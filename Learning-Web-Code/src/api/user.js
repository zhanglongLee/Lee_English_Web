import request from '@/utils/request'

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
// Path： /app/v1_0/user/followings
// Method： POST
export const followUser = userId => {
    return request({
        method: 'POST',
        url: '/app/v1_0/user/followings',
        data: {
            target: userId
        }
    })
}

// 取消关注
// Path： /app/v1_0/user/followings/:target
// Method： DELETE
export const cancelFollowUser = userId => {
    return request({
        method: 'DELETE',
        url: `/app/v1_0/user/followings/${userId}`
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