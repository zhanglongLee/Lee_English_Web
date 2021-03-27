import { NotFound } from 'lin-mizar';
import { UserListening } from '../model/web-user-listening';
import { ListeningModel } from '../model/listening'

class UserLearningDao {

  // 获取做题记录列表
  async getUserLearning(ctx){
    // 记录查询到的用户信息
    const user = ctx.currentUser;
    if (!user) {
      throw new NotFound({
        code: 10021
      });
    }
    let webUserId = user.id
    const userLearningList = await UserListening.findAll({
      where:{
        webUserId
      },
      include:[
        {
          model:ListeningModel
        }
      ],
      attributes:{
        exclude:['deleted_at']
      }
    })
    return userLearningList
  }

  // 新增用户做题记录
  async createUserLearning(ctx, v) {
    // 记录查询到的用户信息
    const user = ctx.currentUser;
    if (!user) {
      throw new NotFound({
        code: 10021
      });
    }
    
    let webUserId = user.id
    let { listeningId , history_answer } = v.get('body')
    let obj = {
      webUserId,
      listeningId,
      history_answer
    }
    const userDone = await UserListening.findOne({
      where:{
        listeningId,
        webUserId
      }
    })
    // 存在则修改做题记录
    if(userDone){
      userDone.history_answer = history_answer
      userDone.save()
    }else{
      // 创建做题记录
      UserListening.create(obj)
    }
  }

  // 删除用户做题记录
  async deleteUserLearning(ctx, listeningId) {
    // 记录查询到的用户信息
    const user = ctx.currentUser;
    if (!user) {
      throw new NotFound({
        code: 10021
      });
    }
    
    let webUserId = user.id
    const userDone = await UserListening.findOne({
      where:{
        listeningId,
        webUserId
      }
    })
    if (!userDone) {
      throw new NotFound({
        code: 10257
      });
    }
    userDone.destroy()
  }
}

export { UserLearningDao };
