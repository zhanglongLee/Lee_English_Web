<template>
  <div class="container" v-loading="loading">
    <div class="title">
      <span>修改听力练习</span> <span class="back" @click="back"> <i class="iconfont icon-fanhui"></i> 返回 </span>
    </div>
    <el-divider></el-divider>
    <div class="wrap">
      <el-row>
        <el-form
          :model="form"
          :rules="rules"
          status-icon
          ref="form"
          label-width="120px"
          v-loading="loading"
          @submit.native.prevent
        >
          <el-form-item label="听力标题" prop="title">
            <el-input size="medium" v-model="form.title" placeholder="请填写听力标题"></el-input>
          </el-form-item>
          
          <el-row>
            <el-col :span="12">
              <el-form-item label="封面" prop="image">
                <!-- <el-upload
                  class="avatar-uploader"
                  :action="uploadUrl"
                  :show-file-list="false"
                  :headers="uploadHeaders"
                  :http-request="uploadImage"
                  :before-upload="beforeImageUpload"
                >
                  <img v-if="form.image" :src="form.image" class="avatar" />
                  <i v-else class="el-icon-plus avatar-uploader-icon"></i>
                </el-upload> -->
                <uploadImage :httpRequest="fUploadImage" :beforeUpload="beforeImageUpload">
                  <img v-if="form.image" :src="form.image" class="avatar" />
                  <i v-else class="el-icon-plus avatar-uploader-icon"></i>
                </uploadImage>
              </el-form-item>
            </el-col>
            <el-col :span="12">
              <el-form-item label="听力录音上传" prop="source">
                <el-upload
                  class="avatar-uploader"
                  :action="uploadUrl"
                  :show-file-list="true"
                  :headers="uploadHeaders"
                  :http-request="uploadSource"
                  :before-upload="beforeSourceUpload"
                >
                  <i class="el-icon-plus avatar-uploader-icon"></i>
                </el-upload>
              </el-form-item>
            </el-col>
            <el-col :span="12">
              <el-form-item label="分类" prop="categoryId">
                <el-select v-model="form.categoryId" placeholder="请选择">
                  <el-option v-for="item in categoryList" :key="item.value" :label="item.label" :value="item.value">
                  </el-option>
                </el-select>
              </el-form-item>
            </el-col>
            <el-col :span="12">
              <el-form-item label="是否发布" prop="is_published">
                <el-switch v-model="form.is_published" :active-color="atColor" :inactive-color="inColor"> </el-switch>
              </el-form-item>
            </el-col>
            <el-col :span="12">
              <el-form-item label="描述" prop="description">
                <el-input size="medium" v-model="form.description" placeholder="请填写听力描述"></el-input>
              </el-form-item>
            </el-col>
          </el-row>

          <el-card class="box-card" v-for="( item , index ) in questionsList" :key="index">
            <div slot="header" class="clearfix">
              <span>第{{ index+1 }}题听力练习题目及答案</span>
              <el-button @click="addQuestionsList" style="float: right; padding: 3px 0; margin-left:30px;" type="text">添加</el-button>
              <el-button v-if="questionsList.length>1" @click="questionsList.splice(index,1)" style="float: right; padding: 3px 0" type="text">删除最后一题</el-button>
            </div>
            <el-col :span="11">
              <el-input size="medium" v-model="item.title" placeholder="请填写该题的题目"></el-input>
            </el-col>
            <el-col :span="11" :offset="2">
              <el-input size="medium" v-model="item.answer" placeholder="请填写该题的答案"></el-input>
            </el-col>
            <el-col :span="11">
              <el-input size="medium" v-model="item.op1" placeholder="请填写第一个选项"></el-input>
            </el-col>
          
            <el-col :span="11" :offset="2">
              <el-input size="medium" v-model="item.op2" placeholder="请填写第二个选项"></el-input>
            </el-col>

            <el-col :span="11">
              <el-input size="medium" v-model="item.op3" placeholder="请填写第三个选项"></el-input>
            </el-col>
            <el-col :span="11" :offset="2">
              <el-input size="medium" v-model="item.op4" placeholder="请填写第四个选项"></el-input>
            </el-col>
          </el-card>

          
          <vue-tinymce v-model="form.answer_analysis" :setting="setting" />

          <el-col :span="24">
            <el-form-item class="submit">
              <el-button type="primary" @click="submitForm('form')">保 存</el-button>
              <el-button @click="resetForm('form')">重 置</el-button>
            </el-form-item>
          </el-col>
        </el-form>
      </el-row>
    </div>
  </div>
