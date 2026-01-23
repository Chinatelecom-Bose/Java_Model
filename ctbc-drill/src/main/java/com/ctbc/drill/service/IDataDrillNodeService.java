package com.ctbc.drill.service;

import java.util.List;
import com.ctbc.drill.domain.DataDrillNode;

/**
 * 下钻报表节点表Service接口
 * 
 * @author ctbc
 */
public interface IDataDrillNodeService 
{
    /**
     * 查询下钻报表节点表
     * 
     * @param id 下钻报表节点表主键
     * @return 下钻报表节点表
     */
    public DataDrillNode selectDataDrillNodeById(Integer id);

    /**
     * 查询下钻报表节点表列表
     * 
     * @param dataDrillNode 下钻报表节点表
     * @return 下钻报表节点表集合
     */
    public List<DataDrillNode> selectDataDrillNodeList(DataDrillNode dataDrillNode);

    /**
     * 根据主表ID查询所有节点
     * 
     * @param infoId 主表ID
     * @return 下钻报表节点表集合
     */
    public List<DataDrillNode> selectDataDrillNodesByInfoId(Integer infoId);

    /**
     * 查询子节点列表
     * 
     * @param parentId 父节点ID
     * @return 下钻报表节点表集合
     */
    public List<DataDrillNode> selectDataDrillNodeChildren(Integer parentId);

    /**
     * 查询根节点列表
     * 
     * @param infoId 主表ID
     * @return 下钻报表节点表集合
     */
    public List<DataDrillNode> selectDataDrillRootNodes(Integer infoId);

    /**
     * 构建节点树结构
     * 
     * @param infoId 主表ID
     * @return 节点树结构
     */
    public List<DataDrillNode> buildNodeTree(Integer infoId);

    /**
     * 新增下钻报表节点表
     * 
     * @param dataDrillNode 下钻报表节点表
     * @return 结果
     */
    public int insertDataDrillNode(DataDrillNode dataDrillNode);

    /**
     * 修改下钻报表节点表
     * 
     * @param dataDrillNode 下钻报表节点表
     * @return 结果
     */
    public int updateDataDrillNode(DataDrillNode dataDrillNode);

    /**
     * 删除下钻报表节点表
     * 
     * @param id 下钻报表节点表主键
     * @return 结果
     */
    public int deleteDataDrillNodeById(Integer id);

    /**
     * 批量删除下钻报表节点表
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteDataDrillNodeByIds(Integer[] ids);
}
