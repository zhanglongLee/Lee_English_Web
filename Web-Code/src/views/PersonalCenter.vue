<template>
  <div class="personal-center">
    <el-container class="personal-content">
      <el-aside width="300px" class="personal-aside">
        <div class="user-info">
          <div class="user-img">
            <el-avatar class="img-wrap" :size="150" :src="userInfo.avatar" />
          </div>
          <div class="user-name">
            {{ userInfo.nickname }}<i :class="sexType"></i>
          </div>
        </div>
        <el-menu
          v-if="menuList.length > 0"
          :default-active="currentIndex"
          class="aside-menu"
          @select="menuSelect"
        >
          <el-menu-item
            v-for="item in menuList"
            :key="item.index"
            :index="item.index"
          >
            <i :class="item.className"></i>
            <span slot="title">{{ item.title }}</span>
          </el-menu-item>
        </el-menu>
      </el-aside>
      <el-main class="personal-main">
        <!-- 个人信息S -->
        <el-form
          class="user-form"
          label-position="left"
          label-width="80px"
          :model="userInfo"
        >
          <div class="form-header">
            <div class="form-title">{{ formTitle }}</div>
            <el-button
              v-if="disabled && showEdit"
              type="primary"
              @click="disabled = false"
              >编辑</el-button
            >
            <div v-if="!disabled && showEdit" class="btns">
              <el-button type="info" @click="unSave">取消</el-button>
              <el-button type="primary" @click="save">保存</el-button>
            </div>
            <el-button v-if="showDel" type="primary" @click="disabled = false"
              >删除</el-button
            >
          </div>

          <div v-if="currentIndex === '1'" class="form-content">
            <el-form-item label="我的昵称">
              <el-input
                v-model="userInfo.nickname"
                :disabled="disabled"
                maxlength="10"
              />
            </el-form-item>
            <el-form-item label="我的邮箱">
              <el-input v-model="userInfo.email" :disabled="disabled" />
            </el-form-item>
            <el-form-item label="我的性别" prop="sex">
              <el-radio v-model="userInfo.sex" :disabled="disabled" :label="1"
                >男</el-radio
              >
              <el-radio v-model="userInfo.sex" :disabled="disabled" :label="2"
                >女</el-radio
              >
            </el-form-item>
            <el-form-item label="我的头像">
              <uploadImage
                :disabled="disabled"
                @updateSuccess="updateSuccess"
                :beforeUpload="beforeImageUpload"
              >
                <img
                  v-if="userInfo.avatar"
                  :src="userInfo.avatar"
                  class="avatar"
                />
                <i v-else class="el-icon-plus avatar-uploader-icon"></i>
              </uploadImage>
            </el-form-item>
          </div>
          <!-- 个人信息E -->
          <!-- 做题记录S -->
          <el-table
            v-if="currentIndex === '2'"
            :data="userLearningList"
            tooltip-effect="dark"
            class="my-list"
          >
            <el-table-column type="selection" width="55" />
            <el-table-column label="做题日期"  width="200" >
              <template slot-scope="scope">{{ scope.row.updated_at }}</template>
            </el-table-column>
            <el-table-column label="练习标题" show-overflow-tooltip>
              <template slot-scope="scope">
                <div class="learning-title" @click="toUserLearning(scope.row)">{{ scope.row.listening_name }}</div>
              </template>
            </el-table-column>
          </el-table>
          <!-- 做题记录E -->
          <!-- 个人收藏S -->
          <el-table
            v-if="currentIndex === '3'"
            ref="multipleTable"
            :data="collectionList"
            tooltip-effect="dark"
            class="my-list"
          >
            <el-table-column type="selection" width="55" />
            <el-table-column label="日期" width="120">
              <template slot-scope="scope">{{ scope.row.date }}</template>
            </el-table-column>
            <el-table-column
              prop="address"
              label="标题"
              width="360"
              show-overflow-tooltip
            />
          </el-table>
          <!-- 个人收藏E -->

          <!-- 修改密码S -->
          <div v-if="currentIndex === '4'" class="form-content">
            <el-form-item label="旧密码">
              <el-input v-model="pwdObj.old_password" />
            </el-form-item>
            <el-form-item label="新密码">
              <el-input v-model="pwdObj.new_password" />
            </el-form-item>
            <el-button type="primary" @click="updatePwd">修改密码</el-button>
          </div>
          <!-- 修改密码E -->
        </el-form>
      </el-main>
    </el-container>
  </div>
</template>

