<template>
  <div v-loading="loading" class="container">
    <div class="content">
      <div class="content-top">
        <div class="languages">
          {{ postData.from === "zh" ? "中文（简体）" : "英文" }}
        </div>
        <div class="transform">
          <img src="../assets/images/switch.png" @click="changeLang" />
        </div>
        <div class="languages">
          {{ postData.to === "zh" ? "中文（简体）" : "英文" }}
        </div>
        <button @click="doTranslate">翻译</button>
        <button @click="delTranslate">清除翻译</button>
      </div>
      <div class="main">
        <el-input
          v-model="postData.query"
          class="text-input"
          type="textarea"
          maxlength="50"
          :autosize="{ minRows: 6 }"
          placeholder="请输入内容"
        />
        <div class="result">{{ resultTxt }}</div>
        <div class="history">
          <div class="history-header">
            <div class="history-title">
              <i class="iconfont icon-lishijilu"></i><span>历史记录</span>
            </div>
            <i
              v-if="historyArr.length > 0"
              class="history-del iconfont icon-lajitong"
              @click="isDel = true"
            ></i>
          </div>
          <div v-if="historyArr.length > 0" class="history-content">
            <el-tag
              v-for="(item, index) in historyArr"
              :key="index"
              closable
              :disable-transitions="false"
              @click="postData.query=item"
              @close="delHistoryItem(index)"
            >
              {{ item }}
            </el-tag>
          </div>
          <div v-else class="history-content">
            暂无数据
          </div>
        </div>
      </div>
    </div>
    <el-dialog title="提示" :visible.sync="isDel" width="30%">
      <span>是否删除所有历史记录</span>
      <span slot="footer" class="dialog-footer">
        <el-button @click="dialogVisible = false">取 消</el-button>
        <el-button type="primary" @click="delHistoryAll">确 定</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
import { unique } from '../util/common'
export default {
  name: 'Translate',
  data() {
    return {
      resultTxt: '',
      loading: false,
      isDel: false,
      historyArr: [],
      postData: {
        appid: '20210104000662802',
        key: 'nUyr1hc3UjnG79onw7lz',
        salt: new Date().getTime(),
        query: '',
        from: 'zh',
        to: 'en',
        sign: ''
      }
    }
  },
  mounted() {
    this.historyArr = this.getHistoryArr()
  },
  methods: {
    // 清除翻译
    delTranslate() {
      this.postData.query = ''
      this.resultTxt = ''
    },
    /**
     * 调翻译接口
     * q	string	是	请求翻译 query	UTF-8 编码
     * from	string	是	翻译源语言	可设置为 auto
     * to	string	是	翻译目标语言	不可设置为 auto
     * appid	string	是	APP ID	可在 管理控制台 查看
     * salt	string	是	随机数
     * sign	string	是	签名	appid+q+salt+密钥 的MD5值
     */
    doTranslate() {
      // 清空翻译数据
      this.resultTxt = ''
      this.loading = true
      var params = {
        q: this.postData.query,
        appid: this.postData.appid,
        salt: this.postData.salt,
        from: this.postData.from,
        to: this.postData.to,
        sign: this.md5Data()
      }
      // 搜索记录存储到本地
      this.setHistoryItem(this.postData.query)
      // 动态设置api地址为/api proxyTable代理地址
      this.$store.state.api_url = '/api'
      this.$service({
        url:'',
        methods:'get',
        params:params
      })
        .then(res => {
          this.loading = false
          if(res.error_msg){
            console.log(res.error_msg)
            this.$message.error('翻译接口出错，请联系管理员')
            return
          }
          const len = res.trans_result.length
          for (var i = 0; i < len; i++) {
            this.resultTxt += res.trans_result[i].dst
          }
        })
        .catch(error => {
          this.loading = false
          this.$message.error('翻译接口出错，请联系管理员')
          console.log(error)
        })
    },
    // md5加密
    md5Data() {
      var str1 =
        this.postData.appid +
        this.postData.query +
        this.postData.salt +
        this.postData.key
      return this.md5(str1)
    },
    // 改变翻译方向
    changeLang() {
      const from = this.postData.from
      const to = this.postData.to
      this.postData.from = to
      this.postData.to = from
    },
    // 读取本地存储
    getHistoryArr() {
      const arr =
        JSON.parse(localStorage.getItem('English_study_web_history')) || []
      if (arr.length <= 0) {
        localStorage.setItem('English_study_web_history', '[]')
      }
      return arr
    },
    // 存放搜索记录到本地存储
    setHistoryItem(data) {
      var arr = JSON.parse(localStorage.getItem('English_study_web_history'))
      arr.push(data)
      // 去重
      arr = unique(arr)
      localStorage.setItem('English_study_web_history', JSON.stringify(arr))
    },
    // 更新本地存储
    setHistoryArr(obj) {
      localStorage.setItem('English_study_web_history', JSON.stringify(obj))
    },
    // 删除单个历史记录
    delHistoryItem(index) {
      this.historyArr.splice(index, 1)
      this.setHistoryArr(this.historyArr)
    },
    // 删除所有历史记录
    delHistoryAll() {
      this.isDel = false
      this.historyArr = []
      this.setHistoryArr(this.historyArr)
    },
    // 去重方法
    unique(arr) {
      return arr.filter((item, index, list) => {
        return list.indexOf(item) === index
      })
    }
  },
  destroyed(){
    this.$store.state.api_url = ''
  }
}
</script>

<style lang='scss' scoped>
.container {
  width: 100%;
  // margin-top: 54px;
  background: #f9f9f9;

  .content {
    width: 1200px;
    min-height: 600px;
    margin: 0 auto;
    padding: 20px 0;

    .content-top {
      width: 650px;
      margin: 0 auto;
      display: flex;
      justify-content: space-around;
      .languages {
        width: 140px;
        text-align: center;
        font-size: 14px;
        padding: 4px 0px;
        border-radius: 4px;
        background: #fff;
        border: 1px solid #999;
      }

      .transform {
        width: 50px;
        text-align: center;
        cursor: pointer;

        img {
          width: 25px;
        }
      }

      button {
        padding: 4px 40px;
        border-radius: 4px;
        border: none;
        background: #4395ff;
        font-size: 14px;
        color: #fff;
        cursor: pointer;
      }

      button:hover {
        background: rgb(52, 133, 251);
      }
    }

    .main {
      display: flex;
      flex-wrap: wrap;
      width: 100%;
      margin-top: 20px;

      .text-input {
        width: 50%;
        min-height: 140px;
        background: #fff;

        textarea {
          width: 100%;
          font-size: 18px;
          border: none;
        }
      }

      .result {
        width: 50%;
        min-height: 140px;
        line-height: 22px;
        padding: 10px;
        border: 1px solid #eee;
        border-left: 0;
        color: #333;
        background: #f0f0f0;
      }

      .history {
        width: 50%;
        min-height: 200px;
        padding: 20px;
        margin-top: 10px;
        border: 1px solid #dcdfe6;
        border-radius: 4px;
        background: #f0f0f0;

        .history-header {
          display: flex;
          align-items: center;
          justify-content: space-between;
          .history-title {
            color: #333;
            i {
              font-size: 20px;
            }
            span {
              font-size: 16px;
            }
          }

          .history-del {
            cursor: pointer;
            font-size: 20px;
            &:hover {
              color: #4395ff;
            }
          }
        }

        .history-content {
          margin-top: 10px;

          & >>> .el-tag {
            margin-right: 10px;
            margin-bottom: 5px;
            max-width: 550px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            cursor: pointer;
          }
        }
      }
    }
  }
}
</style>
