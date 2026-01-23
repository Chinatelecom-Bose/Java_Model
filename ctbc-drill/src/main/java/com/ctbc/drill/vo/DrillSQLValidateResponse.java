package com.ctbc.drill.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import java.util.List;

/**
 * SQL校验响应对象
 * 
 * @author ctbc
 */
@ApiModel("SQL校验响应")
public class DrillSQLValidateResponse
{
    /** 是否成功 */
    @ApiModelProperty(value = "是否成功")
    private boolean success;

    /** 是否有效 */
    @ApiModelProperty(value = "是否有效")
    private boolean valid;

    /** 消息 */
    @ApiModelProperty(value = "消息")
    private String message;

    /** 列名列表 */
    @ApiModelProperty(value = "列名列表")
    private List<String> columns;

    /** 总数 */
    @ApiModelProperty(value = "总数")
    private Long total;

    /** 格式化后的SQL */
    @ApiModelProperty(value = "格式化后的SQL")
    private String sql;

    public boolean isSuccess()
    {
        return success;
    }

    public void setSuccess(boolean success)
    {
        this.success = success;
    }

    public boolean isValid()
    {
        return valid;
    }

    public void setValid(boolean valid)
    {
        this.valid = valid;
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

    public Long getTotal()
    {
        return total;
    }

    public void setTotal(Long total)
    {
        this.total = total;
    }

    public String getSql()
    {
        return sql;
    }

    public void setSql(String sql)
    {
        this.sql = sql;
    }
}
