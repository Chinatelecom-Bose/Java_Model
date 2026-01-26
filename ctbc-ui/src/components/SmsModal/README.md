# SmsModal 组件使用指南

这是一个可复用的短信发送模态框组件，支持多种使用方式。

## 配置短信服务提供商信息

要使短信发送功能正常工作，需要在后端配置短信服务提供商的相关信息：

### 1. 配置文件位置
- 文件路径: `d:\IDEA\EM\EquipmentMonitor\ctbc-sms\src\main\resources\application.yml`
- 或者通过环境变量配置

### 2. 需要配置的信息
```yaml
sms:
  api-url: "https://your-sms-provider-api.com/send"  # 短信服务商API地址
  username: "your_username"                          # 短信服务商用户名
  password: "your_password"                          # 短信服务商密码/API密钥
  timeout: 30                                        # 请求超时时间(秒)
  sender-id: "YourCompany"                           # 发送者标识(部分服务商需要)
```

### 3. 广西电信短信服务提供商要求
- 确保服务器IP已在广西电信短信网关白名单中
- 配置有效的企业账号、密码/API密钥
- 确保企业账户余额充足且服务状态正常
- 遵守《通信短信息服务管理规定》等法规要求
- 短信内容需符合运营商审核标准，不得包含敏感词汇
- 需要申请短信签名和模板，并通过审核后方可使用

### 4. 广西电信配置示例
```yaml
sms:
  api-url: "https://api.gxtelecom.com/sms/send"       # 广西电信短信网关地址
  username: "gxtelecom_enterprise_account"            # 广西电信企业账号
  password: "gxtelecom_api_key"                       # 广西电信API密钥
  timeout: 30                                         # 请求超时时间(秒)
  sender-id: "【企业简称】"                            # 短信签名（需备案）
  template-id: "SMS_TEMP_001"                         # 短信模板ID（需审核通过）
```

### 5. 测试配置
- 可先使用测试模式验证配置是否正确
- 检查API接口返回状态码是否为200
- 验证短信是否能正常接收
- 确认短信签名和模板格式正确无误

## 基本用法

```vue
<template>
  <div>
    <!-- 使用按钮触发短信发送 -->
    <a-button @click="openSmsModal">发送短信</a-button>
    
    <!-- 引入短信模态框组件 -->
    <SmsModal ref="smsModalRef" @send-success="onSendSuccess" @send-error="onSendError" />
  </div>
</template>

<script setup>
import { ref } from 'vue';
import SmsModal from '@/components/SmsModal/SmsModal.vue';
import { message } from 'ant-design-vue';

const smsModalRef = ref();

// 打开短信模态框
const openSmsModal = () => {
  // 方式1: 传入数据行（如工单数据）
  const dataRows = [
    { phoneNum: '13800138000', name: '张三' },
    { phone: '13900139000', name: '李四' }
  ];
  
  smsModalRef.value.showModal(dataRows, () => {
    console.log('发送完成回调');
  });
};

// 方式2: 直接传入号码数组
const openWithNumbers = () => {
  const phoneNumbers = ['13800138000', '13900139000'];
  
  smsModalRef.value.showModal(phoneNumbers, () => {
    console.log('发送完成回调');
  });
};

// 发送成功回调
const onSendSuccess = (data) => {
  console.log('短信发送成功:', data);
  message.success(`短信已发送至 ${data.phoneNumber}`);
};

// 发送失败回调
const onSendError = (data) => {
  console.log('短信发送失败:', data);
  message.error(`发送失败: ${data.error}`);
};
</script>
```

## Props 参数

| 参数名 | 类型 | 默认值 | 说明 |
|--------|------|--------|------|
| showDataNumbers | Boolean | true | 是否显示从数据行中选择号码的选项 |
| showCustomInput | Boolean | true | 是否显示自定义号码输入框 |
| defaultContent | String | '' | 默认短信内容 |
| presetNumbers | Array | [] | 预设的号码列表 |

## 事件

| 事件名 | 说明 | 回调参数 |
|--------|------|----------|
| send-success | 短信发送成功时触发 | `{ phoneNumber, content }` |
| send-error | 短信发送失败时触发 | `{ error, phoneNumber, content }` |

## 方法

| 方法名 | 说明 | 参数 |
|--------|------|------|
| showModal | 显示短信发送模态框 | `(dataRows/phoneNumbers, callback)` |

## 在其他模块中复用短信功能

要在其他模块中快速集成短信发送功能，只需以下几行代码：

### 1. 在模板中引入组件
```vue
<template>
  <!-- 其他内容 -->
  <SmsModal ref="smsModalRef" />
</template>
```

### 2. 在脚本中导入并使用
```vue
<script setup>
import { ref } from 'vue';
import SmsModal from '@/components/SmsModal/SmsModal.vue';
import { message } from 'ant-design-vue';

// 短信模态框引用
const smsModalRef = ref();

// 处理发送短信
const handleSendSms = (selectedRows) => {
  if (!selectedRows || selectedRows.length === 0) {
    message.warning('请先选择要发送短信的记录');
    return;
  }

  if (smsModalRef.value && typeof smsModalRef.value.showModal === 'function') {
    smsModalRef.value.showModal(selectedRows, () => {
      // 发送完成后的回调
      console.log('短信发送完成');
    });
  } else {
    message.error('短信组件尚未加载完成，请稍后再试');
  }
};
</script>
```

### 3. 数据行格式要求
确保数据行包含电话号码字段：
```javascript
const dataRows = [
  {
    phoneNum: '13800138000',  // 电话号码字段
    name: '张三',
    // 其他字段...
  }
];
```

推荐的电话号码字段名称：`phoneNum`、`phone`、`contactPhone`、`mobile`