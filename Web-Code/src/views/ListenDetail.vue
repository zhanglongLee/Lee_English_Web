<template>
  <div id="content" class="listen-detail">
    <div class="listen-content">
      <h1 class="header-title">{{listeningDetail.title}}</h1>
      <div class="back-to-prev-page">
        <img src="../assets/images/article/prev.png" alt="" />
        <span @click="backToPrev">返回</span>
      </div>
      <div class="header-info">
        <div class="date">
          {{listeningDetail.created_at}}
        </div>
        <div class="download" @click="downloadSource">
          <i class="iconfont icon-xiazai"></i>下载当前听力资料
        </div>
        <div class="collection">
          <i v-if="!isCollection" @click="toCollect(1)" class="iconfont icon-shoucang" :title="isCollection?'点击取消收藏':'点击收藏'"></i>
          <i v-if="isCollection" @click="toCollect(0)" class="iconfont icon-shoucangbeifen" :title="isCollection?'点击取消收藏':'点击收藏'"></i>
        </div>
        <!-- <div class="d-flex align-items-center flex-wrap">
          <div
            ref="download"
            class="d-none"
            :href="listeningDetail.logo"
            :download="listeningDetail.fileName"
          ></div>
        </div> -->
      </div>
      <div class="post-body">
        <div class="resource">
          <myaudio 
            ref="audioPlayer"
            theme-color="#ff2929"
            :audioData="audioData"
            ></myaudio>
        </div>
        <div class="news-question">
          <ul class="question-list">
            <li
              v-for="(item, i) in questions"
              :key="i"
              class="question-item"
            >
              <p class="item-title">
                <span
                  :color="item.isWrong"
                >{{ i + 1 }}.{{ item.title }}
                  <i v-if="item.isWrong" class="fa fa-hand-o-left colred"></i></span>
                <span
                  v-if="isShowAnswer"
                  style="color:#f5862b;font-size:14px;"
                >正确答案 {{ "：" + item.answer }}
                </span>
              </p>
              <dl class="item-options">
                <dd v-if="item.op1" class="options">
                  <input
                    :id="'op1' + i"
                    v-model="item.answerTemp"
                    class="mr-1"
                    type="radio"
                    :name="'option' + i"
                    value="A"
                  />
                  <label :for="'op1' + i">A.{{ item.op1 }}</label>
                </dd>
                <dd v-if="item.op2" class="options">
                  <input
                    :id="'op2' + i"
                    v-model="item.answerTemp"
                    class="mr-1"
                    type="radio"
                    :name="'option' + i"
                    value="B"
                  />
                  <label :for="'op2' + i">B.{{ item.op2 }}</label>
                </dd>
                <dd v-if="item.op3" class="options">
                  <input
                    :id="'op3' + i"
                    v-model="item.answerTemp"
                    class="mr-1"
                    type="radio"
                    :name="'option' + i"
                    value="C"
                  />
                  <label :for="'op3' + i">C.{{ item.op3 }}</label>
                </dd>
                <dd v-if="item.op4" class="options">
                  <input
                    :id="'op4' + i"
                    v-model="item.answerTemp"
                    class="mr-1"
                    type="radio"
                    :name="'option' + i"
                    value="D"
                  />
                  <label :for="'op4' + i">D.{{ item.op4 }}</label>
                </dd>
              </dl>
              <div v-if="isShowAnswer" class="answer-wrap">
                <!-- <h3>答案解释</h3> -->
                <div v-html="item.questions_analysis"></div>
              </div>
            </li>
          </ul>
          <div class="btn-list">
            <el-button
              type="primary"
              class="sub-btn"
              @click="submit"
            >提交</el-button>
            <div class="detail-list">
              <span
                v-if="!isShowAnswer"
                class="show"
                @click="isShowAnswer = true"
              >我太难了，就想看答案</span>
              <span
                v-else
                class="unshow"
                @click="isShowAnswer = false"
              >我就是看看，其实我知道</span>
            </div>
            <!-- <div class="detail-list">
              <span
                v-if="!isShowAnalysis"
                class="show"
                @click="isShowAnalysis = true"
              >查看解析</span>
              <span
                v-else
                class="unshow"
                @click="isShowAnalysis = false"
              >先不看</span>
            </div> -->
          </div>
          <div
            v-if="
              questions.length <= 0
            "
          >
            <div class="no-result">暂时没有内容/(ㄒoㄒ)/~~</div>
          </div>
        </div>
        
      </div>
    </div>
  </div>
