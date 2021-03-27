<template>
  <div class="login-modal-container">
    <div class="login-form">
      <div class="panfish">
        <img
          v-show="currentFocus === ''"
          src="https://b-gold-cdn.xitu.io/v3/static/img/normal.0447fe9.png"
          class="normal"
        />
        <img
          v-show="currentFocus === 'phoneNumber'"
          src="https://b-gold-cdn.xitu.io/v3/static/img/greeting.1415c1c.png"
          class="greeting"
        />
        <img
          v-show="currentFocus === 'password'"
          src="https://b-gold-cdn.xitu.io/v3/static/img/blindfold.58ce423.png"
          class="blindfold"
        />
      </div>
      <div class="login-pancel">
        <h1 class="title">{{ isRegister ? "注册" : "登录" }}</h1>
        <i
          title="关闭"
          class="close-btn el-icon-close"
          @click="handleClose"
        ></i>
        <el-form ref="ruleForm" :model="postData" :rules="rules">
          <el-form-item prop="phoneNumber">
            <el-input
              v-model="postData.phoneNumber"
              class="phoneNumber-input"
              placeholder="请输入手机号"
              maxlength="64"
              @focus="currentFocus = 'phoneNumber'"
              @blur="currentFocus = ''"
            />
          </el-form-item>
          <el-form-item prop="password">
            <el-input
              v-model="postData.password"
              class="password-input"
              :type="pwdType"
              placeholder="请输入密码"
              maxlength="64"
              @focus="currentFocus = 'password'"
              @blur="currentFocus = ''"
              @keydown.enter.native="login"
            >
              <i
                slot="suffix"
                class="el-icon-view"
                :class="{ active: pwdType === '' }"
                @click="showPassWord"
              ></i>
            </el-input>
          </el-form-item>
        </el-form>
        <div class="register" @click="isRegister = !isRegister">
          {{ isRegister ? "返回登录" : "立即注册" }}
        </div>
        <!-- <el-checkbox v-model="isRemember">记住密码</el-checkbox> -->
        <el-button
          style="width:100%;margin-top:10px"
          :loading="loginLoading"
          type="primary"
          @click="btnClick"
          >{{ isRegister ? "注册" : "登录" }}</el-button
        >
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    visibility: {
      type: Boolean,
      default: false
    }
  },
  inject: ['eventBus'],
  data() {
    const validatePhone = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("请输入手机号"));
      } else {
        if (!/^1[3456789]\d{9}$/.test(value)) {
          callback(new Error("请输入正确的手机号"));
        } else {
          callback();
        }
      }
    };
    const validatePassWord = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("密码长度必须在6~22位之间，包含字符、数字和 _ "));
      } else {
        if (!/^[A-Za-z0-9_*&$#@]{6,22}$/.test(value)) {
          callback(new Error("密码长度必须在6~22位之间，包含字符、数字和 _ "));
        } else {
          callback();
        }
      }
    };
    return {
      // 当前是否为注册
      isRegister: false,
      // 用来显示隐藏密码
      pwdType: "password",
      // 当前鼠标点击的类型：phoneNumber|password|""
      currentFocus: "",
      postData: {
        phoneNumber: "", // 账号
        password: "" // 密码
      },
      loginLoading: false,
      rules: {
        phoneNumber: [{ validator: validatePhone, trigger: "blur" }],
        password: [{ validator: validatePassWord, trigger: "blur" }]
      }
    };
  },
  watch: {
    "postData.phoneNumber": function(curVal, oldVal) {
      if (!curVal) {
        this.postData.phoneNumber = "";
        return false;
      }
      // 实时把非数字的输入过滤掉
      this.postData.phoneNumber = curVal.match(/\d/gi)
        ? curVal.match(/\d/gi).join("")
        : "";
    }
  },
  mounted() {},
  methods: {
    // 关闭
    handleClose() {
      this.$emit("closecb");
    },
    // 注册操作
    register() {
      // this.$store.commit('setApiUrl','/devApi')
      this.$service
        .post("/web/user/register", {
          username: this.postData.phoneNumber,
          password: this.postData.password
        })
        .then(res => {
          console.log(res);
          if(res.code==11){
            this.$message.success(res.message)
          }
        })
        .catch(err => {
          console.log(err);
        });
    },
    // 登录操作
    login() {
      this.$service
        .post("/web/user/login", {
          username: this.postData.phoneNumber,
          password: this.postData.password
        })
        .then(res => {
          if(res.message){
            this.$message.error(res.message)
          }
          let { access_token, refresh_token } = res;
          if(access_token){
            this.$message.success('登陆成功')
            // 登录成功
            this.$emit('logincb', 'ok')
            this.eventBus.$emit('logincb', 'ok')
            this.$store.commit('setToken', access_token)
            this.$store.dispatch('getUserInfo')
          }
        })
        .catch(err => {
          console.log(err);
            this.eventBus.$emit('logincb', 'error')
        });
    },
    // 点击登录或注册按钮
    btnClick() {
      this.$refs.ruleForm.validate(valid => {
        if (valid) {
          this.loginLoading = true;
          if (this.isRegister) {
            this.register();
          } else {
            this.login();
          }
          this.loginLoading = false;
        }
      });
    },
    // 显示隐藏密码
    showPassWord() {
      this.pwdType === "password"
        ? (this.pwdType = "")
        : (this.pwdType = "password");
    }
  }
};
</script>

<style lang='scss' scoped>
.active {
  color: #409eff;
}
.login-modal-container {
  z-index: 1000;
  position: fixed;
  top: 0;
  left: 0;
  bottom: 0;
  right: 0;
  display: flex;
  align-items: center;
  justify-content: center;
  background-color: rgba(0, 0, 0, 0.2);

  .login-form {
    position: relative;
    width: 318px;
    background-color: #fff;
    border-radius: 2px;
  }

  .panfish {
    .normal {
      position: absolute;
      top: 0;
      left: 50%;
      width: 120px;
      transform: translate(-50%, -83%);
      z-index: 1;
    }

    .greeting {
      position: absolute;
      top: 0;
      left: 50%;
      width: 120px;
      transform: translate(-50%, -75.8%);
      z-index: 1;
    }

    .blindfold {
      position: absolute;
      top: 0;
      left: 50%;
      width: 104px;
      transform: translate(-50%, -75%);
      z-index: 1;
    }
  }

  .login-pancel {
    position: relative;
    padding: 22px;

    .register {
      position: absolute;
      font-size: 14px;
      color: #666;
      right: 30px;
      bottom: 70px;
      cursor: pointer;
      &:hover {
        color: #409eff;
      }
    }
    .title {
      margin-bottom: 30px;
      font-size: 18px;
      font-weight: 600;
      color: #333;
    }

    .close-btn {
      position: absolute;
      top: 20px;
      right: 20px;
      padding: 3px;
      color: #bbb;
      font-weight: 600;
      cursor: pointer;
    }

    .phoneNumber-input,
    .password-input {
      margin-bottom: 8px;

      /deep/ input::placeholder {
        color: #999;
      }
    }

    .submit-btn {
      margin-top: 5px;
      padding: 12px;
      background-color: blue;
      color: #fff;
      text-align: center;
      font-size: 14px;
      border-radius: 2px;
      cursor: pointer;
    }
  }
}
</style>
