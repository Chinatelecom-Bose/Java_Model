<template>
  <PageContainer>
    <div class="form-builder-container">
      <fc-designer ref="designer" />
    </div>
  </PageContainer>
</template>

<script setup lang="ts">
import PageContainer from '../../../components/PageContainer/index.vue';
</script>

<style scoped lang="less">
.form-builder-container {
  height: 100%;
  min-height: calc(100vh - 160px); /* 确保最小高度 */
  flex: 1;
  display: flex;
  flex-direction: column;

  :deep(.fc-designer) {
    height: 100% !important;
    min-height: calc(100vh - 200px) !important;
    flex: 1;
    display: flex;
    flex-direction: column;
  }

  :deep(.fc-designer .fc-designer-container) {
    height: 100% !important;
    min-height: calc(100vh - 200px) !important;
    flex: 1;
    display: flex;
    flex-direction: column;
  }

  :deep(.fc-designer .fc-designer-main) {
    height: 100% !important;
    min-height: calc(100vh - 200px) !important;
    flex: 1;
    display: flex;
    flex-direction: column;
  }

  :deep(.fc-designer .fc-designer-content) {
    height: 100% !important;
    min-height: calc(100vh - 200px) !important;
    flex: 1;
    display: flex;
    flex-direction: column;
  }

  :deep(.fc-designer .fc-designer-canvas) {
    height: 100% !important;
    min-height: calc(100vh - 200px) !important;
    flex: 1;
  }
}
</style>