</template>

<script>
import listening from '@/model/listening'
import { getToken } from '@/lin/util/token.js'
import uploadImage from '@/component/base/upload-image'

export default {
  props: {
    rowObj: {
      type: Object,
    },
  },
  components:{uploadImage},
  data() {
    var checkWords = (rule, value, callback) => {
      if (!value) {
        return callback(new Error('文章字数不能为空'))
      }
      value = parseInt(value)
      setTimeout(() => {
        if (!Number.isInteger(value)) {
          callback(new Error('请输入数字值'))
        } else {
          callback()
        }
      }, 1000)
    }
    const token = getToken('access_token')
    return {
      setting: {
        menubar: false,
        toolbar: [
          'searchreplace bold italic underline strikethrough alignleft aligncenter alignright outdent indent  blockquote undo redo removeformat subscript superscript code codesample',
          'hr bullist numlist link image charmap preview anchor pagebreak insertdatetime media table emoticons forecolor backcolor fullscreen',
        ],
        toolbar_drawer: 'sliding',
        quickbars_selection_toolbar:
          'removeformat | bold italic underline strikethrough | fontsizeselect forecolor backcolor',
        plugins: [
          'advlist anchor autolink autosave code codesample colorpicker colorpicker contextmenu directionality emoticons fullscreen hr image imagetools insertdatetime link lists media nonbreaking noneditable pagebreak paste preview print save searchreplace spellchecker tabfocus table template textcolor textpattern visualblocks visualchars wordcount',
        ],
        // language: 'zh_CN', //本地化设置
        height: 350,
      },
      
      uploadHeaders: {
        Authorization: token,
      },
      questionsList:[
        {
          title:'',
          op1:'',
          op2:'',
          op3:'',
          op4:'',
          answer:'',
        }
      ],
      uploadUrl: process.env.VUE_APP_BASE_URL + 'cms/file',
      categoryList: [],
      atColor: '#ff0000',
      inColor: '#999',
      loading: false,
      form: {
        title: '', //	是	string	文章标题
        image: '', //	否	string	文章封面图
        categoryId: '', //	是	string	分类id
        is_published: 0, //	是	string	是否发布，0代表未发布，1代表已发布
        source:'',//	是	string	MP3音频地址
        description:'',// 是 string 描述
      },
      rules: {
        title: [{ required: true, message: '请输入文章标题', trigger: 'blur' }],
        image: [{ required: false, message: '请输入文章封面图', trigger: 'blur' }],
        source: [{ required: true, message: '请上传音频', trigger: 'blur' }],
        categoryId: [{ required: true, message: '请选择分类', trigger: 'change' }],
        is_published: [{ required: true, message: '请选择发布状态', trigger: 'change' }],
      },
    }
  },
  async mounted() {
    this.getCategory();
    delete this.rowObj.created_at
    console.log(this.rowObj)
    this.rowObj.questions = JSON.parse(this.rowObj.questions)
    this.questionsList = this.rowObj.questions
    this.form = this.rowObj
    
  },
  methods: {

    // 获取分类列表
    getCategory(){
      this.$axios({
        method: 'get',
        url: '/v1/category'
      })
      .then(res=>{
        res.data.forEach((item,index)=>{
          this.categoryList.push(
            {
              value:item.id,
              label:item.category_name
            }
          )
        })
      })
    },
    async submitForm(formName) {
      this.$refs.form.validate(async v => {
        if(!this.checkListEmpty()){
          this.$message.error('请填写完整题听力练习题目及答案')
          return
        }
        this.form.questions = JSON.stringify(this.questionsList)
        if (v) {
          console.log(this.form)
          try {
            this.loading = true
            this.form.image = this.form.originImage
            this.form.source = this.form.originSource
            const res = await listening.editListening(this.form.id, this.form)
            this.loading = false
            if (res.code < window.MAX_SUCCESS_CODE) {
              this.$message.success(`${res.message}`)
              this.resetForm(formName)
              this.back()
            }
          } catch (error) {
            this.loading = false
            this.$message.error('听力练习添加修改失败，请检测填写信息')
            console.log(error)
          }
        }
      })
    },
    // 重置表单
    resetForm(formName) {
      for(var k in this[formName]){
        this[formName][k] = null
      }
    },
    back() {
      this.$emit('editClose')
    },
    // 添加列表
    addQuestionsList(){
      this.questionsList.push({
        title:'',
        op1:'',
        op2:'',
        op3:'',
        op4:'',
        answer:'',
      })
    },
    // 音频上传之前
    beforeSourceUpload(file) {
      // const isAudio = file.type === 'audio/mpeg';
      // const isLt2M = file.size / 1024 / 1024 < 5;

      // if (!isAudio) {
      //   setTimeout(()=>{
      //     this.$message.error('只能上传音频格式文件');
      //   },100)
      // }
      // if (!isLt2M) {
      //   setTimeout(()=>{
      //     this.$message.error('上传图片大小不能超过 5MB!');
      //   },100)
      // }
      // return isAudio && isLt2M;
    },
    // 图片上传之前
    beforeImageUpload(file) {
      const isImage = file.type === 'image/jpeg' || file.type === 'image/png';
      const isLt2M = file.size / 1024 / 1024 < 2;

      if (!isImage) {
        setTimeout(()=>{
          this.$message.error('上传图片只能是 JPG 或 PNG 格式!');
        },100)
      }
      if (!isLt2M) {
        setTimeout(()=>{
          this.$message.error('上传图片大小不能超过 2MB!');
        },100)
      }
      return isImage && isLt2M;
    },
    // 自定义图片上传方法
    fUploadImage(req) {
      this.$axios({
        method: 'POST',
        url: '/cms/file',
        data: {
          file: req.file,
        },
      })
      .then(res=>{
        this.$message.success('音频上传成功')
        this.form.image = res.url
        this.form.originImage = res.path
      })
    },
    // 自定义音频上传方法
    uploadSource(req) {
      this.$axios({
        method: 'POST',
        url: '/cms/file',
        data: {
          file: req.file,
        },
      })
      .then(res=>{
        this.$message.success('音频上传成功')
        this.form.source = res.path
      })
    },
    
    // 检查问题列表是否为空
    checkListEmpty(){
      let flag = false
      this.questionsList.forEach(item=>{
        for(var k in item){
          if(!item[k]){
            flag = false
          }else{
            flag = true
          }
        }
      })
      return flag
    },
    
  },
}
</script>

<style lang="scss" scoped>
.el-divider--horizontal {
  margin: 0;
}

.container {
  .title {
    height: 59px;
    line-height: 59px;
    color: $parent-title-color;
    font-size: 16px;
    font-weight: 500;
    text-indent: 40px;

    .back {
      float: right;
      margin-right: 40px;
      cursor: pointer;
    }
  }

  .wrap {
    padding: 20px;
    
    .box-card{
      margin-bottom: 10px;

      /deep/ .el-input{
        margin-bottom: 10px;
      }
    }
  }

  .submit {
    float: left;
  }
}

.avatar-uploader /deep/ .el-upload {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}
.avatar-uploader /deep/ .el-upload:hover {
  border-color: #409eff;
}
.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 178px;
  height: 178px;
  line-height: 178px;
  text-align: center;
}
.avatar {
  width: 178px;
  height: 178px;
  display: block;
}
</style>
