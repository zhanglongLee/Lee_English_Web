/* eslint-disable class-methods-use-this */
import _axios, { get, put, _delete } from '@/lin/plugin/axios'

// 我们通过 class 这样的语法糖使模型这个概念更加具象化，其优点：耦合性低、可维护性。
class Listening {
  // constructor() {}

  // 类中的方法可以代表一个用户行为
  async createListening(data) {
    return _axios({
      method: 'post',
      url: 'v1/listen',
      data,
    })
  }

  // 在这里通过 async await 语法糖让代码同步执行
  // 1. await 一定要搭配 async 来使用
  // 2. await 后面跟的是一个 Promise 对象

  async editListening(id, info) {
    const res = await put(`v1/listen/${id}`, info)
    return res
  }

  async deleteListening(id) {
    const res = await _delete(`v1/listen/${id}`)
    return res
  }

  async getListenings(obj) {
    let { index, size, q } = obj
    return _axios({
      method: 'get',
      url: 'v1/listen',
      params: {
        page: index,
        size,
        q
      },
      handleError: true,
    })
  }
}

export default new Listening()
