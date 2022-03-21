<template>
  <div class="article-cotainer" ref="article-list">
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
        <article-item
          v-for="(item, index) in articles"
          :key="index"
          :article.sync="item"
        />
      </van-list>
    </van-pull-refresh>
  </div>
</template>

<script>
import { getChannelById } from "@/api/article";
import ArticleItem from "@/components/article-item";
import { debounce } from "lodash";
export default {
  name: "Articlelist",
  components: {
    ArticleItem,
  },
  data() {
    return {
      index: 1, //请求第几页
      size: 10, //每页请求的数量
      total: 0, //总共的数据条数
      loading: false,
      finished: false,
      articles: [],
      timestamp: 0,
      isPullRefresh: false,
      refreshSuccessText: "",
    };
  },
  activated() {
    this.$refs["article-list"].scrollTop = this.scrollTop;
  },
  props: {
    channel: {
      type: Object,
      required: true,
    },
  },
  created(){
    this.getArticles()
  },
  mounted() {
    const articleList = this.$refs["article-list"];
    articleList.onscroll = debounce(() => {
      this.scrollTop = articleList.scrollTop;
      console.log(this.scrollTop);
    }, 50);
  },
  methods: {
    getArticles() {
      this.loading = true;
      this.$service
        .get(`/web/article?page=${this.index}&size=${this.size}`)
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
          this.articles = this.articles.concat(rows);
          console.log(this.articles);

          //如果列表数据条数>=总条数，不再触发滚动加载
          if (this.articles.length >= this.total) {
            this.finished = true;
          }
        })
        .catch((err) => {
          this.loading = false;
          console.log(err);
        });
    },
    onLoad() {
      this.index++
      this.getArticles()
    },
    async onLoadback() {
      // 异步更新数据
      console.log(this.index);
      const { data } = await getChannelById({
        channel_id: this.channel.id,
        timestamp: this.timestamp === 0 ? Date.now() : this.timestamp,
        with_top: 0,
      });
      const result = data.data.results;
      this.index++;
      this.timestamp = data.data.pre_timestamp || 0;
      result.forEach((item) => {
        this.articles.push(item);
      });
      this.loading = false;
      // 如果请求不到数据了，就结束请求
      if (this.timestamp === 0) this.finished = true;
    },
    // 下拉刷新
    async onRefresh() {
      // 请求获取数据
      // 数据unshift
      const { data } = await getChannelById({
        channel_id: this.channel.id,
        timestamp: Date.now(),
        with_top: 0,
      });
      const result = data.data.results;
      result.forEach((item) => {
        this.articles.unshift(item);
      });
      this.refreshSuccessText = `更新了${result.length}条数据`;
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