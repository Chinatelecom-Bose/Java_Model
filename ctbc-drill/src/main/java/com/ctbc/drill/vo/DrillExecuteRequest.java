package com.ctbc.drill.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import java.util.Map;

/**
 * 下钻执行请求对象
 * 
 * @author ctbc
 */
@ApiModel("下钻执行请求")
public class DrillExecuteRequest
{
    /** 报表ID */
    @ApiModelProperty(value = "报表ID", required = true)
    private Integer reportId;

    /** 节点ID */
    @ApiModelProperty(value = "节点ID", required = true)
    private Integer nodeId;

    /** 查询参数 */
    @ApiModelProperty(value = "查询参数")
    private Map<String, Object> params;

    /** 页码 */
    @ApiModelProperty(value = "页码", example = "1")
    private Integer pageNo = 1;

    /** 每页大小 */
    @ApiModelProperty(value = "每页大小", example = "10")
    private Integer pageSize = 10;

    public Integer getReportId()
    {
        return reportId;
    }

    public void setReportId(Integer reportId)
    {
        this.reportId = reportId;
    }

    public Integer getNodeId()
    {
        return nodeId;
    }

    public void setNodeId(Integer nodeId)
    {
        this.nodeId = nodeId;
    }

    public Map<String, Object> getParams()
    {
        return params;
    }

    public void setParams(Map<String, Object> params)
    {
        this.params = params;
    }

    public Integer getPageNo()
    {
        return pageNo;
    }

    public void setPageNo(Integer pageNo)
    {
        this.pageNo = pageNo;
    }

    public Integer getPageSize()
    {
        return pageSize;
    }

    public void setPageSize(Integer pageSize)
    {
        this.pageSize = pageSize;
    }
}
