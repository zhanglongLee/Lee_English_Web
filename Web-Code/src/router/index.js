import Vue from 'vue'
import VueRouter from 'vue-router'

import NotFound from '../views/NotFound.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Home',
    component: () => import('../views/Home.vue'),
    meta: {
      title: '英语学习网站'
    }
  },
  {
    path: '/translate',
    name: 'Translate',
    component: () => import('../views/Translate.vue'),
    meta: {
      title: '我要翻译'
    }
  },
  {
    path: '/article',
    name: 'Article',
    component: () => import('../views/Article.vue'),
    meta: {
      title: '文章专区'
    }
  },
  {
    path: '/article/ArticleDetail/:id',
    name: 'ArticleDetail',
    component: () => import('../views/ArticleDetail.vue'),
    meta: {
      title: '文章详情'
    }
  },
  {
    path: '/listen',
    name: 'Listen',
    component: () => import('../views/Listen.vue'),
    meta: {
      title: '听力专区'
    }
  },
  {
    path: '/listen/ListenDetail/:id',
    name: 'ListenDetail',
    component: () => import('../views/ListenDetail.vue'),
    meta: {
      title: '听力练习'
    }
  },
  {
    path: '/PersonalCenter',
    name: 'PersonalCenter',
    component: () => import('../views/PersonalCenter.vue'),
    meta: {
      title: '个人中心',
      authentication: true
    }
  },
  {
    path: '/wordStudy',
    name: 'WordStudy',
    component: () => import('../views/WordStudy.vue'),
    meta: {
      title: '单词学习'
    }
  },
  {
    path: '/wordStudy/wordStudyDetail/:id',
    name: 'WordStudyDetail',
    component: () => import('../views/WordStudyDetail.vue'),
    meta: {
      title: '单词详情学习'
    }
  },
  {
    path: '*',
    component: NotFound,
    meta: {
      title: '404页面'
    }
  }
  // {
  //   path: '/about',
  //   name: 'About',
  //   // route level code-splitting
  //   // this generates a separate chunk (about.[hash].js) for this route
  //   // which is lazy-loaded when the route is visited.
  //   component: () => import(/* webpackChunkName: "about" */ '../views/About.vue')
  // }
]


//获取原型对象上的push函数
const originalPush = VueRouter.prototype.push
//修改原型对象中的push方法
VueRouter.prototype.push = function push(location) {
  return originalPush.call(this, location).catch(err => err)
}

const router = new VueRouter({
  mode: 'hash',
  base: process.env.BASE_URL,
  routes
})

export default router
