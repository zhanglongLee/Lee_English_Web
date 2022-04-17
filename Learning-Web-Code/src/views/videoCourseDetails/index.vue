<template>
  <div class="videoCourse-cotainer">
    <van-nav-bar title="视频课程" left-arrow @click-left="$router.back()" />
    <!-- 内容区 -->
    <div class="content-wrap" v-if="videoCourse">
      <my-video
        :videoUrl="videoCourse.video_url"
      ></my-video>
      <!-- <h1 class="title">{{ videoCourse.title }}</h1> -->
      <div class="ep-info-pre">
        <div class="ep-info-wrap">
          <div class="ep-info-left">
            <div class="ep-info-image">
              <img :src="videoCourse.image" :alt="videoCourse.title" />
            </div>
          </div>
          <div class="ep-info-center">
            <div class="ep-info-title">{{ videoCourse.title }}</div>
            <div class="ep-info-data">
              <div class="play">
                <van-icon name="video-o" />
                {{videoCourse.views}}
              </div>
              <div class="fav">
                <van-icon name="like-o" />
                {{videoCourse.like_num}}
              </div>
            </div>
            <div class="ep-info-author">{{ videoCourse.author }}</div>
            <div class="ep-info-description">{{ videoCourse.description }}</div>
          </div>
            <van-button
              @click="onFollow"
              :type="videoCourse.is_followed ? 'default' : 'info'"
              icon="plus"
              class="ep-info-right"
              round
              :loading="isFollowLoding"
              size="small"
            >
              {{ videoCourse.is_followed ? "已关注" : "关注" }}</van-button
            >
        </div>
      </div>
      <div class="title">全部评论</div>
      <!-- 评论区 -->
      <comment-list v-if="commentList.length" :commentList="commentList">
      </comment-list>
      <van-empty v-else description="暂时没有评论哦~ 快来发表第一条评论" />
    </div>

    <!-- 底部区域 -->
    <div class="bottom-content" v-if="videoCourse">
      <van-button
        v-if="videoCourse.is_comment_enabled"
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
        :name="videoCourse.is_collected ? 'star' : 'star-o'"
        :color="videoCourse.is_collected ? 'orange' : ''"
        @click="onCollect"
      />
      <van-icon
        @click="onLike"
        :name="videoCourse.is_liked ? 'good-job' : 'good-job-o'"
        :color="videoCourse.is_liked ? '#3296fa' : ''"
      />
      <van-icon @click="copyClicked" name="share-o" />
    </div>

    <!-- 发布评论区 -->
    <van-popup v-model="postShowObj.status" position="bottom">
      <post-comment
        :parentCommentId="postShowObj.data.commentId"
        :videoCourseId="video_course_id"
      ></post-comment>
    </van-popup>
    <input
      ref="shareInput"
      style="height: 0; opacity: 0; position: absolute; top: 0"
      v-model="shareData"
    />
  </div>
</template>

