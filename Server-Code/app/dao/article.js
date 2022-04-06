import { NotFound, Forbidden, log } from 'lin-mizar';
import { ArticleModel } from '../model/article';
import { CategoryModel } from '../model/category'
import { UserModel } from '../model/user'
import { ArticleCollectionModel } from '../model/collection'
import { Op } from 'sequelize'

class Article {

  // 查询该文章是否被收藏
  static async checkArticleIsCollected(article_id, web_user_id) {
    const res = await ArticleCollectionModel.findOne({
      where: {
        article_id,
        web_user_id
      }
    })
    if (res) {
      return true
    }
    return false
  }
  // 增加文章阅读次数addViews
  static async addViews(id) {
    const res = await ArticleModel.findOne({
      where: {
        id
      }
    });
    if (!res) {
      throw new Forbidden({
        code: 10022
      });
    }
    res.views = res.views + 1
    res.save()
  }
  // 通过多个id查多篇文章，主要用在查询文章浏览记录
  // ids为逗号分割的id 例如：1,2,3
  static async getArticleByIds(idArr) {
    const res = await ArticleModel.findAll({
      where: {
        id: {
          [Op.in]: idArr
        },
        is_published: 1
      },
      attributes: {
        exclude: ['deleted_at', 'updated_at']
      },
      include: [
        {
          model: CategoryModel,
        },
        {
          model: UserModel
        }
      ],
    });
    if (!res) {
      throw new Forbidden({
        code: 10022
      });
    }
    return res
  }
  // 通过id查文章
  static async getArticleById(id) {
    const res = await ArticleModel.findOne({
      where: {
        id,
        is_published: 1
      },
      attributes: {
        exclude: ['deleted_at', 'updated_at']
      },
      include: [
        {
          model: CategoryModel,
        },
        {
          model: UserModel
        }
      ],
    });
    if (!res) {
      throw new Forbidden({
        code: 10022
      });
    }
    return res
  }

  // 前端获取文章列表
  static async getWebArticleList({ page = 1, size = 5, q, categoryId }) {

    var whereObj = { is_published: 1 }
    if (q) {
      whereObj.title = {
        [Op.like]: `%${q}%`
      };
    }
    if (categoryId) {
      whereObj.categoryId = categoryId
    }
    const res = await ArticleModel.findAndCountAll({
      where: whereObj,
      attributes: {
        exclude: ['deleted_at', 'updated_at']
      },
      order: [['is_top', 'DESC'], ['created_at', 'DESC']],
      limit: Number(size),//长度
      offset: (Number(page) - 1) * Number(size),//当前列表开始值
      include: [
        { // include关键字表示关联查询
          model: CategoryModel,
        },
        {
          model: UserModel
        }
      ],
      // raw: true // 这个属性表示开启原生查询，原生查询支持的功能更多，自定义更强
    });
    return res;
  }


  // 前端后期热门文章列表
  static async getWebArticleHotList() {

    const res = await ArticleModel.findAll({
      where: {
        is_published: 1
      },
      attributes: {
        exclude: ['deleted_at', 'updated_at']
      },
      include: [
        { // include关键字表示关联查询
          model: CategoryModel,
        },
        {
          model: UserModel
        }
      ],
    });
    return res;
  }


  // 管理后台文章列表
  static async getArticleList(page, size, q) {
    if (q) {
      var whereObj = {
        title: {
          [Op.like]: `%${q}%`
        }
      };
    }
    const res = await ArticleModel.findAndCountAll({
      where: whereObj,
      attributes: {
        exclude: ['deleted_at', 'updated_at']
      },
      order: [['is_top', 'DESC'], ['created_at', 'DESC']],
      limit: Number(size),//长度
      offset: (Number(page) - 1) * Number(size),//当前列表开始值
      include: [
        { // include关键字表示关联查询
          model: CategoryModel,
        },
        {
          model: UserModel
        }
      ],
      // raw: true // 这个属性表示开启原生查询，原生查询支持的功能更多，自定义更强
    });
    return res;
  }
  // 新增文章
  static async createArticle(v) {
    const article = await ArticleModel.findOne({
      where: {
        title: v.title
      }
    });
    if (article) {
      throw new Forbidden({
        code: 10240
      });
    }
    if (v.words) {
      // 假设一分钟阅读300字
      v.read_time = Math.ceil(v.words / 300)
    }

    // 设置置顶
    this.setIsTop(article, v, ArticleModel)
  }

  // 修改文章
  static async editArticle(id, v) {
    const article = await ArticleModel.findByPk(id);
    if (!article) {
      throw new NotFound();
    }
    // 设置置顶
    this.setIsTop(article, v, ArticleModel)

  }
  // 删除文章
  static async deleteArticle(id) {
    return ArticleModel.destroy({
      where: { id }
    });
  }
  // 设置置顶
  static async setIsTop(content, v, model) {
    if (v.is_top) {
      // 查询出所有文章的是否置顶的值topArr
      const topArr = await model.findAll({
        attributes: ['is_top']
      }).map(i => i.is_top)
      // 求出topArr的最大值max
      const max = Math.max.apply(null, topArr)
      // 将本次修改的文章的is_top的属性设置为max+1
      v.is_top = max + 1
    }

    if (content) {
      content.update({ ...v });
    } else {
      model.create(v);
    }
  }
  // 文章点赞
  static async likeArticle(article_id, web_user_id) {
    const article = await ArticleModel.findByPk(article_id);
    if (!article) {
      throw new NotFound();
    }
    article.update({
      like_num: ++article.like_num
    });
  }
  // 取消文章点赞
  static async unlikeArticle(article_id, web_user_id) {
    const article = await ArticleModel.findByPk(article_id);
    if (!article) {
      throw new NotFound();
    }
    let num = --article.like_num
    article.update({
      like_num: num >= 0 ? num : 0
    });
  }
};

export { Article as ArticleDao };