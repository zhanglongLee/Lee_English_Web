<template>
  <div class="container">
    <div class="title">个人中心</div>
    <div class="wrap">
      <el-row>
        <el-col :lg="16" :md="20" :sm="24" :xs="24">
          <div class="user">
            <div class="title">用户信息</div>
            <div class="content">
              <div class="name-wrapper">
                <div class="label">昵称</div>
                <div class="name">
                  <el-input
                    placeholder="请输入内容"
                    size="small"
                    v-model="nickname"
                    suffix-icon="el-icon-edit"
                    ref="input"
                    @blur="blur"
                  ></el-input>
                </div>
              </div>
              <div class="title">用户头像</div>
              <el-upload
                class="avatar-uploader"
                :action="uploadUrl"
                :show-file-list="false"
                :headers="uploadHeaders"
                :http-request="uploadRequest"
              >
                <img v-if="imgUrl" :src="imgUrl" class="avatar" />
                <i v-else class="el-icon-plus avatar-uploader-icon"></i>
              </el-upload>
            </div>
          </div>
          <div class="password">
            <div class="title">修改密码</div>
            <el-form
              :model="form"
              status-icon
              :rules="rules"
              label-position="left"
              ref="form"
              label-width="90px"
              @submit.native.prevent
            >
              <el-form-item label="原始密码" prop="old_password">
                <el-input type="password" v-model="form.old_password" autocomplete="off"></el-input>
              </el-form-item>
              <el-form-item label="新密码" prop="new_password">
                <el-input type="password" v-model="form.new_password" autocomplete="off"></el-input>
              </el-form-item>
              <el-form-item label="确认密码" prop="confirm_password" label-position="top">
                <el-input type="password" v-model="form.confirm_password" autocomplete="off"></el-input>
              </el-form-item>
              <el-form-item>
                <el-button type="primary" @click="submitForm('form')">保存</el-button>
                <el-button @click="resetForm('form')">重置</el-button>
              </el-form-item>
            </el-form>
          </div>
        </el-col>
      </el-row>
    </div>
    <!-- 修改头像 -->
  </div>
</template>

<script>
import { mapActions, mapGetters } from 'vuex'
import Vue from 'vue'
import User from '@/lin/model/user'
import defaultAvatar from '@/assets/image/user/user.png'
import uploadImage from '@/component/base/upload-image/index.vue'
import { getToken } from '@/lin/util/token.js'

