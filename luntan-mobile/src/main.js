import Vue from 'vue'
import App from './App.vue'
import router from './router/index';
import store from './store';

// 自动设置rem基准值
import 'amfe-flexible'

import Vant from 'vant';
import 'vant/lib/index.css';
import '@/styles/index.less';
import '@/utils/dayjs'
import {Toast} from 'vant'

import {getToken} from './utils/token'
import service from './utils/axios'
import VueVideoPlayer from 'vue-video-player'
 
// require videojs style
import 'video.js/dist/video-js.css'
import 'vue-video-player/src/custom-theme.css'
 
Vue.use(VueVideoPlayer)

Vue.prototype.$service = service

Vue.use(Vant)
Vue.config.productionTip = false
Vue.prototype.$bus = new Vue()

router.beforeEach((to, from, next) => {
  // 设置标题
  if (to.meta && to.meta.title) {
    document.title = to.meta.title
  }
  if (to.meta && to.meta.requireAuth) {
    if (!getToken('access_token')) {
      next({ path: '/login' })
      Toast('请登录后访问')
    }
  }
  next()
})

new Vue({
  render: h => h(App),
  router,
  store
}).$mount('#app')