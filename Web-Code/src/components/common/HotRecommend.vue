<template>
  <div class="hot-recommend">
    <div class="hot-recommend-content">
      <div class="item-header">
        <div class="line"></div>
        <div class="item-title">
          <span>{{ titleText }}</span>
        </div>
      </div>
      <div class="line"></div>
      <div class="hot-recommend-main-content">
        <div
          v-for="(item, index) in hotRecommendList"
          :key="item.id"
          class="content-item"
          @click="navToDetail(item.id)"
        >
          <div class="content-item-index">
            {{ (index + 1 + "").padStart(2, "0") }}
          </div>
          <div class="content-item-text">{{ item.title }}</div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'HotRecommend',
  props: {
    titleText: {
      type: String,
      default: () => {
        return '热点推荐'
      }
    }
  },
  data() {
    return {
      hotRecommendList: []
    }
  },
  created() {
    this.getHotRecommend() // 热点推荐
  },
  methods: {
    getHotRecommend() {
      // if (sessionStorage.getItem('hotNews')) {
      //   this.hotRecommendList = JSON.parse(sessionStorage.getItem('hotNews'))
      // } else {

      // }
      const res = {
        status: true,
        data: [
          {
            id: '2017',
            title: 'Texas governor demands ‘emergency’ election reform as state GOP unveils two dozen bills aimed at voting rights'
          },
          {
            id: '2013',
            title: 'Texas governor demands ‘emergency’ election reform as state GOP unveils two dozen bills aimed at voting rights'
          },
          {
            id: '2010',
            title: 'Texas governor demands ‘emergency’ election reform as state GOP unveils two dozen bills aimed at voting rights'
          },
          {
            id: '2005',
            title: 'Texas governor demands ‘emergency’ election reform as state GOP unveils two dozen bills aimed at voting rights'
          },
          {
            id: '2001',
            title: 'Texas governor demands ‘emergency’ election reform as state GOP unveils two dozen bills aimed at voting rights'
          }
        ],
        msg: '成功',
        code: 200
      }
      const vdata = res.data
      this.hotRecommendList = vdata
      // sessionStorage.setItem('hotNews', JSON.stringify(this.hotRecommendList))
      // let postObj = { id: '' }
      // this.$Post(
      //   'News/NewsData/getHotNews',
      //   { data: postObj },
      //   res => {
      //     console.log(JSON.stringify(res))
      //     let vdata = res.data
      //     this.hotRecommendList = vdata
      //     sessionStorage.setItem(
      //       'hotNews',
      //       JSON.stringify(this.hotRecommendList)
      //     )
      //   },
      //   err => {
      //     this.$alertShow(err.msg)
      //   },
      //   true
      // )
    },

    linkToAd(item) {
      window.open(item.url)
    },
    navToDetail(id) {
      this.$router.push(`/article/ArticleDetail/${id}`)
    }
  }
}
</script>

<style scoped>
.hot-recommend {
  width: 300px;
}
.hot-recommend-content {
  background: rgba(251, 251, 251, 0.8);
  height: 380px;
}
.hot-recommend-content > .line {
  border-bottom: 1px solid rgba(216, 216, 216, 0.4);
  margin: 0 20px;
}
.hot-recommend-main-content {
  display: flex;
  flex-direction: column;
}
.hot-recommend-main-content > .content-item {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin: 22px 20px 0;
}
.hot-recommend-main-content > .content-item:hover {
  cursor: pointer;
}
.hot-recommend-main-content .content-item-index {
  width: 40px;
  color: rgba(83, 57, 14, 0.4);
  font-size: 34px;
  font-weight: bold;
}
.hot-recommend-main-content .content-item-text {
  flex: 1;
  font-size: 13px;
  margin-left: 20px;
  color: rgba(38, 38, 38, 1);
  overflow: hidden;
  display: -webkit-box;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 2;
}

.hot-recommend-ad > .advertisement {
  height: 150px;
  margin-top: 15px;
}
.hot-recommend-ad > .advertisement:nth-child(1) > .item-img {
  background: rgba(248, 248, 248, 1);
}
.hot-recommend-ad > .advertisement:nth-child(2) > .item-img {
  background: rgba(248, 248, 248, 1);
}
.hot-recommend-ad .item-img {
  position: relative;
  height: 100%;
}
.hot-recommend-ad .item-img > div,
.hot-recommend-ad .item-img > div img {
  height: 100%;
  width: 100%;
}
.hot-recommend-ad .item-img img {
  position: absolute;
  height: 26px;
  right: 0;
  bottom: 0;
}

.item-header {
  height: 51px;
  position: relative;
}
.item-header .line {
  border-bottom: 1px solid rgba(216, 216, 216, 1);
}
.item-title {
  width: 105px;
  height: 50px;
  line-height: 50px;
  font-size: 18px;
  color: rgba(51, 51, 51, 1);
  font-weight: 600;
  border-top: 3px solid rgba(175, 144, 92, 1);
  display: flex;
  align-items: center;
  justify-content: space-between;
}
.item-title > span {
  padding-left: 20px;
}
</style>
