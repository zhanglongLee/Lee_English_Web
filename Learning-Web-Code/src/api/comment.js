import request from '@/utils/request'
import http from '@/utils/axios'
// 获取评论
// Path： /v1/comment/:articleId
// Method： GET
export const getCommentList = (articleId) => {
  return http({
    method: 'GET',
    url: `/v1/comment/${articleId}`
  })
}

// 对评论点赞
// Path： /v1/comment/likeComment
// Method： POST
// id 评论id
export const likeComment = commentId => {
  return http({
    method: 'POST',
    url: '/v1/comment/likeComment',
    data: {
      id: commentId
    }
  })
}
// 取消对评论点赞
// Path： /v1/comment/unlikeComment
// Method： POST
// id 评论id
export const delikeComment = commentId => {
  return http({
    method: 'POST',
    url: '/v1/comment/unlikeComment',
    data: {
      id: commentId
    }
  })
}

// 添加评论或回复评论
// Path： /v1/comment
// Method： POST
export const addComment = data => {
  return http({
    method: 'POST',
    url: '/v1/comment',
    data
  })
}