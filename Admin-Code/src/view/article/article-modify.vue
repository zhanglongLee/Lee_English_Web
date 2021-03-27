<template>
  <div class="container" v-loading="loading">
    <div class="title">
      <span>修改图书</span> <span class="back" @click="back"> <i class="iconfont icon-fanhui"></i> 返回 </span>
    </div>
    <el-divider></el-divider>
    <div class="wrap">
      <el-row>
        <el-col :span="24">
          <el-form
            :model="form"
            :rules="rules"
            status-icon
            ref="form"
            label-width="120px"
            @submit.native.prevent
          >
            <el-form-item label="文章标题" prop="title">
              <el-input size="medium" v-model="form.title" placeholder="请填写书名"></el-input>
            </el-form-item>
            <el-form-item label="作者" prop="author">
              <el-input size="medium" v-model="form.author" placeholder="请填写作者"></el-input>
            </el-form-item>

            <el-col :span="8">
              <el-form-item label="封面" prop="image">
                <el-upload
                  class="avatar-uploader"
                  :action="uploadUrl"
                  :show-file-list="false"
                  :headers="uploadHeaders"
                  :http-request="uploadRequest"
                >
                  <img v-if="form.image" :src="form.image" class="avatar" />
                  <i v-else class="el-icon-plus avatar-uploader-icon"></i>
                </el-upload>
              </el-form-item>
            </el-col>
            <el-col :span="8">
              <el-form-item label="分类" prop="categoryId">
                <el-select v-model="form.categoryId" placeholder="请选择">
                  <el-option v-for="item in categoryList" :key="item.value" :label="item.label" :value="item.value">
                  </el-option>
                </el-select>
              </el-form-item>
            </el-col>
            <el-col :span="8">
              <el-form-item label="发布日期" prop="published_time">
                <el-date-picker
                  v-model="form.published_time"
                  type="datetime"
                  value-format="yyyy-MM-dd HH:mm:ss"
                  placeholder="选择日期时间"
                >
                </el-date-picker>
              </el-form-item>
            </el-col>
            <el-col :span="24">
              <el-form-item label="简介" prop="description">
                <el-input size="medium" type="textarea" :rows="4" placeholder="请输入简介" v-model="form.description">
                </el-input>
              </el-form-item>
            </el-col>
            <el-col :span="24">
              <el-form-item label="内容" prop="content">
                <vue-tinymce v-model="form.content" :setting="setting" />
              </el-form-item>
            </el-col>
            <el-col :span="12">
              <el-form-item label="文章字数" prop="words">
                <el-input type="number" size="medium" v-model="form.words" placeholder="请填写文章字数"></el-input>
              </el-form-item>
            </el-col>
            <el-col :span="12">
              <el-form-item label="是否发布" prop="is_published">
                <el-switch v-model="form.is_published" :active-color="atColor" :inactive-color="inColor"> </el-switch>
              </el-form-item>
            </el-col>
            <el-col :span="12">
              <el-form-item label="是否开启评论" prop="is_comment_enabled">
                <el-switch v-model="form.is_comment_enabled" :active-color="atColor" :inactive-color="inColor">
                </el-switch>
              </el-form-item>
            </el-col>
            <el-col :span="12">
              <el-form-item label="是否置顶" prop="is_top">
                <el-switch v-model="form.is_top" :active-color="atColor" :inactive-color="inColor"> </el-switch>
              </el-form-item>
            </el-col>

            <el-form-item class="submit">
              <el-button type="primary" @click="submitForm('form')">保 存</el-button>
              <el-button @click="resetForm('form')">重 置</el-button>
            </el-form-item>
          </el-form>
        </el-col>
      </el-row>
    </div>
  </div>
</template>

<script>
import article from '@/model/article'
import { getToken } from '@/lin/util/token.js'

export default {
  props: {
    rowObj: {
      type: Object,
    },
  },
  data() {
    const token = getToken('access_token')
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
      uploadUrl: process.env.VUE_APP_BASE_URL + 'cms/file',
      categoryList: [],
      atColor: '#ff0000',
      inColor: '#999',
      loading: false,
      form: {
        title: '', //	是	string	文章标题
        description: '', //	是	string	文章描述
        image: '', //	否	string	文章封面图
        content: '', //	是	string	文章内容
        author: '', //	是	string	文章作者
        published_time: '', //	是	string	发布日期，格式：2020-01-14
        categoryId: '', //	是	string	分类id
        is_published: 0, //	是	string	是否发布，0代表未发布，1代表已发布
        is_comment_enabled: 1, //	是	string	是否显示评论，1代表显示，0代表不显示
        is_top: 0, //	是	string	是否文章置顶，1代表置顶，0代表不置顶
      },
      rules: {
        title: [{ required: true, message: '请输入文章标题', trigger: 'blur' }],
        description: [{ required: true, message: '请输入文章描述', trigger: 'blur' }],
        image: [{ required: true, message: '请输入文章封面图', trigger: 'blur' }],
        content: [{ required: true, message: '请输入文章内容', trigger: 'blur' }],
        author: [{ required: true, message: '请输入文章作者', trigger: 'blur' }],
        published_time: [{ required: true, message: '请选择日期', trigger: 'change' }],
        categoryId: [{ required: true, message: '请选择分类', trigger: 'change' }],
        is_published: [{ required: true, message: '请选择发布状态', trigger: 'change' }],
        is_comment_enabled: [{ required: true, message: '请选择评论状态', trigger: 'change' }],
        is_top: [{ required: true, message: '请选择置顶状态', trigger: 'change' }],
        words: [{ validator: checkWords, trigger: 'blur' }],
      },
    }
  },
  async mounted() {
    this.getCategory();
    delete this.rowObj.created_at
    this.form = this.rowObj
    
  },
  methods: {
    // 自定义图片上传方法
    uploadRequest(req) {
      this.$axios({
        method: 'POST',
        url: '/cms/file',
        data: {
          file: req.file,
        },
      })
      .then(res=>{
        this.form.image = res.url
        this.form.originImage = res.path
      })
    },
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
      this.loading = true
      this.$refs.form.validate(async v=>{
        if(v){
          try {
            this.form.image = this.form.originImage
            const res = await article.editArticle(this.form.id, this.form)
            this.loading = false
            if (res.code < window.MAX_SUCCESS_CODE) {
              this.$message.success(`${res.message}`)
              this.resetForm(formName)
              this.back()
            }
          } catch (error) {
            this.loading = false
            this.$message.error('文章修改失败，请检测填写信息')
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
