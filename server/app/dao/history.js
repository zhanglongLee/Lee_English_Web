import { NotFound, Forbidden } from 'lin-mizar';
import { ArticleHistoryModel } from '../model/history'
import { ArticleModel } from '../model/article'
import { ArticleDao } from '../dao/article'
import { Op } from 'sequelize'

class History {
  // 查看用户的历史记录列表
  static async getArticleHistoryList(web_user_id,page = 1,size = 5) {
    console.log(web_user_id,page,size);
    var whereObj
    if(web_user_id){
      whereObj = {
        web_user_id
      }
    }
    const res = await ArticleHistoryModel.findAll({
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
        history_id: idArr[index],
        data: item
      })
    })
    return historyList;
  }

  // 新增历史记录
  static async createHistory(web_user_id, article_id) {
    const Article = await ArticleModel.findOne({
      where: {
        id: article_id
      }
    });
    if (!Article) {
      throw new Forbidden({
        code: 10022
      });
    }
    const History = await ArticleHistoryModel.findOne({
      where: {
        web_user_id,
        article_id
      }
    });
    if (History) {
      // 如果已收藏，不做处理
      return
    }
    // 文章收藏新增
    return await ArticleHistoryModel.create({
      web_user_id,
      article_id
    });
  }

  // 删除收藏
  static async deleteHistory(web_user_id, article_id) {
    // 文章收藏
    return ArticleHistoryModel.destroy({
      where: { article_id,web_user_id }
    });

  }
};

export { History as HistoryDao };