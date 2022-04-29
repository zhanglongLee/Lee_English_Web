<template>
  <div class="container">
    <div class="title">
      <span>修改图书</span> <span class="back" @click="back"> <i class="iconfont icon-fanhui"></i> 返回 </span>
    </div>
    <el-divider></el-divider>
    <div class="wrap">
      <el-row>
        <el-col :lg="16" :md="20" :sm="24" :xs="24">
          <el-form :model="form" status-icon ref="form" label-width="100px" @submit.native.prevent>
            <el-form-item label="分类名" prop="title">
              <el-input size="medium" v-model="form.category_name" placeholder="请填写分类名"></el-input>
            </el-form-item>
            <el-form-item class="submit">
              <el-button type="primary" @click="submitForm('form')" :loading="loading">保 存</el-button>
              <el-button @click="resetForm('form')">重 置</el-button>
            </el-form-item>
          </el-form>
        </el-col>
      </el-row>
    </div>
  </div>
</template>

<script>
import category from '@/model/category'

export default {
  props: {
    rowObj: {
      type: Object,
    },
  },
  data() {
    return {
      loading: false,
      form: {
        category_name:''
      },
    }
  },
  async mounted() {
    delete this.rowObj.created_at
    this.form = this.rowObj
  },
  methods: {
    async submitForm(formName) {
      this.loading = true
      this.$refs.form.validate(async v=>{
        if(v){
          try {
            const res = await category.editCategory(this.form.id, this.form)
            this.loading = false
            if (res.code < window.MAX_SUCCESS_CODE) {
              this.$message.success(`${res.message}`)
              this.resetForm(formName)
              this.back()
            }
          } catch (error) {
            this.loading = false
            this.$message.error('分类修改失败，请检测填写信息')
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
</style>
