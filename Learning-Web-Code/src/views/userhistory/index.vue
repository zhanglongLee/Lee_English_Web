<template>
  <div class="userhistory">
    <van-nav-bar title="浏览记录" left-arrow @click-left="$router.back()" />
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
    <div class="tips">左滑可以调出删除按钮哦~</div>
  </div>
</template>

<script>
import ArticleItem from "@/components/article-item";
import { getUserArticleHistory, deleteUserArticleHistory } from "@/api/article";
import {
    Toast
} from 'vant'
export default {
  name: "userhistory",
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
          Toast.success("删除浏览记录成功！")
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
@keyframes opt {
  0% {
    opacity: 0;
    transform: scaleX(0) scaleY(0);
  }

  50% {
    opacity: 1;
    transform: scaleX(100%) scaleY(100%);
  }

  100% {
    opacity: 0;
    transform: scaleX(0) scaleY(0);
  }
}

.button {
  height: 100%;
}

.tips {
  width: 150px;
  height: 30px;
  font-size: 10px;
  line-height: 30px;
  text-align: center;
  background-color: rgb(248, 45, 96);
  box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.3);
  border-radius: 10px;
  color: rgb(255, 255, 255);
  position: fixed;
  bottom: 20%;
  opacity: 0;
  animation: opt 4s ease forwards;
  animation-delay: 1s;
  left: 0;
  right: 0;
  margin: 0 auto;
}
</style>