<template>
  <div class="update-birthday">
    <van-datetime-picker
      v-model="currentDate"
      type="date"
      title="选择年月日"
      :min-date="minDate"
      :max-date="maxDate"
      @cancel="$emit('close')"
      @confirm="onConfirm"
    />
  </div>
</template>

<script>
import dayjs from "dayjs";
export default {
  name: "updateBirthday",
  data() {
    return {
      minDate: new Date(1900, 0, 1),
      maxDate: new Date(),
      currentDate: new Date(this.value),
    };
  },
  props: ["value"],
  methods: {
    onConfirm() {
      const date = dayjs(this.currentDate).format("YYYY-MM-DD");
      this.$emit("handleUpdateBirthday", date);
      this.$emit("close");
    },
  },
};
</script>

<style lang="less" scoped>
</style>