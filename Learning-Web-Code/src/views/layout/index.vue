<template>
    <div>
        <keep-alive>
            <router-view></router-view>
        </keep-alive>
        <!-- 底部导航栏 -->
        <van-tabbar class="tabbar" v-model="active">
            <van-tabbar-item icon="home-o" name="home" @click="goToPage('home','/')">首页</van-tabbar-item>
            <van-tabbar-item class="iconfont" name="tianqi" icon-prefix="icon" icon="tianqi" @click="goToPage('tianqi','/weather')">天气</van-tabbar-item>
            <van-tabbar-item class="iconfont" name="jihua" icon-prefix="icon" icon="jihua" @click="goToPage('jihua','/todolist')">计划</van-tabbar-item>
            <van-tabbar-item icon="user-o" name="my" @click="goToPage('my','/my')">我的</van-tabbar-item>
        </van-tabbar>
    </div>
</template>

<script>
    export default {
        name: 'layout',
        data() {
            return {
                active: 'home',
            }
        },
        methods:{
          goToPage(name,path){
            this.active = name
            this.$router.push({path})
          },
          setTabBar(){
            // 如果path不为/，则截取对应的name
            this.active = this.$route.path.split("/")[1] || "home"
          }
        },
        mounted(){
          this.setTabBar()
            this.$store.commit('ADDCACHEPAGE','layout');
        }
    }
</script>

<style scoped lang="less">
.tabbar{
    /deep/ .iconfont{
        font-size: 12px !important;
    }
}


</style>