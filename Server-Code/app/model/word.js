import { Sequelize, Model, DataTypes } from 'sequelize';
import sequelize from '../lib/db';
import { CategoryModel } from './category';

class Word extends Model {
  toJSON() {
    const origin = {
      word_id: this.word_id,
      word_name: this.word_name,
      translate: this.translate,
      pronunciation: this.pronunciation,
      description: this.description,
      categoryId: this.categoryId,
      categoryName:this.category.category_name
    };
    return origin;
  }
}

Word.init(
  {
    word_id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    word_name: {
      type: DataTypes.STRING(255),
      allowNull: false,
      comment: '单词名称'
    },
    translate: {
      type: DataTypes.STRING(255),
      allowNull: true,
      comment: '单词解释'
    },
    pronunciation: {
      type: DataTypes.STRING(255),
      allowNull: false,
      comment: '单词发音'
    },
    categoryId: {
      type: DataTypes.BIGINT(20),
      allowNull: false,
      comment: '单词分类id'
    },
  },
  {
    // 定义表名
    tableName: "Word",
    // 定义模型名称
    modelName: "Word",
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
Word.belongsTo(CategoryModel, {
  foreignKey: 'categoryId',
  targetKey: 'id',
});
CategoryModel.hasOne(Word, {
  foreignKey: 'categoryId',
  targetKey: 'id',
});

export { Word as WordModel };
