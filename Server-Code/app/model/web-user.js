import {
  NotFound,
  verify,
  AuthFailed,
  generate,
  Failed,
  config,
} from 'lin-mizar';
import sequelize from '../lib/db';
import { IdentityType } from '../lib/type';
import { Model, Sequelize } from 'sequelize';

class UserIdentity extends Model {
  // 去除空密码
  checkPassword(raw) {
    if (!this.credential || this.credential === '') {
      return false;
    }
    return verify(raw, this.credential);
  }
  // 账号密码校验
  static async verify(username, password) {
    const user = await this.findOne({
      where: {
        identity_type: IdentityType.Password,
        identifier: username
      }
    });
    if (!user) {
      throw new NotFound({ code: 10021 });
    }
    if (!user.checkPassword(password)) {
      throw new AuthFailed({ code: 10031 });
    }
    return user;
  }
  // 修改密码
  static async changePassword(currentUser, oldPassword, newPassword) {
    const user = await this.findOne({
      where: {
        identity_type: IdentityType.Password,
        identifier: currentUser.username
      }
    });
    if (!user) {
      throw new NotFound({ code: 10021 });
    }
    if (!user.checkPassword(oldPassword)) {
      throw new Failed({
        code: 10011
      });
    }
    user.credential = generate(newPassword);
    await user.save();
  }
  // 重置密码
  static async resetPassword(currentUser, newPassword) {
    const user = await this.findOne({
      where: {
        identity_type: IdentityType.Password,
        identifier: currentUser.username
      }
    });
    if (!user) {
      throw new NotFound({ code: 10021 });
    }
    user.credential = generate(newPassword);
    await user.save();
  }
}

UserIdentity.init(
  {
    id: {
      type: Sequelize.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    user_id: {
      type: Sequelize.INTEGER,
      allowNull: false,
      comment: '用户id'
    },
    identity_type: {
      type: Sequelize.STRING({ length: 100 }),
      allowNull: false,
      comment: '登录类型（手机号 邮箱 用户名）或第三方应用名称（微信 微博等）'
    },
    identifier: {
      type: Sequelize.STRING({ length: 100 }),
      comment: '标识（手机号 邮箱 用户名或第三方应用的唯一标识）'
    },
    credential: {
      type: Sequelize.STRING({ length: 100 }),
      comment: '密码凭证（站内的保存密码，站外的不保存或保存token）'
    }
  },
  {
    sequelize,
    // 数据库表名
    tableName: 'web_user_identity',
    // 模型名称
    modelName: 'web_user_identity',
    // 启用软删除
    paranoid: true,
    // 自动写入时间
    timestamps: true,
    // 重名名时间字段
    createdAt: "created_at",
    updatedAt: "updated_at",
    deletedAt: "deleted_at",
  }
);

class User extends Model {
  toJSON() {
    const origin = {
      id: this.id,
      username: this.username,
      nickname: this.nickname,
      email: this.email,
      avatar: this.avatar ? `${config.getItem('siteDomain', 'http://localhost')}/assets/upload/${this.avatar}` : null,
      originAvatar: this.avatar ? this.avatar : 'avatar.png',
      sex:this.sex
    };
    return origin;
  }
}

User.init(
  {
    id: {
      type: Sequelize.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    username: {
      type: Sequelize.STRING({ length: 24 }),
      allowNull: false,
      comment: '用户名，唯一'
    },
    nickname: {
      type: Sequelize.STRING({ length: 24 }),
      comment: '用户昵称',
      defaultValue: new Date().getTime()
    },
    avatar: {
      // 用户默认生成图像，为null
      type: Sequelize.STRING({ length: 500 }),
      comment: '头像url',
      defaultValue:'avatar.png'
    },
    email: {
      type: Sequelize.STRING({ length: 100 }),
      allowNull: true
    },
    sex: {
      type: Sequelize.INTEGER(1),
      allowNull: false,
      defaultValue:1
    }
  },
  {
    sequelize,
    // 数据库表名
    tableName: 'web_user',
    // 模型名称
    modelName: 'web_user',
    // 唯一索引
    indexes: [
      {
        name: 'username_del',
        unique: true,
        fields: ['username', 'delete_time']
      },
      {
        name: 'email_del',
        unique: true,
        fields: ['email', 'delete_time']
      }
    ],
    // 启用软删除
    paranoid: true,
    // 自动写入时间
    timestamps: true,
    // 重名名时间字段
    createdAt: "created_at",
    updatedAt: "updated_at",
    deletedAt: "deleted_at",
  }
);

export { User as UserModel, UserIdentity as UserIdentityModel };
