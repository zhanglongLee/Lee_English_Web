import { LinRouter, config } from 'lin-mizar';
import {
  web_loginRequired,
  web_refreshTokenRequiredWithUnifyException,
} from '../../middleware/web_jwt';
import { AddArticleValidator, DeleteArticleValidator, EditArticleValidator,ArticleIsCollectValidator, LikeArticleValidator } from '../../validator/article';
import { PaginateValidator, PositiveIdValidator } from '../../validator/common'
import { ArticleDao } from '../../dao/article';
import { shuffle } from '../../lib/util'

const ArticleApi = new LinRouter({
  prefix: '/web/article'
});

/**
 * 获取对应频道的文章列表
 */
ArticleApi.get('/', async ctx => {
  const v = await new PaginateValidator().validate(ctx);
  let { page, size, q, categoryId } = v.get('query');
  let articleList = await ArticleDao.getWebArticleList({page, size, q, categoryId});
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

/**
 * 查询该篇文章是否被收藏
 */
 ArticleApi.post('/isCollected', async ctx => {
  const v = await new ArticleIsCollectValidator().validate(ctx);
  let { article_id,web_user_id } = v.get('body');
  var isCollected = await ArticleDao.checkArticleIsCollected(article_id,web_user_id);
  ctx.json({
    code:200,
    isCollected
  });
});

// 文章点赞
ArticleApi.post('/likeArticle', web_loginRequired ,  async ctx => {
  const v = await new LikeArticleValidator().validate(ctx);
  let web_user_id = ctx.currentUser.id
  let { article_id } = v.get('body');
  await ArticleDao.likeArticle(article_id,web_user_id);
  ctx.json({
    code:200,
    message:"点赞成功"
  });
});
// 文章取消点赞
ArticleApi.post('/unlikeArticle', web_loginRequired ,  async ctx => {
  const v = await new LikeArticleValidator().validate(ctx);
  let web_user_id = ctx.currentUser.id
  let { article_id } = v.get('body');
  await ArticleDao.unlikeArticle(article_id,web_user_id);
  ctx.json({
    code:200,
    message:"取消点赞成功"
  });
});
module.exports = { ArticleApi };

