package com.ctbc.drill.controller;

import java.util.List;
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
import com.ctbc.drill.domain.DataDrillNode;
import com.ctbc.drill.service.IDataDrillNodeService;

/**
 * 下钻报表节点表Controller
 * 
 * @author ctbc
 */
@RestController
@RequestMapping("/drill/node")
public class DataDrillNodeController extends BaseController
{
    @Autowired
    private IDataDrillNodeService dataDrillNodeService;

    /**
     * 查询下钻报表节点表列表
     */
    @PreAuthorize("@ss.hasPermi('drill:node:list')")
    @GetMapping("/list")
    public TableDataInfo list(DataDrillNode dataDrillNode)
    {
        startPage();
        List<DataDrillNode> list = dataDrillNodeService.selectDataDrillNodeList(dataDrillNode);
        return getDataTable(list);
    }
    
    /**
     * 根据主表ID查询所有节点
     */
    @PreAuthorize("@ss.hasPermi('drill:node:list')")
    @GetMapping("/listByInfoId/{infoId}")
    public AjaxResult listByInfoId(@PathVariable("infoId") Integer infoId)
    {
        List<DataDrillNode> list = dataDrillNodeService.selectDataDrillNodesByInfoId(infoId);
        return AjaxResult.success(list);
    }
    
    /**
     * 查询根节点列表
     */
    @PreAuthorize("@ss.hasPermi('drill:node:list')")
    @GetMapping("/rootNodes/{infoId}")
    public AjaxResult listRootNodes(@PathVariable("infoId") Integer infoId)
    {
        List<DataDrillNode> list = dataDrillNodeService.selectDataDrillRootNodes(infoId);
        return AjaxResult.success(list);
    }
    
    /**
     * 获取节点树结构
     */
    @PreAuthorize("@ss.hasPermi('drill:node:list')")
    @GetMapping("/tree/{infoId}")
    public AjaxResult getNodeTree(@PathVariable("infoId") Integer infoId)
    {
        List<DataDrillNode> list = dataDrillNodeService.buildNodeTree(infoId);
        return AjaxResult.success(list);
    }

    /**
     * 获取下钻报表节点表详细信息
     */
    @PreAuthorize("@ss.hasPermi('drill:node:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Integer id)
    {
        return AjaxResult.success(dataDrillNodeService.selectDataDrillNodeById(id));
    }

    /**
     * 新增下钻报表节点表
     */
    @PreAuthorize("@ss.hasPermi('drill:node:add')")
    @Log(title = "下钻报表节点表", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody DataDrillNode dataDrillNode)
    {
        return toAjax(dataDrillNodeService.insertDataDrillNode(dataDrillNode));
    }

    /**
     * 修改下钻报表节点表
     */
    @PreAuthorize("@ss.hasPermi('drill:node:edit')")
    @Log(title = "下钻报表节点表", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody DataDrillNode dataDrillNode)
    {
        return toAjax(dataDrillNodeService.updateDataDrillNode(dataDrillNode));
    }

    /**
     * 删除下钻报表节点表
     */
    @PreAuthorize("@ss.hasPermi('drill:node:remove')")
    @Log(title = "下钻报表节点表", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Integer[] ids)
    {
        return toAjax(dataDrillNodeService.deleteDataDrillNodeByIds(ids));
    }
    
    /**
     * 获取子节点列表
     */
    @PreAuthorize("@ss.hasPermi('drill:node:list')")
    @GetMapping("/children/{parentId}")
    public AjaxResult getNodeChildren(@PathVariable("parentId") Integer parentId)
    {
        List<DataDrillNode> list = dataDrillNodeService.selectDataDrillNodeList(new DataDrillNode());
        List<DataDrillNode> children = list.stream()
            .filter(node -> parentId.equals(node.getParentId()))
            .toList();
        return AjaxResult.success(children);
    }
}
