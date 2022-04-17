<template>
  <div class="my-container">
    <!-- 头像容器 -->
    <van-cell-group v-if="userInfo" class="my-info">
      <!-- 头像和个人信息区域 -->
      <van-cell :border="false" center title="单元格" class="base-info">
        <van-image
          slot="icon"
          class="avatar"
          round
          :src="userInfo.photo"
          fit="cover"
        />
        <div slot="title" class="name">{{ userInfo.nickname }}</div>
        <van-button
          size="small"
          to="/user/profile"
          class="right-btn"
          round
          slot="right-icon"
          >编辑资料</van-button
        >
      </van-cell>
      <!-- 头像下部宫格布局 -->
      <van-grid :border="false" class="data-info">
        <van-grid-item class="data-info-item">
          <div slot="text">
            <div class="count">{{ 10 }}</div>
            <div class="text">点赞</div>
          </div>
        </van-grid-item>
        <van-grid-item class="data-info-item">
          <div slot="text">
            <div class="count">{{ 2 }}</div>
            <div class="text">关注</div>
          </div>
        </van-grid-item>
        <van-grid-item class="data-info-item">
          <div slot="text">
            <div class="count">{{ 1 }}</div>
            <div class="text">评论</div>
          </div>
        </van-grid-item>
        <van-grid-item class="data-info-item">
          <div slot="text">
            <div class="count">{{ 0 }}</div>
            <div class="text">浏览</div>
          </div>
        </van-grid-item>
      </van-grid>
    </van-cell-group>

    <!-- 未登录显示的页面 -->
    <div v-else class="not-login">
      <div @click="$router.push('/login')">
        <img class="mobile-icon" src="./images/unlogin-img.png" />
      </div>
      <span class="not-login-text">登录、注册</span>
    </div>

    <!-- 收藏和历史 -->
    <van-grid :column-num="2" class="nav-grid mb-15" icon-size="20px">
      <van-grid-item
        class="iconfont nav-grid-item"
        icon="like-o"
        text="我的收藏"
        @click="$router.push('/usercollect')"
      />
      <van-grid-item
        class="iconfont nav-grid-item"
        icon="browsing-history-o"
        text="浏览记录"
        @click="$router.push('/userhistory')"
      />
    </van-grid>

    <!-- 下方的单元格 -->
    <!-- <van-cell title="消息通知" is-link to="/" /> -->
    <!-- <van-cell title="人工智障" to="/userchat" is-link class="mb-15" /> -->
    <van-cell title="退出登录" v-if="userInfo" @click="onLogout" class="logout" />
  </div>
</template>

<script>
import { mapState } from "vuex";
export default {
  name: "my",
  data() {
    return {
      currentUser: {},
    };
  },
  computed: {
    ...mapState(["userInfo"]),
  },
  methods: {
    onLogout() {
      this.$dialog
        .confirm({
          title: "确认退出账户吗",
          message: "退出后将清除当前所有用户数据",
        })
        .then(() => {
          this.$store.dispatch("logOut")
        })
        .catch(() => {
          // on cancel
          // 取消的回调 直接return
          return;
        });
    }
  },
};
</script>

<style scoped lang="less">
//最外层
.my-container {
  .my-info {
    background: url("./images/banner.png") no-repeat;
    background-size: cover;

    .base-info {
      height: 115px;
      box-sizing: border-box;
      padding-top: 38px;
      padding-bottom: 11px;
      background-color: unset;

      .avatar {
        width: 66px;
        height: 66px;
        border: 1px solid white;
        box-sizing: border-box;
        margin-right: 11px;
      }

      .name {
        color: #fff;
        font-size: 15px;
      }

      .right-btn {
        height: 16px;
        font-size: 10px;
        color: #666666;
      }
    }

    .data-info {
      .data-info-item {
        height: 65px;
        color: #fff;
        text-align: center;

        .count {
          font-size: 18px;
        }

        .text {
          font-size: 11px;
        }
      }
    }

    /deep/ .van-grid-item__content {
      background-color: unset;
    }
  }

  .not-login {
    background: url("./images/banner.png") no-repeat;
    background-size: cover;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    height: 180px;

    .mobile-icon {
      width: 66px;
      height: 66px;
    }

    .not-login-text {
      margin-top: 10px;
      color: white;
      font-size: 14px;
    }
  }

  /deep/ .nav-grid {
    .nav-grid-item {
      height: 70px;

      .icon {
        font-size: 23px;
      }

      .icon-good {
        color: #eb5556;
      }

      .icon-browse {
        color: #ff9d1d;
      }

      .van-grid-item__text {
        font-size: 14px;
        color: #333;
      }
    }
  }

  .mb-15 {
    margin-bottom: 4px;
  }

  .logout {
    text-align: center;
    color: #d86262;
  }
}
</style>