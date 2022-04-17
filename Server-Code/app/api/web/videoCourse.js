import { LinRouter, config } from 'lin-mizar';
import {
  web_loginRequired,
  web_refreshTokenRequiredWithUnifyException,
} from '../../middleware/web_jwt';
import { AddVideoCourseValidator, DeleteVideoCourseValidator, EditVideoCourseValidator,VideoCourseIsCollectValidator, LikeVideoCourseValidator } from '../../validator/videoCourse';
import { PaginateValidator, PositiveIdValidator } from '../../validator/common'
import { VideoCourseDao } from '../../dao/videoCourse';
import { shuffle } from '../../lib/util'

const VideoCourseApi = new LinRouter({
  prefix: '/web/videoCourse'
});

/**
 * 获取对应频道的视频课程列表
 */
VideoCourseApi.get('/', async ctx => {
  const v = await new PaginateValidator().validate(ctx);
  let { page, size, q, categoryId } = v.get('query');
  let VideoCourseList = await VideoCourseDao.getWebVideoCourseList({page, size, q, categoryId});
  // 返回结果
  let obj = {};
  obj.page = Number(page) || 1;
  obj.size = Number(size) || 5;
  obj.total = VideoCourseList.count;
  obj.data = VideoCourseList.rows;
  ctx.json(obj);
});

/**
 * 获取热门随机视频课程列表
 */
VideoCourseApi.get('/hotlist', async ctx => {
  let VideoCourseList = await VideoCourseDao.getWebVideoCourseHotList();
  // 随机选取其中五条
  VideoCourseList = shuffle(VideoCourseList).slice(0, 5)
  // 返回结果
  let obj = {};
  obj.data = VideoCourseList;

  ctx.json(obj);
});



/**
 * 增加视频课程阅读次数
 */
VideoCourseApi.get('/addViews/:id', async ctx => {
  const v = await new PositiveIdValidator().validate(ctx);
  let { id } = v.get('path');
  await VideoCourseDao.addViews(id);
  ctx.success({
    message: "阅读成功"
  });
});

/**
 * 获取视频课程分类列表
 */
 VideoCourseApi.get('/getType', async ctx => {
  const typeList = await VideoCourseDao.getTypeList();
  ctx.json({
    data:typeList
  });
});

/**
 * 通过Id查找视频课程详情
 */
 VideoCourseApi.get('/:id', async ctx => {
  const v = await new PositiveIdValidator().validate(ctx);
  let { id } = v.get('path');
  var VideoCourseList = await VideoCourseDao.getVideoCourseById(id);
  ctx.json({
    data: VideoCourseList
  });
});

/**
 * 查询该篇视频课程是否被收藏
 */
 VideoCourseApi.post('/isCollected', async ctx => {
  const v = await new VideoCourseIsCollectValidator().validate(ctx);
  let { video_course_id,web_user_id } = v.get('body');
  var isCollected = await VideoCourseDao.checkVideoCourseIsCollected(video_course_id,web_user_id);
  ctx.json({
    code:200,
    isCollected
  });
});

// 视频课程点赞
VideoCourseApi.post('/likeVideoCourse', web_loginRequired ,  async ctx => {
  const v = await new LikeVideoCourseValidator().validate(ctx);
  let web_user_id = ctx.currentUser.id
  let { video_course_id } = v.get('body');
  await VideoCourseDao.likeVideoCourse(video_course_id,web_user_id);
  ctx.json({
    code:200,
    message:"点赞成功"
  });
});
// 视频课程取消点赞
VideoCourseApi.post('/unlikeVideoCourse', web_loginRequired ,  async ctx => {
  const v = await new LikeVideoCourseValidator().validate(ctx);
  let web_user_id = ctx.currentUser.id
  let { video_course_id } = v.get('body');
  await VideoCourseDao.unlikeVideoCourse(video_course_id,web_user_id);
  ctx.json({
    code:200,
    message:"取消点赞成功"
  });
});
module.exports = { VideoCourseApi };

