<template>
  <div class="search-result">
    <van-list
      v-model="loading"
      :finished="finished"
      :offset="10"
      :immediate-check="false"
      finished-text="没有更多了"
      @load="onLoad"
    >
      <video-item
        v-for="(videoCourse, index) in list"
        :key="index"
        :videoCourses.sync="videoCourse"
      />
    </van-list>
  </div>
</template>

<script>
import { getVideoCourseSearchResult } from "@/api/search";
import VideoItem from "@/components/video-item";
export default {
  name: "searchResult",
  components: {
    VideoItem,
  },
  data() {
    return {
      list: [],
      loading: false,
      finished: false,
      index: 1,
      size: 10,
    };
  },
  props: ["searchText"],
  mounted(){
    this.getArticles()
  },
  methods: {
    getArticles() {
      let data = {
        page: this.index,
        size: this.size,
        q: this.searchText,
      };
      getVideoCourseSearchResult(data)
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
          this.list = this.list.concat(rows);
          console.log(this.list);

          //如果列表数据条数>=总条数，不再触发滚动加载
          if (this.list.length >= this.total) {
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
      this.index++;
      this.getArticles();
    },
  },
};
</script>

<style scoped lang="less">
.search-result {
  position: fixed;
  right: 0;
  left: 0;
  bottom: 0;
  top: 54px;
  overflow-y: auto;
}
</style>