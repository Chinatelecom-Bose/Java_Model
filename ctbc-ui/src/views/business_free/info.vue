<template>
  <div class="business-free-info">
    <a-card title="公务免费管理 - 报表配置">
      <DataDrillInfoManager 
        parent-menu-path="business_free" 
        parent-menu-name="公免公纳管理系统"
        menu-path="BF_Form"
        menu-component="business_free/display"
      />
    </a-card>
  </div>
</template>

<script setup lang="ts">
import { onMounted } from 'vue';
import DataDrillInfoManager from '@/components/DataDrill/DrillManager.vue';

onMounted(() => {
});
</script>

<style scoped>
.business-free-info {
  padding: 16px;
}
</style>