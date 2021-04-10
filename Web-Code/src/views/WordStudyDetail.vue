<template>
  <div class="word-wrap">
    <div v-if="!isCard" class="word-content">
      <div class="title-wrap">
        <el-page-header @back="backClick"></el-page-header>
        <div class="title">四级词汇列表</div>
      </div>
      <div class="wordLists" v-if="wordList.length>0">
         <el-table
          ref="multipleTable"
          :data="wordList"
          tooltip-effect="dark"
          style="width: 100%"
          @selection-change="selectionChange">
          <el-table-column
            type="selection"
            width="55">
          </el-table-column>
          <el-table-column
            prop="word_name"
            label="单词名称"
            width="120">
          </el-table-column>
          <el-table-column
            prop="pronunciation"
            label="单词音标"
            width="120">
          </el-table-column>
          <el-table-column
            prop="translate"
            label="单词释义"
            show-overflow-tooltip>
          </el-table-column>
        </el-table>
        <div class="page">
          <Pagination :size="size" :total="total" @currentChange="currentChange" />
        </div>
        <div class="btns">
          <el-button type="primary" @click="addWord('')">加入生词本</el-button>
          <el-button type="primary" v-show="!isCard" @click="isCard=true">卡片学习</el-button>
        </div>
      </div>
      <div class="no-result" v-else>暂无数据~</div>
    </div>
    <div v-if="isCard" class="card-content">
      <el-carousel indicator-position="none" :autoplay="false" height="300px" :loop="false" arrow="always">
        <el-carousel-item v-for="(item,index) in wordList" :key="index" class="cardItem">
          <div class="item-content">
            <el-card class="box-card">
              <div class="word-name">{{item.word_name}}</div>
              <div class="pronunciation">{{item.pronunciation}}</div>
              <div class="translate">{{item.translate}}</div>
              <div class="word-type"><el-tag>{{item.category_name}}词汇</el-tag></div>
              <i class="iconfont icon-lajitong addbtn" title="添加生词" @click="cardAddWord(item.word_id)"></i>
            </el-card>
          </div>
        </el-carousel-item>
      </el-carousel>
    </div>
    <el-button class="change-btn" v-show="isCard" type="primary" @click="isCard=false">列表学习</el-button>
  </div>
</template>

<script>
import Pagination from '../components/common/Pagination'
import { deepClone } from '../util/common'
export default {
  components:{
    Pagination
  },
  data(){
    return {
      wordList:[
        {word_id:5,word_name:"alone",translate:"adj. 单独的，孤单的，独自一人的 adv. 独自地",pronunciation:"[ə'ləun]",category_name:"四级"},
        {word_id:6,word_name:"alarm",translate:"n. 警报，警报器，警告，惊恐 vt. 向...报警，警告，使惊恐",pronunciation:"[ə'lɑ:m]",category_name:"四级"},
        {word_id:7,word_name:"airline",translate:"n. 航线，航空公司",pronunciation:"['ɛəlain]",category_name:"四级"},
        {word_id:8,word_name:"airport",translate:"n. 机场，航空站",pronunciation:"['eəpɔ:t]",category_name:"四级"},
        {word_id:9,word_name:"allow",translate:"v.允许；准许；给予；承认",pronunciation:"[ə'lau]",category_name:"四级"},
        {word_id:10,word_name:"alike",translate:"adj. 相似的，同样的 adv. 一样，以同样的方式",pronunciation:"[ə'laik]",category_name:"四级"},
        {word_id:4,word_name:"aircraft",translate:"n. 飞机",pronunciation:"['ɛəkrɑ:ft]",category_name:"四级"},
      ],
      wordId:0,
      multipleSelection: [],
      size:5,
      index:1,
      total:10,
      isCard:false,//是否为卡片学习
      userInfo:{},//用户信息
    }
  },
  methods:{
    // 返回上一页
    backClick(){
      this.$router.back();
    },
    // 分页器点击
    currentChange(newV) {
      this.index = newV
    },
    selectionChange(val) {
      this.multipleSelection = val.map(item=>item.word_id);
    },
    // 卡片点击添加生词
    cardAddWord(id){
      let word_id_arr = [id]
      this.addWord(word_id_arr)
    },
    // 添加生词
    addWord(arr){
      let word_id_arr = arr || this.multipleSelection
      this.$service
        .post("/web/wordbook",{
          web_user_id:this.userInfo.id,
          word_id:JSON.stringify(word_id_arr)
        })
        .then(res => {
          if(res.code == 0 ){
            this.$message.success(res.message)
          }else{
            this.$message.error('添加生词失败，请联系管理员！')
          }
        })
        .catch(err => {
          console.log(err);
        });
    }
  },
  mounted(){
    this.userInfo = deepClone(this.$store.state.userInfo);
    this.wordId = this.$route.params.id
    console.log(this.wordId)
  }
}
</script>

<style lang="scss" scoped>
.word-wrap {
  position: relative;
  width: 100%;
  height: calc(100vh - 54px);
  overflow: hidden;
  background: #f9f9f9;

  .change-btn{
    position: absolute;
    left: 50%;
    transform: translateX(-50%);
    top: 20px;
  }
  .card-content {
    width: 800px;
    height: 300px;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%,-50%);

    
    .cardItem{
      .item-content{
        width: 100%;
        display: flex;
        justify-content: center;
        align-items: center;
        .box-card{
          position: relative;
          width: 400px;
          height: 300px;
          text-align: center;
          &:hover{
            .addbtn{
              opacity: 1;
            }
          }

          .word-name{
            width: 100%;
            font-size: 20px;
            font-weight: bold;
          }

          .pronunciation{
            color: #666;
            margin-top: 10px; 
          }

          .translate{
            margin-top: 60px;
          }

          .word-type{
            margin-top: 30px;
          }

          .addbtn{
            position: absolute;
            top: 20px;
            right: 20px;
            opacity: 0;
            transition: .3s all linear;
            cursor: pointer;
          }
        }
      }
    }
    
  }
  .word-content {
    width: 800px;
    margin: 0 auto;
    padding: 20px 0;
    .title-wrap{
      display: flex;
        margin-bottom: 30px;
        /deep/ .el-page-header__left::after{
          background: #fff;
        }
      .title{
        width: calc(100% - 92px);
        font-size: 20px;
        text-align: center;
      } 
    }
    
    .word-list{
      width: 100%;
    }

    .page{
      width: 100%;
      margin-top: 10px;
      /deep/ .pagination{
        display: flex;
        justify-content: center;
      }
    }
    
    .btns{
      margin-top: 20px;
      width: 100%;
      display: flex;
      justify-content: space-between;
    }
  }
}
.no-result{
  display: flex;
  justify-content: center;
  align-items: center;
  font-size: 18px;
  width: 100%;
  height: 500px;
}
</style>