import http from '@/utils/axios'


// 获取搜索结果
// Path： /web/article
// Method： GET
/**
 * Query

    参数名称	是否必须	示例	备注
    index	否	1	页数，不传默认为1
    size	否	10	每页数量，不传每页数量由后端决定
    q	是		搜索关键词
 * @param  params 
 * @returns 
 */
export const getSearchResult = params => {
    return http({
        method: 'GET',
        url: '/web/article',
        params
    })
}

// 获取视频课程搜索结果
// Path： /web/videoCourse
// Method： GET
/**
 * Query

    参数名称	是否必须	示例	备注
    index	否	1	页数，不传默认为1
    size	否	10	每页数量，不传每页数量由后端决定
    q	是		搜索关键词
 * @param  params 
 * @returns 
 */
    export const getVideoCourseSearchResult = params => {
      return http({
          method: 'GET',
          url: '/web/videoCourse',
          params
      })
  }