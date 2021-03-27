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
        <hot-recommend title-text="听力推荐" />
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
      typeList: [
        {
          id: 1,
          name: '全部'
        },
        {
          id: 2,
          name: '体育'
        },
        {
          id: 3,
          name: '科技'
        },
        {
          id: 4,
          name: '音乐'
        }
      ],
      curType: {},
      curList: [], // 根据条件获取的当前新闻列表
      curCode: '', // 当前新闻类型码
      dictList: [],
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
      this.$router.push(`/listen/ListenDetail/${id}`)
    },
    // 获取新闻列表
    getNewsList() {
      // this.loading = true
      // const keyword = this.$route.query.keyword || ''
      // if (this.curCode == '6001010') {
      //   this.curCode = '6001011,6001012'
      // }
      // let postObj = { index: this.index, size: this.size, keyword: keyword, type: this.curCode }

      // this.$Post('News/NewsData/getNewsList', {data: postObj},
      //   (res) => {
      //     console.log(JSON.stringify(res))
      //     let vdata = res.data
      //     this.curList = vdata.data // 当前新闻列表
      //     this.total = vdata.page_data.totalCount
      //     this.loading = false
      //   },
      //   (err) => {
      //     this.$alertShow(err.msg)
      //   },
      // true)
      const res = {
        status: true,
        data: {
          page_data: {
            totalCount: 314,
            totalPage: 63
          },
          data: [
            {
              id: '2039',
              title: '2020年9月英语四级听力真题 短文(3)',
              views: '87',
              istop: '1',
              isexcellent: '0',
              istopic: '0',
              happendate: '2021-03-07 20:17:51',
              typename: '2020年英语四级听力真题',
              status: '1001002',
              statusname: '发布中',
              authorstr: 'admin',
              pic:
                'https://dev.u-road.com/ChinaITSAdminApiServer/writable/uploads/image/20210309/20210309123532205.jpeg',
              content: '众所周知，使用电子产品还会导致人与人接触的减少。',
              html: ''
            },
            {
              id: '2040',
              title: '2020年9月英语四级听力真题 短文(2)',
              views: '87',
              istop: '1',
              isexcellent: '0',
              istopic: '0',
              happendate: '2021-03-07 20:17:51',
              typename: '2020年英语四级听力真题',
              status: '1001002',
              statusname: '发布中',
              authorstr: 'admin',
              pic: '',
              content: '迈克·汉农12岁就已经在社区做出了一番事业。',
              html: ''
            },
            {
              id: '2041',
              title: '2020年9月英语四级听力真题 短文(2)',
              views: '87',
              istop: '1',
              isexcellent: '0',
              istopic: '0',
              happendate: '2021-03-07 20:17:51',
              typename: '2020年英语四级听力真题',
              status: '1001002',
              statusname: '发布中',
              authorstr: 'admin',
              pic: '',
              content: '秘书说您购买的木桌有问题，是吗？',
              html: ''
            },
            {
              id: '2042',
              title: '2020年9月英语四级听力真题 短文(1)',
              views: '87',
              istop: '1',
              isexcellent: '0',
              istopic: '0',
              happendate: '2021-03-07 20:17:51',
              typename: '2020年英语四级听力真题',
              status: '1001002',
              statusname: '发布中',
              authorstr: 'admin',
              pic: '',
              content: '欢迎收看电视节目《近藤麻理惠的整理秘诀》',
              html: ''
            },
            {
              id: '2043',
              title: '2020年9月英语四级听力真题 长对话(2)',
              views: '87',
              istop: '1',
              isexcellent: '0',
              istopic: '0',
              happendate: '2021-03-07 20:17:51',
              typename: '2020年英语四级听力真题',
              status: '1001002',
              statusname: '发布中',
              authorstr: 'admin',
              pic: '',
              content: '周三上午，不少人在前往波兰首都华沙的途中发现自己被一种不同寻常的障碍物拦住了去路。',
              html: ''
            },
            {
              id: '2044',
              title: '2020年9月英语四级听力真题 长对话(1)',
              views: '87',
              istop: '1',
              isexcellent: '0',
              istopic: '0',
              happendate: '2021-03-07 20:17:51',
              typename: '2020年英语四级听力真题',
              status: '1001002',
              statusname: '发布中',
              authorstr: 'admin',
              pic: '',
              content: '周三上午，不少人在前往波兰首都华沙的途中发现自己被一种不同寻常的障碍物拦住了去路。',
              html: ''
            }
          ]
        },
        msg: '成功',
        code: 200
      }
      const vdata = res.data
      this.curList = vdata.data // 当前新闻列表
      this.total = vdata.page_data.totalCount
      this.loading = false
    },
    currentChange(newV) {
      this.index = newV
      this.getNewsList()
      this.scrollToTop()
    },
    typeBtnClick(id) {
      console.log(id)
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
  text-align: center;
  font-size: 18px;
}

</style>
