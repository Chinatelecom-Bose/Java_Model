package com.ctbc.sms.domain;

import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import com.ctbc.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 系统短信日志对象 sys_sms_log
 * 
 * @author ruoyi
 * @date 2026-01-20
 */
public class SysSmsLog extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键，短信日志id */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    /** 电话号码 */
    private String smsPhoneNumber;

    /** 短信发送时间 */
    private String smsSendTime;

    /** 短信内容 */
    private String smsContent;

    /** 短信平台返回内容 */
    private String smsResponse;

    /** 短信返回码 */
    private String smsCode;

    /** 短信返回信息 */
    private String smsMsg;

    /** 短信发送完成状态 */
    private String smsSuccess;

    public Long getId()
    {
        return id;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public String getSmsPhoneNumber()
    {
        return smsPhoneNumber;
    }

    public void setSmsPhoneNumber(String smsPhoneNumber)
    {
        this.smsPhoneNumber = smsPhoneNumber;
    }

    public String getSmsSendTime()
    {
        return smsSendTime;
    }

    public void setSmsSendTime(String smsSendTime)
    {
        this.smsSendTime = smsSendTime;
    }

    public String getSmsContent()
    {
        return smsContent;
    }

    public void setSmsContent(String smsContent)
    {
        this.smsContent = smsContent;
    }

    public String getSmsResponse()
    {
        return smsResponse;
    }

    public void setSmsResponse(String smsResponse)
    {
        this.smsResponse = smsResponse;
    }

    public String getSmsCode()
    {
        return smsCode;
    }

    public void setSmsCode(String smsCode)
    {
        this.smsCode = smsCode;
    }

    public String getSmsMsg()
    {
        return smsMsg;
    }

    public void setSmsMsg(String smsMsg)
    {
        this.smsMsg = smsMsg;
    }

    public String getSmsSuccess()
    {
        return smsSuccess;
    }

    public void setSmsSuccess(String smsSuccess)
    {
        this.smsSuccess = smsSuccess;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("smsPhoneNumber", getSmsPhoneNumber())
            .append("smsSendTime", getSmsSendTime())
            .append("smsContent", getSmsContent())
            .append("smsResponse", getSmsResponse())
            .append("smsCode", getSmsCode())
            .append("smsMsg", getSmsMsg())
            .append("smsSuccess", getSmsSuccess())
            .toString();
    }
}