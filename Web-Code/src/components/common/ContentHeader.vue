<template>
  <div class="content-header">
    <div class="type-list">
      <el-button
        v-for="(item,index) in dataList"
        :key="index"
        class="btn-item"
        type="primary"
        size="small"
        round
        @click="handleClick(item)"
      >{{ item }}</el-button>
    </div>
    <div class="my-search">
      <el-input size="medium" :placeholder="placeholder" clearable v-model="keyword" class="input-with-select"  @keydown.enter.native="handleSearch">
        <el-button slot="append" icon="el-icon-search" @click="handleSearch"></el-button>
      </el-input>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    typeList: {
      type: Array,
    },
    placeholder: {
      type: String,
      default: '请输入搜索内容',
    },
  },
  data() {
    return {
      keyword: '',
      dataList:[]
    }
  },
  methods: {
    handleClick(data) {
      this.$emit('typeBtnClick', data)
    },
    handleSearch(){
      this.$emit('query', this.keyword)
    }
  },
  mounted(){
    this.dataList = this.typeList
  },
  watch:{
    typeList(newD){
      this.dataList = newD
    },
    keyword(newD){
      if(newD === ''){
        this.$emit('query', this.keyword)
      }
    }
  }
}
</script>

<style lang="scss" scoped>
.content-header{
  position: relative;
  width: 100%;
  height: 60px;
  display: flex;
  align-items: center;
  .my-search{
    position: absolute;
    right: 0px;
  }
}

.type-list{
  margin: 10px 0;
}
.type-list >>> .btn-item{
  padding: 6px 15px;
}

.my-search /deep/ .el-input-group__append {
  border-top-right-radius: 20px;
  border-bottom-right-radius: 20px;
  padding: 0 8px;
  color: #fff;
  background: #409eff;
  border: 1px solid #409eff;
  .el-icon-search {
    font-size: 18px;
  }
}
.my-search /deep/ .el-input__inner {
  border-top-left-radius: 20px;
  border-bottom-left-radius: 20px;
  border-right: none;
  width: 150px;
  transition: all 0.2s linear;

  &:focus {
    width: 250px;
    transition: all 0.3s linear;
  }
}
</style>
