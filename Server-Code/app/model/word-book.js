import { Model, DataTypes } from 'sequelize';
import sequelize from '../lib/db';

class WordBook extends Model {
  toJSON() {
    const origin = {
      id: this.id,
      web_user_id: this.web_user_id,
      content: this.content,
      created_at: this.created_at,
      updated_at: this.updated_at,
    };
    return origin;
  }
}

WordBook.init(
  {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    web_user_id: {
      type: DataTypes.BIGINT(20),
      allowNull: false,
      comment: '用户id'
    },
    content: {
      type: DataTypes.TEXT('long'),
      allowNull: false,
      comment: '生词本内容'
    },
  },
  {
    // 定义表名
    tableName: "wordbook",
    // 定义模型名称
    modelName: "wordbook",
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

// // 定义外键
// WordBook.belongsTo(WordModel,{
//   foreignKey: 'listeningId',
//   targetKey: 'id',
// });
// WordModel.hasOne(WordBook,{
//   foreignKey: 'listeningId',
//   targetKey: 'id',
// });

export { WordBook as WordBookModel};
