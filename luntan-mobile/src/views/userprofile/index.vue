<template>
  <div class="user-profile">
    <!-- 上方导航栏 -->
    <van-nav-bar title="个人信息" left-arrow @click-left="$router.back()" />

    <!-- 个人信息模块 -->
    <van-cell-group>
      <input
        type="file"
        accept="image/*"
        @change="onFileChange"
        hidden
        ref="imgUpload"
      />
      <van-cell
        title="头像"
        @click="$refs.imgUpload.click()"
        value="内容"
        is-link
        center
      >
        <van-image :src="user.photo" fit="cover" round width="35" height="35" />
      </van-cell>
      <van-cell
        title="昵称"
        @click="isNameshow = true"
        is-link
        :value="user.nickname"
      />
      <van-cell
        title="性别"
        @click="isGendershow = true"
        is-link
        :value="user.sex == 1 ? '男' : '女'"
      />
      <van-cell
        title="生日"
        @click="isBrithdayshow = true"
        is-link
        :value="user.birthday ? user.birthday : '未设置'"
      />
    </van-cell-group>
    <van-button type="primary" color="#3296fa" block @click="updateUserInfo">确定</van-button>
    <!-- 编辑昵称 -->
    <van-popup
      v-model="isNameshow"
      position="bottom"
      :style="{ height: '100%' }"
    >
      <update-name
        v-model="user.nickname"
        v-if="isNameshow"
        @close="isNameshow = false"
        @handleUpdateName="handleUpdateName"
      >
      </update-name>
    </van-popup>

    <!-- 编辑性别 -->
    <van-popup v-model="isGendershow" position="bottom">
      <update-gender
        v-model="user.sex"
        @close="isGendershow = false"
        @handleUpdateGender="handleUpdateGender"
      ></update-gender>
    </van-popup>

    <!-- 编辑生日 -->
    <van-popup v-model="isBrithdayshow" position="bottom">
      <update-birthday
        v-if="isBrithdayshow"
        v-model="user.birthday"
        @close="isBrithdayshow = false"
        @handleUpdateBirthday="handleUpdateBirthday"
      >
      </update-birthday>
    </van-popup>

    <!-- 修改头像 -->
    <div class="headImg">
      <van-popup v-model="isPhotoShow" style="height: 100%" position="bottom">
        <update-photo
          v-if="isPhotoShow"
          @handleUpdatePhoto="handleUpdatePhoto"
          @close="isPhotoShow = false"
          :file="pictureObject"
        >
        </update-photo>
      </van-popup>
    </div>
  </div>
</template>

<script>
import updateName from "./components/update-name.vue";
import UpdateGender from "./components/update-gender.vue";
import UpdateBirthday from "./components/update-birthday.vue";
import UpdatePhoto from "./components/update-photo.vue";
import { mapState } from "vuex";
import { deepClone } from "@/utils/common.js";
export default {
  components: {
    updateName,
    UpdateGender,
    UpdateBirthday,
    UpdatePhoto,
  },
  name: "userprofile",
  computed: {
    ...mapState(["userInfo"]),
  },
  data() {
    return {
      user: {},
      isNameshow: false,
      isGendershow: false,
      isBrithdayshow: false,
      isPhotoShow: false,
      pictureObject: null,
    };
  },
  methods: {
    handleUpdatePhoto({url,path}){
      this.user.photo = url
      this.user.avatar = path
    },
    // 修改生日
    handleUpdateBirthday(birthday){
      this.user.birthday = birthday
    },
    // 修改性别
    handleUpdateGender(sex){
      this.user.sex = sex
      console.log(this.user.sex);
    },
    // 修改名字
    handleUpdateName(nickname){
      this.user.nickname = nickname
    },
    onFileChange() {
      this.isPhotoShow = true;
      // 触发弹出层 预览图片
      const fileObject = this.$refs.imgUpload.files[0];
      this.pictureObject = fileObject;
      this.$refs.imgUpload.value = "";
    },
    // 修改用户信息
    updateUserInfo(){
      this.$store.dispatch("updateUserInfo",this.user)
    }
  },
  mounted(){
    // 重新获取用户信息
    this.$store.dispatch("getUserInfo")
    this.user = deepClone(this.userInfo)
    // avatar应该截取最后的文件名称 例如：http://localhost:5000/assets/upload/1647851046978.jpg -》 1647851046978.jpg
    this.user.avatar = this.user.avatar.slice(this.user.avatar.lastIndexOf("/")+1)
  }
};
</script>

<style lang="less" scoped>
.headImg {
  /deep/ .van-popup {
    background-color: rgba(0, 0, 0, 0.267);
  }
}
</style>