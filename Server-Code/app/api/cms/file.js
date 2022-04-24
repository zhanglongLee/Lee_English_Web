import { LinRouter, ParametersException, config , NotFound } from 'lin-mizar';

import { loginRequired } from '../../middleware/jwt';
import fs from 'fs';
import path from 'path';

const file = new LinRouter({
  prefix: '/cms/file'
});

file.linPost('upload', '/', async ctx => {
  const file = ctx.request.files.file
  const baseName = path.basename(file.path)
  ctx.json({
    path: baseName,
    url: ctx.origin + '/upload/' + baseName
  });

});

export { file };