<script>
import {
  addCollect,
  deleteCollect,
  checkVideoCourseIsCollected,
  userLike,
  userCancelLike,
  getVideoCourseById,
  addUserVideoCourseHistory,
} from "@/api/videoCourse";
import { ImagePreview, Toast } from "vant";
import { cancelFollowUser, followUser, checkAuthorIsFocus } from "@/api/user";
import "github-markdown-css";
import { mapState } from "vuex";
import { getCommentList } from "@/api/comment";
import commentList from "./components/comment-list.vue";
import PostComment from "./components/post-comment.vue";
import myVideo from "@/components/my-video";
export default {
  components: {
    commentList,
    PostComment,
    myVideo,
  },
  name: "Article",
  data() {
    return {
      video_course_id: "",
      videoCourse: null,
      isFollowLoding: false,
      isPostShow: false,
      commentList: [],
      totalCommentCount: 0,
      isReplyShow: false,
      replyComment: {},
      scrollTop: 0,
      shareData: location.href,
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
        await addUserVideoCourseHistory({ video_course_id: this.video_course_id });
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
    // 评论视频课程
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
    async getVideoCourseBy() {
      const { data } = await getVideoCourseById(this.video_course_id);
      data.is_collected = false;
      data.is_liked = false;
      if (this.userInfo) {
        // 检查视频课程是否被收藏
        const { isCollected } = await checkVideoCourseIsCollected({
          web_user_id: this.userInfo.id,
          video_course_id: this.video_course_id,
        });
        data.is_collected = isCollected;
        // 检查作者是否被关注
        const { isFocus } = await checkAuthorIsFocus({
          to_user_id: data.uid,
        });
        data.is_followed = isFocus;
      }
      this.$set(this, "videoCourse", data);
      // 由于更新数据后视图未立即刷新 使用nextTick
      this.$nextTick(() => {
        // 获取内容区
        const videoCourseContent = this.$refs["videoCourse-content"];
        if (!videoCourseContent) {
          return;
        }
        // dom操作
        const imgs = videoCourseContent.querySelectorAll("img");
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
        if (this.videoCourse.is_followed) {
          await cancelFollowUser({
            to_user_id: this.videoCourse.uid,
            rel_type: 2,
          });
          Toast.success({
            message: "取消关注成功！",
          });
        } else {
          await followUser({
            to_user_id: this.videoCourse.uid,
            rel_type: 1,
          });
          Toast.success({
            message: "关注成功！",
          });
        }
        // 未关注则关注
        this.videoCourse.is_followed = !this.videoCourse.is_followed;
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
          type: 2,
          id: this.videoCourse.id,
        };
        if (this.videoCourse.is_collected) {
          await deleteCollect(obj);
        } else {
          await addCollect(obj);
        }
        this.videoCourse.is_collected = !this.videoCourse.is_collected;
        Toast.success({
          message: this.videoCourse.is_collected ? "收藏成功" : "已取消收藏",
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
        if (!this.videoCourse.is_liked) {
          await userLike(this.videoCourse.id);
          this.$set(this.videoCourse, "is_liked", true);
        } else {
          await userCancelLike(this.videoCourse.id);
          this.$set(this.videoCourse, "is_liked", false);
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
        const { data } = await getCommentList(this.video_course_id);
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
    // 检查该篇视频课程作者是否被关注
    checkAuthorIsFocus() {},
  },
  async mounted() {
    this.$bus.$on("post-success", this.closePostModal);
    this.video_course_id = this.$route.params.videoId;
    await this.getVideoCourseBy();
    this.$store.dispatch("updateParam", [
      { is_comment_enabled: this.videoCourse.is_comment_enabled },
    ]);
    this.getComments();
    this.addArticleHistory();
  },
};
</script>



<style lang="less" scoped>

.videoCourse-cotainer {
  .content-wrap {
    width: 100%;
    height: calc(~"100vh - 90px");
    overflow-y: auto;
    background-color: white;

    .ep-info-pre {
      display: flex;
      padding: 14px 12px 11px;
      border-bottom: 1px solid #e7e7e7;
      .ep-info-wrap {
        position: relative;
        display: flex;
        .ep-info-left {
          width: 90px;
          height: 100px;
          margin-right: 10px;
          .ep-info-image {
            width: 100%;
            height: 100%;
            img {
              border-radius: 10px;
              display: inline-block;
              vertical-align: top;
              width: 100%;
              height: 100%;
              overflow: hidden;
              font-size: 12px;
            }
          }
        }
        .ep-info-center {
          flex: 1;
          font-size: 14px;
          color: #999;
          .ep-info-title {
            width: 250px;
            height: 20px;
            line-height: 20px;
            margin-bottom: 4px;
            font-size: 16px;
            color: #000;
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
          }
          .ep-info-data {
            display: flex;
            color: #444;
            .fav {
              margin-left: 10px;
            }
          }
          .ep-info-author {
            color: #444;
          }
        }
        .ep-info-right {
          position: absolute;
          top: 24px;
          right: 0;
          width: 70px;
          height: 24px;
        }
      }
    }
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