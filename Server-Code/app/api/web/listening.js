import { LinRouter, config } from 'lin-mizar';
import { groupRequired } from '../../middleware/jwt';
import { logger } from '../../middleware/logger';
import { AddListeningValidator, DeleteListeningValidator, EditListeningValidator } from '../../validator/listening';
import { PositiveIdValidator,PaginateValidator } from '../../validator/common'
import { ListeningDao } from '../../dao/listening';
import { CollectionDao } from '../../dao/collection';
import { shuffle } from '../../lib/util'

const ListenApi = new LinRouter({
  prefix: '/web/listening'
});


/**
 * 查看听力练习列表
 */
ListenApi.get('/', async ctx => {
  const v = await new PaginateValidator().validate(ctx);
  let { page, size, q } = v.get('query');
  let listenList = await ListeningDao.getWebListeningList(page, size, q);

  // 返回结果
  let obj = {};
  obj.page = Number(page) || 1;
  obj.size = Number(size) || 5;
  obj.total = listenList.count;
  obj.data = listenList.rows;

  ctx.json(obj);
});

/**
 * 获取热门随机听力列表
 */
ListenApi.get('/hotlist', async ctx => {
  let listenList = await ListeningDao.getListeningHotList();
  // 随机选取其中五条
  listenList = shuffle(listenList).slice(0, 5)
  // 返回结果
  let obj = {};
  obj.data = listenList;

  ctx.json(obj);
});

/**
 * 通过Id查找听力练习详情
 */
ListenApi.get('/:id', async ctx => {
  const v = await new PositiveIdValidator().validate(ctx);
  let { id } = v.get('path');
  var listenList = await ListeningDao.getListeningById(id);
  ctx.json({
    data: listenList
  });
});

module.exports = { ListenApi };