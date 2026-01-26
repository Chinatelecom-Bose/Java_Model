package com.ctbc.sms.service.impl;

import com.ctbc.sms.domain.SysSmsLog;
import com.ctbc.sms.dto.SendSmsDto;
import com.ctbc.sms.mapper.SysSmsLogMapper;
import com.ctbc.sms.service.ISmsService;
import com.ctbc.common.utils.DateUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import reactor.core.publisher.Mono;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.CompletableFuture;

/**
 * 短信服务实现
 * 
 * @author ruoyi
 * @date 2026-01-20
 */
@Service
@Transactional
public class SmsServiceImpl implements ISmsService
{
    @Autowired
    private com.ctbc.sms.config.SmsProperties smsProperties;

    @Autowired
    private SysSmsLogMapper sysSmsLogMapper;

    @Override
    public CompletableFuture<SmsResult> sendSmsAsync(SendSmsDto dto) {
        return CompletableFuture.supplyAsync(() -> {
            try {
                // 检查必要配置
                if (!isConfigValid()) {
                    return new SmsResult(false, "短信配置缺失，请在配置文件中配置短信相关参数", null);
                }

                // 使用SmsProperties获取配置值
                 String xAppId = smsProperties.getXAppId();
                 String xAppKey = smsProperties.getXAppKey();
                 String apiUrl = smsProperties.getApiUrl();
                 String systemCode = smsProperties.getSystemCode();
                 String userAcct = smsProperties.getUserAcct();
                 String password = smsProperties.getPassword();
                 String lanId = smsProperties.getLanId();
                 String sceneId = smsProperties.getSceneId();
                 int timeoutSeconds = smsProperties.getTimeout();

                // 构建当前时间
                LocalDateTime curTime = LocalDateTime.now();
                String sendTime = curTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));

                // 构建请求体
                Map<String, Object> contractRoot = buildRequestBody(dto.getPhone(), dto.getContent(), curTime);

                // 发送HTTP请求
                Map<String, String> headers = new HashMap<>();
                headers.put("X-APP-ID", xAppId);
                headers.put("X-APP-KEY", xAppKey);
                headers.put("Content-Type", "application/json");

                // 使用WebClient发送请求
                String response = sendHttpRequest(contractRoot, headers);

                // 解析响应
                String[] parsedResponse = parseResponse(response);

                // 保存短信日志
                SysSmsLog smsLog = new SysSmsLog();
                smsLog.setSmsPhoneNumber(dto.getPhone());
                smsLog.setSmsSendTime(sendTime);
                smsLog.setSmsContent(dto.getContent());
                smsLog.setSmsResponse(response);
                smsLog.setSmsCode(parsedResponse[0]); // sms_code
                smsLog.setSmsMsg(parsedResponse[1]);  // sms_msg
                smsLog.setSmsSuccess(parsedResponse[2]); // sms_success

                saveSmsLog(smsLog);

                boolean success = "true".equals(parsedResponse[2]);
                return new SmsResult(success, success ? "发送成功" : parsedResponse[1], response);

            } catch (Exception e) {
                // 记录失败日志
                SysSmsLog smsLog = new SysSmsLog();
                smsLog.setSmsPhoneNumber(dto.getPhone());
                smsLog.setSmsSendTime(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));
                smsLog.setSmsContent(dto.getContent());
                smsLog.setSmsResponse("Exception: " + e.getMessage());
                smsLog.setSmsCode("");
                smsLog.setSmsMsg(e.getMessage());
                smsLog.setSmsSuccess("false");
                
                saveSmsLog(smsLog);

                return new SmsResult(false, "发送失败: " + e.getMessage(), null);
            }
        });
    }

    @Override
    public void saveSmsLog(SysSmsLog smsLog) {
        try {
            sysSmsLogMapper.insertSysSmsLog(smsLog);
        } catch (Exception e) {
            // 记录日志，但不抛出异常，避免影响主流程
            System.err.println("保存短信日志失败: " + e.getMessage());
            e.printStackTrace();
        }
    }

    /**
     * 检查配置是否有效
     */
    private boolean isConfigValid() {
        if (smsProperties == null) {
            return false;
        }
        
        return isNotEmpty(smsProperties.getApiUrl()) &&
               isNotEmpty(smsProperties.getXAppId()) &&
               isNotEmpty(smsProperties.getXAppKey()) &&
               isNotEmpty(smsProperties.getSystemCode()) &&
               isNotEmpty(smsProperties.getUserAcct()) &&
               isNotEmpty(smsProperties.getPassword()) &&
               isNotEmpty(smsProperties.getLanId()) &&
               isNotEmpty(smsProperties.getSceneId());
    }
    
    /**
     * 检查字符串是否非空
     */
    private boolean isNotEmpty(String str) {
        return str != null && !str.trim().isEmpty();
    }

    /**
     * 构建请求体
     */
    @SuppressWarnings("unchecked")
    private Map<String, Object> buildRequestBody(String phone, String content, LocalDateTime curTime) {
        // 获取配置值
        String systemCode = smsProperties.getSystemCode();
        String password = smsProperties.getPassword();
        String userAcct = smsProperties.getUserAcct();
        String lanId = smsProperties.getLanId();
        String sceneId = smsProperties.getSceneId();
        
        String transactionId = systemCode + curTime.format(DateTimeFormatter.ofPattern("yyyyMMddHHmmss")) + "1000000001";
        String requestTime = curTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        String sendDate = curTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));

        Map<String, Object> tcpCont = new HashMap<>();
        tcpCont.put("TransactionId", transactionId);
        tcpCont.put("SystemCode", systemCode);
        tcpCont.put("Password", password);
        tcpCont.put("UserAcct", userAcct);
        tcpCont.put("RequestTime", requestTime);

        Map<String, Object> order = new HashMap<>();
        order.put("AccNbr", phone);
        order.put("LanId", lanId);
        order.put("SendDate", sendDate);
        order.put("OrderContent", content);

        Map<String, Object> bizCont = new HashMap<>();
        bizCont.put("SceneId", sceneId);
        bizCont.put("Order", order);

        Map<String, Object> contractRoot = new HashMap<>();
        contractRoot.put("TcpCont", tcpCont);
        contractRoot.put("BizCont", bizCont);

        Map<String, Object> requestBody = new HashMap<>();
        requestBody.put("ContractRoot", contractRoot);

        return requestBody;
    }

    /**
     * 发送HTTP请求
     */
    private String sendHttpRequest(Map<String, Object> requestBody, Map<String, String> headers) {
        // 获取配置值
        String apiUrl = smsProperties.getApiUrl();
        int timeoutSeconds = smsProperties.getTimeout();
        
        try {
            org.springframework.web.reactive.function.client.WebClient webClient = 
                org.springframework.web.reactive.function.client.WebClient.builder()
                    .baseUrl(apiUrl)
                    .build();

            Mono<String> responseMono = webClient.post()
                .uri("")
                .headers(httpHeaders -> {
                    headers.forEach(httpHeaders::set);
                })
                .bodyValue(requestBody)
                .retrieve()
                .bodyToMono(String.class)
                .timeout(java.time.Duration.ofSeconds(timeoutSeconds));

            return responseMono.block(); // 注意：这里仍然使用block()是为了保持与现有异步框架的一致性
        } catch (Exception e) {
            return "HTTP Error: " + e.getMessage();
        }
    }

    /**
     * 解析响应
     */
    @SuppressWarnings("unchecked")
    private String[] parseResponse(String responseText) {
        String smsCode = "";
        String smsMsg = "";
        String smsSuccess = "false";

        if (responseText == null || responseText.trim().isEmpty()) {
            return new String[]{smsCode, smsMsg, smsSuccess};
        }

        try {
            com.alibaba.fastjson2.JSONObject responseObj = com.alibaba.fastjson2.JSON.parseObject(responseText);
            
            // 尝试不同格式的响应解析
            com.alibaba.fastjson2.JSONObject cr = responseObj.getJSONObject("contractRoot");
            if (cr == null) {
                cr = responseObj.getJSONObject("ContractRoot");
            }
            
            if (cr != null) {
                com.alibaba.fastjson2.JSONObject biz = cr.getJSONObject("bizCont");
                if (biz == null) {
                    biz = cr.getJSONObject("BizCont");
                }
                
                if (biz != null) {
                    Object order = biz.get("order");
                    if (order == null) {
                        order = biz.get("Order");
                    }
                    
                    if (order instanceof java.util.List) {
                        java.util.List<?> orderList = (java.util.List<?>) order; // 使用通配符避免强转风险
                        if (!orderList.isEmpty() && orderList.get(0) instanceof com.alibaba.fastjson2.JSONObject) {
                            com.alibaba.fastjson2.JSONObject item = (com.alibaba.fastjson2.JSONObject) orderList.get(0);
                            smsCode = String.valueOf(item.getOrDefault("respCode", ""));
                            smsMsg = String.valueOf(item.getOrDefault("respDesc", ""));
                        }
                    }
                }

                com.alibaba.fastjson2.JSONObject tcp = cr.getJSONObject("tcpCont");
                if (tcp == null) {
                    tcp = cr.getJSONObject("TcpCont");
                }
                
                if (tcp != null) {
                    if (smsCode.isEmpty()) {
                        smsCode = String.valueOf(tcp.getOrDefault("respCode", ""));
                    }
                    if (smsMsg.isEmpty()) {
                        smsMsg = String.valueOf(tcp.getOrDefault("respDesc", ""));
                    }
                }
            }
            
            smsSuccess = "0000".equals(smsCode) ? "true" : "false";
        } catch (Exception e) {
            // 解析出错时使用默认值
            smsSuccess = "false";
        }

        return new String[]{smsCode, smsMsg, smsSuccess};
    }
}