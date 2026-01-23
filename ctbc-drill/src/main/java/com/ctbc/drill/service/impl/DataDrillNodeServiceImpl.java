package com.ctbc.drill.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ctbc.common.core.domain.entity.SysUser;
import com.ctbc.common.utils.SecurityUtils;
import com.ctbc.drill.domain.DataDrillNode;
import com.ctbc.drill.mapper.DataDrillNodeMapper;
import com.ctbc.drill.service.IDataDrillNodeService;

/**
 * 下钻报表节点表Service业务层处理
 * 
 * @author ctbc
 */
@Service
public class DataDrillNodeServiceImpl implements IDataDrillNodeService 
{
    @Autowired
    private DataDrillNodeMapper dataDrillNodeMapper;

    /**
     * 查询下钻报表节点表
     * 
     * @param id 下钻报表节点表主键
     * @return 下钻报表节点表
     */
    @Override
    public DataDrillNode selectDataDrillNodeById(Integer id)
    {
        return dataDrillNodeMapper.selectDataDrillNodeById(id);
    }

    /**
     * 查询下钻报表节点表列表
     * 
     * @param dataDrillNode 下钻报表节点表
     * @return 下钻报表节点表
     */
    @Override
    public List<DataDrillNode> selectDataDrillNodeList(DataDrillNode dataDrillNode)
    {
        return dataDrillNodeMapper.selectDataDrillNodeList(dataDrillNode);
    }

    /**
     * 新增下钻报表节点表
     * 
     * @param dataDrillNode 下钻报表节点表
     * @return 结果
     */
    @Override
    public int insertDataDrillNode(DataDrillNode dataDrillNode)
    {
        dataDrillNode.setCreateTime(new Date());
        dataDrillNode.setUpdateTime(new Date());
        try
        {
            SysUser user = SecurityUtils.getLoginUser().getUser();
            dataDrillNode.setCreateBy(String.valueOf(user.getUserId()));
        }
        catch (Exception e)
        {
            dataDrillNode.setCreateBy("1");
        }
        return dataDrillNodeMapper.insertDataDrillNode(dataDrillNode);
    }

    /**
     * 修改下钻报表节点表
     * 
     * @param dataDrillNode 下钻报表节点表
     * @return 结果
     */
    @Override
    public int updateDataDrillNode(DataDrillNode dataDrillNode)
    {
        return dataDrillNodeMapper.updateDataDrillNode(dataDrillNode);
    }

    /**
     * 批量删除下钻报表节点表
     * 
     * @param ids 需要删除的下钻报表节点表主键
     * @return 结果
     */
    @Override
    public int deleteDataDrillNodeByIds(Integer[] ids)
    {
        return dataDrillNodeMapper.deleteDataDrillNodeByIds(ids);
    }

    /**
     * 删除下钻报表节点表信息
     * 
     * @param id 下钻报表节点表主键
     * @return 结果
     */
    @Override
    public int deleteDataDrillNodeById(Integer id)
    {
        return dataDrillNodeMapper.deleteDataDrillNodeById(id);
    }

    /**
     * 根据主表ID查询所有节点
     * 
     * @param infoId 主表ID
     * @return 下钻报表节点表集合
     */
    @Override
    public List<DataDrillNode> selectDataDrillNodesByInfoId(Integer infoId)
    {
        return dataDrillNodeMapper.selectDataDrillNodesByInfoId(infoId);
    }

    /**
     * 查询根节点列表
     * 
     * @param infoId 主表ID
     * @return 下钻报表节点表集合
     */
    @Override
    public List<DataDrillNode> selectDataDrillRootNodes(Integer infoId)
    {
        return dataDrillNodeMapper.selectDataDrillRootNodes(infoId);
    }

    /**
     * 查询子节点列表
     * 
     * @param parentId 父节点ID
     * @return 下钻报表节点表集合
     */
    @Override
    public List<DataDrillNode> selectDataDrillNodeChildren(Integer parentId)
    {
        return dataDrillNodeMapper.selectDataDrillNodeChildren(parentId);
    }

    /**
     * 构建节点树
     * 
     * @param infoId 主表ID
     * @return 树形结构的节点列表
     */
    @Override
    public List<DataDrillNode> buildNodeTree(Integer infoId)
    {
        List<DataDrillNode> allNodes = dataDrillNodeMapper.selectDataDrillNodesByInfoId(infoId);
        if (allNodes == null || allNodes.isEmpty())
        {
            return new ArrayList<>();
        }
        return buildTreeRecursive(allNodes, null);
    }

    /**
     * 递归构建树形结构
     * 
     * @param allNodes 所有节点列表
     * @param parentId 父节点ID
     * @return 子节点列表
     */
    private List<DataDrillNode> buildTreeRecursive(List<DataDrillNode> allNodes, Integer parentId)
    {
        List<DataDrillNode> children = new ArrayList<>();
        for (DataDrillNode node : allNodes)
        {
            if (parentId == null)
            {
                if (node.getParentId() == null || node.getParentId() == 0)
                {
                    List<DataDrillNode> nodeChildren = buildTreeRecursive(allNodes, node.getId());
                    node.setChildren(nodeChildren);
                    children.add(node);
                }
            }
            else
            {
                if (parentId.equals(node.getParentId()))
                {
                    List<DataDrillNode> nodeChildren = buildTreeRecursive(allNodes, node.getId());
                    node.setChildren(nodeChildren);
                    children.add(node);
                }
            }
        }
        return children;
    }
}
