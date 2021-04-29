import { LinRouter, config } from 'lin-mizar';
import { groupRequired } from '../../middleware/jwt';
import { logger } from '../../middleware/logger';
import { CreateWordValidator,UpdateWordValidator,DeleteWordValidator } from '../../validator/word';
import { PaginateValidator,PositiveIdValidator } from '../../validator/common'
import { WordDao } from '../../dao/word';
import { WordBookDao } from '../../dao/wordbook'

const WordApi = new LinRouter({
  prefix: '/v1/word'
});


/**
 * 新增单词
 */
WordApi.linPost(
  'addWord', // 唯一表示
  '/', // URL
  {
    permission: '新增单词', // 权限的名字
    module: '单词管理', // 权限属于哪个模块
    mount: true // 是否在全局的权限列表中显示
  },
  groupRequired,
  logger('{user.username}新增单词'), // logger，参数为日志内容
  async ctx => {
    // 1、校验参数
    const v = await new CreateWordValidator().validate(ctx);
    // 2、处理业务逻辑
    // 3、存入数据库
    await WordDao.createWord(v.get('body'));
    // 4、返回成功
    ctx.success({
      message: '单词新增成功！'
    });
  });

/**
 * 通过Id查找单词
 */
WordApi.get('/:id', async ctx => {
  const v = await new PositiveIdValidator().validate(ctx);
  let { id } = v.get('path');
  var wordList = await WordDao.getWordById(id);
  ctx.json({
    data:wordList
  });
});

/**
 * 查看单词列表
 */
WordApi.linGet(
  'getWord', // 唯一表示
  '/', // URL
  {
    permission: '查询所有单词', // 权限的名字
    module: '单词管理', // 权限属于哪个模块
    mount: true // 是否在全局的权限列表中显示
  },
  groupRequired,
  async ctx => {
  const v = await new PaginateValidator().validate(ctx);
  let { page, size, q } = v.get('query');
  let wordList = await WordDao.getWordList(page, size, q);
  // 返回结果
  let obj = {};
  obj.page = Number(page) || 1;
  obj.size = Number(size) || 5;
  obj.total = wordList.count;
  obj.data = wordList.rows;

  ctx.json(obj);
});

/**
 * 编辑单词内容
 */
WordApi.linPut(
  'editWord', // 唯一表示
  '/:id', // URL
  {
    permission: '修改单词内容', // 权限的名字
    module: '单词管理', // 权限属于哪个模块
    mount: true // 是否在全局的权限列表中显示
  },
  groupRequired,
  logger('{user.username}修改单词内容'), // logger，参数为日志内容
  async ctx => {
    const v = await new EditWordValidator().validate(ctx);
    const id = v.get('path.id');
    const params = v.get('body');
    await WordDao.editWord(id, params);
    ctx.success({
      message: '单词内容修改成功！'
    });
  });

/**
 * 删除单词
 */
WordApi.linDelete(
  'deleteWord', // 唯一表示
  '/:id', // URL
  {
    permission: '删除单词', // 权限的名字
    module: '单词管理', // 权限属于哪个模块
    mount: true // 是否在全局的权限列表中显示
  },
  groupRequired,
  logger('{user.username}删除单词'), // logger，参数为日志内容
  async ctx => {
    const v = await new DeleteWordValidator().validate(ctx);
    const id = v.get('path.id');

    const web_user_id = ctx.currentUser.id
    // 1、删除单词
    await WordDao.deleteWord(id);
    // 2、删除生词本下该单词信息
    await WordBookDao.deleteWordBook(web_user_id, id);
    ctx.success({
      message: '单词删除成功！'
    });
  });

module.exports = { WordApi };