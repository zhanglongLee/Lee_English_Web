import { NotFound, Forbidden } from 'lin-mizar';
import { ArticleCollectionModel, VideoCourseCollectionModel } from '../model/collection'
import { ArticleModel } from '../model/article'
import { VideoCourseModel } from '../model/videoCourse'
import { ArticleDao } from '../dao/article'
import { VideoCourseDao } from '../dao/videoCourse'
import { Op } from 'sequelize'

class Collection {
  
  // 获取视频课程收藏列表,默认传用户id，查全部用户的收藏记录
  static async getVideoCourseCollectionList(id,page,size) {
    var whereObj
    if(id){
      whereObj = {
        web_user_id:id
      }
    }
    const res = await VideoCourseCollectionModel.findAll({
      where:whereObj,
      limit: Number(size),//长度
      offset: (Number(page) - 1) * Number(size),//当前列表开始值
      raw: true
    });
    let historyList = []
    let idArr = res.map(item=>item.video_course_id)
    // 查对应的文章列表
    let list = await VideoCourseDao.getVideoCourseByIds(idArr)
    list.forEach((item,index)=>{
      historyList.push({
        collect_id: idArr[index],
        data: item
      })
    })
    return historyList;
  }
  // 获取文章收藏列表,默认传用户id，查全部用户的收藏记录
  static async getArticleCollectionList(id,page,size) {
    var whereObj
    if(id){
      whereObj = {
        web_user_id:id
      }
    }
    const res = await ArticleCollectionModel.findAll({
      where:whereObj,
      limit: Number(size),//长度
      offset: (Number(page) - 1) * Number(size),//当前列表开始值
      raw: true
    });
    let historyList = []
    let idArr = res.map(item=>item.article_id)
    // 查对应的文章列表
    // let list = (await ArticleDao.getArticleByIds(idArr)).map(item=>item.dataValues)
    let list = await ArticleDao.getArticleByIds(idArr)
    list.forEach((item,index)=>{
      historyList.push({
        collect_id: idArr[index],
        data: item
      })
    })
    return historyList;
  }

  // 新增收藏
  static async createCollection(type, id, web_user_id) {

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
      // 文章收藏新增
      return await ArticleCollectionModel.create({
        web_user_id: web_user_id,
        article_id: id
      });
    } else {
      const VideoCourse = await VideoCourseModel.findOne({
        where: {
          id: id
        }
      });
      if (!VideoCourse) {
        throw new Forbidden({
          code: 10259
        });
      }
      const Collection = await VideoCourseCollectionModel.findOne({
        where: {
          web_user_id,
          video_course_id: id
        }
      });
      if (Collection) {
        // 如果已收藏，不做处理
        return
      }
      let VideoCourseCollection = {
        web_user_id,
        video_course_id: id
      }
      return await VideoCourseCollectionModel.create(VideoCourseCollection);
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
  static async deleteCollection(type, id,web_user_id) {
    if (type === 1) {
      let whereObj = {article_id:id}
      if(web_user_id){
        whereObj.web_user_id = web_user_id
      }
      // 文章收藏
      return ArticleCollectionModel.destroy({
        where: whereObj
      });
    } else {
      let whereObj = {video_course_id:id}
      if(web_user_id){
        whereObj.web_user_id = web_user_id
      }
      return VideoCourseCollectionModel.destroy({
        where: whereObj
      });
    }

  }
};

export { Collection as CollectionDao };