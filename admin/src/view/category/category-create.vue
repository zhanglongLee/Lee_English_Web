<template>
  <div class="container">
    <div class="title">新建分类</div>
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
  data() {
    return {
      form: {
        category_name: '',
      },
      loading: false,
    }
  },
  methods: {
    async submitForm(formName) {
      try {
        this.loading = true
        const res = await category.createCategory(this.form)
        this.loading = false
        if (res.code < window.MAX_SUCCESS_CODE) {
          this.$message.success(`${res.message}`)
          this.resetForm('form')
          this.$router.push({path:"/category/list"})
        }
      } catch (error) {
        this.loading = false
        this.$message.error('分类添加失败，请检测填写信息')
        console.log(error)
      }
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
</style>
