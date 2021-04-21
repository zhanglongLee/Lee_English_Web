<template>
  <div class="articles-list">
    <div class="articles-list-header">
      <ContentHeader :type-list="typeList" @typeBtnClick="typeBtnClick" @query="onQueryChange" placeholder="请输入文章"></ContentHeader>
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
        <hot-recommend :hotRecommendList="hotRecommendList" @hotRecommendClick="hotRecommendClick"/>
      </div>
    </div>
  </div>
</template>

<script>
import HotRecommend from '../common/HotRecommend'
import ContentList from '../common/ContentList'
import Pagination from '../common/Pagination'
import { deepClone } from '../../util/common'
import ContentHeader from '../common/ContentHeader'
export default {
  name: 'ArticlesList',
  components: {
    HotRecommend,
    ContentList,
    Pagination,
    ContentHeader
  },
  data() {
    return {
      typeList: [],
      curList: [], //通过分类筛选后的当前文章列表
      allList: [], //全部文章列表
      index: 1,
      size: 5,
      total: 0,
      q:'',
      loading: true,
      hotRecommendList:[]
    }
  },
  watch: {

  },
  created() {
    this.getArticleList()
    this.getHotList()
  },
  methods: {
    // 搜索
    onQueryChange(val){
      this.q = val
      this.getArticleList()
    },
    navToDetail(id) {
      this.$router.push(`/article/ArticleDetail/${id}`)
    },
    // 随机文章点击回调
    hotRecommendClick(item){
      this.navToDetail(item.id)
    },
    // 获取随机文章列表
    getHotList(){
      this.loading = true
      this.$service
        .get(`/web/article/hotlist`)
        .then(res => {
          this.loading = false
          const vdata = res.data
          this.hotRecommendList = deepClone(vdata)
        })
        .catch(err => {
          this.loading = false
          console.log(err);
        });
    },
    // 获取文章列表
    getArticleList() {
      this.loading = true
      this.$service
        .get(`/web/article?page=${this.index}&size=${this.size}&q=${this.q}`)
        .then(res => {
          this.loading = false
          const vdata = res.data
          if(vdata.length==0){
            this.curList = []
            this.typeList = []
            return false
          }
          this.total = res.total
          this.allList = vdata // 当前文章列表
          // 默认选择全部
          this.typeBtnClick('全部');
          // 分类列表渲染
          this.typeList = []
          vdata.forEach((item,index) => {
            this.typeList.push(item.categoryName)
          });
          // 去重
          this.typeList = Array.from(new Set(this.typeList))
          this.typeList.unshift('全部')
        })
        .catch(err => {
          this.loading = false
          console.log(err);
        });

    },
    // 分页器点击
    currentChange(newV) {
      this.index = newV
      this.getArticleList()
      this.scrollToTop()
      this.typeBtnClick('全部')
    },
    // 点击分类按钮
    typeBtnClick(name) {
      if(name==='全部'){
        this.curList = this.allList
      } else {
        this.curList = this.allList.filter(item=>item.categoryName===name)
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
.articles-list-header{
  width: 780px;
}
/* .articles-list-header .search{
  position: absolute;
  right: 0px;
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
