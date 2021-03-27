const articleRouter = {
  route: null,
  name: null,
  title: '文章管理',
  type: 'folder', // 类型: folder, tab, view
  icon: 'iconfont icon-kecheng',
  filePath: 'view/article/', // 文件路径
  order: null,
  inNav: true,
  children: [
    {
      title: '添加文章',
      type: 'view',
      name: 'articleCreate',
      route: '/article/add',
      filePath: 'view/article/article-create.vue',
      inNav: true,
      icon: 'iconfont icon-tushuguanli',
    },
    {
      title: '文章列表',
      type: 'view',
      name: 'articleCreate',
      route: '/article/list',
      filePath: 'view/article/article-list.vue',
      inNav: true,
      icon: 'iconfont icon-tushuguanli',
    },
  ],
}

export default articleRouter
