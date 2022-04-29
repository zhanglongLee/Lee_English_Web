<template>
  <div class="article-item">
    <van-cell :to="{ path: pathUrl }" class="item-container">
      <div slot="title" class="userInfo">
        <div class="userInfo-left">
          <van-image
            :src="article.avatar"
            width="40"
            height="40"
            round
            fit="cover"
          />
        </div>
        <div class="userInfo-right">
          <div class="userInfo-name">{{article.author}}</div>
          <div class="userInfo-publish-info">{{ `${getRelativeTime(article.published_time)} · 发布了 ${!!article.video_url?"视频":"文章"}`}}</div>
        </div>
      </div>
      <div slot="title" class="title van-multi-ellipsis--l3">
        {{ article.title }}
      </div>
      <div slot="title" v-if="!!article.video_url">
        <my-video
          :videoUrl="article.video_url"
        ></my-video>
      </div>
      <div slot="title" v-else class="content">
        {{content}}
      </div>
      <div slot="label" class="label">
        <div class="label-wrapper">
          <span><van-icon name="eye-o" /> {{ article.views }}</span>
          <span><van-icon name="good-job-o" /> {{ article.like_num }}</span>
          <span class="category">{{ article.categoryName }}</span>
        </div>
      </div>
    </van-cell>
  </div>
</template>

<script>
import {parseDomGetInnerHtml} from '@/utils/common'
import myVideo from '../my-video'
import moment from "moment";
export default {
  name: "focusItem",
  components:{
    myVideo
  },
  props: {
    article: {
      type: Object,
      required: true,
    },
  },
  computed:{
    content(){
      return parseDomGetInnerHtml(this.article.content)
    },
    pathUrl(){
      return `${!!this.article.video_url?"videoCourseDetails":"article"}/${this.article.id}`
    }
  },
  methods: {
    // 获取相对时间
    getRelativeTime(published_time) {
      let relativeTime = "";
      let days = moment().diff(moment(published_time), "days");
      let hours = moment().diff(moment(published_time), "hours");
      let minutes = moment().diff(moment(published_time), "minutes");
      let seconds = moment().diff(moment(published_time), "seconds");
      if (seconds > 0 && seconds < 60) {
        relativeTime = seconds + "秒前";
      } else if (minutes > 0 && minutes < 60) {
        relativeTime = minutes + "分钟前";
      } else if (hours > 0 && hours < 60) {
        relativeTime = hours + "小时前";
      } else if (days > 0 && days < 60) {
        relativeTime = days + "天前";
      } else {
        relativeTime = "现在";
      }
      return relativeTime;
    },
  },
  mounted() {},
};
</script>

<style scoped lang="less">
.article-item {
  margin-bottom: 10px;
  .userInfo {
    display: flex;
    align-items: center;
    &-left {
      margin-right: 10px;
    }
    &-right {
      .userInfo-name {
        font-weight: bold;
      }
      .userInfo-publish-info {
        font-size: 12px;
        color: #999;
      }
    }
  }
  .item-container {
    .van-cell__title {
      padding: 3px 0;
      display: flex;
      flex-direction: column;
      justify-content: space-between;
    }

    .title {
      width: 340px;
      font-size: 14px;
      font-weight: bold;
      overflow: hidden;
      text-overflow: ellipsis;
      display: -webkit-box;
      -webkit-line-clamp: 1;
      -webkit-box-orient: vertical;
    }
    .content {
      width: 340px;
      color: rgb(58, 58, 58);
      overflow: hidden;
      text-overflow: ellipsis;
      display: -webkit-box;
      -webkit-line-clamp: 3;
      -webkit-box-orient: vertical;
    }

    .van-cell__value {
      flex: unset;
      width: 113px;
      height: 76px;
      margin-left: 12px;
    }

    .cover-wrapper {
      padding: 15px 0;
      display: flex;
      flex: 1;
      flex-wrap: nowrap;

      .cover-item {
        &:not(:last-child) {
          padding-right: 4px;
        }

        width: 100%;
        height: 76px;
      }
    }

    .label-wrapper {
      font-size: 11px;

      span + span {
        margin-left: 12px;
      }
      .category {
        color: #1989fa;
      }
    }
  }
}
</style>