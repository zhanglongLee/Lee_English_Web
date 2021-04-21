const wordRouter = {
  route: null,
  name: null,
  title: '单词管理',
  type: 'folder', // 类型: folder, tab, view
  icon: 'iconfont icon-table1',
  filePath: 'view/word/', // 文件路径
  order: null,
  inNav: true,
  permission: ['查询所有单词'],
  children: [
    {
      title: '添加单词',
      type: 'view',
      name: 'WordCreate',
      route: '/word/add',
      filePath: 'view/word/word-create.vue',
      inNav: true,
      icon: 'iconfont icon-tushuguanli',
      permission: ['新增单词'],
    },
    {
      title: '单词列表',
      type: 'view',
      name: 'WordList',
      route: '/word/list',
      filePath: 'view/word/word-list.vue',
      inNav: true,
      icon: 'iconfont icon-tushuguanli',
      permission: ['查询所有单词'],
    },
  ],
}

export default wordRouter
