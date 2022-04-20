/**
 * 存储tokens
 * @param {string} accessToken
 * @param {string} refreshToken
 */
export function saveTokens(accessToken, refreshToken) {
  sessionStorage.setItem('access_token', `Bearer ${accessToken}`)
  sessionStorage.setItem('refresh_token', `Bearer ${refreshToken}`)
}

/**
 * 存储access_token
 * @param {string} accessToken
 */
export function saveAccessToken(accessToken) {
  sessionStorage.setItem('access_token', `Bearer ${accessToken}`)
}

/**
 * 获得某个token
 * @param {string} tokenKey
 */
export function getToken(tokenKey) {
  return sessionStorage.getItem(tokenKey)
}

/**
 * 移除token
 */
export function removeToken() {
  sessionStorage.removeItem('access_token')
  // sessionStorage.removeItem('refresh_token')
}
