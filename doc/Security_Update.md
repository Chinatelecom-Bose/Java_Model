# 前后端安全更新技术文档

## 背景与目标
- 目标：登录密码由明文改为加密传输，后端可正常解密；统一敏感配置管理，提升整体安全与可维护性。
- 范围：前端登录与校验、后端登录接口与密钥服务、公钥分发、集中敏感配置、RSA密钥管理、测试验证与发布流程。

## 设计原则
- 安全优先：使用业界推荐的 `RSA-OAEP(SHA-256)`，避免弱填充与过时算法。
- 可维护：敏感项统一在一个配置文件或环境变量中管理；RSA密钥与业务敏感配置分离。
- 最小改动：保持现有登录与权限逻辑不变，只在入口前后加解密。
- 向后兼容：可通过 `encryptType` 识别是否需要解密，支持短期兼容旧前端（不建议长期保留）。

## 实施概览
- 加密算法：`RSA-OAEP` + `SHA-256`。
- 前端：登录前获取公钥，用 `WebCrypto` 加密密码；请求体新增 `encryptType: 'RSAOAEP256'`。
- 后端：根据 `encryptType` 解密 `password` 后执行现有 `SysLoginService.login(...)`；新增公钥分发接口。
- 敏感配置：集中在 `security/env-config.properties`，YAML 中以占位符引用；RSA密钥在 `security/rsa-keys.properties`。

## 前端改动（实现细节）
- 新增接口：`ctbc-ui/src/api/login.js:18` `getPublicKey()`，调用 `GET /security/public-key`，头部 `isToken:false`。
- 加密工具：
  - `ctbc-ui/src/utils/security.js:202` 导入公钥：`importPublicKey(spkiB64)`；`spkiB64` 为 SPKI DER 的 Base64。
  - `ctbc-ui/src/utils/security.js:215` 加密：`encryptRSAOAEP(publicKey, plaintext)`，返回 Base64 密文。
- 登录动作：`ctbc-ui/src/stores/user.js:35`
  - 拉取公钥、导入、公钥加密；请求体包含：
    ```json
    {
      "username": "admin",
      "password": "<Base64密文>",
      "code": "<验证码>",
      "uuid": "<验证码uuid>",
      "encryptType": "RSAOAEP256"
    }
    ```
- 页面：登录表单组件无需改动，密码输入保持原逻辑（参考 `ctbc-ui/src/views/LoginPage.vue:31`）。
- 代码风格与质量：
  - Prettier 3 配置 `trailingComma: 'es5'`（`ctbc-ui/.prettierrc.js:12`）。
  - ESLint 集成 `prettier/prettier` 规则，同步使用 `trailingComma: 'es5'`（`ctbc-ui/.eslintrc.js:56`）。
  - 执行 `npm run format` 后 `npm run lint` 保持规范。

## 后端改动（实现细节）
- 控制器：`ctbc-admin/src/main/java/com/ctbc/web/controller/system/SysLoginController.java`
  - `POST /login`：识别 `encryptType` 为 `'RSAOAEP256'` 时，使用私钥解密 `password` 后传给 `loginService.login(...)`（参考 `:52`）。
  - `GET /security/public-key`：返回 `{ alg: 'RSAOAEP256', publicKey: <SPKI Base64> }`（参考 `:115`）。
- 密钥服务：`ctbc-framework/src/main/java/com/ctbc/framework/crypto/RsaCryptoService.java:21`
  - 提供 `getPublicKeySpkiBase64()` 与 `decryptOAEP256(...)`。
  - 密钥来源优先级：`rsa-keys.properties` > 环境变量 `SECURITY_RSA_PUBLICKEY`/`SECURITY_RSA_PRIVATEKEY` > 启动时生成（开发）。
- 安全配置：`ctbc-framework/src/main/java/com/ctbc/framework/config/SecurityConfig.java:115`
  - 允许匿名访问 `GET /security/public-key`。

## 配置管理（敏感信息）
- 集中文件路径：`ctbc-admin/src/main/resources/security/env-config.properties`。
- 引入方式：`ctbc-admin/src/main/resources/application.yml:55` `spring.config.import: classpath:security/env-config.properties`。
- 使用约定：
  - YAML 中使用占位符 `${KEY}` 引用敏感值，避免将真实值写入 YAML。
  - 环境变量覆盖同名键（优先级最高），用于生产部署与密钥管理系统集成。
- 关键占位符：
  - 数据源：`ctbc-admin/src/main/resources/application-druid.yml:9`、`:10`、`:11` → `${DB_MASTER_URL}`、`${DB_MASTER_USERNAME}`、`${DB_MASTER_PASSWORD}`。
  - Redis/Token：`ctbc-admin/src/main/resources/application.yml:71`、`:73`、`:75`、`:77`、`:96`、`:98`。

