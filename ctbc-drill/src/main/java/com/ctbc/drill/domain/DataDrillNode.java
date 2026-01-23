package com.ctbc.drill.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ctbc.common.annotation.Excel;
import com.ctbc.common.core.domain.BaseEntity;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import java.util.List;

/**
 * 下钻报表节点表对象 data_drill_node
 * 
 * @author ctbc
 */
public class DataDrillNode extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /** 主键ID */
    private Integer id;

    /** 主表ID */
    @Excel(name = "主表ID")
    private Integer infoId;

    /** 父节点ID */
    @Excel(name = "父节点ID")
    private Integer parentId;

    /** 节点名称 */
    @Excel(name = "节点名称")
    @NotBlank(message = "节点名称不能为空")
    @Size(max = 255, message = "节点名称长度不能超过255个字符")
    private String nodeName;

    /** 查询SQL */
    private String sqlText;

    /** 父级关联字段 */
    @Excel(name = "父级关联字段")
    @Size(max = 255, message = "父级关联字段长度不能超过255个字符")
    private String linkField;

    /** 参数名 */
    @Excel(name = "参数名")
    @Size(max = 255, message = "参数名长度不能超过255个字符")
    private String paramName;

    /** 传递字段 */
    @Excel(name = "传递字段")
    @Size(max = 255, message = "传递字段长度不能超过255个字符")
    private String passField;

    /** 状态（0-启用，1-停用） */
    @Excel(name = "状态", readConverterExp = "0=启用,1=停用")
    private String status;

    /** 备注 */
    private String description;

    /** 子节点列表 */
    private List<DataDrillNode> children;

    /** 父节点对象 */
    private DataDrillNode parent;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getInfoId() {
        return infoId;
    }

    public void setInfoId(Integer infoId) {
        this.infoId = infoId;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public String getNodeName() {
        return nodeName;
    }

    public void setNodeName(String nodeName) {
        this.nodeName = nodeName;
    }

    public String getSqlText() {
        return sqlText;
    }

    public void setSqlText(String sqlText) {
        this.sqlText = sqlText;
    }

    public String getLinkField() {
        return linkField;
    }

    public void setLinkField(String linkField) {
        this.linkField = linkField;
    }

    public String getParamName() {
        return paramName;
    }

    public void setParamName(String paramName) {
        this.paramName = paramName;
    }

    public String getPassField() {
        return passField;
    }

    public void setPassField(String passField) {
        this.passField = passField;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<DataDrillNode> getChildren() {
        return children;
    }

    public void setChildren(List<DataDrillNode> children) {
        this.children = children;
    }

    public DataDrillNode getParent() {
        return parent;
    }

    public void setParent(DataDrillNode parent) {
        this.parent = parent;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("infoId", getInfoId())
                .append("parentId", getParentId())
                .append("nodeName", getNodeName())
                .append("sqlText", getSqlText())
                .append("linkField", getLinkField())
                .append("paramName", getParamName())
                .append("passField", getPassField())
                .append("status", getStatus())
                .append("description", getDescription())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .toString();
    }
}
