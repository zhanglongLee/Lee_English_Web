import { LinRouter, config } from 'lin-mizar';
import { groupRequired } from '../../middleware/jwt';
import { logger } from '../../middleware/logger';
import { AddArticleValidator, DeleteArticleValidator, EditArticleValidator } from '../../validator/article';
import { PaginateValidator,PositiveIdValidator } from '../../validator/common'
import { ArticleDao } from '../../dao/article';
import { CommentDao } from '../../dao/comment'
import { set, get } from '../../lib/_redis';

const ArticleApi = new LinRouter({
  prefix: '/v1/article'
});

function delRedis(key) {
  // 清除redis缓存
  set(key, null, 60);
}

var key = '';

/**
 * 新增文章
 */
ArticleApi.linPost(
  'addArticle', // 唯一表示
  '/', // URL
  {
    permission: '新增文章', // 权限的名字
    module: '文章管理', // 权限属于哪个模块
    mount: true // 是否在全局的权限列表中显示
  },
  groupRequired,
  logger('{user.username}新增文章'), // logger，参数为日志内容
  async ctx => {
    // 1、校验参数
    const v = await new AddArticleValidator().validate(ctx);
    // 2、处理业务逻辑
    // 3、存入数据库
    await ArticleDao.createArticle(v.get('body'));
    // 4、返回成功
    ctx.success({
      message: '文章新增成功！'
    });
    delRedis(key);
  });

/**
 * 通过Id查找文章
 */
ArticleApi.get('/:id', async ctx => {
  const v = await new PositiveIdValidator().validate(ctx);
  let { id } = v.get('path');
  var articleList = await ArticleDao.getArticleById(id);
  ctx.json({
    data:articleList
  });
});

/**
 * 查看文章列表
 */
ArticleApi.get('/', async ctx => {
  const v = await new PaginateValidator().validate(ctx);
  let { page, size, q } = v.get('path');
  console.log(page)
  // redis key名
  key = `getArticleList_${page}_${size}_${q}`
  let articleList = null;

  // 读取redis缓存
  // const cacheResult = await get(key);
  // if (cacheResult && cacheResult.rows.length > 0) {
  //   articleList = cacheResult;
  // } else {
  //   // 如果不存在，直接从数据库读取
  //   articleList = await ArticleDao.getArticleList(page, size, q);
  //   // 将数据库读取到的数据存入缓存 缓存时间单位：s
  //   set(key, articleList, 60);
  // }
  articleList = await ArticleDao.getArticleList(page, size, q);
  // 返回结果
  let obj = {};
  obj.page = Number(page) || 1;
  obj.size = Number(size) || 5;
  obj.total = articleList.count;
  obj.data = articleList.rows;

  ctx.json(obj);
});

/**
 * 编辑文章内容
 */
ArticleApi.linPut(
  'editArticle', // 唯一表示
  '/:id', // URL
  {
    permission: '修改文章内容', // 权限的名字
    module: '文章管理', // 权限属于哪个模块
    mount: true // 是否在全局的权限列表中显示
  },
  groupRequired,
  logger('{user.username}修改文章内容'), // logger，参数为日志内容
  async ctx => {
    const v = await new EditArticleValidator().validate(ctx);
    const id = v.get('path.id');
    const params = v.get('body');
    await ArticleDao.editArticle(id, params);
    ctx.success({
      message: '文章内容修改成功！'
    });
    delRedis(key);
  });

/**
 * 删除文章
 */
ArticleApi.linDelete(
  'deleteArticle', // 唯一表示
  '/:id', // URL
  {
    permission: '删除文章', // 权限的名字
    module: '文章管理', // 权限属于哪个模块
    mount: true // 是否在全局的权限列表中显示
  },
  groupRequired,
  logger('{user.username}删除文章'), // logger，参数为日志内容
  async ctx => {
    const v = await new DeleteArticleValidator().validate(ctx);
    const id = v.get('path.id');
    // 1、删除文章
    await ArticleDao.deleteArticle(id);
    // 2、删除该文章下所有的评论
    await CommentDao.deleteArticleComment(id)
    ctx.success({
      message: '文章删除成功！'
    });
    delRedis(key);
  });

module.exports = { ArticleApi };