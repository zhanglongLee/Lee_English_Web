import { LinRouter, config } from 'lin-mizar';
import { groupRequired } from '../../middleware/jwt';
import { logger } from '../../middleware/logger';
import { AddListeningValidator, DeleteListeningValidator, EditListeningValidator } from '../../validator/listening';
import { ListeningDao } from '../../dao/listening';
import { CollectionDao } from '../../dao/collection';
import { UserLearningDao } from '../../dao/web-user-learning'

const ListenApi = new LinRouter({
  prefix: '/v1/listen'
});

// 1. 权限控制（post => linPost）
// 2. 行为日志（审计）添加logger 例如：logger("{user.username}新增期刊内容")

/**
 * 新增听力练习
 */
ListenApi.linPost(
  'addListening', // 唯一表示
  '/', // URL
  {
    permission: '新增听力练习', // 权限的名字
    module: '听力练习管理', // 权限属于哪个模块
    mount: true // 是否在全局的权限列表中显示
  },
  groupRequired,
  logger('{user.username}新增听力练习'), // logger，参数为日志内容
  async ctx => {
    // 1、校验参数
    const v = await new AddListeningValidator().validate(ctx);
    // 2、处理业务逻辑
    // 3、存入数据库
    await ListeningDao.createListening(v.get('body'));
    // 4、返回成功
    ctx.success({
      message: '听力练习新增成功！'
    });
  });

/**
 * 查看听力练习列表
 */
ListenApi.linGet(
  'getListening', // 唯一表示
  '/', // URL
  {
    permission: '查看所有听力练习', // 权限的名字
    module: '听力练习管理', // 权限属于哪个模块
    mount: true // 是否在全局的权限列表中显示
  },
  groupRequired,
  async ctx => {
  let { page, size, q } = ctx.query;

  let listenList = await ListeningDao.getListeningList(page, size, q);

  // 返回结果
  let obj = {};
  obj.page = Number(page) || 1;
  obj.size = Number(size) || 5;
  obj.total = listenList.count;
  obj.data = listenList.rows;

  ctx.json(obj);
});

/**
 * 编辑听力练习内容
 */
ListenApi.linPut(
  'editListening', // 唯一表示
  '/:id', // URL
  {
    permission: '修改听力练习内容', // 权限的名字
    module: '听力练习管理', // 权限属于哪个模块
    mount: true // 是否在全局的权限列表中显示
  },
  groupRequired,
  logger('{user.username}修改听力练习内容'), // logger，参数为日志内容
  async ctx => {
    const v = await new EditListeningValidator().validate(ctx);
    const id = v.get('path.id');
    const params = v.get('body');
    await ListeningDao.editListening(id, params);
    ctx.success({
      message: '听力练习内容修改成功！'
    });
  });

/**
 * 删除听力练习
 */
ListenApi.linDelete(
  'deleteListening', // 唯一表示
  '/:id', // URL
  {
    permission: '删除听力练习', // 权限的名字
    module: '听力练习管理', // 权限属于哪个模块
    mount: true // 是否在全局的权限列表中显示
  },
  groupRequired,
  logger('{user.username}删除听力练习'), // logger，参数为日志内容
  async ctx => {
    const v = await new DeleteListeningValidator().validate(ctx);
    const id = v.get('path.id');
    // 1、删除该听力练习
    await ListeningDao.deleteListening(id);
    // 2、删除该听力练习下所有的收藏记录
    await CollectionDao.deleteCollection(2, id)
    // 3、删除该听力练习下所有的做题记录
    await UserLearningDao.deleteUserLearning(ctx, id);
    ctx.success({
      message: '听力练习删除成功！'
    });
  });



module.exports = { ListenApi };