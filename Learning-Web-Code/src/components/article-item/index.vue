<template>
  <div class="article-item">
    <van-cell
      :to="{ path: `article/${article.id}` } "
      class="item-container"
    >
      <div slot="title" class="title van-multi-ellipsis--l3">
        {{ article.title }}
      </div>
      <div slot="label" class="label">
        <!-- <div class="cover-wrapper" v-if="article.cover.images.length === 3">
          <div
            class="cover-item"
            v-for="(img, index) in article.cover.images"
            :key="index"
          >
            <van-image :src="img" height="76" fit="cover" />
          </div>
        </div> -->
        <div class="label-wrapper">
          <span>{{ article.author }}</span>
          <span class="category">{{ article.categoryName }}</span>
          <span>{{ getRelativeTime(article.published_time) }}</span>
        </div>
      </div>
      <!-- 单封面情况 -->
      <van-image
        :src="article.image"
        width="116"
        height="73"
        fit="cover"
      />
    </van-cell>
  </div>
</template>

<script>
import moment from 'moment'
export default {
  name: "ArticleItem",
  props: {
    article: {
      type: Object,
      required: true,
    },
  },
  methods: {
    // 获取相对时间
    getRelativeTime(published_time){
      let relativeTime = ""
      let days = moment().diff(moment(published_time), 'days')
      let hours = moment().diff(moment(published_time), 'hours')
      let minutes = moment().diff(moment(published_time), 'minutes')
      let seconds = moment().diff(moment(published_time), 'seconds')
      if(seconds>0 && seconds<60){
        relativeTime = seconds + "秒前"
      }else if(minutes>0 && minutes<60){
        relativeTime = minutes + "分钟前"
      }else if(hours>0 && hours<60){
        relativeTime = hours + "小时前"
      }else if(days>0 && days<60){
        relativeTime = days + "天前"
      }else{
        relativeTime = "现在"
      }
      return relativeTime
    },
  },
  mounted() {
  },
};
</script>

<style scoped lang="less">
.article-item {
  .item-container {
    .van-cell__title {
      padding: 3px 0;
      display: flex;
      flex-direction: column;
      justify-content: space-between;
    }

    .title {
      font-size: 16px;
      color: #3a3a3a;
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
      .category{
        color: #1989fa;
      }
    }
  }
}
</style>