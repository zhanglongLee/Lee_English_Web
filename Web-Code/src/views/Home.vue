<template>
  <div class="home">
    <!-- <div class="banner">
      <swiper ref="mySwiper" class="banner-container" :options="swiperOption">
        <swiper-slide v-for="(item,index) in bannerList" :key="index">
          <img
            class="banner-img"
            :src="item.imgUrl"
            alt=""
          /></swiper-slide>
      </swiper>
    </div> -->

    <!--视差滚动-->
    <div class="home-content">
      <div
        id="pic1"
        class="activebg fisrtbg"
      ></div>
      <div class="content-item">
        <div class="content">
          <div class="icon">
            <i class="iconfont icon-shuben"></i>
          </div>
          <div class="txt-wrap">
            <h2>翻译,</h2>
            <h2>只需简单一步</h2>
            <p>只需输入要翻译的汉字</p>
            <p>无论如何都可以将它翻译出来</p>
            <el-button class="entry" type="primary" plain @click="navTo('/translate')">立即翻译</el-button>
            <!-- <a href="#">进入翻译&rsaquo;</a> -->
          </div>
        </div>
      </div>
      <div
        id="pic2"
        class="activebg secondbg"
      ></div>
      <div class="content-item">
        <div class="content">
          <div class="icon">
            <i class="iconfont icon-tinglitixing"></i>
          </div>
          <div class="txt-wrap">
            <h2>听力,</h2>
            <h2>帮助您更进一步</h2>
            <p>这里面有优质的听力练习</p>
            <p>通过听力来练习您的英语听力水平</p>
            <el-button class="entry" type="primary" plain @click="navTo('/listen')">开始听力</el-button>
          </div>
        </div>
      </div>
      <div
        id="pic3"
        class="activebg thirdbg"
      ></div>
      <div class="content-item">
        <div class="content">
          <div class="icon">
            <i class="iconfont icon-wenzhang-copy"></i>
          </div>
          <div class="txt-wrap">
            <h2>资料,</h2>
            <h2>不仅仅是文章</h2>
            <p>这里面有优质的英语文章</p>
            <p>甚至还有一些英文视频来供您观看</p>
            <el-button class="entry" type="primary" plain @click="navTo('/article')">立即阅读</el-button>
          </div>
        </div>
      </div>
      <div
        id="pic4"
        class="activebg fourbg"
      ></div>
    </div>
  </div>
</template>

<script>
// 引入插件
// import { swiper, swiperSlide } from 'vue-awesome-swiper'
import 'swiper/dist/css/swiper.css'
export default {
  name: 'Home',
  components: {
    // swiper,
    // swiperSlide
  },
  data() {
    return {
      bannerList: [
        {
          id: 1,
          imgUrl: require('@/assets/images/banner1.jpg')
        },
        {
          id: 2,
          imgUrl: require('@/assets/images/banner2.jpg')
        },
        {
          id: 3,
          imgUrl: require('@/assets/images/banner3.jpg')
        }
      ],
      swiperOption: {
        loop: true,
        autoplay: {
          delay: 3000,
          stopOnLastSlide: false,
          disableOnInteraction: false
        },
        // 显示分页
        pagination: {
          el: '.swiper-pagination',
          clickable: true // 允许分页点击跳转
        },
        // 设置点击箭头
        navigation: {
          nextEl: '.swiper-button-next',
          prevEl: '.swiper-button-prev'
        }
      },
      positionY1: 0,
      positionY2: 0,
      positionY3: 0,
      positionY4: 0,
      Y1: 0,
      Y2: 0,
      Y3: 0,
      Y4: 0
    }
  },
  computed: {
    swiper() {
      return this.$refs.mySwiper.swiper
    }
  },
  mounted() {

  },
  methods: {
    navTo(path) {
      document.documentElement.scrollTop = 0
      this.$router.push({ path })
    }
  }
}
</script>

<style scoped>
.home {
  height: 100vh;
}
.banner {
  width: 100%;
  height: 500px;
  background: #bfc;
}
.banner-container {
  width: 100%;
  height: 100%;
}
.banner img {
  width: 100%;
  height: 100%;
}
.home-content {
  width: 100%;
}
.content-item {
  background-color: #fff;
  width: 100%;
  height: 400px;
  text-align: center;
  font-size: 30px;
  font-weight: bold;
}

.content-item .content {
  height: 100%;
  width: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
}

.content-item .content .icon {
  height: 100%;
  width: 50%;
  display: flex;
  justify-content: center;
  align-items: center;
}
.content-item .content .icon i{
  font-size: 180px;
}
.content-item .content .txt-wrap {
  height: 100%;
  width: 50%;
  text-align: left;
  padding-top: 50px;
}

.content-item .content .txt-wrap h2 {
  font-size: 50px;
  padding-bottom: 20px;
}

.content-item .content .txt-wrap p {
  width: 100%;
  line-height: 25px;
  opacity: 0.6;
  font-size: 18px;
  letter-spacing: 0.12em;
}

.content-item .content .txt-wrap .entry{
  margin-top: 30px;
  font-size: 20px;
}
.activebg {
  position: relative;
  width: 100%;
  height: 600px;
  background: #fff;
  background-attachment: fixed;
  background-position: center 0;
  background-position-x: 50%;
  background-position-y: 0;
  background-size: 100% 100%;
  background-repeat: no-repeat;
}
.fisrtbg {
  background-image: url(../assets/images/banner1.jpg);
}
.secondbg {
  background-image: url(../assets/images/banner2.jpg);
}
.thirdbg {
  background-image: url(../assets/images/banner3.jpg);
}
.fourbg {
  background-image: url(../assets/images/banner4.jpg);
}
</style>
