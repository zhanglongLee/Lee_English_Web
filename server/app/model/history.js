import { Sequelize, Model, DataTypes } from 'sequelize';
import sequelize from '../lib/db';
import { ArticleModel } from '../model/article'

class ArticleHistoryModel extends Model {
  // toJSON() {
  //   const origin = {
  //     id: this.id,
  //     collection_id: this.article_id,
  //     web_user_id: this.web_user_id,
  //     collection_name: this.article.title,
  //     updated_at: this.updated_at,
  //     type:'article'
  //   };
  //   return origin;
  // }
}
ArticleHistoryModel.init(
  {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    article_id: {
      type: DataTypes.BIGINT(20),
      allowNull: false,
      comment: '文章id'

    },
    web_user_id: {
      type: DataTypes.BIGINT(20),
      allowNull: false,
      comment: '用户id'
    },
  },
  {
    // 定义表名
    tableName: "history",
    // 定义模型名称
    modelName: "history",
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
)

// 设置外键
ArticleHistoryModel.belongsTo(ArticleModel, {
  foreignKey: 'article_id',
  targetKey: 'id'
})
ArticleModel.hasOne(ArticleHistoryModel, {
  foreignKey: 'article_id',
  targetKey: 'id'
})


export { ArticleHistoryModel };