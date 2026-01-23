// 公共路由
export const constantRoutes = [
  {
    path: '/login',
    name: 'LoginPage',
    component: () => import(/* webpackChunkName: "login" */ '@/views/login/LoginPage.vue'),
    hidden: true,
  },
  {
    path: '/register',
    name: 'RegisterPage',
    component: () => import(/* webpackChunkName: "login" */ '@/views/RegisterPage.vue'),
    hidden: true,
  },
  {
    path: '/404',
    component: () => import(/* webpackChunkName: "error" */ '@/views/error/404.vue'),
    hidden: true,
  },
  //   {
  //     path: '/401',
  //     component: () => import(/* webpackChunkName: "error" */ '@/views/error/401.vue'),
  //     hidden: true
  //   },
  {
    path: '/',
    redirect: '/home/workbench',
  },
  {
    path: '/home',
    name: 'HomePage',
    component: () => import(/* webpackChunkName: "layout" */ '@/layout/BaseLayout.vue'),
    children: [
      {
        name: 'Workbench',
        path: 'workbench',
        component: () =>
          import(/* webpackChunkName: "workbench" */ '@/views/workbench/WorkbenchPage.vue'),
        meta: {
          title: '工作台',
          icon: 'dashboard',
          affix: true,
        },
      },
      {
        name: 'HomePageEmpty',
        path: '',
        component: () =>
          import(/* webpackChunkName: "workbench" */ '@/views/workbench/WorkbenchPage.vue'),
        meta: {
          title: '工作台',
          icon: 'dashboard',
          affix: true,
        },
      },
    ],
  },
  {
    path: '/system/user/profile',
    name: 'profile',
    component: () => import(/* webpackChunkName: "layout" */ '@/layout/BaseLayout.vue'),
    children: [
      {
        name: 'profileDetail',
        path: '',
        component: () =>
          import(/* webpackChunkName: "profile" */ '@/views/system/user/profile/index.vue'),
        meta: {
          title: '个人信息',
          icon: 'user',
        },
      },
    ],
  },
  {
    path: '/system/file',
    name: 'FileManagement',
    component: () => import(/* webpackChunkName: "layout" */ '@/layout/BaseLayout.vue'),
    meta: {
      title: '文件管理',
      icon: 'file',
    },
    children: [
      {
        path: '',
        name: 'FileList',
        component: () => import(/* webpackChunkName: "file" */ '@/views/system/file/index.vue'),
        meta: {
          title: '文件列表',
          icon: 'file',
        },
      },
    ],
  },
  {
    path: '/system/role/module/authUser',
    name: 'RoleAuthUser',
    component: () => import(/* webpackChunkName: "layout" */ '@/layout/BaseLayout.vue'),
    children: [
      {
        name: 'RoleAuthUserDetail',
        path: '',
        component: () =>
          import(/* webpackChunkName: "role" */ '@/views/system/role/module/authUser.vue'),
        meta: {
          title: '角色授权用户',
          icon: 'user',
        },
      },
    ],
  },
  // 前台路由
  // ...frontendRoutes,
];

export default constantRoutes;