## RSA 密钥管理（操作指南）
- 文件位置：`ctbc-admin/src/main/resources/security/rsa-keys.properties`。
- 字段：`publicKey`（SPKI DER Base64）、`privateKey`（PKCS#8 DER Base64）。
- Windows PowerShell：
  ```powershell
  openssl genpkey -algorithm RSA -pkeyopt rsa_keygen_bits:2048 -out private_pkcs8.pem
  openssl pkcs8 -topk8 -inform PEM -in private_pkcs8.pem -outform DER -nocrypt -out private_pkcs8.der
  openssl rsa -in private_pkcs8.pem -pubout -outform DER -out public_spki.der
  [Convert]::ToBase64String([IO.File]::ReadAllBytes('public_spki.der'))
  [Convert]::ToBase64String([IO.File]::ReadAllBytes('private_pkcs8.der'))
  ```
- Linux/macOS：
  ```bash
  openssl genpkey -algorithm RSA -pkeyopt rsa_keygen_bits:2048 -out private_pkcs8.pem
  openssl pkcs8 -topk8 -inform PEM -in private_pkcs8.pem -outform DER -nocrypt -out private_pkcs8.der
  openssl rsa -in private_pkcs8.pem -pubout -outform DER -out public_spki.der
  base64 -w 0 public_spki.der > public_spki.b64
  base64 -w 0 private_pkcs8.der > private_pkcs8.b64
  ```
- 安全要求：密钥不进入版本库；生产优先由环境变量或密钥管理系统注入；轮换时先发布新公钥，前端刷新缓存后切换私钥。

## 接口规范
- 公钥分发
  - Method：`GET`
  - Path：`/security/public-key`
  - Response：`{ "alg": "RSAOAEP256", "publicKey": "<SPKI Base64>" }`
- 登录接口
  - Method：`POST`
  - Path：`/login`
  - Request：`{ username, password: <Base64密文>, code, uuid, encryptType: 'RSAOAEP256' }`
  - Response：`{ token: <JWT> }`
- 错误处理：
  - 解密失败返回统一错误，不暴露内部异常；验证码错误、黑名单、长度校验沿用原错误码与文案。

## 测试与验证
- 前端：抓包确认 `encryptType` 与 `password` 密文；登录成功后路由与权限正常。
- 后端：日志确认进入 `SysLoginService.login(...)`，验证码校验在 `ctbc-framework/src/main/java/com/ctbc/framework/web/service/SysLoginService.java:102`；前置校验在 `:131`。
- 数据库连接：若失败，检查 `env-config.properties` 的 `DB_MASTER_*` 非空且无同名空环境变量；默认值仅在键缺失时生效。

## 发布与回滚
- 发布前检查：
  - `env-config.properties` 与 `rsa-keys.properties` 已填充并随包部署。
  - 生产环境是否使用环境变量覆盖敏感项（如有）。
  - 前端构建后 `npm run lint`、`npm run build` 无错误。
- 回滚策略：
  - 若发生登录异常，可临时移除 `encryptType` 以走明文（仅用于紧急回滚，不建议保留）。
  - 后端保持解密分支健壮性，异常时统一错误码。

## 开发规范（本项目）
- 代码风格：遵循 ESLint/Prettier 规则；`trailingComma: 'es5'`，箭头函数参数使用括号。
- 脚本命令：
  - 格式化：`npm run format`
  - 代码检查：`npm run lint`、`npm run lint:fix`
- 安全实践：不在仓库提交密钥与密码；日志不输出敏感信息；错误返回不包含内部细节。
- 配置管理：敏感值使用占位符与集中文件或环境变量；RSA 密钥与业务敏感配置分文件管理。

## 变更文件清单（主要）
- 前端
  - `ctbc-ui/src/api/login.js:18` 新增公钥接口
  - `ctbc-ui/src/utils/security.js:202`、`:215` 新增加密工具
  - `ctbc-ui/src/stores/user.js:35` 登录集成加密
- 后端
  - `ctbc-framework/src/main/java/com/ctbc/framework/crypto/RsaCryptoService.java:21` 新增 RSA 服务
  - `ctbc-admin/src/main/java/com/ctbc/web/controller/system/SysLoginController.java:115` 公钥接口
  - `ctbc-admin/src/main/java/com/ctbc/web/controller/system/SysLoginController.java:52` 登录解密
  - `ctbc-framework/src/main/java/com/ctbc/framework/config/SecurityConfig.java:115` 放行路径
  - `ctbc-admin/src/main/resources/application.yml:55` 导入集中敏感配置
  - `ctbc-admin/src/main/resources/application-druid.yml:9`、`:10`、`:11` 使用统一占位符
  - `ctbc-admin/src/main/resources/security/env-config.properties:2` 集中敏感配置
  - `ctbc-admin/src/main/resources/security/rsa-keys.properties:1` RSA 公私钥

