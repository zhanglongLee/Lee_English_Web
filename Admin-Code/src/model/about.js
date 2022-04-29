/* eslint-disable class-methods-use-this */
import _axios, { get, put, _delete } from '@/lin/plugin/axios'

// 我们通过 class 这样的语法糖使模型这个概念更加具象化，其优点：耦合性低、可维护性。
class About {
  async getVisit() {
    return _axios({
      method: 'get',
      url: 'v1/visit',
      handleError: true,
    })
  }
}

export default new About()