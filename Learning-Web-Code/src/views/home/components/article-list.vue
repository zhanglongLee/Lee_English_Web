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
import { getArticles } from "@/api/article";
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
    }, 50);
  },
  methods: {
    getArticles() {
      this.loading = true;
      let data = {
        page:this.index,
        size:this.size
      }
      // 999是我们自己定义的推荐频道id，不用传categoryId
      if(this.channel && this.channel.id !== 999){
        data.categoryId = this.channel.id
      }
      getArticles(data)
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
          this.finished = true;
          console.log(err);
        });
    },
    onLoad() {
      this.index++
      this.getArticles()
    },
    // 下拉刷新
    async onRefresh() {
      this.articles = []
      this.index = 1
      this.getArticles()
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