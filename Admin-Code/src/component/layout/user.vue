<template>
  <div class="user">
    <el-dropdown>
      <span class="el-dropdown-link">
        <div class="nav-avatar"><img :src="user.avatar || defaultAvatar" alt="头像" /></div>
      </span>
      <el-dropdown-menu slot="dropdown" class="user-box">
        <div class="user-info">
          <div class="avatar" title="点击修改头像">
            <img :src="user.avatar || defaultAvatar" alt="头像" />
          </div>
          <div class="text">
            <div class="username">{{ nickname }}</div>
            <div class="identity">{{ identityName }}</div>
          </div>

          <img src="../../assets/image/user/corner.png" class="corner" />
        </div>
        <ul class="dropdown-box">
          <li class="password" @click="goToCenter">
            <i class="iconfont icon-weibaoxitongshangchuanlogo-"></i> <span>个人中心</span>
          </li>
          <li class="account" @click="outLogin"><i class="iconfont icon-tuichu"></i> <span>退出账户</span></li>
        </ul>
      </el-dropdown-menu>
    </el-dropdown>
  </div>
</template>

<script>
import { mapActions, mapGetters } from 'vuex'
import Vue from 'vue'
import User from '@/lin/model/user'
import 'vue-croppa/dist/vue-croppa.css'
import defaultAvatar from '@/assets/image/user/user.png'
const width = 150
const height = 150
export default {
  name: 'user',
  components: {
  },
  data() {
    return {
      username: null,
      nickname: null,
      identityName: null,
      defaultAvatar,
    }
  },
  computed: {
    ...mapGetters(['user']),
  },
  watch: {},
  created() {
    this.init()
  },
  methods: {
    ...mapActions(['loginOut']),
    init() {
      const { user } = this.$store.state
      console.log(user)
      this.username = user ? user.username : '未登录'
      this.nickname = user && user.nickname ? user.nickname : '佚名'
      this.identityName = user && user.admin ? '超级管理员' : '管理员'
    },
    goToCenter() {
      this.$router.push('/center')
    },
    outLogin() {
      window.location.reload(true)
      this.loginOut()
    },
  },
}
</script>

<style lang="scss" scoped>
.user-dialog /deep/ .el-dialog .el-dialog__header {
  border-bottom: 1px solid #dae1ed;
  padding-bottom: 20px;
}

.user-dialog /deep/ .el-dialog .el-dialog__body {
  padding-bottom: 00px;
}

.user {
  height: 40px;

  .el-dropdown-link {
    cursor: pointer;

    .nav-avatar {
      width: 40px;
      height: 40px;
      border-radius: 50%;
      overflow: hidden;
      margin-right: 10px;
      img{
        width: 100%;
        height: 100%;
      }
    }
  }
}

.user-box {
  width: 326px;
  background-color: none;
  background: transparent;
  margin-bottom: 0;
  padding-bottom: 0;
  border: none;

  .user-info {
    background-image: url('../../assets/image/user/user-bg.png');
    background-size: 100% 100%;
    transform: translateY(-10px);
    border-top-left-radius: 4px;
    border-top-right-radius: 4px;
    display: flex;
    flex-direction: row;
    padding: 35px 20px 25px 30px;
    z-index: 100;
    position: relative;

    .corner {
      position: absolute;
      right: 18px;
      top: -9px;
      width: 27px;
      height: 10px;
    }

    .avatar {
      width: 80px;
      height: 80px;
      border-radius: 50%;
      cursor: pointer;
      overflow: hidden;
      position: relative;

      img{
        width: 100%;
        height: 100%;
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
        height: 32px;
        line-height: 32px;
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

  .dropdown-box {
    display: flex;
    flex-direction: column;
    justify-content: space-around;
    padding-left: 35px;
    height: 122px;
    color: #596c8e;
    font-size: 14px;
    background: white;
    margin-top: -10px;

    li {
      cursor: pointer;

      &:nth-child(1) {
        margin-top: 20px;
      }

      &:nth-child(2) {
        margin-bottom: 20px;
      }

      i {
        margin-right: 10px;
      }

      &:hover {
        color: $theme !important;

        i {
          color: $theme !important;
        }
      }
    }
  }
}

.popper__arrow {
  display: none !important;
}

.avatar-croppa-container {
  display: inline-block;
  border-color: #3862bc;
  border-style: dashed;
  font-size: 0;
  border-width: 2px;
}
</style>
