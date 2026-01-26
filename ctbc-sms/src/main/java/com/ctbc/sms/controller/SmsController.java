package com.ctbc.sms.controller;

import com.ctbc.sms.dto.SendSmsDto;
import com.ctbc.sms.service.ISmsService;
import com.ctbc.common.annotation.Log;
import com.ctbc.common.core.controller.BaseController;
import com.ctbc.common.core.domain.AjaxResult;
import com.ctbc.common.enums.BusinessType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import jakarta.validation.Valid;
import java.util.concurrent.CompletableFuture;

/**
 * 内部短信Controller
 * 
 * @author ruoyi
 * @date 2026-01-20
 */
@RestController
@RequestMapping("/sms")
public class SmsController extends BaseController
{
    @Autowired
    private ISmsService smsService;

    /**
     * 发送短信
     */
    @PostMapping("/send")
    @Log(title = "内部短信", businessType = BusinessType.INSERT)
    public AjaxResult sendSms(@Valid @RequestBody SendSmsDto dto)
    {
        CompletableFuture<ISmsService.SmsResult> future = smsService.sendSmsAsync(dto);
        
        try {
            // 设置合理的超时时间，防止长时间阻塞
            ISmsService.SmsResult result = future.get(30, java.util.concurrent.TimeUnit.SECONDS);
            
            if (result.isSuccess()) {
                return AjaxResult.success("发送成功", result.getResponse());
            } else {
                return AjaxResult.error("短信发送失败: " + result.getMessage());
            }
        } catch (java.util.concurrent.TimeoutException e) {
            return AjaxResult.error("短信发送超时，请稍后重试");
        } catch (Exception e) {
            return AjaxResult.error("短信发送异常: " + e.getMessage());
        }
    }
}