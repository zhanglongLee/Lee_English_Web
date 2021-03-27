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
                :on-success="handleAvatarSuccess"
                :headers="uploadHeaders"
                :before-upload="beforeAvatarUpload"
              >
                <img v-if="user.avatar" :src="user.avatar" class="avatar" />
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
import Croppa from 'vue-croppa'
import User from '@/lin/model/user'
import 'vue-croppa/dist/vue-croppa.css'
import defaultAvatar from '@/assets/image/user/user.png'
import uploadImage from '@/component/base/upload-image/index.vue'
import { getToken } from '@/lin/util/token.js'

Vue.use(Croppa)

const width = 150
const height = 150

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
      cropRule: {
        width,
        height,
      },
      imgRule: {
        minWidth: width,
        minHeight: height,
      },
      cropVisible: false,
      cropImg: '',
      croppa: {},
      imgInfo: null,
      quality: 1,
      defaultAvatar,
    }
  },
  computed: {
    ...mapGetters(['user']),
  },
  watch: {
    cropVisible(val) {
      if (!val) {
        this.$refs.croppa.remove()
        this.cropImg = ''
        this.imgInfo = null
      }
    },
  },
  created() {
    this.init()
  },
  methods: {
    ...mapActions(['loginOut', 'setUserAndState']),
    
    // 图片上传成功
    handleAvatarSuccess(res, file) {
      console.log(file)
      this.user.avatar = URL.createObjectURL(file.raw);
      this.$axios({
        method: 'put',
        url: '/cms/user',
        data: {
          avatar: file.response[0].path,
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
    },
    beforeAvatarUpload(file) {
      const isJPG = file.type === 'image/jpeg';
      const isLt2M = file.size / 1024 / 1024 < 2;

      if (!isJPG) {
        this.$message.error('上传头像图片只能是 JPG 格式!');
      }
      if (!isLt2M) {
        this.$message.error('上传头像图片大小不能超过 2MB!');
      }
      return isJPG && isLt2M;
    },
    fileChange(evt) {
      if (evt.target.files.length !== 1) {
        return
      }
      const imgFile = evt.target.files[0]
      // 验证文件大小是否符合要求, 不大于 5M
      if (imgFile.size > 1024 * 1024 * 5) {
        this.$message.error('文件过大超过5M')
        // 清空输入框
        this.clearFileInput(this.$refs.avatarInput)
        return
      }

      // 验证图像是否符合要求
      const imgSrc = window.URL.createObjectURL(imgFile)
      const image = new Image()
      image.src = imgSrc
      image.onload = () => {
        const w = image.width
        const h = image.height
        if (w < 50) {
          this.$message.error('图像宽度过小, 请选择大于50px的图像')
          // 清空输入框
          this.clearFileInput(this.$refs.avatarInput)
          return
        }
        if (h < 50) {
          this.$message.error('图像高度过小, 请选择大于50px的图像')
          // 清空输入框
          this.clearFileInput(this.$refs.avatarInput)
          return
        }
        // 验证通过, 打开裁剪框
        this.cropImg = imgSrc
        this.cropVisible = true
        if (this.$refs.croppa) {
          this.$refs.croppa.refresh()
        }
      }
      image.onerror = () => {
        this.$message.error('获取本地图片出现错误, 请重试')
        // 清空输入框
        this.clearFileInput(this.$refs.avatarInput)
      }
    },
    async handleCrop() {
      // 获取裁剪数据
      const blob = await this.$refs.croppa.promisedBlob('image/jpeg', 0.8)
      console.log(blob)
      // 构造为文件对象
      const file = new File([blob], 'avatar.jpg', {
        type: 'image/*',
      })
      // const file = new File([blobInfo.blob()], blobInfo.filename(), {
      //   type: 'image/*',
      // })
      console.log(file)
      return this.$axios({
        method: 'POST',
        url: '/cms/file',
        data: {
          file,
        },
      }).then(res => {
        // 清空输入框
        this.clearFileInput(this.$refs.avatarInput)
        if (!Array.isArray(res) || res.length !== 1) {
          this.$message.error('头像上传失败, 请重试')
          return false
        }
        // TODO: 错误码处理
        // if (res.code === 10110) {
        //   throw new Error('文件体积过大')
        // }
        return this.$axios({
          method: 'put',
          url: '/cms/user',
          data: {
            avatar: res[0].path,
          },
        })
          .then(putRes => {
            // eslint-disable-line
            if (putRes.code < window.MAX_SUCCESS_CODE) {
              this.$message({
                type: 'success',
                message: '更新头像成功',
              })
              this.cropVisible = false
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
    clearFileInput(ele) {
      // eslint-disable-next-line
      ele.value = ''
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
