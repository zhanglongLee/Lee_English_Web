import { LinRouter } from 'lin-mizar';

import { PositiveIdValidator } from '../../validator/common'

import {
  CreateWordBookValidator, DeleteWordBookValidator
} from '../../validator/wordbook';

import {
  web_loginRequired,
} from '../../middleware/web_jwt';

import { WordBookDao } from '../../dao/wordbook'

const wordBookApi = new LinRouter({
  prefix: '/web/wordBook',
  module: '生词本管理',
  mountPermission: false
});

// 获取生词列表
wordBookApi.get('/', web_loginRequired, async ctx => {
  const wordBookList = await WordBookDao.getWordBook(ctx);
  ctx.json(wordBookList);
});

// 新增生词
wordBookApi.post('/', web_loginRequired, async ctx => {
  const v = await new CreateWordBookValidator().validate(ctx);
  let { web_user_id, word_id } = v.get('body')
  await WordBookDao.createWordBook(web_user_id,JSON.parse(word_id));
  // 新增成功
  ctx.success({
    message: '用户生词新增成功！'
  });
});

// 删除生词
wordBookApi.delete('/:web_user_id/:word_id', web_loginRequired, async ctx => {
  const v = await new DeleteWordBookValidator().validate(ctx);
  const { web_user_id, word_id } = v.get('path');
  await WordBookDao.deleteWordBook(web_user_id, word_id);
  // 删除成功
  ctx.success({
    message: '用户生词删除成功！'
  });
});

export { wordBookApi };
