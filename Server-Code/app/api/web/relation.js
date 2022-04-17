import { LinRouter } from 'lin-mizar';
import { PaginateValidator, PositiveIdValidator } from '../../validator/common'
import {
  CreateOrUpdateRelationValidator,
  SearchRelationValidator,
  IsFocusRelationValidator
} from '../../validator/relation';
import {
  web_loginRequired,
} from '../../middleware/web_jwt';
import { RelationDao } from '../../dao/relation'

const Relation = new LinRouter({
  prefix: '/web/relation',
  module: '关注或拉黑用户',
  // 用户权限暂不支持分配，开启分配后也无实际作用
  mountPermission: false
});


// 查询关注用户发布的文章或视频列表
Relation.get('/articleAndVideoList', web_loginRequired, async ctx => {
  // 获取用户的id
  let from_user_id = ctx.currentUser.id;
  let relationLists = await RelationDao.getRelationLists(from_user_id, 1);
  let obj = {
    data: relationLists,
    code: 200
  };
  ctx.json(obj);
});

// 切换一个用户对另一个用户的关注/取消关注/拉黑的状态
Relation.post('/createOrUpdate', web_loginRequired, async ctx => {
  const v = await new CreateOrUpdateRelationValidator().validate(ctx);
  let { rel_type, to_user_id } = v.get('body')
  let from_user_id = ctx.currentUser.id
  await RelationDao.operationRelationType(from_user_id,to_user_id,rel_type);
  // 新增成功
  ctx.success({
    message: '操作成功！'
  });
});

// 查询该用户是否被关注
Relation.post('/isFocus', web_loginRequired, async ctx => {
  const v = await new IsFocusRelationValidator().validate(ctx);
  let { to_user_id } = v.get('body')
  let from_user_id = ctx.currentUser.id
  const isFocus = await RelationDao.relationIsFocus(from_user_id,to_user_id);
  // 新增成功
  ctx.json({
    code: 200,
    isFocus
  });
});

export { Relation };
