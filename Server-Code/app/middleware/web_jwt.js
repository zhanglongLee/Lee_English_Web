import {
  NotFound,
  parseHeader,
  RefreshException,
  TokenType,
} from 'lin-mizar';
import { UserModel } from '../model/web-user';
/**
 * 将 user 挂在 ctx 上
 */
async function mountUser(ctx) {
  const { identity } = parseHeader(ctx);
  console.log(identity)
  const user = await UserModel.findByPk(identity);
  if (!user) {
    throw new NotFound({
      code: 10021
    });
  }
  // 将user挂在ctx上
  ctx.currentUser = user;
}

/**
 * 守卫函数，用户登陆即可访问
 */
async function web_loginRequired(ctx, next) {
  if (ctx.request.method !== 'OPTIONS') {
    await mountUser(ctx);

    await next();
  } else {
    await next();
  }
}

/**
 * 守卫函数，用户刷新令牌，统一异常
 */
async function web_refreshTokenRequiredWithUnifyException(ctx, next) {
  if (ctx.request.method !== 'OPTIONS') {
    try {
      const { identity } = parseHeader(ctx, TokenType.REFRESH);
      const user = await UserModel.findByPk(identity);
      if (!user) {
        ctx.throw(
          new NotFound({
            code: 10021
          })
        );
      }
      // 将user挂在ctx上
      ctx.currentUser = user;
    } catch (error) {
      // refresh token 获取失败
      throw new RefreshException();
    }
    await next();
  } else {
    await next();
  }
}

export {
  web_loginRequired,
  web_refreshTokenRequiredWithUnifyException
};
