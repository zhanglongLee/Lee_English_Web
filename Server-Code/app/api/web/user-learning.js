import { LinRouter } from 'lin-mizar';
import { PositiveIdValidator } from '../../validator/common'
import {
  SubmitLearningValidator,
  DeleteLearningValidator
} from '../../validator/user-learning';
import {
  web_loginRequired,
} from '../../middleware/web_jwt';
import { UserLearningDao } from '../../dao/web-user-learning'

const userLearning = new LinRouter({
  prefix: '/web/userLearning',
  module: '练习记录',
  // 用户权限暂不支持分配，开启分配后也无实际作用
  mountPermission: false
});

const userLearningDao = new UserLearningDao();

// 获取做题记录列表
userLearning.get('/', web_loginRequired , async ctx => {
  const userLearningList = await userLearningDao.getUserLearning(ctx);
  // 新增成功
  ctx.json(userLearningList);
});

// 新增做题记录
userLearning.post('/', web_loginRequired , async ctx => {
  const v = await new SubmitLearningValidator().validate(ctx);
  await userLearningDao.createUserLearning(ctx,v);
  // 新增成功
  ctx.success({
    message: '用户做题记录新增成功！'
  });
});

// 删除做题记录
userLearning.delete('/:id', web_loginRequired , async ctx => {
  const v = await new PositiveIdValidator().validate(ctx);
  const id = v.get('path.id');
  await userLearningDao.deleteUserLearning(ctx,id);
  // 删除成功
  ctx.success({
    message: '用户做题记录删除成功！'
  });
});

export { userLearning };
