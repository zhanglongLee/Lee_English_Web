import { Model, DataTypes } from 'sequelize';
import sequelize from '../lib/db';
import { config, log } from 'lin-mizar'
import { VideoCourseModel } from './videoCourse'
import { UserModel } from './web-user'

class Comment extends Model {
  toJSON() {
    console.log(this.web_user);
    const origin = {
      id: this.id,
      web_user_id: this.web_user_id,
      image: this.web_user.avatar?`${config.getItem('siteDomain', 'http://localhost')}/assets/upload/${this.web_user.avatar}`:null,
      originImage: this.image,
      created_at: this.created_at,
      content: this.content,
      is_published: this.is_published,
      video_course_id: this.video_course_id,
      video_course_name:this.video_course.title,
      nickname: this.web_user?this.web_user.nickname:'匿名',
      parent_comment_id: this.parent_comment_id,
      like_num: this.like_num,
    };
    return origin;
  }
}

Comment.init(
  {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    web_user_id: {
      type: DataTypes.BIGINT(20),
      allowNull: false,
      defaultValue: '用户id'
    },

    content: {
      type: DataTypes.STRING(255),
      allowNull: false,
      comment: '评论内容'
    },
    content: {
      type: DataTypes.TEXT('long'),
      allowNull: false,
      comment: '文章正文'
    },
    is_published: {
      type: DataTypes.BOOLEAN,
      allowNull: false,
      defaultValue:1,
      comment: '是否发布'
    },
    video_course_id: {
      type: DataTypes.BIGINT(20),
      allowNull: true,
      defaultValue: '所属的视频课程id'
    },
    parent_comment_id: {
      type: DataTypes.BIGINT(20),
      allowNull: true,
      defaultValue: '父评论id，-1为根评论'
    },
    like_num: {
      type: DataTypes.BIGINT(20),
      allowNull: true,
      defaultValue: 0,
      comment: '评论点赞数量'
    },
  },
  {
    // 定义表名
    tableName: "video_course_comment",
    // 定义模型名称
    modelName: "video_course_comment",
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
Comment.belongsTo(VideoCourseModel, {
  foreignKey: 'video_course_id',
  targetKey: 'id',
});
Comment.belongsTo(UserModel, {
  foreignKey: 'web_user_id',
  targetKey: 'id',
});

export { Comment as CommentModel };
