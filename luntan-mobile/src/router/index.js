import VueRouter from 'vue-router';
import Vue from 'vue';
import store from '@/store'
Vue.use(VueRouter)

const router = new VueRouter({
  routes: [
    {
      path: '/login',
      name: 'login',
      meta: {
        requireAuth: false
      },
      component: () => import('@/views/login')
    },
    {
      path: '/search',
      name: 'search',
      meta: {
        requireAuth: false
      },
      component: () => import('@/views/search')
    },
    {
      path: '/videoCourseSearch',
      name: 'videoCourseSearch',
      meta: {
        requireAuth: false
      },
      component: () => import('@/views/videoCourseSearch')
    },
    {
      path: '/article/:articleId',
      name: 'article',
      meta: {
        requireAuth: false
      },
      component: () => import('@/views/article'),
      props: true
    },

    {
      path: '/videoCourseDetails/:videoId',
      name: 'videoCourseDetails',
      meta: {
        requireAuth: false
      },
      component: () => import('@/views/videoCourseDetails'),
      props: true
    },
    {
      path: '/user/profile',
      name: 'userprofile',
      meta: {
        requireAuth: true
      },
      component: () => import('@/views/userprofile'),
      props: true
    },
    {
      path: '/userchat',
      name: 'userchat',
      meta: {
        requireAuth: false
      },
      component: () => import('@/views/userchat'),
      props: true
    },
    {
      path: '/usercollect',
      name: 'usercollect',
      meta: {
        requireAuth: true
      },
      component: () => import('@/views/usercollect'),
      props: true
    },
    {
      path: '/userhistory',
      name: 'userhistory',
      meta: {
        requireAuth: true
      },
      component: () => import('@/views/userhistory'),
      props: true
    },
    {
      path: '/',
      meta: {
        requireAuth: false
      },
      component: () => import('@/views/layout'),
      children: [{
        path: '', //默认子路由
        component: () => import('@/views/home')
      },
      {
        path: '/myFocus',
        meta: {
          requireAuth: true
        },
        component: () => import('@/views/myFocus')
      },
      {
        path: '/videoCourse',
        meta: {
          requireAuth: false
        },
        component: () => import('@/views/videoCourse')
      },
      {
        path: '/my',
        meta: {
          requireAuth: false
        },
        component: () => import('@/views/my')
      }
      ]
    }
  ]
})



export default router;