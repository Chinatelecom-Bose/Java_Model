package com.ctbc.sms.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.ctbc.sms.domain.SysSmsLog;

/**
 * 系统短信日志Mapper接口
 * 
 * @author ruoyi
 * @date 2026-01-20
 */
public interface SysSmsLogMapper
{
    /**
     * 查询系统短信日志
     * 
     * @param id 系统短信日志主键
     * @return 系统短信日志
     */
    public SysSmsLog selectSysSmsLogById(Long id);

    /**
     * 查询系统短信日志列表
     * 
     * @param sysSmsLog 系统短信日志
     * @return 系统短信日志集合
     */
    public List<SysSmsLog> selectSysSmsLogList(SysSmsLog sysSmsLog);

    /**
     * 新增系统短信日志
     * 
     * @param sysSmsLog 系统短信日志
     * @return 结果
     */
    public int insertSysSmsLog(SysSmsLog sysSmsLog);

    /**
     * 修改系统短信日志
     * 
     * @param sysSmsLog 系统短信日志
     * @return 结果
     */
    public int updateSysSmsLog(SysSmsLog sysSmsLog);

    /**
     * 删除系统短信日志
     * 
     * @param id 系统短信日志主键
     * @return 结果
     */
    public int deleteSysSmsLogById(Long id);

    /**
     * 批量删除系统短信日志
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysSmsLogByIds(Long[] ids);
}