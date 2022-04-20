import http from '@/utils/axios'
// 获取评论
// Path： /web/videoCourseComment/:articleId
// Method： GET
export const getCommentList = (articleId) => {
  return http({
    method: 'GET',
    url: `/web/videoCourseComment/${articleId}`
  })
}

// 对评论点赞
// Path： /web/videoCourseComment/likeComment
// Method： POST
// id 评论id
export const likeComment = commentId => {
  return http({
    method: 'POST',
    url: '/web/videoCourseComment/likeComment',
    data: {
      id: commentId
    }
  })
}
// 取消对评论点赞
// Path： /web/videoCourseComment/unlikeComment
// Method： POST
// id 评论id
export const delikeComment = commentId => {
  return http({
    method: 'POST',
    url: '/web/videoCourseComment/unlikeComment',
    data: {
      id: commentId
    }
  })
}

// 添加评论或回复评论
// Path： /web/videoCourseComment
// Method： POST
export const addComment = data => {
  return http({
    method: 'POST',
    url: '/web/videoCourseComment',
    data
  })
}