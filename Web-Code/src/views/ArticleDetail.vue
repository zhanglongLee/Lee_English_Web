<template>
  <div class="article-container">
    <div class="article-content">
      <div class="article-detail contentAear content-mb">
        <div v-loading="loading" class="article-detail-left">
          <div class="title">{{ detailData.title }}</div>
          <div class="info-wrap">
            <div class="publish">
              <span v-if="detailData.published_time" class="date">{{
                detailData.published_time
              }}</span>
              <span class="publisher">{{ detailData.author }}</span>
            </div>
            <div class="collection">
              <i v-if="!isCollection" @click="toCollect(1)" class="iconfont icon-shoucang" :title="isCollection?'点击取消收藏':'点击收藏'"></i>
              <i v-if="isCollection" @click="toCollect(0)" class="iconfont icon-shoucangbeifen" :title="isCollection?'点击取消收藏':'点击收藏'"></i>
            </div>
          </div>
          <div class="line"></div>
          <div class="content">
            <div class="content-text" v-html="detailData.content"></div>
          </div>
          <div class="back-to-prev-page">
            <img src="../assets/images/article/prev.png" alt="" />
            <span @click="backToPrev">返回上一页</span>
          </div>

          <div class="comment">
            <comment
              comment-width="100%"
              :comment-list="commentList"
              :comment-num="commentNum"
              :avatar="avatar"
              :placeholder="placeholder"
              :min-rows="minRows"
              :max-rows="maxRows"
              @doSend="doSend"
              @doChidSend="doChidSend"
            />
          </div>
          <div class="related-articles">
            <div class="item-header">
              <div class="line"></div>
              <div class="item-title">相关文章</div>
            </div>
            <div
              v-for="item in detailData.relevantnews"
              :key="item.id"
              class="related-articles-item"
            >
              <div class="item-info">
                <div class="title ellipsis" @click="toOtherDetail(item.id)">
                  {{ item.title }}
                </div>
                <div class="brief">{{ item.description }}…</div>
                <div class="date">{{ item.published_time }}</div>
              </div>
              <div v-if="item.image" class="item-img">
                <img :src="item.image" alt="" />
              </div>
            </div>
          </div>
        </div>
        <div class="article-detail-right">
          <hot-recommend />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import HotRecommend from "../components/common/HotRecommend";
