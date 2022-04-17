<template>
  <div class="container" v-loading="loading">
    <div class="title">
      <span>修改视频课程</span> <span class="back" @click="back"> <i class="iconfont icon-fanhui"></i> 返回 </span>
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
            v-loading="loading"
            @submit.native.prevent
          >
            <el-form-item label="视频课程标题" prop="title">
              <el-input size="medium" v-model="form.title" placeholder="请填写视频课程名"></el-input>
            </el-form-item>
            <el-form-item label="作者" prop="author">
              <el-input disabled size="medium" v-model="form.author" placeholder="请填写作者"></el-input>
            </el-form-item>

            <el-col :span="12">
              <el-form-item label="封面" prop="image">
                <el-upload
                  class="avatar-uploader"
                  :action="uploadUrl"
                  :show-file-list="false"
                  :headers="uploadHeaders"
                  :before-upload="beforeImageUpload"
                  :http-request="uploadRequest"
                >
                  <img v-if="form.image" :src="form.image" class="avatar" />
                  <i v-else class="el-icon-plus avatar-uploader-icon"></i>
                </el-upload>
              </el-form-item>
            </el-col>
            <el-col :span="12">
              <el-form-item label="视频课程上传" prop="video_url">
                <el-upload
                  class="avatar-uploader"
                  :action="uploadUrl"
                  :show-file-list="true"
                  :file-list="videoArr"
                  :headers="uploadHeaders"
                  :http-request="uploadSource"
                  :before-remove="beforeRemove"
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
            <el-col :span="8">
              <el-form-item label="是否发布" prop="is_published">
                <el-switch v-model="form.is_published" :active-color="atColor" :inactive-color="inColor"> </el-switch>
              </el-form-item>
            </el-col>
            <el-col :span="8">
              <el-form-item label="是否开启评论" prop="is_comment_enabled">
                <el-switch v-model="form.is_comment_enabled" :active-color="atColor" :inactive-color="inColor">
                </el-switch>
              </el-form-item>
            </el-col>
            <el-col :span="8">
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
import videoCourse from '@/model/videoCourse'
import { getToken } from '@/lin/util/token.js'

