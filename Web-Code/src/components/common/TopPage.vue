<template>
  <header>
    <Login v-if="isShow" @closecb="logoutCallBack" />
    <div class="title">
      <ul>
        <li
          v-for="(item, index) in navList"
          :key="index"
          class="item"
          :class="{ active: item.active }"
          @click="toNav(item.path)"
        >
          {{ item.name }}
        </li>
      </ul>
      <div class="information-wrap">
        <span v-if="!isLogin" class="login" @click="loginClick">登录/注册</span>
        <div v-if="isLogin" class="content">
          <div title="点击进入个人主页" @click="$router.push({path:'/PersonalCenter'})">
            <el-avatar class="information" :size="46" :src="circleUrl" />
          </div>
          <div class="logout" title="点击退出登录" @click="doLogOut">退出登录</div>
        </div>
      </div>
    </div>
  </header>
</template>

<script>
import Login from '@/components/common/login/Login'
export default {
  name: 'TopPage',
  components: {
    Login
  },
  inject: ['eventBus'],
  data() {
    return {
      // isLogin: false,
      isShow: false, // 登录
      navList: [
        {
          name: '首页',
          active: true,
          path: '/'
        },
        {
          name: '我要翻译',
          active: false,
          path: '/translate'
        },
        {
          name: '文章专区',
          active: false,
          path: '/article'
        },
        {
          name: '听力专区',
          active: false,
          path: '/listen'
        },
        {
          name: '单词学习',
          active: false,
          path: '/wordStudy'
        }
      ]
    }
  },
  computed:{  
    circleUrl(){
      return this.$store.state.userInfo.avatar || require('@/assets/images/logo.png')
    },
    isLogin(){
      return !!this.$store.state.token
    }
  },
  watch: {
    $route(newPath) {
      const path = '/' + newPath.fullPath.split('/')[1]
      this.checkAct(path)
    }
  },
  mounted() {
    this.checkAct(this.$route.fullPath)
    // 监听登录是否成功
    this.eventBus.$on('logincb', this.loginStatus)
  },
  beforeDestroy() {
    this.eventBus.$off('logincb', this.loginStatus)
  },
  methods: {
    // 显示登录组件
    loginClick() {
      this.isShow = true
    },
    // 关闭登录组件回调
    logoutCallBack() {
      this.isShow = false
    },
    // 监听登录状态
    loginStatus(flag){
      if(flag === 'ok'){
        this.isShow = false
      }
    },
    // 菜单栏跳转
    toNav(path) {
      this.$router.push({ path: path })
    },
    // 高亮点击的菜单
    checkAct(path) {
      if (path) {
        this.navList.forEach((item, index) => {
          item.active = false
          if (path === item.path) {
            this.navList[index].active = true
          }
        })
      }
    },
    // 退出登录
    doLogOut() {
      this.$router.push({path:"/"})
      this.$store.commit('removeToken')
      this.$store.commit('removeUserInfo')
    }
  }
}
</script>

<style lang="scss" scoped>
header {
  // position: fixed;
  // z-index: 9999999;
  // top: 0px;
  // left: 0px;
  width: 100%;
  height: 54px;
  min-width: 1300px;
  margin: 0 auto;
  background: rgba(61, 68, 76, 1);

  .title {
    display: flex;
    justify-content: space-around;
    width: 100%;
    height: 100%;
    background-color: transparent;
    font-size: 0;

    ul {
      display: flex;
    }

    .item {
      height: 54px;
      line-height: 54px;
      padding: 0 10px;
      font-size: 16px;
      color: #ccc;
      cursor: pointer;
    }

    .logo img {
      height: 75px;
    }

    .item:hover {
      color: #fff;
    }

    .item.active {
      color: #fff;
      background: rgb(41, 46, 51);
    }

    .information-wrap {
      display: flex;
      align-items: center;

      .search {
        width: 260px;
        overflow: hidden;
        border-radius: 3px;
        display: flex;

        input {
          width: 230px;
          height: 32px;
          line-height: 32px;
          padding: 0 0 0 10px;
          color: #fff;
          background: #31363e;
          border: none;
          outline: none;
        }

        .search-btn {
          flex: 1;
          display: flex;
          justify-content: center;
          align-items: center;
          background: #31363e;
          cursor: pointer;

          i {
            width: 24px;
            height: 24px;
            background: url(../../assets/images/search.png) no-repeat;
            background-size: 100% 100%;
          }
        }
      }

      .login {
        font-size: 16px;
        color: #ccc;
        margin-left: 20px;
        cursor: pointer;

        &:hover {
          color: #fff;
        }
      }
      .content {
        display: flex;
        justify-content: center;
        align-items: center;

        .information {
          margin: 0 10px;
          cursor: pointer;
          /deep/ img {
            width: 100%;
          }
        }
        .logout{
          font-size: 14px;
          color: #ccc;
          cursor: pointer;
          &:hover{
            color: #fff;
          }
        }

      }
    }
  }
}
</style>
