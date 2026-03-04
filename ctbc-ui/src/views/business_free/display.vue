<template>
  <div class="business-free-display">
    <!-- 用户信息表格 - 位于页面顶部 -->
    <!-- <UserForm 
      :show-border="false" 
      :max-width="'100%'"
      :show-pagination="false"
      size="small"
    /> -->
    
    <!-- 数据钻取组件 -->
    <DataDrill 
      v-if="defaultReportId !== null"
      class="main-content" 
      :phone-field-mapping="'公免申请人联系方式'"
      :standalone="true"
      :report-id="defaultReportId"
      :enable-sms="true"
      :has-sms-permission="hasSmsPermission"
      :enable-export="true"
      :has-export-permission="true"
    />
    <!-- 加载状态 -->
    <a-spin v-else size="large" style="display: flex; justify-content: center; align-items: center; height: 200px;" />
  </div>
</template>

<script setup lang="ts">
import { ref, computed, onMounted } from 'vue';
import DataDrill from '@/components/DataDrill/display.vue';
import UserForm from '@/components/UserForm/userform.vue';
import { useUserStore } from '@/stores/user';
import request from '@/utils/request';

// 默认的报表ID
const defaultReportId = ref<number | null>(null);

// 用户store
const userStore = useUserStore();

// 检查用户是否具有短信发送权限
const hasSmsPermission = computed(() => {
  const permissions = userStore.permissions || [];
  return permissions.includes('sms:send') || permissions.includes('*:*:*');
});

// 加载默认报表ID
onMounted(async () => {
  try {
    const res = await request.get('/system/config/getDefaultReportId');
    const configValue = res.data?.configValue || res.data?.data?.configValue || '';
    const reportId = parseInt(configValue, 10);
    if (!isNaN(reportId) && reportId > 0) {
      defaultReportId.value = reportId;
    }
  } catch (error) {
    console.error('获取默认报表ID失败:', error);
  }
});
</script>

<style scoped>
.business-free-display {
  display: flex;
  flex-direction: column;
  gap: 16px;
}

.main-content {
  flex: 1;
}
</style>