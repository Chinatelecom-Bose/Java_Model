<!-- 
短信发送模态框组件
用途：提供一个可复用的短信发送界面，支持从数据行选择号码或手动输入号码
使用方式：
1. 基础使用：通过 showModal(dataRows, callback) 调用
2. 直接号码：通过 showModal(['13800138000', '13900139000'], callback) 调用
3. 使用props进行配置化定制
事件：send-success, send-error
-->
<template>
  <a-modal
    v-model:visible="modalVisible"
    title="发送短信"
    width="600px"
    :footer="null"
    @cancel="handleCancel"
  >
    <div v-if="selectedRows && selectedRows.length > 0">
      <a-form :model="formState" layout="vertical">
        <a-form-item label="收件人:" :label-col="{ span: 4 }">
          <a-select 
            v-if="props.showDataNumbers && allPhoneNumbers.length > 0"
            v-model:value="selectedPhoneNumber" 
            placeholder="请选择工单中的号码"
            allow-clear
            mode="multiple"
            :max-tag-count="3"
          >
            <a-select-option 
              v-for="number in allPhoneNumbers" 
              :key="number" 
              :value="number"
            >
              {{ number }}
            </a-select-option>
          </a-select>
          <a-input 
            v-if="props.showCustomInput"
            v-model:value="customPhoneNumber" 
            placeholder="或输入自定义号码（如 1234567890）" 
            style="margin-top: 8px;"
          />
          <!-- <div style="margin-top: 8px; color: #1890ff; cursor: pointer;" @click="fillTestNumber">
            点击此处快速填入测试号码: 1234567890
          </div> -->
        </a-form-item>
        
        <a-form-item v-if="props.showFieldMapping" label="电话号码字段映射:" :label-col="{ span: 4 }" extra="请输入数据行中电话号码字段名，多个字段用逗号分隔">
          <a-input 
            v-model:value="fieldMappingInput" 
            placeholder="例如: 电话号码,手机号,联系电话,phone"
            @change="handleFieldMappingChange"
          />
          <div style="margin-top: 4px; font-size: 12px; color: #666;">
            当前字段映射: {{ phoneFieldList.join(', ') }}
          </div>
        </a-form-item>
        
        <a-form-item label="短信内容:" :label-col="{ span: 4 }">
          <a-textarea 
            v-model:value="formState.content" 
            :rows="4"
            :maxlength="200"
            show-word-limit
            placeholder="请输入短信内容"
          />
        </a-form-item>
        
        <a-form-item>
          <a-space>
            <a-button @click="handleCancel">取消</a-button>
            <a-button type="primary" @click="handleSendConfirm">发送</a-button>
          </a-space>
        </a-form-item>
      </a-form>
    </div>
  </a-modal>
</template>

<script setup>
import { ref, reactive, computed } from 'vue';
import request from '@/utils/request';
import { message, Modal } from 'ant-design-vue';
import { useUserStore } from '@/stores/user';

// 用户store
const userStore = useUserStore();

// 检查用户是否有短信发送权限
const hasSmsPermission = computed(() => {
  // 获取用户信息
  const userInfo = userStore.userInfo;
  
  // 获取用户权限列表
  const userPermissions = userInfo?.permissions || [];
  
  // 检查用户是否有短信发送权限
  const hasSmsPermission = userPermissions.includes('sms:send');
  
  console.log(`✅ SmsModal权限检查结果: ${hasSmsPermission ? '有权限' : '无权限'}`);
  return hasSmsPermission;
});

// 接收组件属性，增加灵活性
const props = defineProps({
  // 是否显示从数据行中选择号码的选项
  showDataNumbers: {
    type: Boolean,
    default: true
  },
  // 是否显示自定义号码输入框
  showCustomInput: {
    type: Boolean,
    default: true
  },
  // 是否显示电话号码字段映射配置
  showFieldMapping: {
    type: Boolean,
    default: true
  },
  // 电话号码字段映射配置（逗号分隔的字段名列表）
  phoneFieldMapping: {
    type: String,
    default: 'phoneNum,phone,contactPhone,mobile,phone_num'
  },
  // 默认短信内容
  defaultContent: {
    type: String,
    default: ''
  },
  // 预设的号码列表
  presetNumbers: {
    type: Array,
    default: () => []
  },
  // 短信发送API路径
  smsApiPath: {
    type: String,
    default: '/system/sms/send'
  }
});

const emit = defineEmits(['send-success', 'send-error']);

const modalVisible = ref(false);
const formState = reactive({
  content: '',
});
const selectedRows = ref([]);
const onSendComplete = ref(null);
const selectedPhoneNumber = ref([]); // 支持多选
const customPhoneNumber = ref('');
const allPhoneNumbers = ref([]);
const fieldMappingInput = ref('');
const phoneFieldList = ref([]);

