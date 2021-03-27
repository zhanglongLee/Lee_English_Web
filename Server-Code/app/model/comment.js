import { Model, DataTypes } from 'sequelize';
import sequelize from '../lib/db';
import { config } from 'lin-mizar'
import { ArticleModel } from '../model/article'
import { UserModel } from '../model/web-user'

class Comment extends Model {
  toJSON() {
    const origin = {
      id: this.id,
      web_user_id: this.web_user_id,
      image: this.image?`${config.getItem('siteDomain', 'http://localhost')}/assets/upload/${this.image}`:null,
      originImage: this.image,
      created_at: this.created_at,
      content: this.content,
      is_published: this.is_published,
      article_id: this.article_id,
      article_name:this.article.title,
      nickname: this.web_user.nickname,
      parent_comment_id: this.parent_comment_id,
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
    image: {
      type: DataTypes.STRING(255),
      allowNull: true,
      comment: '用户头像'
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
    article_id: {
      type: DataTypes.BIGINT(20),
      allowNull: true,
      defaultValue: '所属的文章id'
    },
    parent_comment_id: {
      type: DataTypes.BIGINT(20),
      allowNull: true,
      defaultValue: '父评论id，-1为根评论'
    },
  },
  {
    // 定义表名
    tableName: "comment",
    // 定义模型名称
    modelName: "comment",
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
Comment.belongsTo(ArticleModel, {
  foreignKey: 'article_id',
  targetKey: 'id',
});
Comment.belongsTo(UserModel, {
  foreignKey: 'web_user_id',
  targetKey: 'id',
});

export { Comment as CommentModel };
