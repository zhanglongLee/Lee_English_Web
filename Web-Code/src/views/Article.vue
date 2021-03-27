<template>
  <div class="article-container">
    <div class="content">
      <!-- <div class="content-top">
        <div class="latest shadow">
          <Top5List />
        </div>
        <div class="recommend shadow"></div>
      </div>
      <div class="article-list">
        <ArticleList />
      </div> -->
      <ArticleList />
    </div>
  </div>
</template>

<script>
// import Top5List from '@/components/article/Top5List'
// import ArticleList from '@/components/article/ArticleList'
import ArticleList from '@/components/article/ArticleList'
export default {
  name: 'Article',
  components: {
    ArticleList
    // Top5List,
    // ArticleList
  },
  data() {
    return {

    }
  }
}
</script>

<style lang="scss" scoped>

.article-container {
  position: relative;
  min-width: 1300px;
  // padding-top: 54px;

  .content {
    position: relative;
    width: 1200px;
    margin: 0 auto;
    padding-bottom: 20px;
    .content-top {
      display: flex;
      justify-content: space-between;
      width: 100%;
        .latest{
          width: 60%;
        }

      }
      .recommend {
        // position: fixed;
        // top: 74px;
        // right: 40px;
        width: 36%;
      }
    }
    .article-list {
      width: 60%;
    }
  }
</style>
