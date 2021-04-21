import { LinRouter, config } from 'lin-mizar';
import { PaginateValidator, PositiveIdValidator } from '../../validator/common'
import { GetWordTypeValidator } from '../../validator/word'
import { WordDao } from '../../dao/word';
import { shuffle } from '../../lib/util'

const WordApi = new LinRouter({
  prefix: '/web/word'
});



/**
 * 查看单词列表
 */
WordApi.get('/', async ctx => {
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
 * 获取单词类型列表
 */
WordApi.get('/typeList', async ctx => {
  let wordList = await WordDao.getTypeList();
  // 返回结果
  let obj = {};
  obj.data = wordList;

  ctx.json(obj);
});

/**
 * 根据分类查询单词列表
 */
WordApi.get('/:type', async ctx => {
  const v = await new GetWordTypeValidator().validate(ctx);
  let { page, size } = v.get('query');
  let { type } = v.get('path');
  let wordList = await WordDao.getWordListByType(page, size, type);
  // 返回结果
  let obj = {};
  obj.page = Number(page) || 1;
  obj.size = Number(size) || 5;
  obj.total = wordList.count;
  obj.data = wordList.rows;
  ctx.json(obj);
});

/**
 * 根据分类查询单词卡片列表
 */
 WordApi.get('/card/:type', async ctx => {
  const v = await new GetWordTypeValidator().validate(ctx);
  let { type } = v.get('path');
  let wordList = await WordDao.getWordListByType(1, 9999, type);
  // 返回结果
  let obj = {};
  // 乱序
  obj.data = shuffle(wordList.rows);
  ctx.json(obj);
});
module.exports = { WordApi };