</template>

<script>
import myaudio from '@/components/common/myAudio'
import { deepClone } from '../util/common'
export default {
  components:{
    myaudio
  },
  data() {
    return {
      isCollection:false,//是否已收藏
      listeningId:0,
      listeningDetail: {},
      questions:[],//听力练习题目
      history_answer:[],//历史答案
      isShowAnswer: false,
      isShowAnalysis: false,
      score: 0,
      audioData:[],
      imgList: ['jpg', 'png', 'gif', 'png', 'webp'],
    }
  },
  mounted() {
    // 获取练习id
    this.listeningId = this.$route.params.id;
    
    this.getListeningDetail()
    
  },
  methods: {
    backToPrev() {
      this.$router.back();
    },
    // 获取历史答案
    getHistoryAnswer(){
      this.history_answer = this.$store.state.history_answer
      if(this.history_answer.length>0){
        this.questions.forEach((item,index)=>{
          this.questions[index].answerTemp = this.history_answer[index]
        })
        this.isShowAnswer = true
      }
    },
    // 下载
    downloadSource(){
      window.open(this.listeningDetail.source)
    },
    // 收藏练习
    toCollect(type){
      let collection_type = 2
      let userInfo = this.$store.state.userInfo
      if(type===1){
        this.$service
        .post("/web/collection",{
          type:collection_type,
          web_user_id:userInfo.id,
          id:this.listeningId
        })
        .then(res => {
          if(res.code==0){
            this.isCollection = true
            this.$message.success('收藏成功')
          }
        })
        .catch(err => {
          this.loading = false;
          console.log(err);
        });
      }else{
        // 取消收藏
        this.$service
        .delete(`/web/collection/${collection_type}/${this.listeningId}`)
        .then(res => {
          if(res.code==0){
            this.isCollection = false
            this.$message.success('取消收藏成功')
          }
        })
        .catch(err => {
          this.loading = false;
          console.log(err);
        });
      }
    },
    getListeningDetail() {
      this.$service
        .get("/web/listening/" + this.listeningId)
        .then(res => {
          this.loading = false;
          let vdata = res.data
          this.listeningDetail = vdata
          let questions = JSON.parse(vdata.questions)
          this.audioData = [vdata.source]
          questions.map((item, index) => {
            item.answerTemp = ''
            item.isWrong = false
          })
          this.questions = deepClone(questions)
          // 获取历史答案
          this.getHistoryAnswer()
        })
        .catch(err => {
          this.loading = false;
          console.log(err);
        });
      // this.isShowAnswer = false
      // res.data.questions.map((item, index) => {
      //   item.answerTemp = ''
      //   item.isWrong = false
      // })
      // this.listeningDetail = res.data
      // // 用数据库表中没用到的option5字段作为排序的值
      // this.listeningDetail.questions.sort(this.compare('option5'))
      // console.log(this.listeningDetail)
      // this.listeningDetail.fileName = this.listeningDetail.logo.substr(
      //   this.listeningDetail.logo.lastIndexOf('-') + 1,
      //   this.listeningDetail.logo.lastIndexOf('.')
      // )
      // this.listeningDetail.fileType =
      //   this.imgList.indexOf(
      //     this.listeningDetail.logo.substr(
      //       this.listeningDetail.logo.lastIndexOf('.') + 1
      //     )
      //   ) > -1
      //     ? 'img'
      //     : 'video'
    },
    compare(property) {
      return function(a, b) {
        const value1 = a[property]
        const value2 = b[property]
        return parseInt(value1) - parseInt(value2)
      }
    },
    submit() {
      let hasFinished = true
      for (let i = 0; i < this.questions.length; i++) {
        // 判断是否有答案没有选择
        if (!this.questions[i].answerTemp) {
          hasFinished = false
          break
        }
      }
      if (!hasFinished) {
        this.$message({
          showClose: true,
          message: '您还有试题没有答完呢',
          type: 'warning'
        })
        return false
      }

      
      this.addUserLearning(this.listeningId)
    },
    deleteListening(id) {
      // $.post('/api/listening/delete', {
      //   id
      // })
      //   .done(data => {
      //     if (data.code !== 0) {
      //       console.log(data.msg)
      //       return false
      //     }
      //     this.$message({
      //       showClose: true,
      //       message: data.msg
      //     })
      //     setTimeout(function() {
      //       location.href = '/listening'
      //     }, 500)
      //   })
      //   .fail(err => {
      //     throw err
      //   })
    },
    // 展示做题结果
    showScore(){
      // 错题列表
      const falseList = []
      // 用于计算分数score
      const totalLength = this.questions.length
      let falseLength = 0
      // 遍历题目正误
      this.questions.map((item, index) => {
        // 判断选中的选项是否正确
        item.isWrong = item.answer !== item.answerTemp
        // 如果题目错误，错题数加1
        item.isWrong ? falseLength++ : falseLength
        // 如果题目错误，错题列表添加相对应题目的索引
        item.isWrong ? falseList.push(index + 1) : falseLength
      })
      // 记录分数
      this.score = totalLength - falseLength
      // 正确率
      let percent = parseInt(((totalLength - falseLength) / totalLength) * 100)
      this.$message({
        showClose: true,
        message: `您对了：${this.score}题,正确率为：${percent}%,错题为：${falseList.join()}`
      })
    },
    // 新增用户做题记录
    addUserLearning(id){
      let history_answer = []
      this.questions.forEach(item => {
        history_answer.push(item.answerTemp)
      });
      this.$service
        .post("/web/userLearning",{
          listeningId:id,
          history_answer:JSON.stringify(history_answer)
        })
        .then(res => {
          if(res.code==0){
            this.showScore()
          }
        })
        .catch(err => {
          console.log(err);
        });
    }
  },
  beforeDestroy(){
    // 清除历史答案
    this.$store.commit('removeHistoryAnswer')
  }
}
</script>

