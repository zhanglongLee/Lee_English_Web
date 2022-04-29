import { LinRouter } from 'lin-mizar';
import { PaginateValidator, PositiveIdValidator } from '../../validator/common'
import {
  AddVideoCourseHistoryValidator, 
  DeleteVideoCourseHistoryValidator
} from '../../validator/videoCourseHistory';
import {
  web_loginRequired,
} from '../../middleware/web_jwt';
import { VideoCourseHistoryDao } from '../../dao/videoCourseHistory'

const History = new LinRouter({
  prefix: '/web/videoCourseHistory',
  module: '用户文章浏览记录',
  // 用户权限暂不支持分配，开启分配后也无实际作用
  mountPermission: false
});


// 获取个人用户的收藏列表
History.get('/', web_loginRequired, async ctx => {
  // 获取用户的id
  let id = ctx.currentUser.id;
  const v = await new PaginateValidator().validate(ctx);
  let { page, size } = v.get('query');
  let historyList = await VideoCourseHistoryDao.getVideoCourseHistoryList(id, page, size);
  // let historyList = []
  // for(let i=0;i<historyArr.length;i++){
  //   historyList.push(historyArr[i].dataValues.article)
  // }
  let obj = {
    page: Number(page),
    size: Number(size),
    total: historyList.length,
    data: historyList,
    code: 200
  };
  ctx.json(obj);
});

// 新增用户的文章浏览记录
History.post('/add', web_loginRequired, async ctx => {
  const v = await new AddVideoCourseHistoryValidator().validate(ctx);
  let { video_course_id } = v.get('body')
  let web_user_id = ctx.currentUser.id
  await VideoCourseHistoryDao.createHistory(web_user_id, video_course_id);
  // 新增成功
  ctx.success({
    code: 200,
    message: '浏览记录新增成功！'
  });
});

// 删除收藏记录
History.delete('/:video_course_id', web_loginRequired, async ctx => {
  const v = await new DeleteVideoCourseHistoryValidator().validate(ctx);
  const video_course_id = v.get('path.video_course_id');
  const web_user_id = ctx.currentUser.id
  await VideoCourseHistoryDao.deleteHistory(web_user_id, video_course_id);
  // 删除成功
  ctx.success({
    message: '浏览记录删除成功！'
  });
});

export { History };
