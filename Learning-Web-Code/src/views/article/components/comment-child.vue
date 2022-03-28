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
                @click="onLike"
                :class="comment.is_liking ? 'like' : ''"
                class="good"
              >
                <van-icon
                  :name="comment.is_liking ? 'good-job' : 'good-job-o'"
                />
                <span>{{ comment.like_count }}</span>
              </div>
            </div>
            <div class="content">{{ comment.content }}</div>
            <div class="bottom">
              <span class="time">{{ comment.created_at }}</span>
              <van-button
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
export default {
  name: "commentChild",
  props: ["commentChild", "temp"],
  data() {
    return {};
  },
  methods: {
    async onLike() {
        this.$toast.success({
          message: "开发中",
        });
        return
      const commentId = this.comment.com_id;
      if (this.comment.is_liking) {
        await delikeComment(commentId);
        this.comment.like_count--;
      } else {
        await likeComment(commentId);
        this.comment.like_count++;
      }
      this.comment.is_liking = !this.comment.is_liking;
    },
    //回复二级三级...评论，使用递增
    postitemcomment(id) {
      if(!this.userInfo){
        this.$toast({
          message:"请登录后进行评论操作！"
        })
        return
      }
      this.$store.dispatch("updateParam",["postShowObj",{status:true,data:{id: -1,article_id: id}}])
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
