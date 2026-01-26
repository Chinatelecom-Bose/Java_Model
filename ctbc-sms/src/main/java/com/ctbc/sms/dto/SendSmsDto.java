package com.ctbc.sms.dto;

import jakarta.validation.constraints.NotBlank;

/**
 * 发送短信请求对象
 * 
 * @author ruoyi
 * @date 2026-01-20
 */
public class SendSmsDto
{
    /** 电话号码 */
    @NotBlank(message = "电话号码不能为空")
    private String phone;

    /** 短信内容 */
    @NotBlank(message = "短信内容不能为空")
    private String content;

    public String getPhone()
    {
        return phone;
    }

    public void setPhone(String phone)
    {
        this.phone = phone;
    }

    public String getContent()
    {
        return content;
    }

    public void setContent(String content)
    {
        this.content = content;
    }
}