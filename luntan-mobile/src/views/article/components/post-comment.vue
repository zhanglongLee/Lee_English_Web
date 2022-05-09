<template>
  <div class="post">
    <van-field
      v-model="message"
      rows="2"
      autosize
      type="textarea"
      maxlength="50"
      placeholder="请输入评论"
      show-word-limit
    />
    <van-button
      @click="onComment"
      :disabled="!message"
      size="small"
      round
      class="publish-btn"
      type="primary"
      plain
    >
      发送
    </van-button>
  </div>
</template>

<script>
import { addComment } from "@/api/comment";
import { sensitiveWordFilter } from '@/utils/common'
export default {
  name: "postComment",
  data() {
    return {
      message: "",
    };
  },
  props: {
    articleId: {
      type: [Number, String],
      default: null,
    },
    parentCommentId: {
      type: [Number, String],
      default: null,
    },
  },
  methods: {
    _filter_method(obj) {
      //获取文本输入框中的内容
      var value = $(obj).val(); //遍历敏感词数组
      for (var i = 0; i < keywords.length; i++) {
        //全局替换
        var reg = newRegExp(keywords[i], "g"); //判断内容中是否包括敏感词
        if (value.indexOf(keywords[i]) != -1) {
          varresult = value.replace(reg, "**");
          value = result;
          $(obj).val(result);
        }
      }
    },
    async onComment() {
      if (!this.$store.state.userInfo) {
        this.$toast({
          message: "请登录后进行操作",
        });
        this.$router.push("/login");
        return;
      }
      try {
        await addComment({
          web_user_id: !!this.$store.state.userInfo.id
            ? this.$store.state.userInfo.id
            : null,
          content: sensitiveWordFilter(this.message),
          article_id: !!this.articleId ? this.articleId : null,
          parent_comment_id: !!this.parentCommentId
            ? this.parentCommentId
            : null,
        });
        this.$bus.$emit("post-success");
        this.$toast.success("发布成功！");
        this.message = "";
      } catch (error) {
        this.$toast(error.message);
      }
    },
  },
};
</script>

<style lang="less">
.post {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 10px;

  .publish-btn {
    font-size: 12px;
    width: 48px;
    height: 24px;
  }
}
</style>