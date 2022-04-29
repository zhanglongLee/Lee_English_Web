import { LinRouter, config } from 'lin-mizar';
import { groupRequired } from '../../middleware/jwt';
import { logger } from '../../middleware/logger';
import { AddVideoCourseValidator, DeleteVideoCourseValidator, EditVideoCourseValidator } from '../../validator/videoCourse';
import { PaginateValidator,PositiveIdValidator } from '../../validator/common'
import { VideoCourseDao } from '../../dao/videoCourse';
import { CommentDao } from '../../dao/comment'
import { CollectionDao } from '../../dao/collection'

const VideoCourseApi = new LinRouter({
  prefix: '/v1/videoCourse'
});

/**
 * 新增视频课程
 */
VideoCourseApi.linPost(
  'addVideoCourse', // 唯一表示
  '/', // URL
  {
    permission: '新增视频课程', // 权限的名字
    module: '视频课程管理', // 权限属于哪个模块
    mount: true // 是否在全局的权限列表中显示
  },
  groupRequired,
  logger('{user.username}新增视频课程'), // logger，参数为日志内容
  async ctx => {
    // 1、校验参数
    const v = await new AddVideoCourseValidator().validate(ctx);
    // 2、处理业务逻辑
    // 3、存入数据库
    await VideoCourseDao.createVideoCourse(v.get('body'));
    // 4、返回成功
    ctx.success({
      message: '视频课程新增成功！'
    });
  });

/**
 * 通过Id查找视频课程
 */
VideoCourseApi.get('/:id', async ctx => {
  const v = await new PositiveIdValidator().validate(ctx);
  let { id } = v.get('path');
  var videoCourseList = await VideoCourseDao.getVideoCourseById(id);
  ctx.json({
    data:videoCourseList
  });
});

/**
 * 查看视频课程列表
 */
VideoCourseApi.linGet(
  'getVideoCourse', // 唯一表示
  '/', // URL
  {
    permission: '查询所有视频课程', // 权限的名字
    module: '视频课程管理', // 权限属于哪个模块
    mount: true // 是否在全局的权限列表中显示
  },
  groupRequired,
  async ctx => {
  const v = await new PaginateValidator().validate(ctx);
  let { page, size, q } = v.get('query');
  var videoCourseList = await VideoCourseDao.getVideoCourseList(page, size, q);
  // 返回结果
  let obj = {};
  obj.page = Number(page);
  obj.size = Number(size);
  obj.total = videoCourseList.count;
  obj.data = videoCourseList.rows;

  ctx.json(obj);
});

/**
 * 编辑视频课程内容
 */
VideoCourseApi.linPut(
  'editVideoCourse', // 唯一表示
  '/:id', // URL
  {
    permission: '修改视频课程内容', // 权限的名字
    module: '视频课程管理', // 权限属于哪个模块
    mount: true // 是否在全局的权限列表中显示
  },
  groupRequired,
  logger('{user.username}修改视频课程内容'), // logger，参数为日志内容
  async ctx => {
    const v = await new EditVideoCourseValidator().validate(ctx);
    const id = v.get('path.id');
    const params = v.get('body');
    await VideoCourseDao.editVideoCourse(id, params);
    ctx.success({
      message: '视频课程内容修改成功！'
    });
  });

/**
 * 删除视频课程
 */
VideoCourseApi.linDelete(
  'deleteVideoCourse', // 唯一表示
  '/:id', // URL
  {
    permission: '删除视频课程', // 权限的名字
    module: '视频课程管理', // 权限属于哪个模块
    mount: true // 是否在全局的权限列表中显示
  },
  groupRequired,
  logger('{user.username}删除视频课程'), // logger，参数为日志内容
  async ctx => {
    const v = await new DeleteVideoCourseValidator().validate(ctx);
    const id = v.get('path.id');
    // 1、删除视频课程
    await VideoCourseDao.deleteVideoCourse(id);
    // 2、删除该视频课程下所有的评论
    // await CommentDao.deleteVideoCourseComment(id)
    // 3、删除该视频课程下所有的收藏记录
    // await CollectionDao.deleteCollection(1,id)
    ctx.success({
      message: '视频课程删除成功！'
    });
  });

module.exports = { VideoCourseApi };