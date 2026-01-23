<template>
  <a-modal
    title="文件上传"
    :open="visible"
    width="600px"
    :maskClosable="false"
    @cancel="handleClose"
  >
    <!-- 上传配置 -->
    <a-form
      :model="form"
      :rules="rules"
      ref="formRef"
      :label-col="{ span: 6 }"
      :wrapper-col="{ span: 18 }"
    >
      <a-form-item label="业务类型" name="businessType">
        <a-select
          v-model:value="form.businessType"
          placeholder="请选择业务类型"
          @change="onBusinessTypeChange"
        >
          <a-select-option value="attachment">系统附件</a-select-option>
          <a-select-option value="common">通用文件</a-select-option>
        </a-select>
      </a-form-item>

      <a-form-item v-if="form.businessType === 'attachment'" label="关联ID" name="businessId">
        <a-input v-model:value="form.businessId" placeholder="请输入关联ID" />
      </a-form-item>
    </a-form>

    <!-- 文件上传组件 -->
    <FileUpload
      ref="fileUploadRef"
      :action="uploadUrl"
      :data="uploadData"
      :file-type="getAllowedFileTypes()"
      :file-size="getMaxFileSize()"
      :limit="10"
      v-model="uploadedFiles"
      @change="handleFileChange"
    />

    <template #footer>
      <a-button @click="handleClose">关 闭</a-button>
    </template>
  </a-modal>
</template>

<script setup>
import { ref, reactive, computed } from 'vue';
import FileUpload from '@/components/FileUpload/index.vue';

// 定义 props
const props = defineProps({
  currentFolderId: {
    type: [String, Number],
    default: '0',
  },
});

// 组件引用
const formRef = ref();
const fileUploadRef = ref();

// 响应式数据
const visible = ref(false);
const uploadedFiles = ref('');

// 表单数据
const form = reactive({
  businessType: 'common',
  businessId: 0,
});

// 表单验证规则
const rules = {
  businessType: [{ required: true, message: '请选择业务类型', trigger: 'change' }],
  businessId: [{ required: true, message: '请选择关联对象', trigger: 'change' }],
};

// 计算属性
const uploadUrl = computed(() => {
  switch (form.businessType) {
    case 'attachment':
      return '/system/file/upload/attachment';
    default:
      return '/system/file/upload';
  }
});

const uploadData = computed(() => {
  const data = {
    businessType: form.businessType,
    parentId: props.currentFolderId || '0',
  };

  // 只有当 businessId 有值时才添加到请求参数中
  if (form.businessId !== null && form.businessId !== undefined && form.businessId !== '') {
    data.businessId = form.businessId;
  }

  return data;
});

// 方法
const open = () => {
  visible.value = true;
  resetForm();
};

const handleClose = () => {
  visible.value = false;
  resetForm();
};

const resetForm = () => {
  form.businessType = 'common';
  form.businessId = null;
  uploadedFiles.value = '';
};

const onBusinessTypeChange = (value) => {
  form.businessId = null;
};

const getAllowedFileTypes = () => {
  switch (form.businessType) {
    case 'attachment':
      return [
        'pdf',
        'doc',
        'docx',
        'xls',
        'xlsx',
        'ppt',
        'pptx',
        'txt',
        'jpg',
        'jpeg',
        'png',
        'gif',
        'zip',
        'rar',
      ];
    default:
      return [];
  }
};

const getMaxFileSize = () => {
  return 10;
};

const handleFileChange = (info) => {
  // FileUpload 组件会自动处理上传，这里只需要监听上传结果
  if (info && info.file && info.file.status === 'done') {
    if (info.file.response && info.file.response.code === 200) {
      // 上传成功，刷新父页面
      emit('refresh-father-page-table');
    }
  }
};

// 定义 emit
const emit = defineEmits(['refresh-father-page-table']);

// 暴露方法
defineExpose({
  open,
});
</script>

<style scoped>
.upload-progress {
  margin: 16px 0;
}

.progress-text {
  text-align: center;
  margin-top: 8px;
  color: #666;
}

.upload-results {
  margin-top: 16px;
}

.upload-results h4 {
  margin-bottom: 12px;
  color: #333;
}
</style>
