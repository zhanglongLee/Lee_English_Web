import { Model, DataTypes } from 'sequelize';
import sequelize from '../lib/db';
import { UserModel } from './web-user';

class Relation extends Model {
  // toJSON() {
  //   const origin = {
  //     id: this.id,
  //     title: this.title,
  //     image: this.image?`${config.getItem('siteDomain', 'http://localhost')}/upload/${this.image}`:null,
  //     originImage: this.image,
  //     author: this.author,
  //     published_time: this.published_time,
  //     content: this.content,
  //     description: this.description,
  //     is_published: this.is_published,
  //     is_comment_enabled: this.is_comment_enabled,
  //     is_top: this.is_top,
  //     views: this.views,
  //     words: this.words,
  //     read_time: this.read_time,
  //     categoryId: this.categoryId,
  //     categoryName:this.category.category_name
  //   };
  //   return origin;
  // }
}

Relation.init(
  {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    from_user_id: {
      type: DataTypes.BIGINT(20),
      allowNull: true,
      defaultValue: '发起用户id'
    },
    to_user_id: {
      type: DataTypes.BIGINT(20),
      allowNull: true,
      defaultValue: '接收用户id'
    },
    rel_type: {
      type: DataTypes.INTEGER(1),
      allowNull: false,
      comment: '关注/不关注/拉黑 ，1代表关注，2代表不关注，3代表拉黑'
    },
  },
  {
    // 定义表名
    tableName: "relation",
    // 定义模型名称
    modelName: "relation",
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
Relation.belongsTo(UserModel, {
  foreignKey: 'to_user_id',
  targetKey: 'id',
});

export { Relation as RelationModel };