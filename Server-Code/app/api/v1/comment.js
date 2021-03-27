import { LinRouter, config } from 'lin-mizar';
import { groupRequired } from '../../middleware/jwt';
import { web_loginRequired } from '../../middleware/web_jwt'
import { logger } from '../../middleware/logger';
import { AddCommentValidator, EditCommentValidator, DeleteCommentValidator,CommentSearchValidator } from '../../validator/comment'
import { PaginateValidator,PositiveIdValidator } from '../../validator/common'
import { CommentDao } from '../../dao/comment';
import { set, get } from '../../lib/_redis';

const CommentApi = new LinRouter({
  prefix: '/v1/comment'
});

function delRedis(key) {
  // 清除redis缓存
  set(key, null, 60);
}

var key = '';

// 1. 权限控制（post => linPost）
// 2. 行为日志（审计）添加logger 例如：logger("{user.username}新增期刊内容")

/**
 * 新增评论
 */
CommentApi.post(
  '/',
  web_loginRequired,
  async ctx => {
    // 1、校验参数
    const v = await new AddCommentValidator().validate(ctx);
    // 2、处理业务逻辑
    // 3、存入数据库
    await CommentDao.createComment(v.get('body'));
    // 4、返回成功
    ctx.success({
      message: '新增评论成功！'
    });
    delRedis(key);
  });

/**
 * 通过文章Id查找评论
 */
CommentApi.get('/:id', async ctx => {
  const v = await new PositiveIdValidator().validate(ctx);
  let { id } = v.get('path');
  var commentList = await CommentDao.getCommentById(id);
  ctx.json({
    data:commentList
  });
});

/**
 * 查看评论列表
 */
CommentApi.get('/', async ctx => {
  const v = await new PaginateValidator().validate(ctx);
  let { page, size, q } = v.get('path');
  // redis key名
  key = `getCommentList_${page}_${size}_${q}`
  let commentList = null;

  // 读取redis缓存
  // const cacheResult = await get(key);
  // if (cacheResult && cacheResult.rows.length > 0) {
  //   commentList = cacheResult;
  // } else {
  //   // 如果不存在，直接从数据库读取
  //   commentList = await CommentDao.getCommentList(page, size, q);
  //   // 将数据库读取到的数据存入缓存 缓存时间单位：s
  //   set(key, commentList, 60);
  // }
  commentList = await CommentDao.getCommentList(page, size, q);
  // 返回结果
  let obj = {};
  obj.page = Number(page) || 1;
  obj.size = Number(size) || 5;
  obj.total = commentList.count;
  obj.data = commentList.rows;

  ctx.json(obj);
});

/**
 * 编辑评论内容
 */
CommentApi.linPut(
  'editComment', // 唯一表示
  '/:id', // URL
  {
    permission: '修改评论内容', // 权限的名字
    module: '评论管理', // 权限属于哪个模块
    mount: true // 是否在全局的权限列表中显示
  },
  groupRequired,
  logger('{user.username}修改评论内容'), // logger，参数为日志内容
  async ctx => {
    const v = await new EditCommentValidator().validate(ctx);
    const id = v.get('path.id');
    const params = v.get('body');
    await CommentDao.editComment(id, params);
    ctx.success({
      message: '评论内容修改成功！'
    });
    delRedis(key);
  });

/**
 * 删除评论
 */
CommentApi.linDelete(
  'deleteComment', // 唯一表示
  '/:id', // URL
  {
    permission: '删除评论', // 权限的名字
    module: '评论管理', // 权限属于哪个模块
    mount: true // 是否在全局的权限列表中显示
  },
  groupRequired,
  logger('{user.username}删除评论'), // logger，参数为日志内容
  async ctx => {
    const v = await new DeleteCommentValidator().validate(ctx);
    const id = v.get('path.id');
    await CommentDao.deleteComment(id);
    ctx.success({
      message: '评论删除成功！'
    });
    delRedis(key);
  });

module.exports = { CommentApi };