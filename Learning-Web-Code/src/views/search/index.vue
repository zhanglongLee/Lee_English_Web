<template>
    <div class="search-container">
        <!-- 顶部搜索输入框 -->
        <form action="/">
            <van-search v-model="searchText" show-action placeholder="请输入搜索关键词" @search="onSearch(searchText)"
                @focus="isResultShow=false" @cancel="$router.back()" />
        </form>

        <!-- 搜索结果 -->
        <search-result :searchText="searchText" v-if="isResultShow">
        </search-result>

        <!-- 联想建议 -->
        <!-- <search-suggestion @search="onSearch" :searchText="searchText" v-else-if="searchText">
        </search-suggestion> -->

        <!-- 历史记录 -->
        <search-history
        @update-history="searchHistory = $event"
        @search="onSearch"
        :searchHistory="searchHistory"
        v-else>
        </search-history>
    </div>
</template>

<script>
    import {Toast} from 'vant';
    import {mapState} from 'vuex'
    import {setItem,getItem} from '@/utils/storage'
    import searchSuggestion from './components/search-suggestion.vue';
    import SearchHistory from './components/search-history.vue';
    import SearchResult from './components/search-result.vue';
    export default {
        components: {
            searchSuggestion,
            SearchHistory,
            SearchResult
        },
        name: 'search',
        data() {
            return {
                searchText: '',
                isResultShow: false,
                searchHistory: []
            };
        },
        mounted() {
            this.getHistory();
        },
        computed:{
            ...mapState(['user'])
        },
        methods: {
            onSearch(searchText) {
                this.searchText = searchText;
                // 触发搜索 进行持久化搜索历史
                const index=this.searchHistory.indexOf(searchText);
                // 防止重复加入
                if(index!==-1){
                    this.searchHistory.splice(index,1);
                }
                // 纪录搜索历史
                this.searchHistory.unshift(searchText);
                // 展示搜索结果
                this.isResultShow = true;
            },
            async getHistory(){
                this.searchHistory=getItem('searchHistory')||[];
            }
        },
        watch:{
            // 通过watch统一处理history
            searchHistory:{
                isDeep:true,
                handler(){
                    setItem('searchHistory',this.searchHistory);
                }
            }
        }
    }
</script>

<style scoped lang="less">
    .search-container {}
</style>