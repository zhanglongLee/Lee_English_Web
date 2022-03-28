import { NotFound,Forbidden } from 'lin-mizar';
import { RelationModel } from '../model/relation';
import { ArticleModel } from '../model/article'
import { UserModel } from '../model/web-user'
import { Op } from 'sequelize'

class Relation {

  // 查看某用户的关注列表
  static async getRelationLists(page = 1, size = 5, from_user_id, rel_type) {
    var whereObj = {
      from_user_id,
    };
    if(rel_type){
      whereObj.rel_type = rel_type
    }
    const res = await RelationModel.findAndCountAll({
      where: whereObj,
      attributes: {
        exclude: ['deleted_at', 'updated_at']
      },
      limit: Number(size),//长度
      offset: (Number(page) - 1) * Number(size),//当前列表开始值
      include: [{ // include关键字表示关联查询
        model: UserModel,
        attributes: {
          exclude: ['deleted_at', 'updated_at', 'created_at', 'avatar']
        },
      }],
      // raw: true // 这个属性表示开启原生查询，原生查询支持的功能更多，自定义更强
    });
    return res;
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