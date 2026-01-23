package com.ctbc.test.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ctbc.common.annotation.Excel;
import com.ctbc.common.core.domain.BaseEntity;

/**
 * 数据详情对象 data_info_detail
 * 
 * @author ctbc
 * @date 2025-11-28
 */
public class TestEntity extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 月份 */
    @Excel(name = "月份")
    private Integer monthNo;

    /** 经营单位 */
    @Excel(name = "经营单位")
    private String saleCenterName;

    /** 支局 */
    @Excel(name = "支局")
    private String orgName;

    /** 工号 */
    @Excel(name = "工号")
    private String staffCode;

    /** 姓名 */
    @Excel(name = "姓名")
    private String staffName;

    /** 类型 */
    @Excel(name = "类型")
    private String dataType;

    /** 竣工数 */
    @Excel(name = "竣工数")
    private Integer completeNum;

    /** 激活数 */
    @Excel(name = "激活数")
    private Integer activateNum;

    public TestEntity() {
        this.monthNo = null;
        this.saleCenterName = "";
        this.orgName = "";
        this.staffCode = "";
        this.staffName = "";
        this.dataType = "";
        this.completeNum = 0;
        this.activateNum = 0;
    }

    public void setMonthNo(Integer monthNo) 
    {
        this.monthNo = monthNo;
    }

    public Integer getMonthNo() 
    {
        return monthNo;
    }
    public void setSaleCenterName(String saleCenterName) 
    {
        this.saleCenterName = saleCenterName;
    }

    public String getSaleCenterName() 
    {
        return saleCenterName;
    }
    public void setOrgName(String orgName) 
    {
        this.orgName = orgName;
    }

    public String getOrgName() 
    {
        return orgName;
    }
    public void setStaffCode(String staffCode) 
    {
        this.staffCode = staffCode;
    }

    public String getStaffCode() 
    {
        return staffCode;
    }
    public void setStaffName(String staffName) 
    {
        this.staffName = staffName;
    }

    public String getStaffName() 
    {
        return staffName;
    }
    public void setDataType(String dataType) 
    {
        this.dataType = dataType;
    }

    public String getDataType() 
    {
        return dataType;
    }
    public void setCompleteNum(Integer completeNum) 
    {
        this.completeNum = completeNum;
    }

    public Integer getCompleteNum() 
    {
        return completeNum;
    }
    public void setActivateNum(Integer activateNum) 
    {
        this.activateNum = activateNum;
    }

    public Integer getActivateNum() 
    {
        return activateNum;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("monthNo", getMonthNo())
            .append("saleCenterName", getSaleCenterName())
            .append("orgName", getOrgName())
            .append("staffCode", getStaffCode())
            .append("staffName", getStaffName())
            .append("dataType", getDataType())
            .append("completeNum", getCompleteNum())
            .append("activateNum", getActivateNum())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}