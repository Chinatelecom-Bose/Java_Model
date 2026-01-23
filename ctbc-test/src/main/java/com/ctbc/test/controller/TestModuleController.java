package com.ctbc.test.controller;

import java.util.List;
import java.util.Map;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ctbc.common.annotation.Log;
import com.ctbc.common.core.controller.BaseController;
import com.ctbc.common.core.domain.AjaxResult;
import com.ctbc.common.core.page.TableDataInfo;
import com.ctbc.common.enums.BusinessType;
import com.ctbc.test.domain.TestEntity;
import com.ctbc.test.service.ITestService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

/**
 * 测试Controller
 * 
 * @author ctbc
 */
@Api(tags = "测试模块")
@RestController
@RequestMapping("/test")
public class TestModuleController extends BaseController
{
    @Autowired
    private ITestService testService;

    /**
     * 查询数据详情列表
     */
    @ApiOperation("查询数据详情列表")
    @PreAuthorize("@ss.hasPermi('test:test:list')")
    @GetMapping("/list")
    public TableDataInfo list(TestEntity testEntity)
    {
        startPage();
        List<TestEntity> list = testService.selectTestEntityList(testEntity);
        return getDataTable(list);
    }

    /**
     * 获取数据详情详细信息
     */
    @ApiOperation("获取数据详情详细信息")
    @PreAuthorize("@ss.hasPermi('test:test:query')")
    @GetMapping(value = "/{monthNo}")
    public AjaxResult getInfo(@PathVariable("monthNo") Integer monthNo)
    {
        return AjaxResult.success(testService.selectTestEntityByMonthNo(monthNo));
    }

    /**
     * 新增数据详情
     */
    @ApiOperation("新增数据详情")
    @PreAuthorize("@ss.hasPermi('test:test:add')")
    @Log(title = "数据详情", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody TestEntity testEntity)
    {
        return toAjax(testService.insertTestEntity(testEntity));
    }

    /**
     * 修改数据详情
     */
    @ApiOperation("修改数据详情")
    @PreAuthorize("@ss.hasPermi('test:test:edit')")
    @Log(title = "数据详情", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody TestEntity testEntity)
    {
        return toAjax(testService.updateTestEntity(testEntity));
    }

    /**
     * 删除数据详情
     */
    @ApiOperation("删除数据详情")
    @PreAuthorize("@ss.hasPermi('test:test:remove')")
    @Log(title = "数据详情", businessType = BusinessType.DELETE)
    @DeleteMapping("/{monthNos}")
    public AjaxResult remove(@PathVariable Integer[] monthNos)
    {
        return toAjax(testService.deleteTestEntityByMonthNos(monthNos));
    }

    /**
     * 获取测试统计数据
     */
    @ApiOperation("获取测试统计数据")
    @PreAuthorize("@ss.hasPermi('test:test:list')")
    @GetMapping("/stats")
    public AjaxResult getStats(TestEntity testEntity)
    {
        List<Map<String, Object>> stats = testService.getTestStats(testEntity);
        return AjaxResult.success(stats);
    }

    /**
     * 测试API接口连通性
     */
    @ApiOperation("测试API接口连通性")
    @GetMapping("/api-connectivity")
    public AjaxResult testApiConnectivity()
    {
        Map<String, Object> result = testService.testApiConnectivity(null);
        return AjaxResult.success(result);
    }
}