package com.ctbc.drill.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import jakarta.validation.constraints.NotBlank;

/**
 * SQL校验请求对象
 * 
 * @author ctbc
 */
@ApiModel("SQL校验请求")
public class DrillSQLValidateRequest
{
    /** SQL语句 */
    @ApiModelProperty(value = "SQL语句", required = true)
    @NotBlank(message = "SQL语句不能为空")
    private String sqlText;

    public String getSqlText()
    {
        return sqlText;
    }

    public void setSqlText(String sqlText)
    {
        this.sqlText = sqlText;
    }
}
