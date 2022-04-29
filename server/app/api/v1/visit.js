
import { LinRouter, config } from 'lin-mizar';
import { loginRequired } from '../../middleware/jwt';
import { VisitDao } from '../../dao/visit'


const VisitApi = new LinRouter({
  prefix: '/v1/visit'
});

/**
 * 查看文章列表
 */
VisitApi.linGet(
  'getVisit', // 唯一表示
  '/', // URL
  loginRequired,
  async ctx => {
    const res = await VisitDao.getVisitInfo()
    ctx.json(res);
  });

module.exports = { VisitApi };