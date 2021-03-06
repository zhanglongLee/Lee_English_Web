import { LinRouter, config } from 'lin-mizar';
import {
  web_loginRequired,
  web_refreshTokenRequiredWithUnifyException,
} from '../../middleware/web_jwt';
import { AddArticleValidator, DeleteArticleValidator, EditArticleValidator } from '../../validator/article';
import { PaginateValidator, PositiveIdValidator } from '../../validator/common'
import { ArticleDao } from '../../dao/article';
import { shuffle } from '../../lib/util'

const ArticleApi = new LinRouter({
  prefix: '/web/article'
});

/**
 * 获取文章列表
 */
ArticleApi.get('/', async ctx => {
  const v = await new PaginateValidator().validate(ctx);
  let { page, size, q } = v.get('query');
  let articleList = await ArticleDao.getWebArticleList(page, size, q);
  // 返回结果
  let obj = {};
  obj.page = Number(page) || 1;
  obj.size = Number(size) || 5;
  obj.total = articleList.count;
  obj.data = articleList.rows;

  ctx.json(obj);
});

/**
 * 获取热门随机文章列表
 */
ArticleApi.get('/hotlist', async ctx => {
  let articleList = await ArticleDao.getWebArticleHotList();
  // 随机选取其中五条
  articleList = shuffle(articleList).slice(0, 5)
  // 返回结果
  let obj = {};
  obj.data = articleList;

  ctx.json(obj);
});



/**
 * 增加文章阅读次数
 */
ArticleApi.get('/addViews/:id', async ctx => {
  const v = await new PositiveIdValidator().validate(ctx);
  let { id } = v.get('path');
  await ArticleDao.addViews(id);
  ctx.success({
    message: "阅读成功"
  });
});

/**
 * 获取文章分类列表
 */
 ArticleApi.get('/getType', async ctx => {
  const typeList = await ArticleDao.getTypeList();
  ctx.json({
    data:typeList
  });
});

/**
 * 通过Id查找文章详情
 */
 ArticleApi.get('/:id', async ctx => {
  const v = await new PositiveIdValidator().validate(ctx);
  let { id } = v.get('path');
  var articleList = await ArticleDao.getArticleById(id);
  ctx.json({
    data: articleList
  });
});
module.exports = { ArticleApi };