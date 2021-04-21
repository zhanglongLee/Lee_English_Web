
import { VisitModel } from '../model/visit'
import { UserModel } from '../model/web-user'
import { UserListening } from '../model/web-user-listening'

class Visit {
  // 查看网站信息
  static async getVisitInfo() {

    const { count } = await VisitModel.findOne({
      where: {
        id: 1
      },
      attributes: {
        exclude: ['deleted_at']
      },
    });
    const userList = await UserModel.findAll()
    const userListeningList = await UserListening.findAll()
    let obj = {
      visitTotal:count,
      userTotal:userList.length,
      userListeningTotal:userListeningList.length
    }
    return obj;
  }

  static async webVisit(){
    const webVisit = await VisitModel.findOne({
      where: {
        id: 1
      },
      attributes: {
        exclude: ['deleted_at']
      },
    });
    webVisit.count++
    return await webVisit.save()
  }
};

export { Visit as VisitDao };