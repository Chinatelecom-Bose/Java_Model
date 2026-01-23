package com.ctbc.web.controller.system;

import java.util.Date;
import java.util.List;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import com.ctbc.common.constant.Constants;
import com.ctbc.common.config.ProjectConfig;
import com.ctbc.common.core.domain.AjaxResult;
import com.ctbc.common.core.domain.entity.SysMenu;
import com.ctbc.common.core.domain.entity.SysUser;
import com.ctbc.common.core.domain.model.LoginBody;
import com.ctbc.common.core.domain.model.LoginUser;
import com.ctbc.common.core.text.Convert;
import com.ctbc.common.utils.DateUtils;
import com.ctbc.common.utils.SecurityUtils;
import com.ctbc.common.utils.StringUtils;
import com.ctbc.framework.web.service.SysLoginService;
import com.ctbc.framework.web.service.SysPermissionService;
import com.ctbc.framework.web.service.TokenService;
import com.ctbc.framework.crypto.RsaCryptoService;
import com.ctbc.system.service.ISysConfigService;
import com.ctbc.system.service.ISysMenuService;

/**
 * 登录验证
 * 
 * @author ruoyi
 */
@RestController
public class SysLoginController
{
    @Autowired
    private SysLoginService loginService;

    @Autowired
    private ISysMenuService menuService;

    @Autowired
    private SysPermissionService permissionService;

    @Autowired
    private TokenService tokenService;

    @Autowired
    private ISysConfigService configService;

    @Autowired
    private RsaCryptoService rsaCryptoService;

    @Autowired
    private ProjectConfig projectConfig;

    /**
     * 登录方法
     * 
     * @param loginBody 登录信息
     * @return 结果
     */
    @PostMapping("/login")
    public AjaxResult login(@RequestBody LoginBody loginBody)
    {
        AjaxResult ajax = AjaxResult.success();
        String password = loginBody.getPassword();
        if ("RSAOAEP256".equals(loginBody.getEncryptType())) {
            password = rsaCryptoService.decryptOAEP256(password);
        }
        String token = loginService.login(loginBody.getUsername(), password, loginBody.getCode(),
                loginBody.getUuid());
        ajax.put(Constants.TOKEN, token);
        return ajax;
    }

    /**
     * 获取用户信息
     * 
     * @return 用户信息
     */
    @GetMapping("getInfo")
    public AjaxResult getInfo()
    {
        LoginUser loginUser = SecurityUtils.getLoginUser();
        SysUser user = loginUser.getUser();
        // 角色集合
        Set<String> roles = permissionService.getRolePermission(user);
        // 权限集合
        Set<String> permissions = permissionService.getMenuPermission(user);
        if (!loginUser.getPermissions().equals(permissions))
        {
            loginUser.setPermissions(permissions);
            tokenService.refreshToken(loginUser);
        }
        AjaxResult ajax = AjaxResult.success();
        ajax.put("user", user);
        ajax.put("roles", roles);
        ajax.put("permissions", permissions);
        ajax.put("isDefaultModifyPwd", initPasswordIsModify(user.getPwdUpdateDate()));
        ajax.put("isPasswordExpired", passwordIsExpiration(user.getPwdUpdateDate()));
        ajax.put("avatarUploadEnabled", projectConfig.getUser().isAvatarUploadEnabled());
        return ajax;
    }

    /**
     * 获取路由信息
     * 
     * @return 路由信息
     */
    @GetMapping("getRouters")
    public AjaxResult getRouters()
    {
        Long userId = SecurityUtils.getUserId();
        List<SysMenu> menus = menuService.selectMenuTreeByUserId(userId);
        return AjaxResult.success(menuService.buildMenus(menus));
    }

    @GetMapping("/security/public-key")
    public AjaxResult publicKey()
    {
        AjaxResult ajax = AjaxResult.success();
        ajax.put("alg", "RSAOAEP256");
        ajax.put("publicKey", rsaCryptoService.getPublicKeySpkiBase64());
        return ajax;
    }
    
    // 检查初始密码是否提醒修改
    public boolean initPasswordIsModify(Date pwdUpdateDate)
    {
        Integer initPasswordModify = Convert.toInt(configService.selectConfigByKey("sys.account.initPasswordModify"));
        return initPasswordModify != null && initPasswordModify == 1 && pwdUpdateDate == null;
    }

    // 检查密码是否过期
    public boolean passwordIsExpiration(Date pwdUpdateDate)
    {
        Integer passwordValidateDays = Convert.toInt(configService.selectConfigByKey("sys.account.passwordValidateDays"));
        if (passwordValidateDays != null && passwordValidateDays > 0)
        {
            if (StringUtils.isNull(pwdUpdateDate))
            {
                // 如果从未修改过初始密码，直接提醒过期
                return true;
            }
            Date nowDate = DateUtils.getNowDate();
            return DateUtils.differentDaysByMillisecond(nowDate, pwdUpdateDate) > passwordValidateDays;
        }
        return false;
    }
}
