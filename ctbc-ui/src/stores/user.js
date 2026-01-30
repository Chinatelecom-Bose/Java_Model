import { defineStore } from 'pinia';
import { login, logout, getInfo, getPublicKey } from '@/api/login';
import { getToken, setToken, removeToken } from '@/utils/auth';
import { importPublicKey, encryptRSAOAEP } from '@/utils/security';

export const useUserStore = defineStore('user', {
  state: () => ({
    token: getToken(),
    name: '',
    avatar: '',
    roles: [],
    permissions: [],
    nickName: '',
    loginDate: '',
    loginIp: '',
    avatarUploadEnabled: false,
  }),

  getters: {
    // 用户信息对象，用于向后兼容
    userInfo: (state) => ({
      userName: state.name,
      nickName: state.nickName,
      avatar: state.avatar,
      roles: state.roles,
      permissions: state.permissions,
      loginDate: state.loginDate,
      loginIp: state.loginIp,
      avatarUploadEnabled: state.avatarUploadEnabled,
    }),
  },

  actions: {
    // 登录
    async login(loginInfo) {
      const keyRes = await getPublicKey();
      const pubKey = await importPublicKey(keyRes.publicKey);
      const encPwd = await encryptRSAOAEP(pubKey, loginInfo.password);
      const res = await login({
        username: loginInfo.username,
        password: encPwd,
        code: loginInfo.code,
        uuid: loginInfo.uuid,
        // encryptType: 'RSAOAEP256',
        encryptType: 'RSAPKCS1', // 更改为新的加密类型
      });
      setToken(res.token);
      this.token = res.token;
    },

    // 获取用户信息
    async getInfo() {
      const res = await getInfo();
      this.roles = res.roles;
      this.name = res.user.userName;
      this.avatar = res.user.avatar;
      this.permissions = res.permissions;
      this.nickName = res.user.nickName;
      this.loginDate = res.user.loginDate;
      this.loginIp = res.user.loginIp;
      this.avatarUploadEnabled = !!res.avatarUploadEnabled;
      return res;
    },

    // 退出系统
    async logout() {
      await logout();
      this.token = '';
      this.roles = [];
      this.permissions = [];
      removeToken();
    },

    // 前端 登出
    fedLogout() {
      this.token = '';
      removeToken();
    },
  },
});
