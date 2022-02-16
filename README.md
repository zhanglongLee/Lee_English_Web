# Lee_English_Web
## 快速开始

### 1.导入数据库表+数据

创建名为 `english_study_web` 的数据库

右击`表` -> 执行 `english_study_web` sql文件

> 这里我将所有数据库表的数据都毫无保留的贡献出来了，希望大家给个star

### 2.安装三个，项目的依赖

```shell
cd ./Admin-Code
cnpm i
cd ./Server-Code
cnpm i
cd ./Web-Code
cnpm i
```

### 3.修改配置文件中的数据库密码

```javascript
// ./Server-Code/app/config/secure.js
db: {
    database: 'english_study_web',// 这个是数据库名字
    host: 'localhost',
    dialect: 'mysql',
    port: 3306,// 如果端口有变，也要修改
    username: 'root',
    password: '123456',// 这里改成你的数据库密码
    logging: false,
    timezone: '+08:00',
    dialectOptions: {//时间正确格式
      dateStrings: true,
      typeCast: true
    }
  },
```

### 4.运行项目

```shell
cd ./Admin-Code
npm run dev
cd ./Server-Code
npm run dev
cd ./Web-Code
npm run dev
```

