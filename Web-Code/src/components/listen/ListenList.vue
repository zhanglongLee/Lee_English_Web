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
        <HotRecommend title-text="听力推荐" :hotRecommendList="hotRecommendList" @hotRecommendClick="hotRecommendClick"/>
      </div>
    </div>
  </div>
</template>

<script>
import HotRecommend from '../common/HotRecommend'
import ContentList from '../common/ContentList'
import Pagination from '../common/Pagination'
import typeList from '../common/typeList'
import { deepClone } from '../../util/common'
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
      curType: {},
      curList: [], // 根据条件获取的当前新闻列表
      curCode: '', // 当前新闻类型码
      dictList: [],
      index: 1,
      size: 5,
      total: 0,
      loading: true,
      allList:[],
      hotRecommendList:[]
    }
  },
  watch: {

  },
  created() {
    this.getListeningList()
    this.getHotList()
  },
  methods: {
    navToDetail(id) {
      this.$router.push(`/listen/ListenDetail/${id}`)
    },
    // 获取新闻列表
    getListeningList() {

      this.loading = true
      this.$service
        .get("/web/listening",{
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
          this.allList = vdata // 当前练习列表
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
          console.log(err);
        });
    
    },
    currentChange(newV) {
      this.index = newV
      this.getListeningList()
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
    },
    // 随机文章点击回调
    hotRecommendClick(item){
      this.navToDetail(item.id)
    },
    // 获取随机文章列表
    getHotList(){
      this.loading = true
      this.$service
        .get(`/web/listening/hotlist`)
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
  text-align: center;
  font-size: 18px;
}

</style>
