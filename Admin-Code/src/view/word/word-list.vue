<template>
  <div>
    <!-- 列表页面 -->
    <div class="container" v-if="!showEdit">
      <div class="header"><div class="title">单词列表</div></div>
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
    <word-modify v-else @editClose="editClose" :rowObj="rowObj"></word-modify>
  </div>
</template>

<script>
import word from '@/model/word'
import MyTable from '@/component/base/table/my-table'
import tablePaper from '@/component/base/tablePaper/tablePaper'
import wordModify from './word-modify'

export default {
  components: {
    MyTable,
    wordModify,
    tablePaper,
  },
  data() {
    return {
      tableColumn: [
        { prop: 'word_name', label: '单词名称'},
        { prop: 'pronunciation', label: '单词音标'},
        { prop: 'translate', label: '单词解释' },
        { prop: 'categoryName', label: '分类名' },
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
    }
  },
  async mounted() {
    this.loading = true
    await this.getWords()
    this.operate = [
      { name: '编辑', func: 'handleEdit', type: 'primary' },
      {
        name: '删除',
        func: 'handleDelete',
        type: 'danger',
        permission: '删除单词',
      },
    ]
    this.loading = false
  },
  methods: {
    // 分页点击
    tablePaperChange(data) {
      this.page.index = data
      this.getWords(this.page)
    },
    async getWords() {
      try {
        const words = await word.getWords(this.page)
        this.page.count = words.total
        this.tableData = words.data

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
    // 删除
    handleEdit(val) {
      this.showEdit = true
      this.rowObj = val.row
    },
    handleDelete(val) {
      this.$confirm('此操作将永久删除该单词 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning',
      }).then(async () => {
        const res = await word.deleteWord(val.row.word_id)
        if (res.code == 0) {
          this.$message({
            type: 'success',
            message: `${res.message}`,
          })
          
          this.getWords(this.page)
        }
      })
    },
    rowClick() {},
    editClose() {
      this.showEdit = false
      this.getWords()
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
