package com.ctbc.drill.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ctbc.common.annotation.Excel;
import com.ctbc.common.core.domain.BaseEntity;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import com.fasterxml.jackson.annotation.JsonProperty;
import java.util.List;

/**
 * 下钻报表主表对象 data_drill_info
 * 
 * @author ctbc
 */
public class DataDrillInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键ID */
    private Integer id;

    /** 报表名称 */
    @Excel(name = "报表名称")
    @NotBlank(message = "报表名称不能为空")
    @Size(max = 255, message = "报表名称长度不能超过255个字符")
    @JsonProperty("reportName")
    private String reportName;

    /** 状态（0-启用，1-停用） */
    @Excel(name = "状态", readConverterExp = "0=启用,1=停用")
    private String status;

    /** 备注 */
    private String description;

    /** 下钻节点列表 */
    private List<DataDrillNode> nodes;

    public Integer getId()
    {
        return id;
    }

    public void setId(Integer id)
    {
        this.id = id;
    }

    public String getReportName()
    {
        return reportName;
    }

    public void setReportName(String reportName)
    {
        this.reportName = reportName;
    }

    public String getStatus()
    {
        return status;
    }

    public void setStatus(String status)
    {
        this.status = status;
    }

    public String getDescription()
    {
        return description;
    }

    public void setDescription(String description)
    {
        this.description = description;
    }

    public List<DataDrillNode> getNodes()
    {
        return nodes;
    }

    public void setNodes(List<DataDrillNode> nodes)
    {
        this.nodes = nodes;
    }

    @Override
    public String toString()
    {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("reportName", getReportName())
            .append("status", getStatus())
            .append("description", getDescription())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
