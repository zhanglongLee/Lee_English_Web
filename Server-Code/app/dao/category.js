import { NotFound, Forbidden } from 'lin-mizar';
import { CategoryModel } from '../model/category'
import { ArticleModel } from '../model/article'
import { Op } from 'sequelize'

class Category {
  // 查看分类列表
  static async getCategoryList(page = 1, size = 5, q) {
    if (q) {
      var whereObj = {
        title: {
          [Op.like]: `%${q}%`
        }
      };
    }
    const res = await CategoryModel.findAndCountAll({
      where: whereObj,
      attributes: {
        exclude: ['deleted_at', 'updated_at']
      },
      limit: Number(size),//长度
      offset: (Number(page) - 1) * Number(size),//当前列表开始值
    });
    return res;
  }
  // 新增分类
  static async createCategory(v) {
    const Category = await CategoryModel.findOne({
      where: {
        category_name: v.category_name
      }
    });
    if (Category) {
      throw new Forbidden({
        code: 10253
      });
    }
    await CategoryModel.create(v);
  }

  // 修改分类
  static async editCategory(id, v) {
    const Category = await CategoryModel.findByPk(id);
    if (!Category) {
      throw new NotFound();
    }

    return await Category.update({ ...v });
  }
  // 删除分类
  static async deleteCategory(id) {
    const articleList = await ArticleModel.findAll({
      where: {
        categoryId: id
      }
    });
    // 删除前查询文章列表，查看该分类是否被使用
    if (articleList.length > 0) {
      throw new Forbidden({
        code: 10254
      });
    }
    return CategoryModel.destroy({
      where: { id }
    });
  }
};

export { Category as CategoryDao };