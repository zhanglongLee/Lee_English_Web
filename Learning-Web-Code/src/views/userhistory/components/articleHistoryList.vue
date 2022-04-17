<template>
  <div class="articleHistoryList">
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
        <div v-for="(item, index) in articles" :key="index">
          <van-swipe-cell :before-close="beforeClose" :name="index">
            <article-item :article.sync="item.data" />
            <template #right>
              <van-button class="button" square type="danger" text="移除" />
            </template>
          </van-swipe-cell>
        </div>
      </van-list>
    </van-pull-refresh>
  </div>
</template>

<script>
import ArticleItem from "@/components/article-item";
import { getUserArticleHistory, deleteUserArticleHistory } from "@/api/article";
import { Toast } from "vant";
export default {
  name: "articleHistoryList",

  components: {
    ArticleItem,
  },
  data() {
    return {
      articles: [],
      loading: false,
      finished: false,
      index: 1,
      size: 10,
      refreshSuccessText: "",
      isPullRefresh: false,
    };
  },
  methods: {
    getList() {
      this.loading = true;
      let data = {
        page: this.index,
        size: this.size,
      };
      getUserArticleHistory(data)
        .then((res) => {
          this.loading = false;
          const rows = res.data;
          if (rows == null || rows.length === 0) {
            // 加载结束
            this.finished = true;
            return;
          }
          // 将新数据与老数据进行合并
          this.articles = this.articles.concat(rows);
          console.log(this.articles);

          //如果列表数据条数>=总条数，不再触发滚动加载
          if (this.articles.length >= res.total) {
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
      this.getList();
    },
    // 下拉刷新
    async onRefresh() {
      this.articles = [];
      this.index = 1;
      this.getList();
      this.refreshSuccessText = `更新成功！`;
      this.isPullRefresh = false;
    },
    async beforeClose({ name, position, instance }) {
      switch (position) {
        case "left":
        case "cell":
        case "outside":
          instance.close();
          break;
        case "right":
          await deleteUserArticleHistory(this.articles[name].history_id);
          Toast.success("删除文章历史记录成功！");
          this.articles.splice(name, 1);
          instance.close();
          break;
      }
    },
  },

  created() {
    this.getList();
  },
};
</script>

<style lang="less" scoped>

.button {
  height: 100%;
}

</style>
