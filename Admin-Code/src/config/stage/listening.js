const listeningRouter = {
  route: null,
  name: null,
  title: '听力练习管理',
  type: 'folder', // 类型: folder, tab, view
  icon: 'iconfont icon-erji1',
  filePath: 'view/listening/', // 文件路径
  order: null,
  inNav: true,
  permission: ['查看所有听力练习'],
  children: [
    {
      title: '添加听力练习',
      type: 'view',
      name: 'listeningCreate',
      route: '/listening/add',
      filePath: 'view/listening/listening-create.vue',
      inNav: true,
      icon: 'iconfont icon-tushuguanli',
      permission: ['新增听力练习'],
    },
    {
      title: '听力练习列表',
      type: 'view',
      name: 'listeningList',
      route: '/listening/list',
      filePath: 'view/listening/listening-list.vue',
      inNav: true,
      icon: 'iconfont icon-tushuguanli',
      permission: ['查看所有听力练习'],
    },
  ],
}

export default listeningRouter
