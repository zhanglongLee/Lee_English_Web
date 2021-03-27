import { Model, DataTypes } from 'sequelize';
import sequelize from '../lib/db';
import { ListeningModel } from './listening';

class UserListening extends Model {
  toJSON() {
    const origin = {
      id: this.id,
      webUserId: this.webUserId,
      listeningId: this.listeningId,
      listening_name: this.listening.title,
      history_answer: this.history_answer,
      created_at: this.created_at,
      updated_at: this.updated_at,
    };
    return origin;
  }
}

UserListening.init(
  {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    webUserId: {
      type: DataTypes.BIGINT(20),
      allowNull: false,
      comment: '用户id'
    },
    listeningId: {
      type: DataTypes.BIGINT(20),
      allowNull: false,
      comment: '听力练习id'
    },
    history_answer: {
      type: DataTypes.TEXT('long'),
      allowNull: false,
      comment: '用户答题历史记录',
    },
  },
  {
    // 定义表名
    tableName: "web_user_listening",
    // 定义模型名称
    modelName: "web_user_listening",
    // 启用软删除
    paranoid: true,
    // 自动写入时间
    timestamps: true,
    // 重名名时间字段
    createdAt: "created_at",
    updatedAt: "updated_at",
    deletedAt: "deleted_at",
    sequelize
  }
);

// 定义外键

UserListening.hasOne(ListeningModel,{
  foreignKey: 'id',
  targetKey: 'listeningId',
});
ListeningModel.belongsTo(UserListening,{
  foreignKey: 'id',
  targetKey: 'listeningId',
});


export { UserListening };
