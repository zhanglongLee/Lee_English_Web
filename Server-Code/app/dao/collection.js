import { NotFound, Forbidden } from 'lin-mizar';
import { ArticleCollectionModel, ListeningCollectionModel } from '../model/collection'
import { ArticleModel } from '../model/article'
import { ListeningModel } from '../model/listening'
import { Op } from 'sequelize'

class Collection {
  // 获取收藏列表,默认传用户id，查全部用户的收藏记录
  static async getCollectionList(id) {
    let ArticleCollectionList = await this.getArticleCollectionList(id)
    let ListeningCollectionList = await this.getListeningCollectionList(id)
    let res = Array.prototype.concat.apply(ArticleCollectionList, ListeningCollectionList)
    return res
  }
  // 查看文章收藏列表
  static async getArticleCollectionList(id) {
    var whereObj
    if(id){
      whereObj = {
        web_user_id:id
      }
    }
    const res = await ArticleCollectionModel.findAll({
      where:whereObj,
      attributes: {
        exclude: ['deleted_at']
      },
      include: [
        {
          model: ArticleModel
        }
      ],
    });
    return res;
  }
  // 查看听力练习收藏列表
  static async getListeningCollectionList(id) {
    var whereObj
    if(id){
      whereObj = {
        web_user_id:id
      }
    }
    const res = await ListeningCollectionModel.findAll({
      where:whereObj,
      attributes: {
        exclude: ['deleted_at']
      },
      include: [
        {
          model: ListeningModel
        }
      ],
    });
    return res;
  }

  // 新增收藏
  static async createCollection(v) {
    let { type, web_user_id, id } = v.get('body')

    if (type === 1) {
      const Article = await ArticleModel.findOne({
        where: {
          id: id
        }
      });
      if (!Article) {
        throw new Forbidden({
          code: 10022
        });
      }
      const Collection = await ArticleCollectionModel.findOne({
        where: {
          web_user_id: web_user_id,
          article_id: id
        }
      });
      if (Collection) {
        // 如果已收藏，不做处理
        return
      }
      let articleCollection = {
        web_user_id: web_user_id,
        article_id: id
      }
      console.log(articleCollection)
      // 文章收藏新增
      return await ArticleCollectionModel.create({
        web_user_id: web_user_id,
        article_id: id
      });
    } else {
      const Listening = await ListeningModel.findOne({
        where: {
          id: id
        }
      });
      if (!Listening) {
        throw new Forbidden({
          code: 10259
        });
      }
      const Collection = await ListeningCollectionModel.findOne({
        where: {
          web_user_id,
          listening_id: id
        }
      });
      if (Collection) {
        // 如果已收藏，不做处理
        return
      }
      let ListeningCollection = {
        web_user_id,
        listening_id: id
      }
      return await ListeningCollectionModel.create(ListeningCollection);
    }
  }

  // 修改收藏
  static async editCollection(id, v) {
    const Collection = await CollectionModel.findByPk(id);
    if (!Collection) {
      throw new NotFound();
    }

    return await Collection.update({ ...v });
  }
  // 删除收藏
  static async deleteCollection(type, id) {
    if (type === 1) {
      // 文章收藏
      return ArticleCollectionModel.destroy({
        where: { article_id:id }
      });
    } else {
      return ListeningCollectionModel.destroy({
        where: { listening_id:id }
      });
    }

  }
};

export { Collection as CollectionDao };