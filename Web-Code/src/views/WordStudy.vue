<template>
  <div class="word-wrap">
    <div class="word-content">
      <div class="title">单词分类</div>
      <ul class="cardLists">
        <li class="cardItems" v-for="(item,index) in wordTypeList" :key="index">
          <el-card class="box-card">
            <div class="card-title">{{item.name}}词汇</div>
            <div class="card-num">{{item.wordNum}}<span>词</span></div>
            <el-button class="card-btn" type="primary" @click="startLearning(item.id)">开始学习</el-button>
          </el-card>
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
export default {
  data(){
    return {
      wordTypeList:[
        {id:1,name:"四级",wordNum:500,},
        {id:2,name:"六级",wordNum:600,},
        {id:3,name:"专业英语四级",wordNum:800,},
        {id:4,name:"专业英语八级",wordNum:900,},
        {id:4,name:"新概念英语",wordNum:500,},
        {id:4,name:"高频",wordNum:600,},
      ]
    }
  },
  methods:{
    startLearning(id){
      this.$router.push({path:`/wordStudy/wordStudyDetail/${id}`})
    }
  }
}
</script>

<style lang="scss" scoped>
.word-wrap {
  width: 100%;
  background: #f9f9f9;

  .word-content {
    width: 1200px;
    min-height: 600px;
    margin: 0 auto;
    padding: 20px 0;

    .title{
      font-size: 20px;
      text-align: center;
      margin-bottom: 30px;
    }

    .cardLists{
      display: flex;
      flex-wrap: wrap;

      .cardItems{
        width: 19.5%;
        margin-bottom: 10px;
        background: #fff;
        margin-left: 20px;

        .box-card{
          text-align: center;
          .card-title{
            font-size: 18px;
            font-weight: bold;
            text-align: center;
          }
          .card-num{
            width: 100%;
            line-height: 130px;
            text-align: center;
            font-size: 16px;
            color: #000;
            span{
              color: #666;
            }
          }
          .card-btn{

          }

        }
      }
    }
  }
}
</style>