import { LinRouter } from 'lin-mizar';
import { PaginateValidator, PositiveIdValidator } from '../../validator/common'
import {
  DeleteCollectionValidator,
  AddCollectionValidator
} from '../../validator/collection';
import {
  web_loginRequired,
} from '../../middleware/web_jwt';
import { CollectionDao } from '../../dao/collection'

const Collection = new LinRouter({
  prefix: '/web/collection',
  module: '练习记录',
  // 用户权限暂不支持分配，开启分配后也无实际作用
  mountPermission: false
});


// 获取个人用户的收藏列表
Collection.get('/', web_loginRequired, async ctx => {
  // 获取用户的id
  let id = ctx.currentUser.id;
  const v = await new PaginateValidator().validate(ctx);
  let { page, size } = v.get('query');
  let collectionList = await CollectionDao.getCollectionList(id, page, size);
  let obj = {
    page: Number(page),
    size: Number(size),
    total: collectionList.length,
    data: collectionList,
    code: 200
  };
  ctx.json(obj);
});

// 新增收藏记录
Collection.post('/', web_loginRequired, async ctx => {
  const v = await new AddCollectionValidator().validate(ctx);
  let { type, id } = v.get('body')
  let web_user_id = ctx.currentUser.id
  await CollectionDao.createCollection(type, id, web_user_id);
  // 新增成功
  ctx.success({
    message: '收藏记录新增成功！'
  });
});

// 删除收藏记录
Collection.delete('/:type/:id', web_loginRequired, async ctx => {
  const v = await new DeleteCollectionValidator().validate(ctx);
  const type = v.get('path.type');
  const id = v.get('path.id');
  const web_user_id = ctx.currentUser.id
  await CollectionDao.deleteCollection(type, id, web_user_id);
  // 删除成功
  ctx.success({
    message: '收藏记录删除成功！'
  });
});

export { Collection };
