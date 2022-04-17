import { NotFound,Forbidden } from 'lin-mizar';
import { RelationModel } from '../model/relation';
import { ArticleModel } from '../model/article'
import { UserModel } from '../model/web-user'
import { VideoCourseDao } from './videoCourse'
import { ArticleDao } from './article'
import { Op } from 'sequelize'

class Relation {
  
  // 查看某用户的关注列表
  static async getRelationLists(from_user_id, rel_type) {
    var whereObj = {
      from_user_id,
    };
    if(rel_type){
      whereObj.rel_type = rel_type
    }
    const res = await RelationModel.findAndCountAll({
      where: whereObj,
      raw: true // 这个属性表示开启原生查询，原生查询支持的功能更多，自定义更强
    });
    // console.log(res);
    // return []
    let articleAndVideoList = []
    let idArr = res.rows.map(item=>item.to_user_id)
    // 查对应的文章列表
    let articleList = await ArticleDao.getArticleByUserIds(idArr)
    // 查对应的视频列表
    let videoList = await VideoCourseDao.getVideoCourseByUserIds(idArr)
    articleAndVideoList = [...videoList,...articleList]
    return articleAndVideoList;
  }

  // 关注/取消关注/拉黑某用户
  // rel_type 1代表关注，2代表不关注，3代表拉黑
  static async operationRelationType(from_user_id,to_user_id,rel_type) {
    var whereObj = {
      from_user_id,
      to_user_id,
    };
    const relation = await RelationModel.findOne({
      where: whereObj,
    });
    if (relation) {
      this.editRelationType(from_user_id,to_user_id,rel_type)
    }else{
      // 新增
      await RelationModel.create({from_user_id,to_user_id,rel_type})
    }
  }
  // 切换一个用户对另一个用户的关注/取消关注/拉黑的状态
  static async editRelationType(from_user_id,to_user_id,rel_type){
    var whereObj = {
      from_user_id,
      to_user_id
    };
    const relation = await RelationModel.findOne({
      where: whereObj,
    });
    if (!relation) {
      throw new NotFound();
    }
    return await relation.update({from_user_id,to_user_id,rel_type});
  }

  // 检查是否已关注
  static async relationIsFocus(from_user_id,to_user_id){
    var whereObj = {
      from_user_id,
      to_user_id,
      rel_type: 1
    };
    const relation = await RelationModel.findOne({
      where: whereObj,
    });
    return !!relation
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

export { Relation as RelationDao };