/*
* @description 连接redis的方法 get set
*/
const redis = require('redis');
const REDIS_CONF = {
  // 模拟线上配置
  port: 6379,
  host: '127.0.0.1'
};

// 创建客户端
const redisClient = redis.createClient(REDIS_CONF.port, REDIS_CONF.host);
redisClient.on('error', err => {
  console.log('redis error', err)
});

/**
 * redis set
 * @param {string} key 键
 * @param {string} val 值
 * @param {number} timeout 过期时间，单位 s
 */
function set(key, val, timeout = 60 * 60) {
  if (typeof val === 'object') {
    val = JSON.stringify(val)
  }
  redisClient.set(key, val); // 设置redis的key值
  redisClient.expire(key, timeout) // 设置key的过期时间，单位为s
}

/**
 * redis get
 * @param {string} key 键
 */
function get(key) {
  return new Promise((resolve, reject) => {
    redisClient.get(key, (err, val) => {
      if (err) {
        reject(err);
        return
      }
      if (val === null) {
        resolve(null);
        return false;
      }
      try {
        resolve(JSON.parse(val))
      } catch (e) {
        resolve(val)
      }
    })
  })
}
module.exports = {
  get,
  set
};
