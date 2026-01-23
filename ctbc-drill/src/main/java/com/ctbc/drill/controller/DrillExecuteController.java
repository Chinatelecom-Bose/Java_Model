package com.ctbc.drill.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ctbc.common.annotation.Log;
import com.ctbc.common.core.controller.BaseController;
import com.ctbc.common.core.domain.AjaxResult;
import com.ctbc.common.enums.BusinessType;
import com.ctbc.drill.domain.DataDrillNode;
import com.ctbc.drill.service.IDrillExecuteService;
import com.ctbc.drill.vo.DrillExecuteRequest;
import com.ctbc.drill.vo.DrillExecuteResponse;
import com.ctbc.drill.vo.DrillSQLValidateRequest;
import com.ctbc.drill.vo.DrillSQLValidateResponse;

/**
 * 下钻执行Controller
 * 
 * @author ctbc
 */
@RestController
@RequestMapping("/drill/execute")
public class DrillExecuteController extends BaseController
{
    @Autowired
    private IDrillExecuteService drillExecuteService;

    /**
     * 校验SQL语句
     */
    @PreAuthorize("@ss.hasPermi('drill:execute:validate')")
    @Log(title = "下钻执行", businessType = BusinessType.OTHER)
    @PostMapping("/validateSQL")
    public AjaxResult validateSQL(@RequestBody DrillSQLValidateRequest request)
    {
        DrillSQLValidateResponse response = drillExecuteService.validateSQL(request);
        return AjaxResult.success(response);
    }

    /**
     * 执行下钻查询
     */
    @PreAuthorize("@ss.hasPermi('drill:execute:query')")
    @Log(title = "下钻执行", businessType = BusinessType.OTHER)
    @PostMapping("/execute")
    public AjaxResult executeDrill(@RequestBody DrillExecuteRequest request)
    {
        DrillExecuteResponse response = drillExecuteService.executeDrill(request);
        return AjaxResult.success(response);
    }

    /**
     * 获取下钻节点参数
     */
    @PreAuthorize("@ss.hasPermi('drill:execute:query')")
    @Log(title = "下钻执行", businessType = BusinessType.OTHER)
    @GetMapping("/params/{nodeId}")
    public AjaxResult getNodeParams(@PathVariable("nodeId") Integer nodeId)
    {
        List<String> params = drillExecuteService.getNodeParams(nodeId);
        return AjaxResult.success(params);
    }

    /**
     * 获取下钻树结构
     */
    @PreAuthorize("@ss.hasPermi('drill:execute:query')")
    @Log(title = "下钻执行", businessType = BusinessType.OTHER)
    @GetMapping("/tree/{infoId}")
    public AjaxResult getDrillTree(@PathVariable("infoId") Integer infoId)
    {
        List<DataDrillNode> tree = drillExecuteService.getDrillTree(infoId);
        return AjaxResult.success(tree);
    }
}
