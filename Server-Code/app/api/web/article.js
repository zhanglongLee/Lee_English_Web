import { LinRouter, config } from 'lin-mizar';
import {
  web_loginRequired,
  web_refreshTokenRequiredWithUnifyException,
} from '../../middleware/web_jwt';
import { AddArticleValidator, DeleteArticleValidator, EditArticleValidator } from '../../validator/article';
import { PaginateValidator,PositiveIdValidator } from '../../validator/common'
import { ArticleDao } from '../../dao/article';
import { shuffle } from '../../lib/util'

const ArticleApi = new LinRouter({
  prefix: '/web/article'
});

/**
 * 获取文章列表
 */
 ArticleApi.get('/' , async ctx => {
  const v = await new PaginateValidator().validate(ctx);
  let { page, size } = v.get('query');
  // redis key名
  // key = `getArticleList_${page}_${size}`
  let articleList = null;

  // 读取redis缓存
  // const cacheResult = await get(key);
  // if (cacheResult && cacheResult.rows.length > 0) {
  //   articleList = cacheResult;
  // } else {
  //   // 如果不存在，直接从数据库读取
  //   articleList = await ArticleDao.getWebArticleList(page, size);
  //   // 将数据库读取到的数据存入缓存 缓存时间单位：s
  //   set(key, articleList, 60);
  // }
  articleList = await ArticleDao.getWebArticleList(page, size);
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
 ArticleApi.get('/hotlist' , async ctx => {
  let articleList = await ArticleDao.getWebArticleHotList();
  // 随机选取其中五条
  articleList = shuffle(articleList).slice(0,5)
  // 返回结果
  let obj = {};
  obj.data = articleList;

  ctx.json(obj);
});

/**
 * 通过Id查找文章详情
 */
ArticleApi.get('/:id' , async ctx => {
  const v = await new PositiveIdValidator().validate(ctx);
  let { id } = v.get('path');
  var articleList = await ArticleDao.getArticleById(id);
  ctx.json({
    data:articleList
  });
});

/**
 * 增加文章阅读次数
 */
 ArticleApi.get('/addViews/:id', async ctx => {
  const v = await new PositiveIdValidator().validate(ctx);
  let { id } = v.get('path');
  await ArticleDao.addViews(id);
  ctx.success({
    message:"阅读成功"
  });
});

module.exports = { ArticleApi };