import { LinRouter, ParametersException, config , NotFound } from 'lin-mizar';

import { loginRequired } from '../../middleware/jwt';
import fs from 'fs';
import path from 'path';

const file = new LinRouter({
  prefix: '/cms/file'
});

file.linPost('upload', '/', async ctx => {
  let type = ctx.request.files.file.type
  let typeList = ['image/png','image/jpeg','audio/mpeg']
  console.log(type)
  if(typeList.indexOf(type) === -1){
    throw new NotFound({code:10256})
  }
  if (!Object.keys(ctx.request.files).length>0) {
    throw new ParametersException({ code: 10033 });
  }
  const file = ctx.request.files.file;
  const date = new Date().getTime();
  const ext = path.extname(file.name);
  // 创建可读流
  const reader = fs.createReadStream(file.path);
  let fileRelativePath = date + ext
  let filePath = path.join(__dirname, '../../assets/upload/') + `${fileRelativePath}`;
  // 创建可写流
  const upStream = fs.createWriteStream(filePath);
  // 可读流通过管道写入可写流
  reader.pipe(upStream);
  ctx.json({
    path: fileRelativePath,
    url: config.getItem('siteDomain', 'http://localhost') + '/assets/upload/' + fileRelativePath
  });

});

export { file };
