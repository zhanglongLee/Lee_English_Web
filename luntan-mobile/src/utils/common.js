import store from '../store/index'
export function isJSON(str) {
  if (typeof str == 'string') {
    try {
      var obj = JSON.parse(str);
      if (typeof obj == 'object' && obj) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}

// 数组去重
export function unique(arr) {
  return arr.filter((item, index, list) => {
    return list.indexOf(item) === index
  })
}

// 敏感词过滤
export function sensitiveWordFilter(content) {

  // 多个敏感词，这里在store的sensitiveWord字段进行配置
  var arrMg = store.state.sensitiveWord.split(",")
  // 正则表达式 i代表不分大小写 g表示全局匹配

  for (var i = 0; i < arrMg.length; i++) {
    // 创建一个正则表达式
    var r = new RegExp(arrMg[i], "ig");
    content = content.replace(r, "*");
  }
  return content
}

// 深克隆
export function deepClone(obj) {
  if (obj === null) return null; //null 的情况
  if (obj instanceof RegExp) return new RegExp(obj); //正则表达式的情况
  if (obj instanceof Date) return new Date(obj); //日期对象的情况
  if (typeof obj != "object") {
    //非复杂类型,直接返回 也是结束递归的条件
    return obj
  }
  //[].__proto__.constructor=Array()
  //{}.__proto__.constructor=Object()
  //因此处理数组的情况时,可以取巧用这个办法来new新对象
  var newObj = new (obj.__proto__.constructor);
  for (var key in obj) {
    newObj[key] = deepClone(obj[key])
  }
  return newObj;
}

export function parseDomGetInnerHtml(arg) {
  if (!arg) {
    return ""
  }
  var objE = document.createElement("div");
  objE.innerHTML = arg;
  let result = ""
  objE.childNodes.forEach(item => {
    result += item.innerText
  })
  return result;

}