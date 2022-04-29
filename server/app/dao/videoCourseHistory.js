import { NotFound, Forbidden } from 'lin-mizar';
import { VideoCourseHistoryModel } from '../model/videoCourseHistory'
import { VideoCourseModel } from '../model/videoCourse'
import { VideoCourseDao } from './videoCourse'
import { Op } from 'sequelize'

class VideoCourseHistory {
  // 查看用户的视频课程历史记录列表
  static async getVideoCourseHistoryList(web_user_id,page = 1,size = 5) {
    console.log(web_user_id,page,size);
    var whereObj
    if(web_user_id){
      whereObj = {
        web_user_id
      }
    }
    const res = await VideoCourseHistoryModel.findAll({
      where:whereObj,
      limit: Number(size),//长度
      offset: (Number(page) - 1) * Number(size),//当前列表开始值
      raw: true
    });
    let historyList = []
    let idArr = res.map(item=>item.video_course_id)
    // 查对应的视频课程列表
    // let list = (await VideoCourseDao.getVideoCourseByIds(idArr)).map(item=>item.dataValues)
    let list = await VideoCourseDao.getVideoCourseByIds(idArr)
    list.forEach((item,index)=>{
      historyList.push({
        history_id: idArr[index],
        data: item
      })
    })
    return historyList;
  }

  // 新增历史记录
  static async createHistory(web_user_id, video_course_id) {
    const VideoCourse = await VideoCourseModel.findOne({
      where: {
        id: video_course_id
      }
    });
    if (!VideoCourse) {
      throw new Forbidden({
        code: 10022
      });
    }
    const History = await VideoCourseHistoryModel.findOne({
      where: {
        web_user_id,
        video_course_id
      }
    });
    if (History) {
      // 如果已收藏，不做处理
      return
    }
    // 视频课程收藏新增
    return await VideoCourseHistoryModel.create({
      web_user_id,
      video_course_id
    });
  }

  // 删除收藏
  static async deleteHistory(web_user_id, video_course_id) {
    // 视频课程收藏
    return VideoCourseHistoryModel.destroy({
      where: { video_course_id,web_user_id }
    });

  }
};

export { VideoCourseHistory as VideoCourseHistoryDao };