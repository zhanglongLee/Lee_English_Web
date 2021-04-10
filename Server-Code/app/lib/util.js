import { toSafeInteger, get, isInteger } from 'lodash';
import { ParametersException } from 'lin-mizar';

function getSafeParamId(ctx) {
  const id = toSafeInteger(get(ctx.params, 'id'));
  if (!isInteger(id)) {
    throw new ParametersException({
      code: 10030
    });
  }
  return id;
}

function isOptional(val) {
  // undefined , null , ""  , "    ", 皆通过
  if (val === undefined) {
    return true;
  }
  if (val === null) {
    return true;
  }
  if (typeof val === 'string') {
    return val === '' || val.trim() === '';
  }
  return false;
}

// 随机排序
function shuffle(arr) {

  return arr.sort(() => Math.random() - 0.5);

}

// 数组去重
function unique(arr){
  return arr.filter((item, index, list) => {
    return list.indexOf(item) === index
  })
}
export { getSafeParamId, isOptional, shuffle , unique};
