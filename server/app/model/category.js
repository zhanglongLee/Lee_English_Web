import { Sequelize, Model } from 'sequelize';
import sequelize from '../lib/db';

class CategoryModel extends Model {

}
CategoryModel.init(
  {
    id: {
      type: Sequelize.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    category_name: {
      type: Sequelize.STRING(255),
      allowNull: false
    }
  },
  {
    // 定义表名
    tableName: "category",
    // 定义模型名称
    modelName: "category",
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

export { CategoryModel };