<script>
import uploadImage from "@/components/common/upload-image";
import { deepClone } from "@/util/common";
export default {
  components: { uploadImage },
  data() {
    const item = {
      date: "2016-05-02",
      address: "2018年12月英语六级听力真题及答案:第2套"
    };
    const item1 = {
      date: "2016-05-02",
      address: "数字转型通达未来 | 江苏交控“六朵云”成果发布"
    };
    return {
      currentIndex: "1", // 当前选中的menu
      disabled: true,
      // menu信息
      menuList: [
        { index: "1", title: "个人信息", className: "el-icon-user" },
        { index: "2", title: "我的下载", className: "el-icon-download" },
        { index: "3", title: "我的收藏", className: "el-icon-star-off" },
        { index: "4", title: "用户设置", className: "el-icon-s-tools" }
      ],
      userInfo: {},
      pwdObj: {},
      userLearningList:[],
      collectionList: Array(5).fill(item1)
    };
  },
  computed: {
    formTitle() {
      return this.menuList[Number(this.currentIndex) - 1].title;
    },
    showDel() {
      return this.currentIndex === "2" || this.currentIndex === "3";
    },
    showEdit() {
      return this.currentIndex === "1";
    },
    sexType() {
      return this.userInfo.sex == 1 ? "el-icon-male" : "el-icon-female";
    }
  },
  methods: {
    // 图片上传之前
    beforeImageUpload(file) {
      const isImage = file.type === "image/jpeg" || file.type === "image/png";
      const isLt2M = file.size / 1024 / 1024 < 2;

      if (!isImage) {
        setTimeout(() => {
          this.$message.error("上传图片只能是 JPG 或 PNG 格式!");
        }, 100);
      }
      if (!isLt2M) {
        setTimeout(() => {
          this.$message.error("上传图片大小不能超过 2MB!");
        }, 100);
      }
      return isImage && isLt2M;
    },
    // 图片上传成功后
    updateSuccess(res) {
      this.$message.success("图片上传成功");
      this.userInfo.avatar = res.url;
      this.userInfo.originAvatar = res.path;
    },
    // 取消
    unSave() {
      this.disabled = true;
      this.userInfo = deepClone(this.$store.state.userInfo);
    },
    // 保存
    save() {
      let postObj = deepClone(this.userInfo);
      postObj.avatar = postObj.originAvatar;
      this.$store.dispatch("updateUserInfo", postObj).then(res => {
        if (!res) {
          // 更改信息失败
        } else {
          this.disabled = true;
        }
      });
    },
    // 菜单选中
    menuSelect(i) {
      this.currentIndex = i;
    },
    // 修改密码
    updatePwd() {
      if (!this.pwdObj["old_password"] || !this.pwdObj["new_password"]) {
        this.$message.error('请输入旧密码和新密码')
        return false
      }
      this.$service
        .post("/web/user/change_password",this.pwdObj)
        .then(res => {
          if(res.code===4){
            this.$message.success('密码修改成功,请重新登录！')
            this.$store.dispatch('logOut')
          }
        })
        .catch(err => {
          console.log(err);
        });
    },
    // 获取用户做题记录
    getUserLearning(){
      this.$service
        .get("/web/userLearning")
        .then(res => {
          this.userLearningList = deepClone(res)
        })
        .catch(err => {
          console.log(err);
        });
    },
    // 跳转练习题详情
    toUserLearning(data){
      console.log(data)
    }
  },
  mounted() {
    this.userInfo = deepClone(this.$store.state.userInfo);
    this.getUserLearning()
  }
};
</script>
<style lang="scss" scoped>
.personal-center {
  min-width: 1300px;
  min-height: calc(100vh - 54px);
  padding-bottom: 10px;
  background-color: rgb(238, 241, 246);

  .personal-content {
    width: 1000px;
    margin: 0 auto;
    padding-top: 20px;

    .personal-aside {
      background: #fff;
      padding: 10px 0;

      .user-info {
        width: 100%;
        text-align: center;

        .user-img {
          width: 100%;
          display: flex;
          justify-content: center;
          .img-wrap {
            display: flex;
            justify-content: center;
            align-items: center;
          }
        }
        .user-name {
          display: inline-block;
          margin: 20px 0;
          line-height: 30px;
          padding: 0 20px;
          text-align: center;
          font-size: 16px;
          color: rgb(247, 226, 226);
          border-radius: 18px;
          background: #666;

          i {
            font-size: 18px;
            margin-left: 5px;
          }
          .male {
            color: rgb(247, 226, 226);
          }
          // .female {
          //   color: red;
          // }
        }
      }
      .aside-menu {
        li {
          text-align: center;
          font-size: 16px;
        }
      }
    }

    .personal-main {
      padding: 0;
      margin-left: 100px;
      border: 1px solid #e0e0e0;
      border-radius: 3px;
      background: #fff;
      .user-form {
        .form-header {
          display: flex;
          justify-content: space-between;
          align-items: center;
          margin: 0 30px;
          line-height: 60px;
          border-bottom: 1px solid #ccc;
          .form-title {
            font-size: 18px;
            font-weight: bold;
          }
          .cancel-btn {
            background: #bbb;
            border-color: #bbb;
          }
        }
        .form-content {
          padding: 30px 100px;
          /deep/ .el-form-item__content {
            width: 206px;
          }
          .avatar-uploader {
            /deep/ .el-upload {
              border: 1px dashed #d9d9d9;
              border-radius: 6px;
              cursor: pointer;
              position: relative;
              overflow: hidden;
            }
            /deep/ .el-upload:hover {
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
          }
        }

        .my-list {
          padding: 0 30px;

          .learning-title{
            cursor: pointer;
            &:hover{
              color: #409eff;
            }
          }
        }
      }
    }
  }
}

.el-aside {
  color: #333;
}
</style>

