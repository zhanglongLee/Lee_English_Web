
import http from '@/utils/axios'


/**
 * 获取用户信息
 * path： /web/user/getInfo
 * method： GET
 */
export const getWebUserInfo = () => {
  return http({
    method: 'GET',
    url: '/web/user/getInfo'
  })
}
/**
 * 更新
 * path： /web/user/updateInfo
 * method： POST
 */
export const updateWebUserInfo = (data) => {
  return http({
    method: 'POST',
    url: '/web/user/updateInfo',
    data
  })
}


// 关注用户
// Path： /web/relation/createOrUpdate
// Method： POST
// to_user_id 被关注用户id
// rel_type 1表示关注 2表示取消关注 3表示拉黑
export const followUser = data => {
  return http({
    method: 'POST',
    url: '/web/relation/createOrUpdate',
    data
  })
}

// 取消关注
// Path： /web/relation/createOrUpdate
// Method： POST
// to_user_id 被关注用户id
// rel_type 1表示关注 2表示取消关注 3表示拉黑
export const cancelFollowUser = data => {
  return http({
    method: 'POST',
    url: '/web/relation/createOrUpdate',
    data
  })
}

// 查询关注用户发布的文章或视频列表
// Path： /web/relation/articleAndVideoList
// Method： GET
export const getArticleAndVideoList = (params) => {
  return http({
    method: 'GET',
    url: '/web/relation/articleAndVideoList',
    params
  })
}

// 检测用户是否被关注
// Path： /web/relation/isFocus
// Method： POST
// to_user_id 被检测的用户id
export const checkAuthorIsFocus = data => {
  return http({
    method: 'POST',
    url: '/web/relation/isFocus',
    data
  })
}


// 编辑用户头像
// Path： /cms/file
// Method： POST
export const updateUserPhoto = data => {
  return http({
    method: 'POST',
    url: '/cms/file',
    data
  })
}