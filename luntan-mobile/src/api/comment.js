import request from '@/utils/request'
import http from '@/utils/axios'
// 获取评论
// Path： /web/comment/:articleId
// Method： GET
export const getCommentList = (articleId) => {
  return http({
    method: 'GET',
    url: `/web/comment/${articleId}`
  })
}

// 对评论点赞
// Path： /web/comment/likeComment
// Method： POST
// id 评论id
export const likeComment = commentId => {
  return http({
    method: 'POST',
    url: '/web/comment/likeComment',
    data: {
      id: commentId
    }
  })
}
// 取消对评论点赞
// Path： /web/comment/unlikeComment
// Method： POST
// id 评论id
export const delikeComment = commentId => {
  return http({
    method: 'POST',
    url: '/web/comment/unlikeComment',
    data: {
      id: commentId
    }
  })
}

// 添加评论或回复评论
// Path： /web/comment
// Method： POST
export const addComment = data => {
  return http({
    method: 'POST',
    url: '/web/comment',
    data
  })
}