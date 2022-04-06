<template>
  <div class="article-cotainer">
    <van-nav-bar title="文章" left-arrow @click-left="$router.back()" />
    <!-- 内容区 -->
    <div class="content-wrap" v-if="article">
      <h1 class="title">{{ article.title }}</h1>

      <van-cell class="user-info">
        <van-image
          class="user-avatar"
          :src="article.aut_photo"
          round
          fit="cover"
          slot="icon"
        />
        <div slot="title" class="user-name">{{ article.author }}</div>
        <div slot="label" class="time">{{ article.published_time }}</div>
        <van-button
          @click="onFollow"
          :type="article.is_followed ? 'default' : 'info'"
          icon="plus"
          class="follow-button"
          round
          :loading="isFollowLoding"
          size="small"
        >
          {{ article.is_followed ? "已关注" : "关注" }}</van-button
        >
      </van-cell>
      <div
        ref="article-content"
        class="content markdown-body"
        v-html="article.content"
      ></div>
      <van-divider>文章到这里结束啦~</van-divider>
      <div class="title">全部评论</div>
      <!-- 评论区 -->
      <comment-list v-if="commentList.length" :commentList="commentList">
      </comment-list>
      <van-empty v-else description="暂时没有评论哦~ 快来发表第一条评论" />
    </div>

    <!-- 底部区域 -->
    <div class="bottom-content" v-if="article">
      <van-button
        v-if="article.is_comment_enabled"
        @click="rootComment"
        type="default"
        class="comment-btn"
        round
        size="medium"
      >
        写评论
      </van-button>
      <van-icon name="comment-o" :badge="totalCommentCount" />
      <van-icon
        :name="article.is_collected ? 'star' : 'star-o'"
        :color="article.is_collected ? 'orange' : ''"
        @click="onCollect"
      />
      <van-icon
        @click="onLike"
        :name="article.is_liked ? 'good-job' : 'good-job-o'"
        :color="article.is_liked ? '#3296fa' : ''"
      />
      <van-icon
        @click="copyClicked"
        name="share-o"
      />
    </div>

    <!-- 发布评论区 -->
    <van-popup v-model="postShowObj.status" position="bottom">
      <post-comment
        :parentCommentId="postShowObj.data.commentId"
        :articleId="articleId"
      ></post-comment>
    </van-popup>
    <input ref="shareInput" style="height:0;opacity:0;position:absolute;top:0;" v-model="shareData" />
  </div>
</template>

