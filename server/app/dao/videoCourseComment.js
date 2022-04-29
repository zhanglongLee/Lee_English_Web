import { NotFound,Forbidden } from 'lin-mizar';
import { CommentModel } from '../model/videoCourseComment';
import { VideoCourseModel } from '../model/videoCourse'
import { UserModel } from '../model/web-user'
import { Op } from 'sequelize'

class Comment {

  // 前端展示用：通过视频课程id查评论
  static async getCommentById(id){
    const res = await CommentModel.findAll({
      where:{
        video_course_id:id,
        is_published:1
      },
      attributes: {
        exclude: ['deleted_at', 'updated_at']
      },
      include: [{
        model: VideoCourseModel,
        attributes: [ 'title' ]
      },
      {
        model: UserModel,
        attributes: [ 'nickname','avatar' ]
      }],
    });
    if(!res){
      throw new Forbidden({
        code: 10258
      });
    }
    return res
  }
  static async getChildren(commentList,video_course_id){
    if(commentList.length>0){
      commentList.forEach(async comment=>{
        const res = await CommentModel.findAll({
          where:{
            video_course_id,
            parent_comment_id:comment.id,
            is_published:1
          },
          attributes: {
            exclude: ['deleted_at', 'updated_at']
          },
          include: [{
            model: ArticleModel,
            attributes: [ 'title' ]
          },
          {
            model: UserModel,
            attributes: [ 'nickname' ]
          }],
        });  
        comment.children = res
        this.getChildren(res,video_course_id)
      })
    }
  }

  static async getCommentByIdTest(id){
    const res = await CommentModel.findAll({
      where:{
        video_course_id:id,
        parent_comment_id:-1,
        is_published:1
      },
      attributes: {
        exclude: ['deleted_at', 'updated_at']
      },
      include: [{
        model: ArticleModel,
        attributes: [ 'title' ]
      },
      {
        model: UserModel,
        attributes: [ 'nickname' ]
      }],
    });
    if(!res){
      throw new Forbidden({
        code: 10258
      });
    }
    this.getChildren(res,id)
    console.log(res)
    // return Promise((resolve,reject)=>{
    //   resolve(res)
    // })
  }
  // 查看评论列表
  static async getCommentList(page = 1, size = 5,q) {
    if(q){
      var whereObj = {
        title: {
          [Op.like]: `%${q}%`
        }
      };
    }
    const res = await CommentModel.findAndCountAll({
      where: whereObj,
      attributes: {
        exclude: ['deleted_at', 'updated_at']
      },
      limit: Number(size),//长度
      offset: (Number(page) - 1) * Number(size),//当前列表开始值
      include: [{ // include关键字表示关联查询
        model: ArticleModel,
      }],
      // raw: true // 这个属性表示开启原生查询，原生查询支持的功能更多，自定义更强
    });
    return res;
  }
  // 新增评论
  static async createComment(v) {
    await CommentModel.create(v);
  }

  // 修改评论
  static async editComment(id, v) {
    const article = await CommentModel.findByPk(id);
    if (!article) {
      throw new NotFound();
    }

    return await article.update({ ...v });
  }
  // 通过评论id删除单条评论
  static async deleteComment(id) {
    return CommentModel.destroy({
      where: { id }
    });
  }
  // 通过视频课程id删除该视频课程下所有的评论
  static async deleteArticleComment(video_course_id) {
    return CommentModel.destroy({
      where: { video_course_id }
    });
  }
  static async deleteVideoCourseComment(video_course_id) {
    return CommentModel.destroy({
      where: { video_course_id }
    });
  }

  // 评论点赞
  static async likeComment(id,web_user_id) {
    const comment = await CommentModel.findByPk(id);
    if (!comment) {
      throw new NotFound();
    }
    comment.update({
      like_num: ++comment.like_num
    });
  }
  // 取消评论点赞
  static async unlikeComment(id,web_user_id) {
    const comment = await CommentModel.findByPk(id);
    if (!comment) {
      throw new NotFound();
    }
    let num = --comment.like_num
    comment.update({
      like_num: num >=0 ? num : 0
    });
  }
};

export { Comment as CommentDao };