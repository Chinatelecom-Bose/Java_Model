package com.ctbc.web.controller.system;

import java.util.List;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ctbc.common.annotation.Log;
import com.ctbc.common.core.controller.BaseController;
import com.ctbc.common.core.domain.AjaxResult;
import com.ctbc.common.core.page.TableDataInfo;
import com.ctbc.common.enums.BusinessType;
import com.ctbc.common.utils.poi.ExcelUtil;
import com.ctbc.system.domain.SysConfig;
import com.ctbc.system.service.ISysConfigService;

/**
 * 参数配置 信息操作处理
 * 
 * @author ruoyi
 */
@RestController
@RequestMapping("/system/config")
public class SysConfigController extends BaseController
{
    @Autowired
    private ISysConfigService configService;

    /**
     * 获取参数配置列表
     */
    @PreAuthorize("@ss.hasPermi('system:config:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysConfig config)
    {
        startPage();
        List<SysConfig> list = configService.selectConfigList(config);
        return getDataTable(list);
    }

    @Log(title = "参数管理", businessType = BusinessType.EXPORT)
    @PreAuthorize("@ss.hasPermi('system:config:export')")
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysConfig config)
    {
        List<SysConfig> list = configService.selectConfigList(config);
        ExcelUtil<SysConfig> util = new ExcelUtil<SysConfig>(SysConfig.class);
        util.exportExcel(response, list, "参数数据");
    }

    /**
     * 根据参数编号获取详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:config:query')")
    @GetMapping(value = "/{configId}")
    public AjaxResult getInfo(@PathVariable Long configId)
    {
        return success(configService.selectConfigById(configId));
    }

    /**
     * 根据参数键名查询参数值
     */
    @GetMapping(value = "/configKey/{configKey}")
    public AjaxResult getConfigKey(@PathVariable String configKey)
    {
        return success(configService.selectConfigByKey(configKey));
    }

    /**
     * 获取默认报表ID
     */
    @GetMapping(value = "/getDefaultReportId")
    public AjaxResult getDefaultReportId()
    {
        String configValue = configService.selectConfigByKey("sys.defaultReportId");
        SysConfig config = new SysConfig();
        config.setConfigKey("sys.defaultReportId");
        config.setConfigValue(configValue);
        return success(config);
    }

    /**
     * 新增参数配置
     */
    @PreAuthorize("@ss.hasPermi('system:config:add')")
    @Log(title = "参数管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@Validated @RequestBody SysConfig config)
    {
        if (!configService.checkConfigKeyUnique(config))
        {
            return error("新增参数'" + config.getConfigName() + "'失败，参数键名已存在");
        }
        config.setCreateBy(getUsername());
        return toAjax(configService.insertConfig(config));
    }

    /**
     * 修改参数配置
     */
    @PreAuthorize("@ss.hasPermi('system:config:edit')")
    @Log(title = "参数管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@Validated @RequestBody SysConfig config)
    {
        if (!configService.checkConfigKeyUnique(config))
        {
            return error("修改参数'" + config.getConfigName() + "'失败，参数键名已存在");
        }
        config.setUpdateBy(getUsername());
        return toAjax(configService.updateConfig(config));
    }

    /**
     * 删除参数配置
     */
    @PreAuthorize("@ss.hasPermi('system:config:remove')")
    @Log(title = "参数管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{configIds}")
    public AjaxResult remove(@PathVariable Long[] configIds)
    {
        configService.deleteConfigByIds(configIds);
        return success();
    }

    /**
     * 设置默认报表ID
     */
    @PreAuthorize("@ss.hasPermi('system:config:edit')")
    @Log(title = "参数管理", businessType = BusinessType.UPDATE)
    @PostMapping("/setDefaultReportId")
    public AjaxResult setDefaultReportId(@RequestBody SysConfig config)
    {
        if (config.getConfigValue() == null)
        {
            return error("默认报表ID不能为空");
        }
        
        // 检查配置是否已存在
        String existingValue = configService.selectConfigByKey("sys.defaultReportId");
        
        if (existingValue != null && !existingValue.isEmpty())
        {
            // 配置已存在，通过查询配置列表获取完整的配置对象
            SysConfig searchConfig = new SysConfig();
            searchConfig.setConfigKey("sys.defaultReportId");
            List<SysConfig> configList = configService.selectConfigList(searchConfig);
            
            if (!configList.isEmpty())
            {
                SysConfig existingConfig = configList.get(0);
                existingConfig.setConfigValue(config.getConfigValue());
                existingConfig.setUpdateBy(getUsername());
                return toAjax(configService.updateConfig(existingConfig));
            }
        }
        
        // 配置不存在或查询失败，新增配置
        config.setConfigKey("sys.defaultReportId");
        config.setConfigName("默认报表ID");
        config.setRemark("业务免费页面默认进入的报表ID");
        config.setConfigType("Y");
        config.setCreateBy(getUsername());
        config.setUpdateBy(getUsername());
        return toAjax(configService.insertConfig(config));
    }

    /**
     * 获取父级菜单ID
     */
    @GetMapping(value = "/getParentMenuId")
    public AjaxResult getParentMenuId()
    {
        String configValue = configService.selectConfigByKey("sys.parentMenuId");
        SysConfig config = new SysConfig();
        config.setConfigKey("sys.parentMenuId");
        config.setConfigValue(configValue);
        return success(config);
    }

    /**
     * 设置父级菜单ID
     */
    @PostMapping("/setParentMenuId")
    public AjaxResult setParentMenuId(@RequestBody SysConfig config)
    {
        String configValue = config.getConfigValue();
        
        // 检查配置是否已存在
        String existingValue = configService.selectConfigByKey("sys.parentMenuId");
        
        if (existingValue != null && !existingValue.isEmpty())
        {
            // 配置已存在，通过查询配置列表获取完整的配置对象
            SysConfig searchConfig = new SysConfig();
            searchConfig.setConfigKey("sys.parentMenuId");
            List<SysConfig> configList = configService.selectConfigList(searchConfig);
            
            if (!configList.isEmpty())
            {
                SysConfig existingConfig = configList.get(0);
                existingConfig.setConfigValue(configValue != null ? configValue : "");
                existingConfig.setUpdateBy(getUsername());
                return toAjax(configService.updateConfig(existingConfig));
            }
        }
        
        // 配置不存在或查询失败，新增配置
        config.setConfigKey("sys.parentMenuId");
        config.setConfigName("父级菜单ID");
        config.setRemark("报表生成时的默认parent_id");
        config.setConfigType("Y");
        if (configValue == null) {
            config.setConfigValue("");
        }
        config.setCreateBy(getUsername());
        config.setUpdateBy(getUsername());
        return toAjax(configService.insertConfig(config));
    }

    /**
     * 刷新参数缓存
     */
    @PreAuthorize("@ss.hasPermi('system:config:remove')")
    @Log(title = "参数管理", businessType = BusinessType.CLEAN)
    @DeleteMapping("/refreshCache")
    public AjaxResult refreshCache()
    {
        configService.resetConfigCache();
        return success();
    }
}
