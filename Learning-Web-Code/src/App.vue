<template>
  <div id="app">
    <keep-alive :include="cachePages" >
       <router-view />
    </keep-alive>
     
  </div>
</template>

<script>
  import './styles/index.css';
  import {mapState} from 'vuex';
  export default {
    name: 'App',
    components: {

    },
    computed:{
      ...mapState(['cachePages'])
    }
  }
</script>

<style>
@keyframes opt {
  0% {
    opacity: 0;
    transform: scaleX(0) scaleY(0);
  }

  50% {
    opacity: 1;
    transform: scaleX(100%) scaleY(100%);
  }

  100% {
    opacity: 0;
    transform: scaleX(0) scaleY(0);
  }
}
.tips {
  width: 150px;
  height: 30px;
  font-size: 10px;
  line-height: 30px;
  text-align: center;
  background-color: rgb(248, 45, 96);
  box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.3);
  border-radius: 10px;
  color: rgb(255, 255, 255);
  position: fixed;
  bottom: 20%;
  opacity: 0;
  animation: opt 4s ease forwards;
  animation-delay: 1s;
  left: 0;
  right: 0;
  margin: 0 auto;
}
</style>