<style lang='scss' scoped>
.listen-detail {
  min-width: 1300px;
  // padding-top: 54px;

  .listen-content {
    position: relative;
    width: 1200px;
    margin: 0 auto;
    padding: 20px 0;

    .header-title {
      font-size: 30px;
      line-height: 1.3;
      font-weight: 500;
      padding-bottom: 10px;
    }
    .header-info {
      display: flex;
      justify-content: flex-start;
      align-items: center;
      width: 500px;
      height: 24px;

      .date {
        margin-right: 6px;
        padding-right: 6px;
        border-right: 1px solid #999;
        font-size: 14px;
        color: #999;
        i{
          font-size: 14px;margin-right: 5px;
        }
      }
      .download {
        cursor: pointer;
        font-size: 16px;
        color: #999;
        &:hover{
          color: rgb(7, 7, 122);
        }
      }
    }
    .post-body {
      .resource {
        margin: 10px 0;
        width: 300px;
      }
      .news-question {
        width: 100%;
        .question-list {
          width: 100%;
          .question-item {
            width: 100%;
            .item-title {
              font-size: 18px;
              font-weight: 500;
              margin-bottom: 20px;
            }
            .item-options {
              width: 100%;
              display: flex;
              .options {
                display: flex;
                width: 25%;
                color: #666;
                label {
                  margin-left: 6px;
                  line-height: 1.5;
                }
              }
            }
          }
        }
        .btn-list {
          margin-top: 20px;
          display: flex;
          align-items: center;
          /deep/ .sub-btn {
            padding: 8px 16px;
          }
        }
        .detail-list {
          span {
            font-size: 12px;
            cursor: pointer;
          }
          margin-left: 5px;
        }
      }
      .answer-wrap {
        width: 100%;
        margin-top: 10px;
        h3 {
          font-size: 18px;
          font-weight: 500;
          line-height: 24px;
          margin-bottom: 10px;
        }
      }
    }
  }
}
.no-result {
  width: 100%;
  text-align: center;
  font-size: 18px;
}
.show {
  color: #f5862b;
}
.unshow {
  color:#f22424;
}
.header-info > .collection {
  margin-left: 20px;
  display: flex;
  align-items: center;
}
.header-info > .collection > i{
  font-size: 24px;
  cursor: pointer;
}
.header-info > .collection > i.dark{
  background: #000;
}
.header-info > .collection > i:hover{
  color: #409eff;
}

.back-to-prev-page {
  position: absolute;
  left: 500px;
  top: 30px;
  display: flex;
  align-items: center;
}
.back-to-prev-page > img {
  height: 15px;
}
.back-to-prev-page > span {
  color: rgba(175, 144, 92, 1);
  font-size: 15px;
  margin-left: 5px;
  cursor: pointer;
}
</style>
