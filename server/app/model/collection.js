import { Sequelize, Model, DataTypes } from 'sequelize';
import sequelize from '../lib/db';
import { ArticleModel } from './article'
import { VideoCourseModel } from './videoCourse'

class ArticleCollectionModel extends Model {
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
ArticleCollectionModel.init(
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
    tableName: "user_article_collection",
    // 定义模型名称
    modelName: "user_article_collection",
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

class VideoCourseCollectionModel extends Model {
  toJSON() {
    const origin = {
      id: this.id,
      collection_id: this.video_course_id,
      web_user_id: this.web_user_id,
      collection_name: this.listening.title,
      updated_at: this.updated_at,
      type:'listening'
    };
    return origin;
  }
}
VideoCourseCollectionModel.init(
  {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    video_course_id: {
      type: DataTypes.BIGINT(20),
      allowNull: false,
      comment: '视频课程id'

    },
    web_user_id: {
      type: DataTypes.BIGINT(20),
      allowNull: false,
      comment: '用户id'
    },
  },
  {
    // 定义表名
    tableName: "user_videoCourse_collection",
    // 定义模型名称
    modelName: "user_videoCourse_collection",
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
ArticleCollectionModel.belongsTo(ArticleModel, {
  foreignKey: 'article_id',
  targetKey: 'id'
})
ArticleModel.hasOne(ArticleCollectionModel, {
  foreignKey: 'article_id',
  targetKey: 'id'
})

VideoCourseCollectionModel.belongsTo(VideoCourseModel, {
  foreignKey: 'video_course_id',
  targetKey: 'id'
})
VideoCourseModel.hasOne(VideoCourseCollectionModel, {
  foreignKey: 'video_course_id',
  targetKey: 'id'
})


export { ArticleCollectionModel, VideoCourseCollectionModel };