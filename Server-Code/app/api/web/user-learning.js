import { LinRouter } from 'lin-mizar';

import { PositiveIdValidator } from '../../validator/common'

import {
  SubmitLearningValidator,
} from '../../validator/user-learning';

import {
  web_loginRequired,
} from '../../middleware/web_jwt';

import { UserLearningDao } from '../../dao/web-user-learning'

const userLearningApi = new LinRouter({
  prefix: '/web/userLearning',
  module: '练习记录',
  mountPermission: false
});

// 获取做题记录列表
userLearningApi.get('/', web_loginRequired, async ctx => {
  const userLearningList = await UserLearningDao.getUserLearning(ctx);
  ctx.json(userLearningList);
});

// 新增做题记录
userLearningApi.post('/', web_loginRequired, async ctx => {
  const v = await new SubmitLearningValidator().validate(ctx);
  await UserLearningDao.createUserLearning(ctx, v);
  // 新增成功
  ctx.success({
    message: '用户做题记录新增成功！'
  });
});

// 删除做题记录
userLearningApi.delete('/:id', web_loginRequired, async ctx => {
  const v = await new PositiveIdValidator().validate(ctx);
  const id = v.get('path.id');
  await UserLearningDao.deleteUserLearning(ctx, id);
  // 删除成功
  ctx.success({
    message: '用户做题记录删除成功！'
  });
});

export { userLearningApi };
