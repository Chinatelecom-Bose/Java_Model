<template>
  <div class="business-free-info">
    <a-card title="公务免费管理 - 报表配置">
      <!-- 使用现有的数据钻取信息管理组件 -->
      <DataDrillInfoManager />
    </a-card>
  </div>
</template>

<script setup lang="ts">
import { onMounted } from 'vue';
import DataDrillInfoManager from '@/components/DataDrill/DrillManager.vue';

onMounted(() => {
  // 页面初始化逻辑
});
</script>

<style scoped>
.business-free-info {
  padding: 16px;
}
</style>