import comment from "@/components/common/comment/Comment";
import { deepClone } from '../util/common'
import { getToken } from '../util/token'
export default {
  name: "ArticleDetail",
  components: {
    HotRecommend,
    comment
  },
  data() {
    return {
      isCollection:false,//是否已收藏
      viewIdArr: null,// 已阅读文章id列表（用于防止重复计算某篇文章的阅读次数）
      categoryId: 0, //文章id
      detailData: [],
      loading: true,
      placeholder: "说点什么吧",
      minRows: 4,
      maxRows: 4,
      commentNum: 0,
      // 默认头像
      avatar: require("@/components/common/comment/img/icon/avtar.png"),
      commentList: [],
      commentPostData:{}
    };
  },
  watch: {
    $route: {
      handler: function(to, from) {
        this.getArticleDetails();
      },
      deep:true
    },

  },
  created() {
    // 获取已阅读的文章id列表
    this.viewIdArr = JSON.parse(sessionStorage.getItem("viewIdArr")) || [];
    // 获取文章id
    this.categoryId = this.$route.params.id;
    this.addViews();
    this.getArticleDetails();
    this.getCommentLists();
  },
  methods: {
    // 新增文章阅读次数
    addViews() {
      // 如果已阅读的文章id列表中不包含当前文章id
      if (this.viewIdArr.indexOf(this.categoryId) === -1) {
        this.$service
          .get("/web/article/addViews/" + this.categoryId)
          .then(res => {
            console.log(res);
            let arr = JSON.parse(sessionStorage.getItem("viewIdArr")) || [];
            arr.push(this.categoryId);
            sessionStorage.setItem("viewIdArr", JSON.stringify(arr));
          })
          .catch(err => {
            console.log(err);
          });
      }
    },
    // 获取文章详细信息
    getArticleDetails() {
      this.$service
        .get("/web/article/" + this.categoryId)
        .then(res => {
          this.loading = false;
          const vdata = res.data;
          this.detailData = vdata; // 文章详情
          console.log(res);
        })
        .catch(err => {
          this.loading = false;
          console.log(err);
        });
    },
    // 获取文章对应的评论列表
    getCommentLists(){
      this.$service
        .get("/v1/comment/" + this.categoryId)
        .then(res => {
          this.loading = false;
          var data = deepClone(res.data)
          if(data.length>0){
            this.setCommentList(data)
            this.commentNum = data.length
          }
        })
        .catch(err => {
          this.loading = false;
          console.log(err);
        });
    },
    // 设置评论列表格式
    setCommentList(res){
      this.commentList = []
      let commentMap = {};// key为父评论id
      let targetUserMap = {}// key为评论id
      res.forEach(item => {
        if(!commentMap[item.parent_comment_id]){
          commentMap[item.parent_comment_id] = [
            {
              id:item.id,
              commentUser: {
                id: item.web_user_id,
                nickName: item.nickname,
                avatar: item.image
              },
              content:item.content,
              parent_comment_id:item.parent_comment_id,
              createDate:item.created_at,
            }
          ]
          if(item.parent_comment_id!=-1){
            targetUserMap[item.parent_comment_id] = {
              id: res[item.parent_comment_id-1].web_user_id,
              nickName: res[item.parent_comment_id-1].nickname,
              avatar: res[item.parent_comment_id-1].image
            }
          }
          
          console.log(targetUserMap)
        }else{
          commentMap[item.parent_comment_id].push({
            id:item.id,
            commentUser: {
              id: item.web_user_id,
              nickName: item.nickname,
              avatar: item.image
            },
            content:item.content,
            parent_comment_id:item.parent_comment_id,
            createDate:item.created_at,
          })
        }
      });
      for(var k in commentMap){
        if(k!==-1){
          // 不是主评论
          commentMap['-1'].forEach(item=>{
            // 当前对象中的子评论的parent_comment_id 即 k，等于当前对象的父id 即id
            item.childrenList = commentMap[item.id] || null
            if(item.childrenList){
              let childArr = item.childrenList
              childArr.forEach(i=>{
                i.targetUser = targetUserMap[i.parent_comment_id]
              })
            }
          })
        }
      }
      this.commentList = deepClone(commentMap['-1'])
      console.log(this.commentList)
    },
    backToPrev() {
      this.$router.back();
    },
    toOtherDetail(id) {
      this.$router.push(`/article/ArticleDetail/${id}`);
    },
    // 父评论事件
    doSend(content){
      let obj = {
        content:content
      }
      this.addComment(obj)
    },
    // 子评论事件
    doChidSend(content, commentUserId, pid){
      let obj = {
        content:content,
        parent_comment_id:pid
      }
      this.addComment(obj)
    },
    // 初始化评论传参对象
    resetCommentPost(){
      let userInfo = this.$store.state.userInfo
      this.commentPostData = {
        web_user_id:userInfo.id,
        content:'',
        image:userInfo.originAvatar,
        article_id:this.categoryId,
        parent_comment_id:-1
      }
    },
    // 调新增评论接口
    addComment(obj){
      if(!obj.content){
        this.$message.error('评论内容不能为空')
        return
      }
      this.resetCommentPost()
      this.commentPostData = Object.assign(this.commentPostData,obj)
      this.$service
        .post("/v1/comment",this.commentPostData)
        .then(res => {
          if(res.code=='0'){
            this.getCommentLists()
          }
        })
        .catch(err => {
          this.loading = false;
          console.log(err);
        });
    },
    // 收藏
    toCollect(type){
      if(type===1){
        this.isCollection = true
      }else{
        // 取消收藏
        this.isCollection = false
      }
    },
    
  }
};
</script>

