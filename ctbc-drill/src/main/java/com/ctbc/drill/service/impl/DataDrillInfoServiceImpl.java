package com.ctbc.drill.service.impl;

import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ctbc.common.core.domain.entity.SysUser;
import com.ctbc.common.utils.SecurityUtils;
import com.ctbc.drill.domain.DataDrillInfo;
import com.ctbc.drill.domain.DataDrillNode;
import com.ctbc.drill.mapper.DataDrillInfoMapper;
import com.ctbc.drill.mapper.DataDrillNodeMapper;
import com.ctbc.drill.service.IDataDrillInfoService;
import com.ctbc.drill.service.IDataDrillNodeService;

/**
 * 下钻报表主表Service业务层处理
 * 
 * @author ctbc
 */
@Service
public class DataDrillInfoServiceImpl implements IDataDrillInfoService 
{
    @Autowired
    private DataDrillInfoMapper dataDrillInfoMapper;
    
    @Autowired
    private DataDrillNodeMapper dataDrillNodeMapper;
    
    @Autowired
    private IDataDrillNodeService dataDrillNodeService;

    /**
     * 查询下钻报表主表
     * 
     * @param id 下钻报表主表主键
     * @return 下钻报表主表
     */
    @Override
    public DataDrillInfo selectDataDrillInfoById(Integer id)
    {
        return dataDrillInfoMapper.selectDataDrillInfoById(id);
    }

    /**
     * 查询下钻报表主表列表
     * 
     * @param dataDrillInfo 下钻报表主表
     * @return 下钻报表主表
     */
    @Override
    public List<DataDrillInfo> selectDataDrillInfoList(DataDrillInfo dataDrillInfo)
    {
        return dataDrillInfoMapper.selectDataDrillInfoList(dataDrillInfo);
    }

    /**
     * 新增下钻报表主表
     * 
     * @param dataDrillInfo 下钻报表主表
     * @return 结果
     */
    @Override
    public int insertDataDrillInfo(DataDrillInfo dataDrillInfo)
    {
        dataDrillInfo.setCreateTime(new Date());
        dataDrillInfo.setUpdateTime(new Date());
        try
        {
            SysUser user = SecurityUtils.getLoginUser().getUser();
            dataDrillInfo.setCreateBy(String.valueOf(user.getUserId()));
        }
        catch (Exception e)
        {
            dataDrillInfo.setCreateBy("1");
        }
        return dataDrillInfoMapper.insertDataDrillInfo(dataDrillInfo);
    }

    /**
     * 修改下钻报表主表
     * 
     * @param dataDrillInfo 下钻报表主表
     * @return 结果
     */
    @Override
    public int updateDataDrillInfo(DataDrillInfo dataDrillInfo)
    {
        return dataDrillInfoMapper.updateDataDrillInfo(dataDrillInfo);
    }

    /**
     * 批量删除下钻报表主表
     * 
     * @param ids 需要删除的下钻报表主表主键
     * @return 结果
     */
    @Override
    public int deleteDataDrillInfoByIds(Integer[] ids)
    {
        for (Integer id : ids)
        {
            List<DataDrillNode> nodes = dataDrillNodeMapper.selectDataDrillNodesByInfoId(id);
            if (nodes != null && !nodes.isEmpty())
            {
                Integer[] nodeIds = nodes.stream().map(DataDrillNode::getId).toArray(Integer[]::new);
                dataDrillNodeMapper.deleteDataDrillNodeByIds(nodeIds);
            }
        }
        return dataDrillInfoMapper.deleteDataDrillInfoByIds(ids);
    }

    /**
     * 删除下钻报表主表信息
     * 
     * @param id 下钻报表主表主键
     * @return 结果
     */
    @Override
    public int deleteDataDrillInfoById(Integer id)
    {
        List<DataDrillNode> nodes = dataDrillNodeMapper.selectDataDrillNodesByInfoId(id);
        if (nodes != null && !nodes.isEmpty())
        {
            Integer[] nodeIds = nodes.stream().map(DataDrillNode::getId).toArray(Integer[]::new);
            dataDrillNodeMapper.deleteDataDrillNodeByIds(nodeIds);
        }
        return dataDrillInfoMapper.deleteDataDrillInfoById(id);
    }

    /**
     * 查询下钻报表主表详情（含节点）
     * 
     * @param id 下钻报表主表主键
     * @return 下钻报表主表
     */
    @Override
    public DataDrillInfo selectDataDrillInfoWithNodes(Integer id)
    {
        DataDrillInfo info = dataDrillInfoMapper.selectDataDrillInfoById(id);
        if (info != null)
        {
            List<DataDrillNode> nodes = dataDrillNodeService.buildNodeTree(id);
            info.setNodes(nodes);
        }
        return info;
    }
}
