import { Sequelize, Model, DataTypes } from 'sequelize';
import sequelize from '../lib/db';
import { CategoryModel } from './category';
import { UserModel } from './user'
import { config } from 'lin-mizar'

class Article extends Model {
  toJSON() {
    const origin = {
      id: this.id,
      title: this.title,
      image: this.image?`${config.getItem('siteDomain', 'http://localhost')}/assets/upload/${this.image}`:null,
      originImage: this.image,
      uid: this.uid,
      author: this.user.nickname,
      published_time: this.published_time,
      content: this.content,
      description: this.description,
      is_published: this.is_published,
      is_comment_enabled: this.is_comment_enabled,
      is_top: this.is_top,
      views: this.views,
      words: this.words,
      read_time: this.read_time,
      categoryId: this.categoryId,
      categoryName:this.category.category_name,
      like_num:this.like_num
    };
    return origin;
  }
}

Article.init(
  {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    title: {
      type: DataTypes.STRING(255),
      allowNull: false,
      comment: '文章标题'
    },
    image: {
      type: DataTypes.STRING(500),
      allowNull: true,
      comment: '文章封面'
    },
    uid: {
      type: DataTypes.BIGINT(20),
      allowNull: false,
      comment: '用户id'
    },
    published_time: {
      type: DataTypes.DATE,
      allowNull: true,
      comment: '发布时间',
      defaultValue: Sequelize.NOW
    },
    content: {
      type: DataTypes.TEXT('long'),
      allowNull: false,
      comment: '文章正文'
    },
    description: {
      type: DataTypes.TEXT('long'),
      allowNull: false,
      comment: '文章描述'
    },
    is_published: {
      type: DataTypes.BOOLEAN,
      allowNull: false,
      comment: '是否发布'
    },
    is_comment_enabled: {
      type: DataTypes.BOOLEAN,
      allowNull: false,
      comment: '是否评论'
    },
    is_top: {
      type: DataTypes.INTEGER(20),
      allowNull: false,
      comment: '是否置顶'
    },
    views: {
      type: DataTypes.INTEGER(11),
      allowNull: true,
      comment: '浏览次数',
      defaultValue: 0
    },
    words: {
      type: DataTypes.INTEGER(11),
      allowNull: true,
      comment: '文字字数',
      defaultValue: 0
    },
    read_time: {
      type: DataTypes.INTEGER(11),
      allowNull: true,
      comment: '阅读时长(分钟)',
      defaultValue: 0
    },
    categoryId: {
      type: DataTypes.BIGINT(20),
      allowNull: true,
      comment: '文章分类'
    },
    like_num: {
      type: DataTypes.BIGINT(20),
      allowNull: true,
      defaultValue: 0,
      comment: '文章点赞数量'
    },
  },
  {
    // 定义表名
    tableName: "article",
    // 定义模型名称
    modelName: "article",
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
Article.belongsTo(CategoryModel, {
  foreignKey: 'categoryId',
  targetKey: 'id',
});
Article.belongsTo(UserModel, {
  foreignKey: 'uid',
  targetKey: 'id',
});

export { Article as ArticleModel };