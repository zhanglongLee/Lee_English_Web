<template>
    <div class="tablePaper clearfix" v-if="!!PagerOrder">
      <el-pagination style="float: right;"
        background
        :page-size="PagerOrder.size"
        :pager-count="5"
        :current-page="currPageNum"
        layout="prev,pager, next"
        @current-change="currentChange"
        :total="PagerOrder.count">
      </el-pagination>
      <span class="pagerInfo">共 {{ PagerOrder.count }} 条， 每页 {{ PagerOrder.size }} 条  </span>
      <div class="pagerInfo">
        <slot></slot>
      </div>
    </div>
</template>

<script type="text/ecmascript-6">
  export default {
    props: {
      //分页数据
      PagerOrder: {},
      //当前页码
      currPageNum: {
        type: [Number],
        default: 1
      },

    },
    methods: {
      currentChange(data){
        this.$emit("tablePaperEven", data);
      },

    },
    mounted() {


    },
    data () {
      return {
      }
    }
  }
</script>

<style scoped>
  .tablePaper { width: 100%; height: 100%; background: #fff;}
  .pagerInfo{float: right;font-size: 14px;line-height: 32px;margin-right: 10px;}
  
  .page-info input{width: 50px;height: 35px;border: 1px solid #f1f1f1;text-align: center;}
  .page-info span{margin-right: 10px;font-size: 14px;}

</style>

