import { defineStore } from 'pinia';
import { login, logout, getInfo } from '@/api/login';
import { getToken, setToken, removeToken } from '@/utils/auth';

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
    infoLoaded: false,
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
      const res = await login(loginInfo);
      setToken(res.token);
      this.token = res.token;
    },

    // 获取用户信息
    async getInfo() {
      // 如果已经加载过用户信息，直接返回
      if (this.infoLoaded) {
        return { roles: this.roles };
      }
      
      const res = await getInfo();
      this.roles = res.roles;
      this.name = res.user.userName;
      this.avatar = res.user.avatar;
      this.permissions = res.permissions;
      this.nickName = res.user.nickName;
      this.loginDate = res.user.loginDate;
      this.loginIp = res.user.loginIp;
      this.avatarUploadEnabled = !!res.avatarUploadEnabled;
      this.infoLoaded = true;
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
