import { useUserStore } from '@/stores/user';

function authPermission(permission) {
  const all_permission = '*:*:*';
  const permissions = useUserStore().permissions || [];
  if (permission && permission.length > 0 && Array.isArray(permissions)) {
    return permissions.some((v) => {
      return all_permission === v || v === permission;
    });
  } else {
    return false;
  }
}

function authRole(role) {
  const super_admin = 'admin';
  const roles = useUserStore().roles || [];
  if (role && role.length > 0 && Array.isArray(roles)) {
    return roles.some((v) => {
      return super_admin === v || v === role;
    });
  } else {
    return false;
  }
}

export default {
  // 验证用户是否具备某权限
  hasPermi(permission) {
    return authPermission(permission);
  },
  // 验证用户是否含有指定权限，只需包含其中一个
  hasPermiOr(permissions) {
    if (Array.isArray(permissions)) {
      return permissions.some((item) => {
        return authPermission(item);
      });
    }
    return authPermission(permissions);
  },
  // 验证用户是否含有指定权限，必须全部拥有
  hasPermiAnd(permissions) {
    if (Array.isArray(permissions)) {
      return permissions.every((item) => {
        return authPermission(item);
      });
    }
    return authPermission(permissions);
  },
  // 验证用户是否具备某角色
  hasRole(role) {
    return authRole(role);
  },
  // 验证用户是否含有指定角色，只需包含其中一个
  hasRoleOr(roles) {
    if (Array.isArray(roles)) {
      return roles.some((item) => {
        return authRole(item);
      });
    }
    return authRole(roles);
  },
  // 验证用户是否含有指定角色，必须全部拥有
  hasRoleAnd(roles) {
    if (Array.isArray(roles)) {
      return roles.every((item) => {
        return authRole(item);
      });
    }
    return authRole(roles);
  },
};
