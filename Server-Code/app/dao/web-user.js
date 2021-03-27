import { RepeatException, generate } from 'lin-mizar';
import { UserModel, UserIdentityModel } from '../model/web-user';

import sequelize from '../lib/db';
import { IdentityType } from '../lib/type';

class UserDao {
  // 注册用户
  async createUser (v) {
    let user = await UserModel.findOne({
      where: {
        username: v.get('body.username')
      }
    });
    // 如果存在该用户名，提示用户名已存在
    if (user) {
      throw new RepeatException({
        code: 10071
      });
    }
    await this.registerUser(v);
  }
  // 用户信息分别写入web_user web_user_identity表
  async registerUser (v) {
    let transaction;
    try {
      transaction = await sequelize.transaction();
      // 用户对象
      const user = {
        username: v.get('body.username')
      };
      if (v.get('body.email') && v.get('body.email').trim() !== '') {
        // 邮箱
        user.email = v.get('body.email');
      }
      const { id: user_id } = await UserModel.create(user, {
        transaction
      });
      await UserIdentityModel.create(
        {
          user_id,
          identity_type: IdentityType.Password,
          identifier: user.username,
          credential: generate(v.get('body.password'))
        },
        {
          transaction
        }
      );

      await transaction.commit();
    } catch (error) {
      console.log(error)
      if (transaction) await transaction.rollback();
    }
    return true;
  }

  // 获取用户信息
  async getInformation (ctx) {
    const user = ctx.currentUser
    const userInfo = await UserModel.findAll({
      where: {
        id: user.id
      }
    });
    return userInfo;
  }

  // 更新用户信息
  async updateInformation (ctx,v) {
    // 记录查询到的用户信息
    const user = ctx.currentUser;
    if (!user) {
      throw new NotFound({
        code: 10021
      });
    }

    if (v.get('body.email') && user.email !== v.get('body.email')) {
      const exit = await UserModel.findOne({
        where: {
          email: v.get('body.email')
        }
      });
      if (exit) {
        throw new RepeatException({
          code: 10076
        });
      }
      user.email = v.get('body.email');
    }
    if (v.get('body.nickname') && user.nickname !== v.get('body.nickname')) {
      const exit = await UserModel.findOne({
        where: {
          nickname: v.get('body.nickname')
        }
      });
      if (exit) {
        throw new RepeatException({
          code: 10251
        });
      }
      user.nickname = v.get('body.nickname');
    }
    user.sex = v.get('body.sex');
    user.avatar = v.get('body.avatar');
    await user.save()
  }

  // 修改密码
  async changePassWord (ctx,v){
    
  }
}

export { UserDao };
