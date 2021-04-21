<template>
  <div>
    <!-- 列表页面 -->
    <div class="container" v-if="!showEdit">
      <div class="header">
        <div class="title">听力练习列表</div>
        <my-search class="search" @query="onQueryChange" ref="searchKeyword" />
      </div>
      <!-- 表格 -->
      <my-table
        :tableColumn="tableColumn"
        :tableData="tableData"
        :operate="operate"
        @handleEdit="handleEdit"
        @handleDelete="handleDelete"
        @handleView="handleView"
        @row-click="rowClick"
        v-loading="loading"
      ></my-table>
      <table-paper class="table-paper" :currPageNum="page.index" :PagerOrder="page" @tablePaperEven="tablePaperChange"></table-paper>
    </div>

    <!-- 编辑页面 -->
    <listening-modify v-else @editClose="editClose" :rowObj="rowObj"></listening-modify>
  </div>
</template>

<script>
import listening from '@/model/listening'
import MyTable from '@/component/base/table/my-table'
import tablePaper from '@/component/base/tablePaper/tablePaper'
import listeningModify from './listening-modify'
import MySearch from '@/component/base/search/my-search'

export default {
  components: {
    MyTable,
    listeningModify,
    tablePaper,
    MySearch
  },
  data() {
    return {
      tableColumn: [
        { prop: 'title', label: '标题' },
        { prop: 'categoryName', label: '分类名' },
        { prop: 'description', label: '描述'},
        { prop: 'show_is_published', label: '是否发布' },
        { prop: 'created_at', label: '发布时间' },
      ],
      tableData: [],
      operate: [],
      page: {
        size: 5,
        count: 8,
        index: 1,
        q:''
      },
      showEdit: false,
      rowObj: {},
      loading: false,
      currentPage3: 4,
    }
  },
  async mounted() {
    this.loading = true
    await this.getListenings()
    this.operate = [
      { name: '编辑', func: 'handleEdit', type: 'primary',permission: '修改听力练习内容', },
      {
        name: '删除',
        func: 'handleDelete',
        type: 'danger',
        permission: '删除听力练习',
      },
      // {
      //   name: '查看听力练习',
      //   func: 'handleView',
      //   type: 'primary'
      // },
    ]
    this.loading = false
  },
  methods: {
    // 搜索
    onQueryChange(val){
      this.page.q = val
      this.getListenings()
    },
    // 查看听力
    handleView(val){
      console.log(val)
    },
    // 分页点击
    tablePaperChange(data) {
      this.page.index = data
      this.getListenings(this.page)
    },
    async getListenings() {
      try {
        const listenings = await listening.getListenings(this.page)
        this.page.count = listenings.total
        this.tableData = listenings.data

        this.tableData.forEach(item=>{
          // 处理布尔值显示
          item.show_is_published = !!item.is_published ? '是' : '否'
          item.show_is_comment_enabled = !!item.is_comment_enabled ? '是' : '否'
          item.show_is_top = !!item.is_top ? '是' : '否'
        })
      } catch (error) {
        // 资源不存在
        if (error.code === 10020) {
          this.tableData = []
        }
      }
    },
    handleEdit(val) {
      this.showEdit = true
      this.rowObj = val.row
    },
    // 删除
    handleDelete(val) {
      this.$confirm('此操作将永久删除该听力练习 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning',
      }).then(async () => {
        const res = await listening.deleteListening(val.row.id)
        if (res.code == 0) {
          this.$message({
            type: 'success',
            message: `${res.message}`,
          })
          
          this.getListenings(this.page)
        }
      })
    },
    rowClick() {},
    editClose() {
      this.showEdit = false
      this.getListenings()
    },
  },
}
</script>

<style lang="scss" scoped>
.container {
  padding: 0 30px;

  .header {
    display: flex;
    align-items: center;

    .title {
      height: 59px;
      line-height: 59px;
      color: $parent-title-color;
      font-size: 16px;
      font-weight: 500;
    }
    .search{
      margin-left: 100px;
    }
  }

  .table-paper {
    margin-top: 20px;
  }
}
</style>
