import axios from 'axios'
import store from '../store/index'
import { isJSON } from '../util/common'
import { getToken } from '../util/token'
import Vue from 'vue'
import router from '../router'

const service = axios.create({
  // 联调
  baseURL: process.env.API_URL,
  headers: {
    get: {
      'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8'
    },
    post: {
      'Content-Type': 'application/json;charset=utf-8'
    }
  },
  // 是否跨站点访问控制请求
  timeout: 10000,
  transformRequest: [(data) => {
    data = JSON.stringify(data)
    return data
  }],
  validateStatus() {
    // 使用async-await，处理reject情况较为繁琐，所以全部返回resolve，在业务代码中处理异常
    return true
  },
  transformResponse: [(data) => {
    if (isJSON(data)) {
      data = JSON.parse(data)
    }
    return data
  }]
})

// 请求拦截器
service.interceptors.request.use(config => {
  // 获取vuex中的api地址
  if (store.state.api_url) {
    config.baseURL = store.state.api_url
  }
  // 添加token
  let token = getToken('access_token')
  if (token) {
    config.headers.Authorization = token;
  }
  return config
}, (error) => {
  // 错误抛到业务代码
  error.data = {}
  error.data.msg = '服务器异常，请联系管理员！'
  return Promise.resolve(error)
})

// 响应拦截器
service.interceptors.response.use(response => {
  let msg = response.data.message
  if(msg instanceof Array){
    // message: ["电子邮箱不符合规范，请输入正确的邮箱"]
    response.data.message = msg[0]
  }
  if(response.data.code===10051){
    // token 过期
    // 清除用户过期信息
    store.dispatch('logOut')
  }
  return response.data
}, (error) => {
  // 错误抛到业务代码
  error.data = {}
  error.data.msg = '请求超时或服务器异常，请检查网络或联系管理员！'
  return Promise.resolve(error)
})

export default service