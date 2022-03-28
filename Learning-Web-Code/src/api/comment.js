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
// Path： /app/v1_0/comment/likings
// Method： POST
export const likeComment = commentId => {
    return request({
        method: 'POST',
        url: '/app/v1_0/comment/likings',
        data: {
            target: commentId
        }
    })
}
// 取消对评论点赞
// Path： /app/v1_0/comment/likings/:target
// Method： DELETE
export const delikeComment = commentId => {
    return request({
        method: 'DELETE',
        url: `/app/v1_0/comment/likings/${commentId}`
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