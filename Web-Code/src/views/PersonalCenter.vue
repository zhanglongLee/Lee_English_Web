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
            :data="userListeningList"
            tooltip-effect="dark"
            class="my-list"
            max-height="450"
          >
            <el-table-column label="做题日期" width="200" >
              <template slot-scope="scope">{{ scope.row.updated_at }}</template>
            </el-table-column>
            <el-table-column label="练习标题" show-overflow-tooltip width="240">
              <template slot-scope="scope">
                <div class="listening-title">{{ scope.row.listening_name }}</div>
              </template>
            </el-table-column>
            <el-table-column
              fixed="right"
              label="操作"
              width="100">
              <template slot-scope="scope">
                <el-button @click="toUserListening(scope.row)" type="text" size="small">查看</el-button>
                <el-button @click="delUserListening(scope.row)" type="text" size="small">删除</el-button>
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
            max-height="450"
          >
            <el-table-column label="收藏日期" width="200" >
              <template slot-scope="scope">{{ scope.row.updated_at }}</template>
            </el-table-column>
            <el-table-column label="收藏标题" show-overflow-tooltip width="240">
              <template slot-scope="scope">
                <div class="listening-title">{{ scope.row.collection_name }}</div>
              </template>
            </el-table-column>
            <el-table-column
              fixed="right"
              label="操作"
              width="100">
              <template slot-scope="scope">
                <el-button @click="toCollection(scope.row)" type="text" size="small">查看</el-button>
                <el-button @click="delCollection(scope.row)" type="text" size="small">删除</el-button>
              </template>
            </el-table-column>
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

          <!-- 生词本 S-->
          <div v-if="currentIndex === '5'" class="word-list">
            <div class="btn-list">
              <el-button-group>
                <el-button size="mini" :type="isShowTranslate?'primary':''" @click="isShowTranslate=true">显示释义</el-button>
                <el-button size="mini" :type="!isShowTranslate?'primary':''" @click="isShowTranslate=false">隐藏释义</el-button>
              </el-button-group>
            </div>
            <div class="word-content" v-if="wordBookList.length>0">
              <div class="word-items" v-for="(item,index) in wordBookList" :key="index">
                <h3 class="item-title">{{item.word_name}}</h3>
                <div class="item-pronunciation">{{item.pronunciation}}</div>
                <div class="item-translate" v-show="isShowTranslate">{{item.translate}}</div>
                <div class="item-type"><el-tag>{{item.categoryName}}词汇</el-tag></div>
                <i class="iconfont icon-lajitong" title="移出生词本" @click="removeWord(item.word_id)"></i>
              </div>
            </div>
            <div v-else class="no-result">
              暂无数据
            </div>
          </div>
          <!-- 生词本 E-->
        </el-form>
      </el-main>
    </el-container>
  </div>
</template>

