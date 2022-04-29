import request from '@/utils/request'
import http from '@/utils/axios'

/**
 * 获取文章列表
 * @param {Object} params 
 * @returns 
 */
export const getArticles = params => {
  return http({
      method: 'GET',
      url: '/web/article',
      params
  })
}
/**
 * 获取文章详情
 * @param {Number} id 
 * @returns 
 */
 export const getArticleById = id => {
  return http({
      method: 'GET',
      url: `/web/article/${id}`,
  })
}

// 获取用户收藏文章列表
// Path： /web/collection
// Method： GET
export const getUserCollect = (params) => {
  return http({
      method: 'GET',
      url: '/web/collection',
      params
  })
}

// 收藏文章
// Path： /web/collection
// type为1代表是文章
// id 文章id
// Method： POST
export const addCollect = data => {
    return http({
        method: 'POST',
        url: '/web/collection',
        data
    })
}

// 取消收藏
// Path： /web/collection/:type/:articleId
// type为1代表是文章
// Method： DELETE
export const deleteCollect = ({type,id}) => {
    return http({
        method: 'DELETE',
        url: `/web/collection/${type}/${id}`
    })
}

// 检查该篇文章是否被收藏
// Path： /web/article/isCollected
// article_id 文章id
// web_user_id 用户id
// Method： POST
export const checkArticleIsCollected = data => {
  return http({
      method: 'POST',
      url: '/web/article/isCollected',
      data
  })
}


// 获取新闻列表
// Path： /app/v1_1/articles
// Method： GET
export const getChannelById = params => {
  return request({
      method: 'GET',
      url: '/app/v1_1/articles',
      params
  })
}
// 对文章点赞
// Path： /web/article/likeArticle
// Method： POST
// article_id 文章id
export const userLike = article_id => {
    return http({
        method: 'POST',
        url: '/web/article/likeArticle',
        data:{
          article_id
        }
    })
}

// 取消点赞
// Path： /web/article/unlikeArticle
// Method： POST
// article_id 文章id
export const userCancelLike = article_id => {
    return http({
        method: 'POST',
        url: '/web/article/unlikeArticle',
        data:{
          article_id
        }
    })
}

// 现在用户文章浏览记录
// Path： /web/history/add
// Method： POST
// articleId 文章id
export const addUserArticleHistory = (data) => {
  return http({
      method: 'POST',
      url: '/web/history/add',
      data
  })
}

// 获取用户文章浏览记录列表
// Path： /web/history
// Method： GET
export const getUserArticleHistory = () => {
  return http({
      method: 'GET',
      url: '/web/history'
  })
}

// 删除用户文章浏览记录
// Path： /web/history/:id
// Method： DELETE
export const deleteUserArticleHistory = (id) => {
  return http({
      method: 'DELETE',
      url: `/web/history/${id}`
  })
}