<style lang="scss" scoped>
.article-container {
  position: relative;
  min-width: 1300px;
  // padding-top: 54px;
}
.article-content {
  position: relative;
  width: 1200px;
  margin: 0 auto;
  padding: 20px 0;
}
.article-detail {
  display: flex;
  justify-content: space-between;
}
.article-detail-left {
  width: 780px;
  margin: 0 60px 0 0;
}
.article-detail-left > .title {
  font-size: 26px;
  color: rgba(38, 38, 38, 1);
  font-weight: bold;
}
.info-wrap{
  display: flex;
  margin-top: 30px;
}
.info-wrap > .publish {
  display: flex;
  align-items: center;
  color: rgba(168, 168, 168, 0.7);
  font-size: 14px;
  font-weight: bold;
}
.info-wrap > .publish > .magazine {
  margin-left: 20px;
}
.info-wrap > .publish > .publisher {
  margin-left: 10px;
}
.info-wrap > .collection {
  margin-left: 20px;
  display: flex;
  align-items: center;
}
.info-wrap > .collection > i{
  font-size: 24px;
  cursor: pointer;
}
.info-wrap > .collection > i.dark{
  background: #000;
}
.info-wrap > .collection > i:hover{
  color: #409eff;
}
.article-detail-left > .line {
  border-bottom: 1px solid rgba(216, 216, 216, 0.5);
  margin-top: 20px;
}
.article-detail-left > .content {
  width: 100%;
  margin-top: 30px;
}
.article-detail-left > .content > .content-img {
  width: 780px;
}
.article-detail-left > .content > .content-img > img {
  width: 100%;
}
.article-detail-left > .content > .img-info {
  color: rgba(51, 51, 51, 0.5);
  font-size: 14px;
  margin-top: 10px;
  text-align: center;
}
.article-detail-left > .content > .content-text {
  width: 100%;
  margin-top: 20px;
  color: rgba(51, 51, 51, 1);
  font-size: 15px;
  text-indent: 20px;
  line-height: 30px;
}
.article-detail-left > .content > .content-text > div {
  margin-bottom: 30px;
}

.article-detail-left > .back-to-prev-page {
  display: flex;
  align-items: center;
  margin: 20px 0;
}
.article-detail-left > .back-to-prev-page > img {
  height: 15px;
}
.article-detail-left > .back-to-prev-page > span {
  color: rgba(175, 144, 92, 1);
  font-size: 15px;
  margin-left: 5px;
  cursor: pointer;
}

.item-header {
  height: 51px;
  position: relative;
}
.item-header .line {
  border-bottom: 1px solid rgba(216, 216, 216, 1);
}
.item-title {
  width: 105px;
  height: 50px;
  line-height: 50px;
  font-size: 26px;
  color: rgba(51, 51, 51, 1);
  font-weight: 600;
  border-top: 3px solid rgba(175, 144, 92, 1);
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.related-articles-item {
  height: 180px;
  display: flex;
  justify-content: space-between;
  margin-top: 30px;
}
.related-articles-item > .item-info {
  flex: 1;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}
.related-articles-item > .item-info > .title {
  color: rgba(38, 38, 38, 1);
  font-size: 20px;
  font-weight: bold;
  cursor: pointer;
}
.related-articles-item > .item-info > .brief {
  color: rgba(136, 136, 136, 1);
  font-size: 14px;
}
.related-articles-item > .item-info > .date {
  color: rgba(168, 168, 168, 1);
  font-size: 12px;
}
.related-articles-item > .item-img {
  width: 270px;
  margin-left: 10px;
}

.related-articles-item > .item-img > img {
  width: 100%;
  height: 100%;
}

.article-detail-right {
  flex: 1;
}
.content-text >>> table {
  width: 780px !important;
}
.content-text >>> h1 {
  margin: 20px 0;
}

.content-text >>> .caas-img-container img {
  width: 100%;
}



</style>
