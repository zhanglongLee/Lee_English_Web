import Vue from 'vue'
import Vuex from 'vuex';
import { getItem, setItem } from '@/utils/storage'
import { getToken,removeToken,saveAccessToken} from '../utils/token'
import { getUserInfo } from '../utils/index.js'
Vue.use(Vuex)
// 响应动作的actions
const USER_KEY = "adk-user"

const actions = {
  setUser({ commit }, user) {
    commit('SETUSER', user);
  },
  // 获取用户信息
  async getUserInfo(context) {
    setTimeout(() => {
      Vue.prototype.$service
        .get("/web/user/getInfo")
        .then(res => {
          if (res.length === 0) {
            return
          }
          let data = res[0]
          context.commit('removeUserInfo')
          context.commit('setUserInfo', data)
        })
        .catch(err => {
          console.log(err);
        });
    }, 0)
  },
  // 修改用户信息
  updateUserInfo(context, data) {
    setTimeout(() => {
      Vue.prototype.$service
        .post("/web/user/updateInfo", data)
        .then(res => {
          if (res.code == '10252') {
            // 更新成功
            // 重新获取用户信息
            Vue.prototype.$message.success(res.message)
            context.dispatch('getUserInfo')
            return true
          } else {
            Vue.prototype.$message.error(res.message)
          }
        })
        .catch(err => {
          console.log(err);
        });
    }, 0)
    return false
  },
  // 退出登录
  logOut(context) {
    context.commit('removeToken')
    context.commit('removeUserInfo')
    router.push({ path: '/' })
  }
}

//操作数据的mutations
const mutations = {
  SETUSER(state, user) {
    state.user = user;
    // 需要进行持久化
    setItem(USER_KEY, state.user)
  },
  ADDCACHEPAGE(state, pageName) {
    if (!state.cachePages.includes(pageName)) {
      state.cachePages.push(pageName);
    }
  },
  REMOVECACHEPAGE(state, pageName) {
    const index = state.cachePages.indexOf(pageName);
    if (index !== -1) {
      state.cachePages.splice(index, 1);
    }
  },
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
    localStorage.setItem('history_answer', data)
  },
  // 删除用户当前点击的听力练习历史答案
  removeHistoryAnswer(state) {
    state.history_answer = []
    localStorage.removeItem('history_answer')
  },
  // 设置用户信息
  setUserInfo(state, data) {
    state.userInfo = data
    localStorage.setItem('userInfo', JSON.stringify(data))
  },
  // 删除用户信息
  removeUserInfo(state) {
    state.userInfo = {}
    localStorage.removeItem('userInfo')
  },
  // 设置api_url
  setApiUrl(state, url) {
    state.api_url = url
  },
  // 删除api_url
  removeApiUrl(state) {
    state.api_url = ''
  }
}

// 准备state
const state = {
  user: getItem(USER_KEY),
  cachePages: ['layout'],
  token: getToken('access_token'),
  userInfo: JSON.parse(localStorage.getItem('userInfo')) || {},
  api_url: '',
  history_answer: JSON.parse(localStorage.getItem('history_answer')) || [],
}

const getters = {

}
//创建store
export default new Vuex.Store({
  actions,
  mutations,
  state,
  getters
})