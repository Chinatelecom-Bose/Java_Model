package com.ctbc.drill.service;

import java.util.List;
import com.ctbc.drill.domain.DataDrillNode;
import com.ctbc.drill.vo.DrillExecuteRequest;
import com.ctbc.drill.vo.DrillExecuteResponse;
import com.ctbc.drill.vo.DrillSQLValidateRequest;
import com.ctbc.drill.vo.DrillSQLValidateResponse;

/**
 * 下钻SQL执行Service接口
 * 
 * @author ctbc
 */
public interface IDrillExecuteService 
{
    /**
     * 校验SQL语句
     * 
     * @param request SQL校验请求
     * @return SQL校验响应
     */
    public DrillSQLValidateResponse validateSQL(DrillSQLValidateRequest request);

    /**
     * 执行下钻查询
     * 
     * @param request 下钻执行请求
     * @return 下钻执行响应
     */
    public DrillExecuteResponse executeDrill(DrillExecuteRequest request);

    /**
     * 获取下钻节点参数
     * 
     * @param nodeId 节点ID
     * @return 参数列表
     */
    public List<String> getNodeParams(Integer nodeId);

    /**
     * 获取下钻树结构
     * 
     * @param infoId 主表ID
     * @return 下钻树结构
     */
    public List<DataDrillNode> getDrillTree(Integer infoId);

    /**
     * 获取父节点SQL的输出字段
     * 
     * @param parentNodeId 父节点ID
     * @return 字段列表
     */
    public List<String> getParentNodeColumns(Integer parentNodeId);
}