// 处理字段映射配置变化
const handleFieldMappingChange = () => {
  if (fieldMappingInput.value.trim()) {
    // 解析用户输入的字段映射配置
    phoneFieldList.value = fieldMappingInput.value
      .split(',')
      .map(field => field.trim())
      .filter(field => field.length > 0);
  } else {
    // 如果用户清空输入框，使用默认配置
    phoneFieldList.value = props.phoneFieldMapping
      .split(',')
      .map(field => field.trim())
      .filter(field => field.length > 0);
  }
  
  // 字段映射配置变化后，重新提取电话号码并更新选择
  if (selectedRows.value && selectedRows.value.length > 0) {
    const phoneNumbers = extractPhoneNumbers(selectedRows.value);
    allPhoneNumbers.value = [...new Set([...(phoneNumbers || []), ...(props.presetNumbers || [])])];
    
    // 更新选中的号码
    if (allPhoneNumbers.value.length > 0) {
      selectedPhoneNumber.value = [...allPhoneNumbers.value];
    } else {
      selectedPhoneNumber.value = [];
    }
  }
};

// 从数据行中提取电话号码（支持动态字段映射）
const extractPhoneNumbers = (rows) => {
  const fieldsToCheck = phoneFieldList.value.length > 0 
    ? phoneFieldList.value 
    : props.phoneFieldMapping.split(',').map(field => field.trim());
  
  return [...new Set(rows.flatMap(row => 
    fieldsToCheck.map(field => row[field]).filter(Boolean)
  ))];
};

// 显示模态框（兼容原有调用方式）
const showModal = (rows, callback) => {
  // 初始化字段映射配置
  fieldMappingInput.value = props.phoneFieldMapping;
  handleFieldMappingChange();
  
  // 如果传入的是单个号码而非数据行，处理为预设号码
  if (typeof rows === 'string' || Array.isArray(rows) && rows.every(r => typeof r === 'string')) {
    // 处理预设号码的情况
    const numbers = Array.isArray(rows) ? rows : [rows];
    allPhoneNumbers.value = [...new Set([...numbers, ...(props.presetNumbers || [])])];
    selectedPhoneNumber.value = [allPhoneNumbers.value[0]] || [];
    selectedRows.value = []; // 没有数据行
  } else {
    // 处理数据行的情况
    selectedRows.value = Array.isArray(rows) ? rows : [rows];
    
    // 使用动态字段映射提取电话号码
    const phoneNumbers = extractPhoneNumbers(selectedRows.value);
    
    allPhoneNumbers.value = [...new Set([...(phoneNumbers || []), ...(props.presetNumbers || [])])];
    
    // 如果数据行很多（比如超过1个），则自动选中所有号码（模拟表格全选功能）
    if (allPhoneNumbers.value.length > 1) {
      selectedPhoneNumber.value = [...allPhoneNumbers.value]; // 自动选中所有号码
    } else if (allPhoneNumbers.value.length === 1) {
      selectedPhoneNumber.value = [allPhoneNumbers.value[0]]; // 如果只有一个号码，选中它
    } else {
      selectedPhoneNumber.value = []; // 如果没有号码，清空选择
    }
  }
  
  onSendComplete.value = callback;
  
  // 设置默认内容
  formState.content = props.defaultContent;
  
  // 清空自定义号码
  customPhoneNumber.value = '';
  
  modalVisible.value = true;
};

// 快速填入测试号码
const fillTestNumber = () => {
  customPhoneNumber.value = '1234567890';
};

