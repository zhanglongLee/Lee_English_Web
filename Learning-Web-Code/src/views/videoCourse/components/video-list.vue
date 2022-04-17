<template>
  <div class="article-cotainer" ref="video-courses-list">
    <!-- 下拉刷新容器 -->
    <van-pull-refresh
      v-model="isPullRefresh"
      :success-text="refreshSuccessText"
      :success-duration="500"
      @refresh="onRefresh"
    >
      <!-- 渲染组件块 -->
      <van-list
        v-model="loading"
        :finished="finished"
        :offset="10"
        :immediate-check="false"
        finished-text="没有更多了"
        @load="onLoad"
      >
        <!-- 单元格结构 -->
        <video-item
          v-for="(item, index) in videoCourses"
          :key="index"
          :videoCourses.sync="item"
        />
      </van-list>
    </van-pull-refresh>
  </div>
</template>

<script>
import { getVideoCourses } from "@/api/videoCourse";
import VideoItem from "@/components/video-item";
import { debounce } from "lodash";
export default {
  name: "Articlelist",
  components: {
    VideoItem,
  },
  data() {
    return {
      index: 1, //请求第几页
      size: 10, //每页请求的数量
      total: 0, //总共的数据条数
      loading: false,
      finished: false,
      videoCourses: [],
      timestamp: 0,
      isPullRefresh: false,
      refreshSuccessText: "",
    };
  },
  activated() {
    this.$refs["video-courses-list"].scrollTop = this.scrollTop;
  },
  props: {
    channel: {
      type: Object,
      required: true,
    },
  },
  created(){
    this.getVideoCourses()
  },
  mounted() {
    const articleList = this.$refs["video-courses-list"];
    articleList.onscroll = debounce(() => {
      this.scrollTop = articleList.scrollTop;
    }, 50);
  },
  methods: {
    getVideoCourses() {
      this.loading = true;
      let data = {
        page:this.index,
        size:this.size
      }
      // 999是我们自己定义的推荐频道id，不用传categoryId
      if(this.channel && this.channel.id !== 999){
        data.categoryId = this.channel.id
      }
      getVideoCourses(data)
        .then((res) => {
          this.loading = false;
          const rows = res.data;
          this.total = res.data.total;
          if (rows == null || rows.length === 0) {
            // 加载结束
            this.finished = true;
            return;
          }
          // 将新数据与老数据进行合并
          this.videoCourses = this.videoCourses.concat(rows);
          console.log(this.videoCourses);

          //如果列表数据条数>=总条数，不再触发滚动加载
          if (this.videoCourses.length >= this.total) {
            this.finished = true;
          }
        })
        .catch((err) => {
          this.loading = false;
          this.finished = true;
          console.log(err);
        });
    },
    onLoad() {
      this.index++
      this.getVideoCourses()
    },
    // 下拉刷新
    async onRefresh() {
      this.videoCourses = []
      this.index = 1
      this.getVideoCourses()
      this.refreshSuccessText = `更新成功！`;
      this.isPullRefresh = false;
    },
  },
};
</script>

<style scoped lang="less">
.article-cotainer {
  position: fixed;
  left: 0;
  right: 0;
  bottom: 50px;
  top: 90px;
  overflow-y: auto;
}
</style>