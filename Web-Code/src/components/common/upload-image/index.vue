<template>
  <dir class="img-upload">
    <el-upload
      class="avatar-uploader"
      :action="uploadUrl"
      :show-file-list="showFileList"
      :headers="uploadHeaders"
      :http-request="httpRequest"
      :on-success="handleAvatarSuccess"
      :before-upload="beforeUpload"
      :disabled="disabled"
    >
      <slot></slot>
    </el-upload>
  </dir>
</template>

<script>
import { getToken } from '../../../util/token'
export default {
  props: {
    showFileList: {
      type: Boolean,
      default: () => {
        return false
      },
    },
    disabled: {
      type: Boolean,
    },
    httpRequest: {
      type: Function,
    },
    beforeUpload: {
      type: Function,
    },
  },
  data() {
    const token = getToken('access_token')
    return {
      uploadHeaders: {
        Authorization: token,
      },
      uploadUrl: process.env.API_URL + 'cms/file',
    }
  },
  methods:{
    handleAvatarSuccess(data){
      this.$emit('updateSuccess',data)
    }
  }
}
</script>

<style lang="scss" scoped>
.img-upload {
  width: 100%;
  .avatar-uploader /deep/ .el-upload {
    border: 1px dashed #d9d9d9;
    border-radius: 6px;
    cursor: pointer;
    position: relative;
    overflow: hidden;
  }
  .avatar-uploader /deep/ .el-upload:hover {
    border-color: #409eff;
  }
}
</style>