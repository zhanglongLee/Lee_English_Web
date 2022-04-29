import { Model,DataTypes, Sequelize } from 'sequelize';
import sequelize from '../lib/db';

class Visit extends Model {
  toJSON() {
    const origin = {
      id: this.id,
      count: this.count,
    };
    return origin;
  }
}

Visit.init(
  {
    id: {
      type: Sequelize.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    count: {
      type: DataTypes.INTEGER,
      allowNull:false
    },
  },
  {
    // 定义表名
    tableName: "visit",
    // 定义模型名称
    modelName: "visit",
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

export { Visit as VisitModel };
