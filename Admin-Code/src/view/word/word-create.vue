<template>
  <div class="container">
    <div class="title">新建单词</div>
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
            <el-form-item label="单词名称" prop="word_name">
              <el-input size="medium" v-model="form.word_name" placeholder="请填写单词名称"></el-input>
            </el-form-item>
            <el-form-item label="单词解释" prop="translate">
              <el-input size="medium" v-model="form.translate" placeholder="请填写单词解释"></el-input>
            </el-form-item>
            <el-form-item label="单词音标" prop="pronunciation">
              <el-input size="medium" v-model="form.pronunciation" placeholder="请填写单词音标"></el-input>
            </el-form-item>
            <el-col :span="8">
              <el-form-item label="分类" prop="categoryId">
                <el-select v-model="form.categoryId" placeholder="请选择">
                  <el-option v-for="item in categoryList" :key="item.value" :label="item.label" :value="item.value">
                  </el-option>
                </el-select>
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
import word from '@/model/word'
import { getToken } from '@/lin/util/token.js'

export default {
  components: {
  },
  data() {
    const token = getToken('access_token')
    return {
      categoryList: [],
      loading: false,
      form: {
        word_name: '', //	是	string	文章标题
        pronunciation: '', //	是	string	单词发音
        translate: '', //	是	string	单词解释
        categoryId: '', //	是	string	分类id
      },
      rules: {
        word_name: [{ required: true, message: '请输入单词名称', trigger: 'blur' }],
        pronunciation: [{ required: true, message: '请输入文章发音', trigger: 'blur' }],
        translate: [{ required: true, message: '请输入单词解释', trigger: 'blur' }],
        categoryId: [{ required: true, message: '请选择分类', trigger: 'change' }],
      },
    }
  },
  mounted() {
    this.getCategory()
  },
  methods: {
    
    // 获取分类列表
    getCategory() {
      this.$axios({
        method: 'get',
        url: '/v1/category/list',
      }).then(res => {
        res.data.forEach((item, index) => {
          this.categoryList.push({
            value: item.id,
            label: item.category_name,
          })
        })
      })
    },
    submitForm() {
      console.log(this.form)
      // this.form.pronunciation = this.form.pronunciation.charCodeAt()
      // this.form.translate = this.form.translate.charCodeAt()
      this.$refs.form.validate(async v => {
        if (v) {
          try {
            this.loading = true
            const res = await word.createWord(this.form)
            this.loading = false
            if (res.code < window.MAX_SUCCESS_CODE) {
              this.$message.success(`${res.message}`)
              this.resetForm('form')
              this.$router.push({path:"/word/list"})
            }
          } catch (error) {
            this.loading = false
            this.$message.error('单词添加失败，请检测填写信息')
            console.log(error)
          }
        }
      })
    },
    // 重置表单
    resetForm(formName) {
      this.$refs[formName].resetFields()
    },
  },
}
</script>

<style lang="scss" scoped>
.container {
  .title {
    height: 59px;
    line-height: 59px;
    color: $parent-title-color;
    font-size: 16px;
    font-weight: 500;
    text-indent: 40px;
    border-bottom: 1px solid #dae1ec;
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
