<template>
  <div class="my-table">
    <el-table
    :data="tableData"
    tooltip-effect="dark"
    style="width: 100%">
      <el-table-column
        v-for="(item,index) in columnData"
        :key="index"
        :fixed="item.fixed"
        :prop="item.prop"
        :label="item.label"
        :width="item.width"
        :show-overflow-tooltip="item.tooltip">
      </el-table-column>
      <el-table-column
        fixed="right"
        label="操作"
        width="100">
        <template slot-scope="scope">
          <el-button @click="handleViewClick(scope.row)" type="text" size="small">查看</el-button>
          <el-button @click="handleDelClick(scope.row)" type="text" size="small">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>

<script>
export default {
  name:'my-table',
  props:{
    tableData:{
      type:Array
    },
    columnData:{
      type:Array
    },
    btnData:{
      type:Array
    }
  },
  data(){
    return{

    }
  },
  methods: {
    handleClick(row) {
      console.log(row);
      this.$emit('viewCB',row)
    },
    handleDelClick(row) {
      console.log(row);
      this.$emit('delCB',row)
    }
  },
}
</script>

<style lang="scss" scoped>
.my-table{
  width: 100%;
}
</style>