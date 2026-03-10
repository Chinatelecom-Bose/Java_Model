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
      :key="reportId"
      class="main-content" 
      :phone-field-mapping="'公免申请人联系方式'"
      :standalone="reportId !== null"
      :report-id="reportId"
      :enable-sms="true"
      :has-sms-permission="hasSmsPermission"
      :enable-export="true"
      :has-export-permission="true"
    />
  </div>
</template>

<script setup lang="ts">
import { ref, computed, onMounted, watch } from 'vue';
import { useRoute } from 'vue-router';
import DataDrill from '@/components/DataDrill/display.vue';
import UserForm from '@/components/UserForm/userform.vue';
import { useUserStore } from '@/stores/user';

const route = useRoute();

const reportId = ref<number | null>(null);

const userStore = useUserStore();

const hasSmsPermission = computed(() => {
  const permissions = userStore.permissions || [];
  return permissions.includes('sms:send') || permissions.includes('*:*:*');
});

function loadReportId() {
  const urlReportId = route.query.reportId;
  
  if (urlReportId) {
    const parsedId = parseInt(String(urlReportId), 10);
    if (!isNaN(parsedId) && parsedId > 0) {
      reportId.value = parsedId;
      return;
    }
  }
  
  reportId.value = null;
}

onMounted(() => {
  loadReportId();
});

watch(() => route.query.reportId, () => {
  loadReportId();
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