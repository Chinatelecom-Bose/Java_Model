package com.ctbc.sms.service;

import com.ctbc.sms.domain.SysSmsLog;
import com.ctbc.sms.dto.SendSmsDto;

import java.util.concurrent.CompletableFuture;

/**
 * 短信服务接口
 * 
 * @author ruoyi
 * @date 2026-01-20
 */
public interface ISmsService
{
    /**
     * 发送短信
     * 
     * @param dto 发送短信请求对象
     * @return 发送结果
     */
    CompletableFuture<SmsResult> sendSmsAsync(SendSmsDto dto);

    /**
     * 记录短信日志
     * 
     * @param smsLog 短信日志对象
     */
    void saveSmsLog(SysSmsLog smsLog);
    
    /**
     * 短信发送结果内部类
     */
    class SmsResult {
        private boolean success;
        private String message;
        private Object response;

        public SmsResult(boolean success, String message, Object response) {
            this.success = success;
            this.message = message;
            this.response = response;
        }

        // Getters and setters
        public boolean isSuccess() {
            return success;
        }

        public void setSuccess(boolean success) {
            this.success = success;
        }

        public String getMessage() {
            return message;
        }

        public void setMessage(String message) {
            this.message = message;
        }

        public Object getResponse() {
            return response;
        }

        public void setResponse(Object response) {
            this.response = response;
        }
    }
}