import Koa from 'koa';
import koaBody from 'koa-body';
import cors from '@koa/cors';
import mount from 'koa-mount';
import serve from 'koa-static';
import { config, json, logging, success, jwt, Loader } from 'lin-mizar';
import { PermissionModel } from './model/permission';



/**
 * 跨域支持
 * @param app koa实例
 */
function applyCors(app) {
  app.use(cors());
}

/**
 * 解析文件上传+bodyParse
 * @param app koa实例
 */
function applyKoaBody(app) {
  // 参数解析
  app.use(koaBody({
    multipart: true, // 支持文件上传
  }));
}

/**
 * 静态资源服务
 * @param app koa实例
 * @param prefix 静态资源存放相对路径
 */
function applyStatic(app, prefix = '/assets') {
  const assetsDir = config.getItem('file.storeDir', 'app/static');
  app.use(mount(prefix, serve(assetsDir)));
}

/**
 * json logger 扩展
 * @param app koa实例
 */
function applyDefaultExtends(app) {
  json(app);
  logging(app);
  success(app);
}

/**
 * loader 加载插件和路由文件
 * @param app koa实例
 */
function applyLoader(app) {
  const pluginPath = config.getItem('pluginPath');
  const loader = new Loader(pluginPath, app);
  loader.initLoader();
}

/**
 * jwt
 * @param app koa实例
 */
function applyJwt(app) {
  const secret = config.getItem('secret');
  jwt.initApp(app, secret);
}

/**
 * 初始化Koa实例
 */
async function createApp() {
  const app = new Koa();
  applyKoaBody(app);
  applyCors(app);
  applyStatic(app);
  const { log, error, Lin, multipart } = require('lin-mizar');
  app.use(log);
  app.on('error', error);
  applyDefaultExtends(app);
  applyLoader(app);
  applyJwt(app);
  const lin = new Lin();
  await lin.initApp(app, true); // 是否挂载插件路由，默认为true
  await PermissionModel.initPermission();

  return app;
}

module.exports = { createApp };
