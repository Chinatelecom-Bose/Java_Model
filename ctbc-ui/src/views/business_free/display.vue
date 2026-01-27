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
      :enable-sms="hasSmsPermission"
      :phone-field-mapping="'电话号码'"
      :has-sms-permission="hasSmsPermission"
      :standalone="true"
      :report-id="defaultReportId"
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

// 业务免费报表的特定ID
const BUSINESS_FREE_REPORT_ID = 14; // 可以根据实际情况调整

// 默认的报表ID
const defaultReportId = ref<number | null>(BUSINESS_FREE_REPORT_ID);


// 用户store
const userStore = useUserStore();

// 检查用户是否有短信发送权限
const hasSmsPermission = computed(() => {
  // 获取用户信息，检查角色备注字段是否包含"短信"字样
  const userInfo = userStore.userInfo;
  
  // 获取用户角色对象信息（包含remark字段）
  const userRoleObjects = (userInfo as any)?.roleObjects || [];
  
  // 如果用户没有角色信息，默认返回false（安全起见）
  if (!userRoleObjects || userRoleObjects.length === 0) {
    return false;
  }
  
  // 检查用户角色中是否有包含"短信"字样的备注
  const hasSmsRole = userRoleObjects.some((role: any) => {
    // 检查角色remark字段是否包含"短信"字样
    if (role.remark && typeof role.remark === 'string') {
      return role.remark.includes('短信');
    }
    return false;
  });
  
  return hasSmsRole;
});

// 初始化默认报表ID（不传入node-id以进入报表的根节点）
    onMounted(async () => {
      // 直接获取第一个报表作为默认报表，进入其根节点（父节点）
      try {
        const reportResponse = await request.get('/drill/info/list', {
          params: { page_no: 1, page_size: 1 }
        });
        
        // 修复数据解析：后端返回的数据结构可能是 res.data 或 res
        const responseData = reportResponse.data || reportResponse;
        const rows = responseData.rows || responseData.list || [];
        
        if (rows && rows.length > 0) {
          // 查找特定的业务免费报表
          const targetReport = rows.find(row => row.id === BUSINESS_FREE_REPORT_ID);
          if (targetReport) {
            defaultReportId.value = targetReport.id;
          } else {
            // 如果没找到特定报表，则使用第一个报表
            defaultReportId.value = rows[0].id;
          }
        }
      } catch (err) {
        console.error('获取默认报表失败:', err);
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