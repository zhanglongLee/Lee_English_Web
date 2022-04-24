const categoryRouter = {
  route: null,
  name: null,
  title: '频道管理',
  type: 'folder', // 类型: folder, tab, view
  icon: 'iconfont icon-erji',
  filePath: 'view/category/', // 文件路径
  order: null,
  inNav: true,
  permission: ['查询所有频道'],
  children: [
    {
      title: '添加频道',
      type: 'view',
      name: 'categoryCreate',
      route: '/category/add',
      filePath: 'view/category/category-create.vue',
      inNav: true,
      icon: 'iconfont icon-tushuguanli',
      permission: ['新增频道'],
    },
    {
      title: '频道列表',
      type: 'view',
      name: 'categoryList',
      route: '/category/list',
      filePath: 'view/category/category-list.vue',
      inNav: true,
      icon: 'iconfont icon-tushuguanli',
      permission: ['查询所有频道'],
    },
  ],
}

export default categoryRouter
