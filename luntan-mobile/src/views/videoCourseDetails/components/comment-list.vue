<template>
  <div>
    <div
      class="comment-list"
      v-for="(comment, index) in commentList"
      :key="index"
    >
      <van-cell-group class="comment-item">
        <van-cell :border="false">
          <van-image
            class="left-img"
            :src="comment.image"
            fit="cover"
            round
            slot="icon"
          />
          <div slot="title" class="base-info">
            <div class="up">
              <span v-if="isSecondComment(comment)">{{
                "@回复" + comment.nickname + comment.parent_comment_id
              }}</span>
              <span class="name" v-else>
                {{ comment.nickname }}
              </span>
              <div @click="onLike(comment)" :class="is_liked ? 'like' : ''" class="good">
                <van-icon :name="is_liked ? 'good-job' : 'good-job-o'" />
                <span>{{ comment.like_count }}</span>
              </div>
            </div>
            <div class="content">{{ comment.content }}</div>
            <div class="bottom">
              <span class="time">{{ comment.created_at }}</span>
              <van-button
                v-if="is_comment_enabled"
                @click="parentComment(comment)"
                class="recomment"
                type="primary"
                size="mini"
                round
                >回复</van-button
              >
            </div>
          </div>
        </van-cell>
      </van-cell-group>
      <commentChild :commentChild="comment.child"></commentChild>
    </div>
  </div>
</template>

<script>
import commentChild from "./comment-child.vue";
import { mapState } from "vuex";
import { delikeComment, likeComment } from '@/api/videoCourseComment'
export default {
  components: {
    commentChild,
  },
  name: "commentList",
  computed:{
    ...mapState(['is_comment_enabled','userInfo'])
  },
  data() {
    return {
      loading: false,
      finished: false,
      limit: 10,
      offset: null,
      is_liked: false,
    };
  },
  props: {
    commentList: {
      type: [Array],
      default: () => [],
    },
  },
  methods: {
    closePostModal() {
      this.$store.dispatch("updateParam", [
        "postShowObj",
        { status: false, data: {} },
      ]);
    },
    parentComment(data) {
      if (!this.userInfo) {
        this.$toast({
          message: "请登录后进行评论操作！",
        });
        return;
      }
      this.$store.dispatch("updateParam", [
        "postShowObj",
        { status: true, data },
      ]);
    },
    isSecondComment(item) {
      return item.parent_comment_id !== -1;
    },
    async onLike(comment) {
      const commentId = comment.id;
      if (this.is_liked) {
        await delikeComment(commentId);
        this.$toast.success({
          message: "取消点赞成功！",
        });
      } else {
        await likeComment(commentId);
        this.$toast.success({
          message: "点赞成功！",
        });
      }
      this.is_liked = !this.is_liked;
    },
    // 评论成功回调
    onPostSuccess(comment) {
      // 将发布成功的评论 放到评论列表顶部
      this.isPostShow = false;
      console.log(comment);
    },
  },
  watch: {
    list: {
      isDeep: true,
      async handler() {
        // const{idObj,content}=this.list[0];
        // const{data}=await getUserInfo();
        // console.log(data);
        // console.log(idObj);
        // let newComment={
        //     com_id:idObj.com_id,
        //     aut_id:data.data.id,
        //     aut_name:data.data.name,
        //     aut_photo:data.data.photo,
        //     like_count:0,
        //     reply_count:0,
        //     pubdate:Date.now(),
        //     content:content,
        //     is_top:0,
        //     is_liking:false
        // }
        // this.commentList.unshift(newComment);
      },
    },
  },
  mounted() {
    this.$bus.$on("post-success", this.closePostModal);
  },
};
</script>

<style lang="less" scoped>
.title {
  font-size: 20px;
  padding: 10px;
  color: #222222;
}
.comment-list {
  & /deep/ .comment-item {
    .like {
      color: rgb(255, 16, 56);
    }
    .left-img {
      width: 35px;
      height: 35px;
    }

    .base-info {
      margin-left: 13px;

      .up {
        display: flex;
        justify-content: space-between;

        .name {
          font-size: 13px;
          color: #406599;
        }
      }

      .content {
        font-size: 16px;
        color: #222222;
      }

      .bottom {
        display: flex;

        .time {
          font-size: 10px;
        }

        .recomment {
          margin-left: 20px;
          background-color: #f4f5f6;
          color: #222222;
          border: none;
          width: 68px;
          height: 24px;
        }
      }
    }
  }
}
</style>