<script>
import uploadImage from "@/components/common/upload-image";
import { deepClone } from "@/util/common";
import myTable from "@/components/common/my-table"
export default {
  components: { uploadImage,myTable },
  data() {
    return {
      isShowTranslate:true,//是否显示释义
      currentIndex: "1", // 当前选中的menu
      disabled: true,
      // menu信息
      menuList: [
        { index: "1", title: "个人信息", className: "el-icon-user" },
        { index: "2", title: "练习记录", className: "el-icon-download" },
        { index: "3", title: "我的收藏", className: "el-icon-star-off" },
        { index: "4", title: "用户设置", className: "el-icon-s-tools" },
        { index: "5", title: "我的生词", className: "el-icon-notebook-1" },
      ],
      userInfo: {},
      pwdObj: {},
      userListeningList:[],
      wordBookList:[],
      listeningColumnData:[
        {prop:"updated_at",label:"做题时间",tooltip:false},
        {prop:"listening_name",label:"标题",tooltip:true}
      ],
      collectionList: [],
      collectionColumnData:[
        {prop:"updated_at",label:"收藏时间",tooltip:false},
        {prop:"collection_name",label:"标题",tooltip:true}
      ],
    };
  },
  computed: {
    formTitle() {
      return this.menuList[Number(this.currentIndex) - 1].title;
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
    getUserListening(){
      this.$service
        .get("/web/userLearning")
        .then(res => {
          this.userListeningList = deepClone(res)
        })
        .catch(err => {
          console.log(err)
          this.$message.error('获取用户做题记录失败，请联系管理员！')
          this.userListeningList = []
        });
    },
    // 获取用户收藏列表
    getCollectionList(){
      this.$service
        .get("/web/collection")
        .then(res => {
          this.collectionList = deepClone(res)
        })
        .catch(err => {
          console.log(err)
          this.$message.error('获取用户收藏列表失败，请联系管理员！')
          this.collectionList = []
        });
    },
    // 获取用户生词列表
    getWordBookList(){
      this.$service
        .get("/web/wordbook")
        .then(res => {
          console.log(res)
          this.wordBookList = deepClone(res)
        })
        .catch(err => {
          console.log(err)
          this.$message.error('获取用户生词列表失败，请联系管理员！')
          this.collectionList = []
        });
    },
    // 跳转练习题详情
    toUserListening(data){
      // 存储当前点击练习题的历史答案
      let history_answer = JSON.parse(data.history_answer)
      let id = data.listeningId
      this.$store.commit('setHistoryAnswer',history_answer)
      this.$router.push(`/listen/ListenDetail/${id}`)
      console.log(data)
    },
    // 删除做题记录
    delUserListening(data){
      let id = data.listeningId
      this.$service
        .delete(`/web/userLearning/${id}`)
        .then(res => {
          if(res.code===0){
            // 删除成功
            this.$message.success('听力练习记录删除成功')
            this.getUserListening()
          }else{
            this.$message.error('听力练习记录删除失败，请联系管理员！')
          }
        })
        .catch(err => {
          console.log(err);
        });
      console.log(data)
    },
    // 跳转文章详情
    toCollection(data){
      // let id = data.articleId
      // this.$store.commit('setHistoryAnswer',history_answer)
      let type = data.type
      let id = data.collection_id
      if(type==='article'){
        this.$router.push(`/article/ArticleDetail/${id}`)
      }else if(type==='listening'){
        this.$router.push(`/listen/ListenDetail/${id}`)
      }
      console.log(data)
    },
    // 删除文章收藏
    delCollection(data){
      let type = data.type
      let id = data.collection_id
      var delType = 0
      if(type=="listening"){
        delType = 2
      }else if(type=="article"){
        delType = 1
      }
      this.$service
        .delete(`/web/collection/${delType}/${id}`)
        .then(res => {
          if(res.code===0){
            // 删除成功
            this.$message.success('收藏记录删除成功')
            this.getCollectionList()
          }else{
            this.$message.error('收藏记录删除失败，请联系管理员！')
          }
        })
        .catch(err => {
          console.log(err);
        });
      
      console.log(data)
    },
    // 移出生词
    removeWord(id){
      this.$service
        .delete(`/web/wordBook/${this.userInfo.id}/${id}`)
        .then(res => {
          if(res.code===0){
            // 删除成功
            this.$message.success('生词删除成功')
            this.getWordBookList()
          }else{
            this.$message.error('生词删除失败，请联系管理员！')
          }
        })
        .catch(err => {
          console.log(err);
        });
    }
  },
  mounted() {
    this.userInfo = deepClone(this.$store.state.userInfo);
    this.getUserListening()
    this.getCollectionList()
    this.getWordBookList()
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
        .word-list{
          width: 100%;
          padding: 10px 30px;
          .btn-list{
            width: 100%;
            text-align: right;
            
          }
          .word-content{
            width: 100%;
            max-height: 400px;
            overflow-y: auto;
            display: flex;
            flex-wrap: wrap;
            margin-top: 20px;
            .word-items{
              position: relative;
              display: flex;
              flex-direction: column;
              width: 45%;
              min-height: 120px;
              margin: 10px;
              padding: 10px;
              background: #F3F4F6;

              .item-title{
                font-size: 18px;
                font-weight: bold;
              }
              .item-pronunciation{
                font-size: 14px;
                margin: 10px 0 20px 0;
                color: #999da7;
              }
              .item-translate{
                font-size: 14px;
              }
              .item-type{
                position: absolute;
                top: 10px;
                right: 10px;
              }
              i{
                position: absolute;
                bottom: 10px;
                right: 10px;
                cursor: pointer;
                &:hover{
                  color: #409eff;
                }
              }
            }
          }
        }

        .my-list {
          padding: 0 30px;

          .listening-title{
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
.no-result{
  display: flex;
  justify-content: center;
  align-items: center;
  font-size: 18px;
  width: 100%;
  height: 400px;
}
.el-aside {
  color: #333;
}
</style>

