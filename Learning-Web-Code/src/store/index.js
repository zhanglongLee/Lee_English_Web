import Vue from 'vue'
import Vuex from 'vuex';
import { getItem, setItem } from '@/utils/storage'
import router from '@/router/index'
import { getToken, removeToken, saveAccessToken } from '../utils/token'
import { getWebUserInfo, updateWebUserInfo } from '../api/user.js'
import {
  Toast
} from 'vant'
Vue.use(Vuex)

// 准备state
const state = {
  cachePages: ['layout'],
  token: getToken('access_token'),
  userInfo: JSON.parse(sessionStorage.getItem('userInfo')) || null,
  api_url: '',
  history_answer: JSON.parse(sessionStorage.getItem('history_answer')) || [],
  commentId: "",
  postShowObj: {
    data:{},
    status:false
  },
  is_comment_enabled: ""
}

// 响应动作的actions
const USER_KEY = "adk-user"

const actions = {
  setUser({ commit }, user) {
    commit('SETUSER', user);
  },
  updateParam(context, data) {
    context.commit("UPDATEPARAM", data);
  },
  // 获取用户信息
  getUserInfo(context) {
    setTimeout(async () => {
      try {
        let { code, userInfo } = await getWebUserInfo("/web/user/getInfo")
        userInfo.photo = userInfo.avatar
        if (code === 200) {
          context.commit('removeUserInfo')
          context.commit('setUserInfo', userInfo)
        }
      } catch (error) {
        console.log(error);
      }
    }, 0)
  },
  // 修改用户信息
  updateUserInfo(context, data) {
    setTimeout(async () => {
      try {
        let { code, message } = await updateWebUserInfo(data)
        if (code == '10252') {
          // 更新成功
          // 重新获取用户信息
          Toast.success(message)
          context.dispatch('getUserInfo')
        } else {
          Toast.fail(message)
        }
      } catch (error) {
        console.log(error);
      }
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
  UPDATEPARAM(state, param) {
    let attr, data;
    if (param.length > 1) {
      [attr, data] = param;
    } else {
      [data] = param;
    }
    let keys = Object.keys(data);
    for (let key of keys) {
      if (attr) {
        state[attr][key] = data[key];
      } else {
        state[key] = data[key];
        console.log(state);
      }
    }
  },
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
    sessionStorage.setItem('history_answer', data)
  },
  // 删除用户当前点击的听力练习历史答案
  removeHistoryAnswer(state) {
    state.history_answer = []
    sessionStorage.removeItem('history_answer')
  },
  // 设置用户信息
  setUserInfo(state, data) {
    state.userInfo = data
    sessionStorage.setItem('userInfo', JSON.stringify(data))
  },
  // 删除用户信息
  removeUserInfo(state) {
    state.userInfo = null
    sessionStorage.removeItem('userInfo')
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


const getters = {

}
//创建store
export default new Vuex.Store({
  actions,
  mutations,
  state,
  getters
})