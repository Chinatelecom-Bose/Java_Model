package com.ctbc.drill.controller;

import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
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
import com.ctbc.drill.domain.DataDrillInfo;
import com.ctbc.drill.service.IDataDrillInfoService;

/**
 * 下钻报表主表Controller
 * 
 * @author ctbc
 */
@RestController
@RequestMapping("/drill/info")
public class DataDrillInfoController extends BaseController {
    private static final Logger logger = LoggerFactory.getLogger(DataDrillInfoController.class);

    @Autowired
    private IDataDrillInfoService dataDrillInfoService;

    /**
     * 查询下钻报表主表列表
     */
    @PreAuthorize("@ss.hasPermi('drill:info:list')")
    @GetMapping("/list")
    public TableDataInfo list(DataDrillInfo dataDrillInfo) {
        logger.info("=== DRILL DEBUG: 接收到 /drill/info/list 请求 ===");
        logger.info("=== DRILL DEBUG: 请求参数: {}", dataDrillInfo);
        logger.info("=== DRILL DEBUG: 开始处理分页查询 ===");

        startPage();
        List<DataDrillInfo> list = dataDrillInfoService.selectDataDrillInfoList(dataDrillInfo);

        logger.info("=== DRILL DEBUG: 查询结果数量: {}", list.size());
        logger.info("=== DRILL DEBUG: 返回数据表信息 ===");

        return getDataTable(list);
    }

    /**
     * 查询下钻报表主表详情（含节点）
     */
    @PreAuthorize("@ss.hasPermi('drill:info:query')")
    @GetMapping(value = "/detail/{id}")
    public AjaxResult getDetail(@PathVariable("id") Integer id) {
        return AjaxResult.success(dataDrillInfoService.selectDataDrillInfoWithNodes(id));
    }

    /**
     * 获取下钻报表主表详细信息
     */
    @PreAuthorize("@ss.hasPermi('drill:info:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Integer id) {
        return AjaxResult.success(dataDrillInfoService.selectDataDrillInfoById(id));
    }

    /**
     * 新增下钻报表主表
     */
    @PreAuthorize("@ss.hasPermi('drill:info:add')")
    @Log(title = "下钻报表主表", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody DataDrillInfo dataDrillInfo) {
        return toAjax(dataDrillInfoService.insertDataDrillInfo(dataDrillInfo));
    }

    /**
     * 修改下钻报表主表
     */
    @PreAuthorize("@ss.hasPermi('drill:info:edit')")
    @Log(title = "下钻报表主表", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody DataDrillInfo dataDrillInfo) {
        return toAjax(dataDrillInfoService.updateDataDrillInfo(dataDrillInfo));
    }

    /**
     * 删除下钻报表主表
     */
    @PreAuthorize("@ss.hasPermi('drill:info:remove')")
    @Log(title = "下钻报表主表", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Integer[] ids) {
        return toAjax(dataDrillInfoService.deleteDataDrillInfoByIds(ids));
    }
}
