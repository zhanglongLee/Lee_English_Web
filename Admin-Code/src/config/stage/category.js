const categoryRouter = {
  route: null,
  name: null,
  title: '分类管理',
  type: 'folder', // 类型: folder, tab, view
  icon: 'iconfont icon-erji',
  filePath: 'view/category/', // 文件路径
  order: null,
  inNav: true,
  children: [
    {
      title: '添加分类',
      type: 'view',
      name: 'categoryCreate',
      route: '/category/add',
      filePath: 'view/category/category-create.vue',
      inNav: true,
      icon: 'iconfont icon-tushuguanli',
    },
    {
      title: '分类列表',
      type: 'view',
      name: 'categoryCreate',
      route: '/category/list',
      filePath: 'view/category/category-list.vue',
      inNav: true,
      icon: 'iconfont icon-tushuguanli',
    },
  ],
}

export default categoryRouter
