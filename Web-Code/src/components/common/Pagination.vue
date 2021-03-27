<template>
  <div class="pagination">
    <el-pagination
      background
      layout="prev, pager, next"
      :page-size="size"
      :total="total"
      @current-change="handleChange"
    />
  </div>
</template>

<script>
export default {
  props: {
    size: {
      type: Number,
      default: () => {
        return 5
      }
    },
    total: {
      type: Number,
      default: () => {
        return 10
      }
    }
  },
  methods: {
    handleChange(e) {
      this.$emit('currentChange', e)
    }
  }
}
</script>

<style scoped>
.pagination {
  display: flex;
  justify-content: flex-end;
}
/*带背景的分页按钮背景色begin*/
.pagination
  >>> .el-pagination.is-background
  .el-pager
  li:not(.disabled).active {
  background-color: rgba(175, 144, 92, 1);
  color: #fff;
}
.pagination >>> .el-pagination.is-background .el-pager li.active {
  color: #fff;
  cursor: default;
}
.pagination >>> .el-pagination.is-background .el-pager li:hover {
  color: rgba(175, 144, 92, 1);
}
.pagination >>> .el-pagination.is-background .el-pager li:not(.disabled):hover {
  color: rgba(175, 144, 92, 1);
}
.pagination
  >>> .el-pagination.is-background
  .el-pager
  li:not(.disabled).active:hover {
  background-color: rgba(175, 144, 92, 1);
  color: #fff;
}
/* end */
</style>
