package com.ctbc.sms;

import com.ctbc.sms.dto.SendSmsDto;
import com.ctbc.sms.service.ISmsService;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import jakarta.annotation.Resource;

/**
 * 短信服务测试类
 * 
 * @author ruoyi
 * @date 2026-01-20
 */
@SpringBootTest
public class SmsServiceTest {
    @Resource
    private ISmsService smsService;

    @Test
    public void testSendSms() throws Exception {
        SendSmsDto dto = new SendSmsDto();
        dto.setPhone("13800138000");
        dto.setContent("测试短信内容");

        ISmsService.SmsResult result = smsService.sendSmsAsync(dto).get();

        System.out.println("短信发送结果: " + result.isSuccess() + ", 消息: " + result.getMessage());
    }
}