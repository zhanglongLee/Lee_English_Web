import { LinRouter } from 'lin-mizar';
import { groupRequired } from '../../middleware/jwt';
import { logger } from '../../middleware/logger';
import { DeleteCollectionValidator } from '../../validator/collection';
import { CollectionDao } from '../../dao/collection';

const CollectionApi = new LinRouter({
  prefix: '/v1/collection'
});


/**
 * 查看收藏列表
 */
CollectionApi.get('/', async ctx => {
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

/**
 * 删除收藏
 */
CollectionApi.linDelete(
  'deleteCollection', // 唯一表示
  '/:type/:id', // URL
  {
    permission: '删除文章收藏', // 权限的名字
    module: '文章收藏管理', // 权限属于哪个模块
    mount: true // 是否在全局的权限列表中显示
  },
  groupRequired,
  logger('{user.username}删除收藏'), // logger，参数为日志内容
  async ctx => {
    const v = await new DeleteCollectionValidator().validate(ctx);
    const type = v.get('path.type');
    const id = v.get('path.id');
    await CollectionDao.deleteCollection(type,id);
    // 删除成功
    ctx.success({
      message: '收藏记录删除成功！'
    });
  });

module.exports = { CollectionApi };