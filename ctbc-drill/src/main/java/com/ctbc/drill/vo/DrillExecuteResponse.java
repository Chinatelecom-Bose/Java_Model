package com.ctbc.drill.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import java.util.List;
import java.util.Map;

/**
 * 下钻执行响应对象
 * 
 * @author ctbc
 */
@ApiModel("下钻执行响应")
public class DrillExecuteResponse
{
    /** 是否成功 */
    @ApiModelProperty(value = "是否成功")
    private boolean success;

    /** 消息 */
    @ApiModelProperty(value = "消息")
    private String message;

    /** 列名列表 */
    @ApiModelProperty(value = "列名列表")
    private List<String> columns;

    /** 数据列表 */
    @ApiModelProperty(value = "数据列表")
    private List<Map<String, Object>> data;

    /** 总数 */
    @ApiModelProperty(value = "总数")
    private Long total;

    public boolean isSuccess()
    {
        return success;
    }

    public void setSuccess(boolean success)
    {
        this.success = success;
    }

    public String getMessage()
    {
        return message;
    }

    public void setMessage(String message)
    {
        this.message = message;
    }

    public List<String> getColumns()
    {
        return columns;
    }

    public void setColumns(List<String> columns)
    {
        this.columns = columns;
    }

    public List<Map<String, Object>> getData()
    {
        return data;
    }

    public void setData(List<Map<String, Object>> data)
    {
        this.data = data;
    }

    public Long getTotal()
    {
        return total;
    }

    public void setTotal(Long total)
    {
        this.total = total;
    }
}
