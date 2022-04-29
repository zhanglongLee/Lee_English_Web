<template>
  <div class="articleCollectList">
    <div v-if="articles.length">
      <div v-for="(item, index) in articles" :key="index">
        <focus-item :article.sync="item" />
      </div>
    </div>
    <div v-else class="no-data">暂无数据</div>
  </div>
</template>

<script>
import focusItem from "@/components/focus-item";
import { getArticleAndVideoList } from "@/api/user";
export default {
  name: "articleCollectList",

  components: {
    focusItem,
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
      getArticleAndVideoList()
        .then((res) => {
          this.loading = false;
          const rows = res.data;
          // 将新数据与老数据进行合并
          this.articles = rows
          console.log(this.articles);
        })
        .catch((err) => {
          this.loading = false;
          console.log(err);
        });
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
.no-data{
  width: 100%;
  height: 100px;
  display: flex;
  justify-content: center;
  align-items: center;
  color: #969799;
  font-size: 14px;
}
</style>
