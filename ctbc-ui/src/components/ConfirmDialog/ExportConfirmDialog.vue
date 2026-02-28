<template>
  <a-modal
    title="导出确认"
    v-model:open="visible"
    width="480px"
    :mask-closable="false"
    :keyboard="!loading"
    @cancel="handleCancel"
  >
    <div v-if="loading" style="padding: 12px;">
      <a-skeleton active :paragraph="{ rows: 3 }" />
      <div style="margin-top: 12px; color: #999; font-size: 12px;">
        正在统计导出范围，请稍候…
      </div>
    </div>

    <div v-else style="padding: 12px; line-height: 1.8;">
      <div>即将导出数据条数：<b>{{ count }}</b></div>
      <div v-if="selectedCount > 0">
        已选择记录：<b>{{ selectedCount }}</b> 条
      </div>
      <div v-else>
        月份范围：
        <b v-if="startMonth">{{ formatMonth(startMonth) }}</b>
        <span v-else>-</span>
        至
        <b v-if="endMonth">{{ formatMonth(endMonth) }}</b>
        <span v-else>-</span>
      </div>
      <div v-for="(val, key) in filtersPreview" :key="key" v-if="val" style="color:#666;">
        {{ labelMap[key] || key }}：{{ val }}
      </div>
      <div style="color:#999; font-size:12px; margin-top:8px;">
        {{ selectedCount > 0 ? '注：将导出已选择的记录。' : '注：未选择记录时，将导出满足当前筛选的全部数据。' }}
      </div>
    </div>

    <template #footer>
      <a-button @click="handleCancel" :disabled="loading">取 消</a-button>
      <a-button type="primary" :disabled="loading || (count === 0 && selectedCount === 0)" @click="handleConfirm">确 认</a-button>
    </template>
  </a-modal>
</template>

<script setup>
import { computed } from 'vue';
import dayjs from 'dayjs';

const props = defineProps({
  visible: { type: Boolean, default: false },
  loading: { type: Boolean, default: false },
  count: { type: Number, default: 0 },
  selectedCount: { type: Number, default: 0 },
  startMonth: { type: [String, Number], default: null },
  endMonth: { type: [String, Number], default: null },
  filtersPreview: { type: Object, default: () => ({}) },
  labelMap: { type: Object, default: () => ({}) },
});

const emit = defineEmits(['update:visible', 'cancel', 'confirm']);

const visible = computed({
  get: () => props.visible,
  set: (value) => emit('update:visible', value)
});

const formatMonth = (value) => {
  if (!value) return '';
  // 如果是6位数字格式如202301，转换为2023-01
  if (typeof value === 'number' || (typeof value === 'string' && /^\d{6}$/.test(value))) {
    const str = String(value);
    return `${str.substring(0, 4)}-${str.substring(4, 6)}`;
  }
  // 否则使用dayjs格式化
  return dayjs(value).format('YYYY-MM');
};

const handleCancel = () => {
  emit('cancel');
};

const handleConfirm = () => {
  emit('confirm');
};
</script>

<style scoped>
</style>