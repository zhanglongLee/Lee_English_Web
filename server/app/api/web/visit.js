
import { LinRouter, config } from 'lin-mizar';
import { VisitDao } from '../../dao/visit'


const VisitApi = new LinRouter({
  prefix: '/web/visit'
});

/**
 * 增加网站阅读量
 */
VisitApi.get(
  'addVisit', // 唯一表示
  '/', // URL
  async ctx => {
    const res = await VisitDao.webVisit()
    ctx.success({
      message: '网站阅读量+1！'
    });
  });

module.exports = { VisitApi };