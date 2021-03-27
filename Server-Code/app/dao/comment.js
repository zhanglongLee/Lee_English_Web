import { NotFound,Forbidden } from 'lin-mizar';
import { CommentModel } from '../model/comment';
import { ArticleModel } from '../model/article'
import { UserModel } from '../model/web-user'
import { Op } from 'sequelize'

class Comment {

  // 前端展示用：通过文章id查评论
  static async getCommentById(id){
    const res = await CommentModel.findAll({
      where:{
        article_id:id,
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
    return res
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
  // 通过文章id删除该文章下所有的评论
  static async deleteArticleComment(article_id) {
    return CommentModel.destroy({
      where: { article_id }
    });
  }

};

export { Comment as CommentDao };