export default {
  props: {
    rowObj: {
      type: Object,
    },
  },
  data() {
    const token = getToken('access_token')
    // const checkWords = (rule, value, callback) => {
    //   if (!value) {
    //     return callback(new Error('视频课程字数不能为空'))
    //   }
    //   value = parseInt(value)
    //   setTimeout(() => {
    //     if (!Number.isInteger(value)) {
    //       callback(new Error('请输入数字值'))
    //     } else {
    //       callback()
    //     }
    //   }, 1000)
    // }
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
      uploadUrl: `${process.env.VUE_APP_BASE_URL }cms/file`,
      categoryList: [],
      atColor: '#ff0000',
      inColor: '#999',
      loading: false,
      form: {
        title: '', //	是	string	视频课程标题
        description: '', //	是	string	视频课程描述
        image: '', //	否	string	视频课程封面图
        video_url: '', //	是	string	视频课程路径
        author: '内容管理员', //	是	string	视频课程作者
        published_time: '', //	是	string	发布日期，格式：2020-01-14
        categoryId: '', //	是	string	分类id
        is_published: 0, //	是	string	是否发布，0代表未发布，1代表已发布
        is_comment_enabled: 1, //	是	string	是否显示评论，1代表显示，0代表不显示
        is_top: 0, //	是	string	是否视频课程置顶，1代表置顶，0代表不置顶

      },
      rules: {
        title: [{ required: true, message: '请输入视频课程标题', trigger: 'blur' }],
        description: [{ required: true, message: '请输入视频课程描述', trigger: 'blur' }],
        image: [{ required: true, message: '请输入视频课程封面图', trigger: 'blur' }],
        video_url: [{ required: true, message: '请上传视频课程', trigger: 'blur' }],
        // author: [{ required: true, message: '请输入视频课程作者', trigger: 'blur' }],
        published_time: [{ required: true, message: '请选择日期', trigger: 'change' }],
        categoryId: [{ required: true, message: '请选择分类', trigger: 'change' }],
        is_published: [{ required: true, message: '请选择发布状态', trigger: 'change' }],
        is_comment_enabled: [{ required: true, message: '请选择评论状态', trigger: 'change' }],
        is_top: [{ required: true, message: '请选择置顶状态', trigger: 'change' }],
      },
      videoArr: []
    }
  },
  async mounted() {
    this.getCategory()
    delete this.rowObj.created_at
    this.form = this.rowObj
    this.form.is_top = Boolean(this.form.is_top)
    this.videoArr = []
    if (this.form.video_url) {
      this.videoArr.push({
        name: this.form.video_url,
        url: this.form.origin_video_url
      })
    }
  },
  methods: {
    // 清除视频上传记录
    beforeRemove() {
      this.form.origin_video_url = ''
      this.form.video_url = ''
    },
    // 上传视频前
    beforeSourceUpload(file) {
      this.form.video_url = ''
      this.form.origin_video_url = ''
      const isMP4 = file.type === 'video/mp4'
      const isLt30M = file.size / 1024 / 1024 < 30

      if (!isMP4) {
        setTimeout(() => {
          this.$message.error('上传视频只能是 MP4 格式!')
        }, 100)
      }
      if (!isLt30M) {
        setTimeout(() => {
          this.$message.error('上传视频大小不能超过 30MB!')
        }, 100)
      }
      return isMP4 && isLt30M
    },
    // 自定义视频上传方法
    uploadSource(req) {
      this.videoArr = []
      this.$axios({
        method: 'POST',
        url: '/cms/file',
        data: {
          file: req.file,
        },
      })
        .then(res => {
          this.$message.success('视频上传成功')
          this.form.video_url = res.url
          this.videoArr.push({
            name: res.url,
            url: res.path
          })
          this.form.origin_video_url = res.path
        })
    },
    beforeImageUpload(file) {
      const isIMG = file.type === 'image/jpeg' || file.type === 'image/png'
      const isLt5M = file.size / 1024 / 1024 < 5

      if (!isIMG) {
        setTimeout(() => {
          this.$message.error('上传头像图片只能是 JPG 或 PNG 格式!')
        }, 100)
      }
      if (!isLt5M) {
        setTimeout(() => {
          this.$message.error('上传头像图片大小不能超过 5MB!')
        }, 100)
      }
      return isIMG && isLt5M
    },
    // 自定义图片上传方法
    uploadRequest(req) {
      this.$axios({
        method: 'POST',
        url: '/cms/file',
        data: {
          file: req.file,
        },
      })
        .then(res => {
          this.form.image = res.url
          this.form.originImage = res.path
        })
    },
    // 获取分类列表
    getCategory() {
      this.$axios({
        method: 'get',
        url: '/v1/category/list'
      })
        .then(res => {
          res.data.forEach((item, index) => {
            this.categoryList.push(
              {
                value: item.id,
                label: item.category_name
              }
            )
          })
        })
    },
    async submitForm(formName) {
      this.$refs.form.validate(async v => {
        if (v) {
          try {
            this.loading = true
            this.form.image = this.form.originImage
            this.form.video_url = this.form.originVideoUrl
            this.form.is_top = Number(this.form.is_top)
            delete this.form.show_is_comment_enabled
            delete this.form.show_is_published
            delete this.form.show_is_top
            const res = await videoCourse.editVideoCourse(this.form.id, this.form)
            this.loading = false
            if (res.code < window.MAX_SUCCESS_CODE) {
              this.$message.success(`${res.message}`)
              this.resetForm(formName)
              this.back()
            }
          } catch (error) {
            this.loading = false
            this.$message.error('视频课程修改失败，请检测填写信息')
            console.log(error)
          }
        }
      })
    },

    // 重置表单
    resetForm(formName) {
      for (const k in this[formName]) {
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
