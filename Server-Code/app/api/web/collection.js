import { LinRouter } from 'lin-mizar';
import { PositiveIdValidator } from '../../validator/common'
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


// 获取收藏列表
Collection.get('/', web_loginRequired , async ctx => {
  let { page, size } = ctx.query;

  let collectionList = await CollectionDao.getCollectionList();
  // let resList = 
  // 返回结果
  let obj = {};
  obj.page = Number(page) || 1;
  obj.size = Number(size) || 5;
  obj.total = collectionList.length;
  obj.data = collectionList;

  ctx.json(obj);
});

// 新增收藏记录
Collection.post('/', web_loginRequired , async ctx => {
  const v = await new AddCollectionValidator().validate(ctx);
  await CollectionDao.createCollection(v);
  // 新增成功
  ctx.success({
    message: '收藏记录新增成功！'
  });
});

// 删除收藏记录
Collection.delete('/:type/:id', web_loginRequired , async ctx => {
  const v = await new DeleteCollectionValidator().validate(ctx);
  const type = v.get('path.type');
  const id = v.get('path.id');
  await CollectionDao.deleteCollection(type,id);
  // 删除成功
  ctx.success({
    message: '收藏记录删除成功！'
  });
});

export { Collection };
