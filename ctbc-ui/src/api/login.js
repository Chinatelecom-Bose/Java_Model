import request from '@/utils/request';
import { encrypt } from '@/utils/security';

// 登录方法
export function login(data) {
  const password = encrypt(data.password);
  const requestData = {
    username: data.username,
    password: password,
    code: data.code,
    uuid: data.uuid,
    encryptType: 'RSAPKCS1',
  };
  return request({
    url: '/login',
    method: 'post',
    data: requestData,
  });
}

export function getPublicKey() {
  return request({
    url: '/security/public-key',
    headers: {
      isToken: false,
    },
    method: 'get',
  });
}

// 注册方法
export function register(data) {
  return request({
    url: '/register',
    headers: {
      isToken: false,
    },
    method: 'post',
    data: data,
  });
}

// 获取用户详细信息
export function getInfo() {
  return request({
    url: '/getInfo',
    method: 'get',
  });
}

// 退出方法
export function logout() {
  return request({
    url: '/logout',
    method: 'post',
  });
}

// 获取验证码
export function getVerifyCodeImg() {
  return request({
    url: '/captchaImage',
    headers: {
      isToken: false,
    },
    method: 'get',
    timeout: 20000,
  });
}
