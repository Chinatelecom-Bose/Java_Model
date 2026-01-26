package com.ctbc.sms.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * 短信服务配置属性
 * 
 * @author ruoyi
 * @date 2026-01-20
 */
@Component
@ConfigurationProperties(prefix = "sms")
public class SmsProperties
{
    private String apiUrl;
    private String xAppId;
    private String xAppKey;
    private String systemCode;
    private String userAcct;
    private String password;
    private String lanId;
    private String sceneId;
    private int timeout = 30; // 默认30秒

    // Getters and Setters
    public String getApiUrl()
    {
        return apiUrl;
    }

    public void setApiUrl(String apiUrl)
    {
        this.apiUrl = apiUrl;
    }

    public String getXAppId()
    {
        return xAppId;
    }

    public void setXAppId(String xAppId)
    {
        this.xAppId = xAppId;
    }

    public String getXAppKey()
    {
        return xAppKey;
    }

    public void setXAppKey(String xAppKey)
    {
        this.xAppKey = xAppKey;
    }

    public String getSystemCode()
    {
        return systemCode;
    }

    public void setSystemCode(String systemCode)
    {
        this.systemCode = systemCode;
    }

    public String getUserAcct()
    {
        return userAcct;
    }

    public void setUserAcct(String userAcct)
    {
        this.userAcct = userAcct;
    }

    public String getPassword()
    {
        return password;
    }

    public void setPassword(String password)
    {
        this.password = password;
    }

    public String getLanId()
    {
        return lanId;
    }

    public void setLanId(String lanId)
    {
        this.lanId = lanId;
    }

    public String getSceneId()
    {
        return sceneId;
    }

    public void setSceneId(String sceneId)
    {
        this.sceneId = sceneId;
    }

    public int getTimeout()
    {
        return timeout;
    }

    public void setTimeout(int timeout)
    {
        this.timeout = timeout;
    }
}