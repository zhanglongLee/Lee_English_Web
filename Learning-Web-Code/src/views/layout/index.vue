<template>
    <div>
        <keep-alive>
            <router-view></router-view>
        </keep-alive>
        <!-- 底部导航栏 -->
        <van-tabbar class="tabbar" v-model="active">
            <van-tabbar-item icon="home-o" name="home" @click="goToPage('home','/')">首页</van-tabbar-item>
            <van-tabbar-item icon="video-o" name="videoCourse" @click="goToPage('videoCourse','/videoCourse')">视频课程</van-tabbar-item>
            <van-tabbar-item icon="friends-o" name="myFocus" @click="goToPage('myFocus','/myFocus')">我的关注</van-tabbar-item>
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
        watch:{
          '$route'(val){
            this.setTabBar()
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