<template>
  <div class="content-list">
    <div
      v-for="item in curList"
      :key="item.id"
      class="articles-list-content-left-item"
    >
      <div class="item-info">
        <div class="title ellipsis" @click="toDetail(item.id)">
          {{ item.title }}
        </div>
        <div class="brief">{{ item.description }}</div>
        <div class="content-info">
          <div v-if="item.published_time" class="date">{{ item.published_time }}</div>
          <div v-if="item.views" class="icon" :title="'阅读量为'+item.views"><i class="iconfont icon-yanjing"></i>{{ item.views }}</div>
          <div v-if="item.words" class="icon" :title="'文章字数为'+item.words"><i class="iconfont icon-wenzhang"></i>{{ item.words }}</div>
          <div v-if="item.read_time" class="icon" :title="'推荐阅读时间为'+item.read_time+'分钟'"><i class="iconfont icon-shijian_zhongbiao"></i>{{ item.read_time }}</div>
          <el-tag v-if="item.categoryName" effect="dark" class="categoryName">{{ item.categoryName }}</el-tag>
        </div>
      </div>
      <div v-if="item.image" class="item-img">
        <img :src="item.image" alt="" />
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    curList: {
      type: Array,
      default: () => {
        return []
      }
    }
  },
  methods: {
    toDetail(id) {
      this.$emit('navToDetail', id)
    }
  }
}
</script>

<style lang="scss" scoped>
.content-list{
  width: 100%;
  .articles-list-content-left-item {
    height: 150px;
    display: flex;
    justify-content: space-between;
    margin-bottom: 50px;
    cursor: pointer;
    &:hover .item-info > .brief{
      color: rgb(7, 7, 122);
    }
    .item-info {
      flex: 1;
      display: flex;
      flex-direction: column;
      justify-content: space-between;

      .title {
        color: rgba(38, 38, 38, 1);
        font-size: 20px;
        font-weight: bold;
      }
      .brief {
        width: 100%;
        color: #333;
        font-size: 14px;
      }
      .content-info{
        height: 30px;
        cursor: default;
        display: flex;
        align-items: center;
        color: rgba(168, 168, 168, 1);
        font-size: 12px;
        .icon{
          margin-left: 10px;
        }
        .categoryName{
          line-height: 1;
          height: auto;
          padding: 6px 10px;
          margin-left: 10px;
        }
      }

    }
    .item-img {
      width: 200px;
      margin-left: 10px;

      img {
        width: 100%;
        height: 100%;
      }
    }
  }
}
</style>
