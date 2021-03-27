import { LinRouter } from 'lin-mizar';
import { groupRequired } from '../../middleware/jwt';
import { logger } from '../../middleware/logger';
import { AddCategoryValidator, DeleteCategoryValidator, EditCategoryValidator } from '../../validator/category';
import { CategoryDao } from '../../dao/category';

const CategoryApi = new LinRouter({
  prefix: '/v1/category'
});

// 1. 权限控制（post => linPost）
// 2. 行为日志（审计）添加logger 例如：logger("{user.username}新增期刊内容")

/**
 * 新增分类
 */
CategoryApi.linPost(
  'addCategory', // 唯一表示
  '/', // URL
  {
    permission: '新增分类', // 权限的名字
    module: '分类管理', // 权限属于哪个模块
    mount: true // 是否在全局的权限列表中显示
  },
  groupRequired,
  logger('{user.username}新增分类'), // logger，参数为日志内容
  async ctx => {
    // 1、校验参数
    const v = await new AddCategoryValidator().validate(ctx);
    // 2、处理业务逻辑
    // 3、存入数据库
    await CategoryDao.createCategory(v.get('body'));
    // 4、返回成功
    ctx.success({
      message: '分类新增成功！'
    });
  });

/**
 * 查看分类列表
 */
CategoryApi.get('/', async ctx => {
  let { page, size, q } = ctx.query;

  let categoryList = await CategoryDao.getCategoryList(page, size, q);

  // 返回结果
  let obj = {};
  obj.page = Number(page) || 1;
  obj.size = Number(size) || 5;
  obj.total = categoryList.count;
  obj.data = categoryList.rows;

  ctx.json(obj);
});

/**
 * 编辑分类内容
 */
CategoryApi.linPut(
  'editCategory', // 唯一表示
  '/:id', // URL
  {
    permission: '修改分类内容', // 权限的名字
    module: '分类管理', // 权限属于哪个模块
    mount: true // 是否在全局的权限列表中显示
  },
  groupRequired,
  logger('{user.username}修改分类内容'), // logger，参数为日志内容
  async ctx => {
    const v = await new EditCategoryValidator().validate(ctx);
    const id = v.get('path.id');
    const params = v.get('body');
    await CategoryDao.editCategory(id, params);
    ctx.success({
      message: '分类内容修改成功！'
    });
  });

/**
 * 删除分类
 */
CategoryApi.linDelete(
  'deleteCategory', // 唯一表示
  '/:id', // URL
  {
    permission: '删除分类', // 权限的名字
    module: '分类管理', // 权限属于哪个模块
    mount: true // 是否在全局的权限列表中显示
  },
  groupRequired,
  logger('{user.username}删除分类'), // logger，参数为日志内容
  async ctx => {
    const v = await new DeleteCategoryValidator().validate(ctx);
    const id = v.get('path.id');
    await CategoryDao.deleteCategory(id);
    ctx.success({
      message: '分类删除成功！'
    });
  });

module.exports = { CategoryApi };