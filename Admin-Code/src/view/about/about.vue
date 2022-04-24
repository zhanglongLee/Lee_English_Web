<template>
  <div class="container">
    欢迎进入后台管理系统!
  </div>
</template>

<script>
import About from '../../model/about'
export default {
  data() {
    return {}
  },
  mounted() {

  },
}
</script>

<style scoped lang="scss">
.container {
  width: 100%;
  height: calc(100vh - 86px);
  display: flex;
  justify-content: center;
  align-items: center;
  font-size: 40px;
  color: #000;
}

</style>