<script>
import {
  addCollect,
  deleteCollect,
  checkArticleIsCollected,
  userLike,
  userCancelLike,
  getArticleById,
  addUserArticleHistory,
} from "@/api/article";
import { ImagePreview, Toast } from "vant";
import { cancelFollowUser, followUser, checkAuthorIsFocus } from "@/api/user";
import "github-markdown-css";
import { mapState } from "vuex";
import { getCommentList } from "@/api/comment";
import commentList from "./components/comment-list.vue";
import PostComment from "./components/post-comment.vue";
export default {
  components: {
    commentList,
    PostComment,
  },
  name: "Article",
  data() {
    return {
      articleId: "",
      article: null,
      isFollowLoding: false,
      isPostShow: false,
      commentList: [],
      totalCommentCount: 0,
      isReplyShow: false,
      replyComment: {},
      scrollTop: 0,
      shareData: location.href
    };
  },
  async created() {},
  computed: {
    ...mapState(["userInfo", "postShowObj"]),
  },
  methods: {
    copyClicked() {
      this.$refs.shareInput.select();
      document.execCommand("copy");
      this.$toast.success("已复制分享链接！");
    },
    copySuccess() {
      this.$toast.success("已复制分享链接！");
    },
    copyError() {
      this.$toast.error("分享失败！");
    },
    async addArticleHistory() {
      if (this.userInfo) {
        await addUserArticleHistory({ articleId: this.articleId });
      }
    },
    // 关闭回复弹框
    closePostModal() {
      this.$store.dispatch("updateParam", [
        "postShowObj",
        { status: false, data: {} },
      ]);
      this.getComments();
    },
    // 评论文章
    rootComment() {
      if (!this.userInfo) {
        this.$toast({
          message: "请登录后进行评论操作！",
        });
        return;
      }
      this.$store.dispatch("updateParam", [
        "postShowObj",
        { status: true, data: { commentId: -1 } },
      ]);
    },
    async getArticle() {
      const { data } = await getArticleById(this.articleId);
      data.is_collected = false;
      data.is_liked = false;
      if (this.userInfo) {
        // 检查文章是否被收藏
        const { isCollected } = await checkArticleIsCollected({
          web_user_id: this.userInfo.id,
          article_id: this.articleId,
        });
        data.is_collected = isCollected;
        // 检查作者是否被关注
        const { isFocus } = await checkAuthorIsFocus({
          to_user_id: data.uid,
        });
        data.is_followed = isFocus;
      }
      this.$set(this, "article", data);
      // 由于更新数据后视图未立即刷新 使用nextTick
      this.$nextTick(() => {
        // 获取内容区
        const articleContent = this.$refs["article-content"];
        if (!articleContent) {
          return;
        }
        // dom操作
        const imgs = articleContent.querySelectorAll("img");
        const imgPath = [];
        // 遍历每个img 添加点击事件
        imgs.forEach((img, index) => {
          imgPath.push(img.src);
          img.onclick = function () {
            ImagePreview({
              images: imgPath,
              startPosition: index,
            });
          };
        });
      });
    },
    async onFollow() {
      this.isFollowLoding = true;
      if (this.userInfo) {
        // 如果已关注则取关
        if (this.article.is_followed) {
          await cancelFollowUser({
            to_user_id: this.article.uid,
            rel_type: 2,
          });
          Toast.success({
            message: "取消关注成功！",
          });
        } else {
          await followUser({
            to_user_id: this.article.uid,
            rel_type: 1,
          });
          Toast.success({
            message: "关注成功！",
          });
        }
        // 未关注则关注
        this.article.is_followed = !this.article.is_followed;
      } else {
        this.$toast({
          message: "请登录后再关注！",
        });
      }
      this.isFollowLoding = false;
    },
    // 收藏
    async onCollect() {
      Toast.loading({
        message: "操作中···",
        forbidClick: true,
      });
      if (this.userInfo) {
        let obj = {
          type: 1,
          id: this.article.id,
        };
        if (this.article.is_collected) {
          await deleteCollect(obj);
        } else {
          await addCollect(obj);
        }
        this.article.is_collected = !this.article.is_collected;
        Toast.success({
          message: this.article.is_collected ? "收藏成功" : "已取消收藏",
        });
      } else {
        this.$toast({
          message: "请登录后进行收藏操作",
        });
      }
    },
    // 点赞
    async onLike() {
      Toast.loading({
        message: "操作中···",
        forbidClick: true,
      });
      if (this.userInfo) {
        if (!this.article.is_liked) {
          await userLike(this.article.id);
          this.$set(this.article, "is_liked", true);
        } else {
          await userCancelLike(this.article.id);
          this.$set(this.article, "is_liked", false);
        }
        Toast.success({
          message: "操作成功",
        });
      } else {
        this.$toast({
          message: "请登录后进行操作",
        });
      }
    },
    onReplyClick(comment) {
      this.isReplyShow = true;
      this.replyComment = comment;
      console.log(comment);
    },
    // 获取评论
    async getComments() {
      this.loading = true;
      try {
        // 异步更新数据
        const { data } = await getCommentList(this.articleId);
        this.totalCommentCount = data.length;
        this.commentList = this.changeComment(data);
        console.log(this.commentList);
        this.loading = false;
      } catch (error) {
        console.log(error);
        this.loading = false;
      }
    },
    //评论数据处理，分为几级评论
    changeComment(data) {
      function fn(temp, parentName) {
        let arr1 = [];
        for (let i = 0; i < data.length; i++) {
          if (data[i].parent_comment_id == temp) {
            arr1.push(data[i]);
            data[i].parentName = parentName;
            data[i].child = fn(data[i].id, data[i].nickname);
          }
        }
        return arr1;
      }
      return fn(-1, "");
    },
    // 检查该篇文章作者是否被关注
    checkAuthorIsFocus() {},
  },
  async mounted() {
    this.$bus.$on("post-success", this.closePostModal);
    this.articleId = this.$route.params.articleId;
    await this.getArticle();
    this.$store.dispatch("updateParam", [
      { is_comment_enabled: this.article.is_comment_enabled },
    ]);
    this.getComments();
    this.addArticleHistory();
  },
};
</script>



<style lang="less" scoped>
@media (max-width: 767px) {
  .markdown-body {
    padding: 15px;
  }
}

.article-cotainer {
  .content-wrap {
    width: 100%;
    height: calc(~"100vh - 90px");
    overflow-y: auto;
    background-color: white;
  }

  .title {
    font-size: 20px;
    margin: 0;
    padding: 14px;
    color: #3a3a3a;
    background-color: white;
  }

  .user-info {
    justify-content: space-around;
    align-items: center;
    padding: 10px 14px;

    .user-avatar {
      width: 35px;
      height: 35px;
      margin-right: 8px;
    }

    .user-name {
      font-size: 11px;
      color: #333333;
    }

    .time {
      font-size: 11px;
      color: #b4b4b4;
    }

    .follow-button {
      width: 85px;
      height: 29px;
    }
  }

  .markdown-body {
    padding: 14px;
    background-color: white;
  }

  .bottom-content {
    display: flex;
    justify-content: space-evenly;
    align-items: center;
    width: 100%;
    height: 44px;
    background-color: white;

    .comment-btn {
      width: 141px;
      height: 23px;
      font-size: 15px;
    }
  }
}
</style>