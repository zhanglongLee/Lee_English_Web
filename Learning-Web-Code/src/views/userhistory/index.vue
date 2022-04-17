<template>
  <div class="usercollect">
    <van-nav-bar title="历史记录" left-arrow @click-left="$router.back()" />
    <!-- tab栏标签 -->
    <van-tabs
      class="channel-tabs"
      v-model="active"
      border
      color="#3296fa"
      line-width="15px"
    >
      <van-tab
        class="channel-tabs-item"
        v-for="channel in channels"
        :title="channel.category_name"
        :key="channel.id"
      >
      </van-tab>
    </van-tabs>
    <!-- 下拉刷新容器 -->
    <articleHistoryList v-show="active === 0"></articleHistoryList>
    <videoCourseHistoryList v-show="active === 1"></videoCourseHistoryList>
    <div class="tips">左滑可以调出删除按钮哦~</div>
  </div>
</template>

<script>
import articleHistoryList from './components/articleHistoryList'
import videoCourseHistoryList from './components/videoCourseHistoryList'
export default {
  name: "usercollect",
  components:{
    articleHistoryList,
    videoCourseHistoryList,
  },
  data() {
    return {
      articles: [],
      active: 0,
      channels: [
        {
          id: 1,
          category_name: "文章",
        },
        {
          id: 2,
          category_name: "视频课程",
        },
      ],
      loading: false,
      finished: false,
      index: 1,
      size: 10,
      refreshSuccessText: "",
      isPullRefresh: false,
    };
  },
  methods: {
  },
};
</script>

<style lang="less" scoped>
.channel-tabs {
  .wap-nav-set {
    flex-shrink: 0;
    //不参与平分 只参与固定。
    width: 40px;
  }

  .wap-nav-wrap {
    position: fixed;
    display: flex;
    align-items: center;
    justify-content: center;
    line-height: 44px;
    right: 0px;
    width: 40px;
    height: 43px;
    font-size: 20px;
    background-color: rgba(255, 255, 255, 0.8);
  }

  /deep/ .van-tabs__nav {
    padding: 0 !important;
  }

  /deep/ .van-tab {
    border-right: 1px rgb(231, 231, 231) solid;
    border-bottom: 1px rgb(223, 221, 221) solid;
    width: 100px;
  }

  ::v-deep .van-tabs__line {
    bottom: 6px !important;
  }
}

</style>