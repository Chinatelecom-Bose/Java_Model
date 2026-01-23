package com.ctbc.drill.mapper;

import java.util.List;
import com.ctbc.drill.domain.DataDrillInfo;
import com.ctbc.drill.domain.DataDrillNode;

/**
 * 下钻报表主表Mapper接口
 * 
 * @author ctbc
 */
public interface DataDrillInfoMapper 
{
    /**
     * 查询下钻报表主表
     * 
     * @param id 下钻报表主表主键
     * @return 下钻报表主表
     */
    public DataDrillInfo selectDataDrillInfoById(Integer id);

    /**
     * 查询下钻报表主表列表
     * 
     * @param dataDrillInfo 下钻报表主表
     * @return 下钻报表主表集合
     */
    public List<DataDrillInfo> selectDataDrillInfoList(DataDrillInfo dataDrillInfo);

    /**
     * 查询下钻报表主表详情（含节点）
     * 
     * @param id 下钻报表主表主键
     * @return 下钻报表主表
     */
    public DataDrillInfo selectDataDrillInfoWithNodes(Integer id);

    /**
     * 新增下钻报表主表
     * 
     * @param dataDrillInfo 下钻报表主表
     * @return 结果
     */
    public int insertDataDrillInfo(DataDrillInfo dataDrillInfo);

    /**
     * 修改下钻报表主表
     * 
     * @param dataDrillInfo 下钻报表主表
     * @return 结果
     */
    public int updateDataDrillInfo(DataDrillInfo dataDrillInfo);

    /**
     * 删除下钻报表主表
     * 
     * @param id 下钻报表主表主键
     * @return 结果
     */
    public int deleteDataDrillInfoById(Integer id);

    /**
     * 批量删除下钻报表主表
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteDataDrillInfoByIds(Integer[] ids);
}
