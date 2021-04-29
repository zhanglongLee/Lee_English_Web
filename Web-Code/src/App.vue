<template>
  <div class="container">
    <header>
      <top-page v-if="!isNotFound" />
    </header>
    <section>
      <router-view />
    </section>
    <!-- 回到顶部 -->
    <img v-show="btnFlag" class="go-top" src="./assets/images/backTop.png" @click="ScrollTop" />
  </div>
</template>
<script>
import TopPage from './components/common/TopPage'
import Vue from 'vue'
export default {
  name: 'Translate',
  components: {
    'top-page': TopPage
  },
  data() {
    return {
      isNotFound: false,
      btnFlag: false,
      scrollTopHeight: 0,
      eventBus: new Vue(),
    }
  },
  provide() {
    // eventBus挂载的事件： addGroup addUser
    return {
      eventBus: this.eventBus,
    }
  },
  watch: {
    $route: {
      handler: function(val, oldVal) {
        this.isNotFound = val.meta.title === '404页面'
      },
      // 深度观察监听
      deep: true
    },
    scrollTopHeight() {
      if (this.scrollTopHeight > 60) {
        this.btnFlag = true
      } else {
        this.btnFlag = false
      }
    }
  },
  mounted() {

    this.isNotFound = this.$route.meta.title === '404页面'
    window.addEventListener('scroll', this.watchScroll)
  },
  methods: {
    ScrollTop() {
      this.scrollToTop()
    },
    watchScroll() {
      this.scrollTopHeight =
        window.pageYOffset ||
        document.documentElement.scrollTop ||
        document.body.scrollTop
    }
  }
}
</script>
<style lang="scss">
@import url(assets/css/reset.css);
@import url(assets/css/iconfont.css);
@import url(assets/css/common.css);
* {
  box-sizing: border-box;
}
body{
  font-family: Arial,"Microsoft YaHei";
}
.go-top {
  position: fixed;
  right: 50px;
  bottom: 50px;
  width: 40px;
  height: 40px;
  cursor: pointer;
}
.container {
  position: relative;
  width: 100%;
  height: 100%;
}
.header {
  width: 100%;
}
section {
  width: 100%;
}

</style>
