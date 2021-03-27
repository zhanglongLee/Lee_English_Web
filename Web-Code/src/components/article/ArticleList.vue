<template>
  <div class="articles-list">
    <div class="articles-list-header">
      <typeList :type-list="typeList" @typeBtnClick="typeBtnClick" />
    </div>
    <div class="articles-list-content contentAear content-mb">
      <div
        v-if="curList.length > 0"
        v-loading="loading"
        class="articles-list-content-left"
      >
        <ContentList :cur-list="curList" @navToDetail="navToDetail" />
        <Pagination :size="size" :total="total" @currentChange="currentChange" />
      </div>
      <div v-else v-loading="loading" class="articles-list-content-left">
        <div class="no-result">暂时没有内容/(ㄒoㄒ)/~~</div>
      </div>
      <div class="articles-list-content-right">
        <hot-recommend />
      </div>
    </div>
  </div>
</template>

<script>
import HotRecommend from '../common/HotRecommend'
import ContentList from '../common/ContentList'
import Pagination from '../common/Pagination'
import typeList from '../common/typeList'
export default {
  name: 'ArticlesList',
  components: {
    HotRecommend,
    ContentList,
    Pagination,
    typeList
  },
  data() {
    return {
      typeList: [],
      curList: [], //通过分类筛选后的当前文章列表
      allList: [], //全部文章列表
      index: 1,
      size: 5,
      total: 0,
      loading: true
    }
  },
  watch: {

  },
  created() {
    this.getNewsList()
  },
  methods: {
    navToDetail(id) {
      this.$router.push(`/article/ArticleDetail/${id}`)
    },
    // 获取新闻列表
    getNewsList() {
      this.loading = true
      this.$service
        .get("/web/article", {
          size:this.size,
          page:this.index
        })
        .then(res => {
          this.loading = false
          const vdata = res.data
          if(vdata.length==0){
            return false
          }
          this.total = res.total
          this.allList = vdata // 当前新闻列表
          // 默认选择全部
          this.typeBtnClick(99);
          // 分类列表渲染
          this.typeList = []
          vdata.forEach(item => {
            this.typeList.push({
              id:item.categoryId,
              name:item.categoryName
            })
          });
          this.typeList.unshift({
            id: 99,
            name: '全部'
          })
        })
        .catch(err => {
          this.loading = false
          console.log(err);
        });

    },
    // 分页器点击
    currentChange(newV) {
      this.index = newV
      this.getNewsList()
      this.scrollToTop()
    },
    // 点击分类按钮
    typeBtnClick(id) {
      if(id===99){
        this.curList = this.allList
      } else {
        this.curList = this.allList.filter(item=>item.categoryId===id)
      }
    }
  }
}
</script>

<style scoped>
/* .articles-list-bg {
  height: 300px;
  width: 100%;
  background: url(../../assets/images/articles/follow-bg.png) no-repeat;
  background-size: cover;
  position: relative;
} */

.articles-list-content {
  display: flex;
  justify-content: space-between;
}
.articles-list-content-left {
  width: 780px;
  margin: 0 60px 0 0;
}
.articles-list-content-right {
  flex: 1;
}

.articles-list-content-left > .no-result {
  display: flex;
  justify-content: center;
  align-items: center;
  font-size: 18px;
  width: 100%;
  height: 500px;
}

</style>
