# 短信服务模块 (ctbc-sms)

## 模块介绍
短信服务模块提供统一的短信发送功能，支持与外部短信平台集成。

## 功能特性
- 异步短信发送
- 短信发送日志记录
- 配置化管理
- 统一异常处理

## 接口说明

### 发送短信
- **URL**: `/sms/send`
- **Method**: `POST`
- **Content-Type**: `application/json`
- **Request**:
```json
{
  "phone": "13800138000",
  "content": "短信内容"
}
```
- **Response**:
```json
{
  "code": 200,
  "msg": "发送成功",
  "data": {
    "phone": "13800138000",
    "response": "短信平台返回内容"
  }
}
```

## 配置说明

在 `application.yml` 中添加以下配置（以下为示例配置，实际部署时请使用真实有效的参数）：

```yaml
sms:
  api-url: ${SMS_API_URL:https://api.smsprovider.com/send}  # 短信平台API地址
  x-app-id: ${SMS_XAPPID:797d6e7328d6f23163972ab46aa6b009}  # 应用ID
  x-app-key: ${SMS_XAPPKEY:d076f7b066cdfb5f1338db20257b7fdb}  # 应用密钥
  system-code: ${SMS_SYSTEM_CODE:BSYCXT}  # 系统代码
  user-acct: ${SMS_USER_ACCT:BSYCXT}  # 用户账号
  password: ${SMS_PASSWORD:BSYCXT}  # 密码
  lan-id: ${SMS_LAN_ID:1600}  # 语言ID
  scene-id: ${SMS_SCENE_ID:4973}  # 场景ID
  timeout: ${SMS_TIMEOUT:30}  # 超时时间（秒）
```

### 安全注意事项
- 请勿将敏感配置信息（如APP KEY、密码等）硬编码在配置文件中
- 生产环境建议使用环境变量或安全的配置管理系统
- 定期更换认证凭据以确保安全性
- 确保配置文件不被提交到版本控制系统

## 数据库表

执行 `sql/sys_sms.sql` 脚本创建短信日志表。

## 依赖说明

- Spring Boot Web
- Spring Boot WebFlux (异步HTTP请求)
- MyBatis-Plus
- FastJSON2