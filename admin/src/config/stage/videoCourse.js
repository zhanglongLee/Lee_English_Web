const videoCourseRouter = {
  route: null,
  name: null,
  title: '视频课程管理',
  type: 'folder', // 类型: folder, tab, view
  icon: 'iconfont icon-kecheng',
  filePath: 'view/videoCourse/', // 文件路径
  order: null,
  inNav: true,
  permission: ['查询所有视频课程'],
  children: [
    {
      title: '添加视频课程',
      type: 'view',
      name: 'videoCourseCreate',
      route: '/videoCourse/add',
      filePath: 'view/videoCourse/videoCourse-create.vue',
      inNav: true,
      icon: 'iconfont icon-tushuguanli',
      permission: ['新增视频课程'],
    },
    {
      title: '视频课程列表',
      type: 'view',
      name: 'videoCourseList',
      route: '/videoCourse/list',
      filePath: 'view/videoCourse/videoCourse-list.vue',
      inNav: true,
      icon: 'iconfont icon-tushuguanli',
      permission: ['查询所有视频课程'],
    },
  ],
}

export default videoCourseRouter
