<template>
  <div class="my-focus">
    <van-nav-bar title="关注" left-arrow @click-left="$router.back()" />
    <articleCollectList></articleCollectList>
  </div>
</template>

<script>
import articleCollectList from './components/articleCollectList'
export default {
  name:"myFocus",
  components:{
    articleCollectList
  },
  data () {
    return {}
  },
  methods: {},
}
</script>

<style lang="less" scoped>

</style>
