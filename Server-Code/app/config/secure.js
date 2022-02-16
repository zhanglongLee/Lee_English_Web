'use strict';

module.exports = {
  db: {
    database: 'english_study_web',// 这个是数据库名字
    host: 'localhost',
    dialect: 'mysql',
    port: 3306,// 如果端口有变，也要修改
    username: 'root',
    password: '253323694',// 这里改成你的数据库密码
    logging: false,
    timezone: '+08:00',
    dialectOptions: {//时间正确格式
      dateStrings: true,
      typeCast: true
    }
  },
  secret:
    '\x88W\xf09\x91\x07\x98\x89\x87\x96\xa0A\xc68\xf9\xecJJU\x17\xc5V\xbe\x8b\xef\xd7\xd8\xd3\xe6\x95*4'
};
