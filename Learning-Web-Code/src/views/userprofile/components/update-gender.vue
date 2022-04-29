<template>
  <div class="update-gender">
    <van-picker
      title="请选择性别"
      show-toolbar
      :columns="columns"
      @confirm="onConfirm"
      @cancel="$emit('close')"
      :default-index="defaultIndex"
      @change="onGenderChange"
    />
  </div>
</template>

<script>
export default {
  name: "updateGender",
  data() {
    return {
      columns: ["男", "女"],
      defaultIndex: this.value,
    };
  },
  props: ["value"],
  methods: {
    onGenderChange(picker, value, index) {
      this.defaultIndex = index;
    },
    async onConfirm() {
      // 这里defaultIndex+1是为了实现1代表男，2代表女
      this.$emit("handleUpdateGender", this.defaultIndex+1);
      this.$emit("close");
    },
  },
};
</script>

<style lang="less" scoped>
</style>