// 发送短信确认
const handleSendConfirm = async () => {
  // 检查用户权限
  if (!hasSmsPermission.value) {
    message.error('您没有短信发送权限，请联系管理员');
    return;
  }
  
  if (!formState.content.trim()) {
    message.warning('请输入短信内容');
    return;
  }

  // 获取要发送的电话号码（优先使用自定义号码，否则使用选择的号码）
  let phoneNumbers = [];
  
  if (customPhoneNumber.value) {
    // 如果输入了自定义号码，则只使用自定义号码
    phoneNumbers = [customPhoneNumber.value];
  } else {
    // 否则根据当前字段映射配置重新提取电话号码
    if (selectedRows.value && selectedRows.value.length > 0) {
      // 使用最新的字段映射配置重新提取电话号码
      phoneNumbers = extractPhoneNumbers(selectedRows.value);
      
      // 验证是否成功提取到号码
      if (!phoneNumbers || phoneNumbers.length === 0) {
        message.warning(`使用字段映射 [${phoneFieldList.value.join(', ')}] 未能提取到有效的电话号码，请检查字段映射配置`);
        return;
      }
    } else {
      // 如果没有数据行，使用选择的号码
      phoneNumbers = Array.isArray(selectedPhoneNumber.value) ? selectedPhoneNumber.value : [selectedPhoneNumber.value].filter(Boolean);
    }
  }
  
  if (!phoneNumbers || phoneNumbers.length === 0) {
    message.warning('请选择或输入至少一个电话号码');
    return;
  }

  // 验证电话号码格式（简单验证）
  const phoneRegex = /^1[3-9]\d{9}$/;
  const invalidNumbers = phoneNumbers.filter(number => !phoneRegex.test(number));
  if (invalidNumbers.length > 0) {
    message.warning(`以下号码格式不正确: ${invalidNumbers.join(', ')}`);
    return;
  }

  // 显示确认对话框，避免误操作
  Modal.confirm({
    title: '确认发送短信',
    content: `您确定要向 ${phoneNumbers.length} 个号码发送短信吗？\n\n收件人: ${phoneNumbers.join(', ')}\n\n内容：${formState.content}`,
    okText: '确认发送',
    cancelText: '取消',
    onOk: async () => {
      try {
        // 如果只有一个号码，直接发送；如果有多个号码，批量发送
        if (phoneNumbers.length === 1) {
          try {
            const response = await request.post(props.smsApiPath, {
              phone: phoneNumbers[0],
              content: formState.content
            });
            
            if (response.code === 200) {
              message.success(`短信发送成功！已发送到: ${phoneNumbers[0]}`);
              
              // 触发成功事件
              emit('send-success', { phoneNumber: phoneNumbers[0], content: formState.content });
              
              // 调用完成回调
              if (onSendComplete.value && typeof onSendComplete.value === 'function') {
                onSendComplete.value();
              }
            } else {
              message.error(response.msg || '短信发送失败: 未知错误');
              // 触发失败事件
              emit('send-error', { error: response.msg || '未知错误', phoneNumber: phoneNumbers[0], content: formState.content });
            }
          } catch (error) {
            message.error('短信发送失败: 网络错误');
            emit('send-error', { error: error.message || '网络错误', phoneNumber: phoneNumbers[0], content: formState.content });
          }
        } else {
          // 批量发送短信
          let successCount = 0;
          let failCount = 0;
          const failedNumbers = [];

          // 循环发送每条短信
          for (const phoneNumber of phoneNumbers) {
            try {
              const response = await request.post(props.smsApiPath, {
                phone: phoneNumber,
                content: formState.content
              });

              if (response.code === 200) {
                successCount++;
              } else {
                failCount++;
                failedNumbers.push({ number: phoneNumber, reason: response.msg });
              }
            } catch (err) {
              failCount++;
              failedNumbers.push({ number: phoneNumber, reason: err.message || '发送失败' });
            }
          }

          // 显示结果
          if (failCount === 0) {
            message.success(`短信批量发送成功！共发送 ${successCount} 条`);
          } else if (successCount === 0) {
            message.error(`短信批量发送失败！共失败 ${failCount} 条`);
          } else {
            message.warning(`短信批量发送完成！成功 ${successCount} 条，失败 ${failCount} 条`);
          }

          // 触发成功事件（包含发送结果）
          emit('send-success', { 
            total: phoneNumbers.length, 
            success: successCount, 
            failed: failCount,
            content: formState.content,
            failedNumbers: failedNumbers
          });

          // 调用完成回调
          if (onSendComplete.value && typeof onSendComplete.value === 'function') {
            onSendComplete.value();
          }
        }
        
        handleCancel();
      } catch (error) {
          console.error('发送短信失败:', error);
          // 提取错误信息，优先显示后端返回的错误消息
          const errorMsg = error.response?.data?.msg || 
                          error.response?.data?.message || 
                          error.message || 
                          '短信发送失败: 网络错误';
          
          message.error(errorMsg);
          
          // 如果是配置相关错误，使用message提示
          if (errorMsg.includes('需要短信服务提供商提供信息') || 
              errorMsg.includes('配置缺失')) {
            message.error('短信服务配置缺失，请联系管理员配置短信服务提供商信息');
          }
        }
    },
  });
};

// 关闭模态框
const handleCancel = () => {
  modalVisible.value = false;
  formState.content = '';
  selectedRows.value = [];
  onSendComplete.value = null;
  selectedPhoneNumber.value = [];  // 重置为数组
  customPhoneNumber.value = '';
  fieldMappingInput.value = '';
  phoneFieldList.value = [];
};

// 暴露方法给父组件
defineExpose({
  showModal,
});
</script>