export default {
  name: 'center',
  components: {
    uploadImage,
  },
  data() {
    const token = getToken('access_token')
    const oldPassword = (rule, value, callback) => {
      // eslint-disable-line
      if (!value) {
        return callback(new Error('原始密码不能为空'))
      }
      if (value.length < 6) {
        callback(new Error('密码长度不能少于6位数'))
      }
      callback()
    }
    const validatePassword = (rule, value, callback) => {
      if (value === '') {
        callback(new Error('请输入密码'))
      } else if (value.length < 6) {
        callback(new Error('密码长度不能少于6位数'))
      } else {
        if (this.form.checkPassword !== '') {
          this.$refs.form.validateField('confirm_password')
        }
        callback()
      }
    }
    const validatePassword2 = (rule, value, callback) => {
      if (value === '') {
        callback(new Error('请再次输入密码'))
      } else if (value !== this.form.new_password) {
        callback(new Error('两次输入密码不一致!'))
      } else {
        callback()
      }
    }
    return {
      uploadHeaders: {
        Authorization: token,
      },
      uploadUrl: process.env.VUE_APP_BASE_URL + 'cms/file',
      username: null,
      nickname: null,
      imgUrl:null,
      form: {
        old_password: '',
        new_password: '',
        confirm_password: '',
      },
      rules: {
        old_password: [{ validator: oldPassword, trigger: 'blur', required: true }],
        new_password: [{ validator: validatePassword, trigger: 'blur', required: true }],
        confirm_password: [{ validator: validatePassword2, trigger: 'blur', required: true }],
      },
      defaultAvatar,
    }
  },
  computed: {
    ...mapGetters(['user']),
  },
  watch:{
    user(newD){
      this.imgUrl = newD.avatar
    }
  },
  created() {
    this.init()
    this.imgUrl = this.user.avatar
  },
  methods: {
    ...mapActions(['loginOut', 'setUserAndState']),
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
        this.imgUrl = res.url
        this.$axios({
        method: 'put',
        url: '/cms/user',
        data: {
          avatar: res.path,
        },
      })
        .then(putRes => {
          // eslint-disable-line
          if (putRes.code < window.MAX_SUCCESS_CODE) {
            this.$message({
              type: 'success',
              message: '更新头像成功',
            })
            // 触发重新获取用户信息
            return User.getInformation()
          }
          return Promise.reject(new Error('更新头像失败'))
        })
        .then(infoRes => {
          // eslint-disable-line
          // 尝试获取当前用户信息
          const user = infoRes
          this.setUserAndState(user)
        })
      })
    },
    async blur() {
      if (this.nickname) {
        const { user } = this.$store.state
        if (this.nickname !== user.nickname && this.nickname !== '佚名') {
          this.$axios({
            method: 'put',
            url: '/cms/user',
            data: {
              nickname: this.nickname,
            },
            showBackend: true,
          })
            .then(res => {
              if (res.code < window.MAX_SUCCESS_CODE) {
                this.$message({
                  type: 'success',
                  message: '更新昵称成功',
                })
                // 触发重新获取用户信息
                return User.getInformation()
              }
            })
            .then(res => {
              // eslint-disable-line
              this.setUserAndState(res)
              this.nickname = res.nickname
            })
        }
      }
      this.nicknameChanged = false
    },
    init() {
      const { user } = this.$store.state
      this.nickname = user && user.nickname ? user.nickname : '佚名'
    },
    goToCenter() {
      this.$router.push('/center')
    },
    submitForm(formName) {
      if (this.form.old_password === '' && this.form.new_password === '' && this.form.confirm_password === '') {
        this.dialogFormVisible = false
        return
      }
      if (this.form.old_password === this.form.new_password) {
        this.$message.error('新密码不能与原始密码一样')
        return
      }
      this.$refs[formName].validate(async valid => {
        // eslint-disable-line
        if (valid) {
          const res = await User.updatePassword(this.form)
          if (res.code < window.MAX_SUCCESS_CODE) {
            this.$message.success(`${res.message}`)
            this.resetForm(formName)
            this.dialogFormVisible = false
            setTimeout(() => {
              this.loginOut()
              const { origin } = window.location
              window.location.href = origin
            }, 1000)
          }
        } else {
          console.log('error submit!!')
          this.$message.error('请填写正确的信息')
          return false
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
    max-width: 800px;
    .user {
      padding: 0px 20px 25px 30px;
      z-index: 100;
      position: relative;
      border-bottom: 1px solid #dae1ec;
      .title {
        font-weight: bold;
        font-size: 16px;
        color: #3a3a3a;
        text-indent: 0px;
        border: none;
      }
      .content {
        display: flex;
        flex-direction: column;
        .name-wrapper {
          display: flex;
          align-items: center;
          .label {
            margin-right: 20px;
            color: #333;
            font-weight: bold;
            font-size: 14px;
          }
          .name {
            font-weight: 500;
          }
        }
        .avatar {
          width: 80px;
          height: 80px;
          border-radius: 50%;
          cursor: pointer;
          overflow: hidden;
          position: relative;

          .image-upload {
            position: absolute;
            z-index: 9999;
            // 隐藏文件上传样式
            /deep/ .upload-item > div,
            /deep/ .upload-item > i {
              display: none;
            }
          }
          .mask {
            opacity: 0;
            transition: all 0.2s;
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.3);
            display: flex;
            justify-content: center;
            align-items: center;
            cursor: pointer;
            color: white;

            input {
              display: none;
            }
          }

          &:hover {
            .mask {
              opacity: 1;
            }
          }
        }

        .text {
          margin-left: 20px;
          color: #fff;
          display: flex;
          flex-direction: column;
          justify-content: center;

          .username {
            margin-bottom: 10px;
            font-size: 16px;
            cursor: pointer;
          }

          .desc {
            font-size: 14px;
            color: rgba(222, 226, 230, 1);
          }
        }

        .info {
          position: absolute;
          bottom: 10px;
          right: 10px;
          display: flex;
          color: #fff;
          font-size: 14px;
          height: 20px;
          line-height: 20px;

          .mid {
            padding: 0 5px;
          }
        }
      }
    }
    .password {
      padding: 25px 20px 25px 30px;
      .title {
        color: #3a3a3a;
        font-weight: bold;
        font-size: 16px;
        text-indent: 0px;
        margin-bottom: 20px;
        border: none;
      }
    }
  }
}

.avatar-uploader .el-upload {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}
.avatar-uploader .el-upload:hover {
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
