<template>
  <div>
    <div
      :class="['comment-child', { pd20: !temp }]"
      v-for="(comment, index) in commentChild"
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
              <span v-if="comment.parentName">{{
                comment.nickname + " @回复" + comment.parentName
              }}</span>
              <span class="name" v-else>
                {{ comment.nickname }}
              </span>
              <div
                @click="onLike(comment)"
                :class="is_liked ? 'like' : ''"
                class="good"
              >
                <van-icon
                  :name="is_liked ? 'good-job' : 'good-job-o'"
                />
                <span>{{ comment.like_count }}</span>
              </div>
            </div>
            <div class="content">{{ comment.content }}</div>
            <div class="bottom">
              <span class="time">{{ comment.created_at }}</span>
              <van-button
                v-if="is_comment_enabled"
                @click="postitemcomment(comment.id)"
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
      <comment-child :commentChild="comment.child" :temp="true"></comment-child>
    </div>
  </div>
</template>

<script>
import { delikeComment, likeComment } from '@/api/videoCourseComment'
import { mapState } from "vuex";
export default {
  name: "commentChild",
  props: ["commentChild", "temp"],
  data() {
    return {
      is_liked: false
    };
  },
  computed:{
    ...mapState(['is_comment_enabled'])
  },
  methods: {
    async onLike(comment) {
      const commentId = comment.id;
      if (this.is_liked) {
        await delikeComment(commentId);
        this.$toast.success({
          message: "取消点赞成功！"
        })
      } else {
        await likeComment(commentId);
        this.$toast.success({
          message: "点赞成功！"
        })
      }
      this.is_liked = !this.is_liked;
    },
    //回复二级三级...评论，使用递增
    postitemcomment(id) {
      if(!this.$store.state.userInfo){
        this.$toast({
          message:"请登录后进行评论操作！"
        })
        return
      }
      this.$store.dispatch("updateParam",["postShowObj",{status:true,data:{commentId: id}}])
    },
  },
};
</script>

<style lang="less" scoped>
.comment-child {
  &.pd20 {
    padding-left: 20px;
  }
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
