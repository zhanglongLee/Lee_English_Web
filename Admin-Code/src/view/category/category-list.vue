<template>
  <div>
    <!-- 列表页面 -->
    <div class="container" v-if="!showEdit">
      <div class="header"><div class="title">分类列表</div></div>
      <!-- 表格 -->
      <my-table
        :tableColumn="tableColumn"
        :tableData="tableData"
        :operate="operate"
        @handleEdit="handleEdit"
        @handleDelete="handleDelete"
        @row-click="rowClick"
        v-loading="loading"
      ></my-table>
      <table-paper class="table-paper" :currPageNum="page.index" :PagerOrder="page" @tablePaperEven="tablePaperChange"></table-paper>
    </div>

    <!-- 编辑页面 -->
    <category-modify v-else @editClose="editClose" :rowObj="rowObj"></category-modify>
  </div>
</template>

<script>
import category from '@/model/category'
import MyTable from '@/component/base/table/my-table'
import tablePaper from '@/component/base/tablePaper/tablePaper'
import categoryModify from './category-modify'

export default {
  components: {
    MyTable,
    categoryModify,
    tablePaper,
  },
  data() {
    return {
      tableColumn: [
        { prop: 'id', label: 'ID' },
        { prop: 'category_name', label: '分类名称' },
        { prop: 'created_at', label: '创建时间' },
      ],
      tableData: [],
      operate: [],
      page: {
        size: 5,
        count: 8,
        index: 1,
      },
      showEdit: false,
      rowObj: {},
      loading: false,
      currentPage3: 4,
    }
  },
  async mounted() {
    this.loading = true
    await this.getCategorys()
    this.operate = [
      { name: '编辑', func: 'handleEdit', type: 'primary' },
      {
        name: '删除',
        func: 'handleDelete',
        type: 'danger',
        permission: '删除分类',
      },
    ]
    this.loading = false
  },
  methods: {
    // 查看文章
    handleView(val){
      console.log(val)
    },
    // 分页点击
    tablePaperChange(data) {
      this.page.index = data
      this.getCategorys(this.page)
    },
    async getCategorys() {
      try {
        const categorys = await category.getCategorys(this.page)
        this.page.count = categorys.total
        this.tableData = categorys.data
      } catch (error) {
        // 资源不存在
        if (error.code === 10020) {
          this.tableData = []
        }
      }
    },
    // 删除
    handleEdit(val) {
      this.showEdit = true
      this.rowObj = val.row
    },
    handleDelete(val) {
      this.$confirm('此操作将永久删除该分类 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning',
      }).then(async () => {
        const res = await category.deleteCategory(val.row.id)
        if (res.code == 0) {
          this.$message({
            type: 'success',
            message: `${res.message}`,
          })
          
          this.getCategorys(this.page)
        }
      })
    },
    rowClick() {},
    editClose() {
      this.showEdit = false
      this.getCategorys()
    },
  },
}
</script>

<style lang="scss" scoped>
.container {
  padding: 0 30px;

  .header {
    display: flex;
    justify-content: space-between;
    align-items: center;

    .title {
      height: 59px;
      line-height: 59px;
      color: $parent-title-color;
      font-size: 16px;
      font-weight: 500;
    }
  }

  .table-paper {
    margin-top: 20px;
  }
}
</style>
