import { Sequelize, Model, DataTypes } from 'sequelize';
import sequelize from '../lib/db';
import { VideoCourseModel } from './videoCourse'

class VideoCourseHistoryModel extends Model {
  // toJSON() {
  //   const origin = {
  //     id: this.id,
  //     collection_id: this.video_course_id,
  //     web_user_id: this.web_user_id,
  //     collection_name: this.article.title,
  //     updated_at: this.updated_at,
  //     type:'article'
  //   };
  //   return origin;
  // }
}
VideoCourseHistoryModel.init(
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
    tableName: "video_course_history",
    // 定义模型名称
    modelName: "video_course_history",
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
VideoCourseHistoryModel.belongsTo(VideoCourseModel, {
  foreignKey: 'video_course_id',
  targetKey: 'id'
})
VideoCourseModel.hasOne(VideoCourseHistoryModel, {
  foreignKey: 'video_course_id',
  targetKey: 'id'
})


export { VideoCourseHistoryModel };