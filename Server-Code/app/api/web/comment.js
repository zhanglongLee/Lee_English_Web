import { LinRouter, config } from 'lin-mizar';
import { web_loginRequired } from '../../middleware/web_jwt'
import { AddCommentValidator,LikeCommentValidator } from '../../validator/comment'
import { PaginateValidator,PositiveIdValidator } from '../../validator/common'
import { CommentDao } from '../../dao/comment';

const CommentApi = new LinRouter({
  prefix: '/web/comment'
});

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
  let { page, size, q } = v.get('query');
  let commentList = await CommentDao.getCommentList(page, size, q);
  // 返回结果
  let obj = {};
  obj.page = Number(page) || 1;
  obj.size = Number(size) || 5;
  obj.total = commentList.count;
  obj.data = commentList.rows;

  ctx.json(obj);
});


// 评论点赞
CommentApi.post('/likeComment', web_loginRequired ,  async ctx => {
  const v = await new LikeCommentValidator().validate(ctx);
  let web_user_id = ctx.currentUser.id
  let { id } = v.get('body');
  await CommentDao.likeComment(id,web_user_id);
  ctx.json({
    code:200,
    message:"点赞成功"
  });
});
// 评论取消点赞
CommentApi.post('/unlikeComment', web_loginRequired ,  async ctx => {
  const v = await new LikeCommentValidator().validate(ctx);
  let web_user_id = ctx.currentUser.id
  let { id } = v.get('body');
  await CommentDao.unlikeComment(id,web_user_id);
  ctx.json({
    code:200,
    message:"取消点赞成功"
  });
});
module.exports = { CommentApi };