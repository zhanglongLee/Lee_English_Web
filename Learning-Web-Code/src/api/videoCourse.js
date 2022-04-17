import http from '@/utils/axios'

/**
 * 获取视频课程列表
 * @param {Object} params 
 * @returns 
 */
export const getVideoCourses = params => {
  return http({
      method: 'GET',
      url: '/web/videoCourse',
      params
  })
}
/**
 * 获取视频课程详情
 * @param {Number} id 
 * @returns 
 */
 export const getVideoCourseById = id => {
  return http({
      method: 'GET',
      url: `/web/videoCourse/${id}`,
  })
}

// 获取用户收藏视频课程列表
// Path： /web/collection
// Method： GET
export const getUserCollect = (params) => {
  return http({
      method: 'GET',
      url: '/web/videoCourseCollection',
      params
  })
}

// 收藏视频课程
// Path： /web/collection
// type为1代表是视频课程
// id 视频课程id
// Method： POST
export const addCollect = data => {
    return http({
        method: 'POST',
        url: '/web/collection',
        data
    })
}

// 取消收藏
// Path： /web/collection/:type/:videoCourseId
// type为1代表是视频课程
// Method： DELETE
export const deleteCollect = ({type,id}) => {
    return http({
        method: 'DELETE',
        url: `/web/collection/${type}/${id}`
    })
}

// 检查该篇视频课程是否被收藏
// Path： /web/videoCourse/isCollected
// video_course_id 视频课程id
// web_user_id 用户id
// Method： POST
export const checkVideoCourseIsCollected = data => {
  return http({
      method: 'POST',
      url: '/web/videoCourse/isCollected',
      data
  })
}


// 对视频课程点赞
// Path： /web/videoCourse/likeVideoCourse
// Method： POST
// video_course_id 视频课程id
export const userLike = video_course_id => {
    return http({
        method: 'POST',
        url: '/web/videoCourse/likeVideoCourse',
        data:{
          video_course_id
        }
    })
}

// 取消点赞
// Path： /web/videoCourse/unlikeVideoCourse
// Method： POST
// video_course_id 视频课程id
export const userCancelLike = video_course_id => {
    return http({
        method: 'POST',
        url: '/web/videoCourse/unlikeVideoCourse',
        data:{
          video_course_id
        }
    })
}

// 现在用户视频课程浏览记录
// Path： /web/history/add
// Method： POST
// videoCourseId 视频课程id
export const addUserVideoCourseHistory = (data) => {
  return http({
      method: 'POST',
      url: '/web/videoCourseHistory/add',
      data
  })
}

// 获取用户视频课程浏览记录列表
// Path： /web/history
// Method： GET
export const getUserVideoCourseHistory = () => {
  return http({
      method: 'GET',
      url: '/web/videoCourseHistory'
  })
}

// 删除用户视频课程浏览记录
// Path： /web/history/:id
// Method： DELETE
export const deleteUserVideoCourseHistory = (id) => {
  return http({
      method: 'DELETE',
      url: `/web/videoCourseHistory/${id}`
  })
}