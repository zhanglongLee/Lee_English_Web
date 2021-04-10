import Vue from 'vue'
import Vuex from 'vuex'
import router from '../router'
import { getToken,removeToken,saveAccessToken} from '../util/token'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    token: getToken('access_token'),
    userInfo: JSON.parse(localStorage.getItem('userInfo')) || {},
    api_url:'',
    history_answer:JSON.parse(localStorage.getItem('history_answer')) || [],
  },
  mutations: {
    // 设置token信息
    setToken(state, token) {
      state.token = token
      saveAccessToken(token)
    },
    // 删除token信息
    removeToken(state) {
      state.token = ''
      removeToken()
    },
    // 设置用户当前点击的听力练习历史答案
    setHistoryAnswer(state, data) {
      state.history_answer = data
      localStorage.setItem('history_answer',data)
    },
    // 删除用户当前点击的听力练习历史答案
    removeHistoryAnswer(state) {
      state.history_answer = []
      localStorage.removeItem('history_answer')
    },
    // 设置用户信息
    setUserInfo(state, data) {
      state.userInfo = data
      localStorage.setItem('userInfo',JSON.stringify(data))
    },
    // 删除用户信息
    removeUserInfo(state) {
      state.userInfo = {}
      localStorage.removeItem('userInfo')
    },
    // 设置api_url
    setApiUrl(state,url){
      state.api_url = url
    },
    // 删除api_url
    removeApiUrl(state){
      state.api_url = ''
    }

  },
  actions: {
    // 获取用户信息
    getUserInfo(context){
      setTimeout(()=>{
        Vue.prototype.$service
        .get("/web/user/getInfo")
        .then(res => {
          if(res.length===0){
            return
          }
          let data = res[0]
          context.commit('removeUserInfo')
          context.commit('setUserInfo',data)
        })
        .catch(err => {
          console.log(err);
        });
      },0)
    },
    // 修改用户信息
    updateUserInfo(context,data){
      setTimeout(()=>{
        Vue.prototype.$service
        .post("/web/user/updateInfo",data)
        .then(res => {
          if(res.code=='10252'){
            // 更新成功
            // 重新获取用户信息
            Vue.prototype.$message.success(res.message)
            context.dispatch('getUserInfo')
            return true
          }else{
            Vue.prototype.$message.error(res.message)
          }
        })
        .catch(err => {
          console.log(err);
        });
      },0)
      return false
    },
    // 退出登录
    logOut(context){
      context.commit('removeToken')
      context.commit('removeUserInfo')
      router.push({path:'/'})
    }
  },
  getters: {
  },
  modules: {
  }
})
