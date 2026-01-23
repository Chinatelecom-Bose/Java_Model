// ✅ ActionButtons.vue - 操作列中的操作按钮组件（支持查看、编辑、删除、插槽）
<template>
  <span class="table-action-bar">
    <span class="action-buttons">
      <!-- 查看按钮 -->
      <slot name="view">
        <a v-if="hasView" class="action-btn view-btn" @click="$emit('view', record)">
          <BearJiaIcon :icon="icons.view" /> {{ texts.view }}
        </a>
      </slot>

      <!-- 编辑按钮 -->
      <slot name="edit">
        <a-divider v-if="hasEdit && hasView" type="vertical" />
        <a v-if="hasEdit" class="action-btn edit-btn" @click="$emit('edit', record)">
          <BearJiaIcon :icon="icons.edit" /> {{ texts.edit }}
        </a>
      </slot>

      <!-- 删除按钮 -->
      <slot name="delete">
        <a-divider v-if="hasDelete && (hasEdit || hasView)" type="vertical" />
        <a v-if="hasDelete" class="action-btn delete-btn" @click="$emit('delete', record)">
          <BearJiaIcon :icon="icons.delete" /> {{ texts.delete }}
        </a>
      </slot>

      <!-- 自定义操作按钮插槽 -->
      <slot name="actions" :record="record">
        <!-- 默认插槽内容，用于自定义按钮 -->
      </slot>

      <!-- 默认插槽（向后兼容） -->
      <slot :record="record"></slot>
    </span>
  </span>
</template>

<script setup>
import { BearJiaIcon } from '@/utils/BearJiaIcon.js';

const props = defineProps({
  record: Object,
  hasView: { type: Boolean, default: true },
  hasEdit: { type: Boolean, default: true },
  hasDelete: { type: Boolean, default: false },
  icons: {
    type: Object,
    default: () => ({
      view: 'eye-outlined',
      edit: 'edit-outlined',
      delete: 'delete-outlined',
    }),
  },
  texts: {
    type: Object,
    default: () => ({
      view: '查看',
      edit: '修改',
      delete: '删除',
    }),
  },
});
</script>

<style lang="less">
/* TableActionBar 组件样式 */
.table-action-bar {
  .action-buttons {
    display: inline-flex;
    align-items: center;
    gap: 4px;
  }
}

/* 全局 action-btn 样式，供插槽使用 */
.action-btn {
  display: inline-flex;
  align-items: center;
  gap: 4px;
  padding: 4px 8px;
  font-size: 13px;
  border-radius: 4px;
  cursor: pointer;
  transition: background-color 0.2s;

  &.view-btn {
    background-color: #e6f4ff;
    color: #1677ff;
  }

  &.edit-btn {
    background-color: #fff7e6;
    color: #fa8c16;
  }

  &.delete-btn {
    background-color: #fff1f0;
    color: #ff4d4f;
  }

  &.custom-btn {
    background-color: #f6ffed;
    color: #52c41a;
  }

  &.warning-btn {
    background-color: #fffbe6;
    color: #faad14;
  }

  &.info-btn {
    background-color: #e6fffb;
    color: #13c2c2;
  }

  &.primary-btn {
    background-color: #e6f4ff;
    color: #1677ff;
  }
}

// 暗黑主题支持
:global(.dark-theme) {
  .action-btn {
    &.view-btn {
      background-color: rgba(22, 119, 255, 0.15);
      color: var(--primary-color);
    }

    &.edit-btn {
      background-color: rgba(250, 140, 22, 0.15);
      color: #fa8c16;
    }

    &.delete-btn {
      background-color: rgba(255, 77, 79, 0.15);
      color: #ff4d4f;
    }

    &.custom-btn {
      background-color: rgba(82, 196, 26, 0.15);
      color: #52c41a;
    }

    &.warning-btn {
      background-color: rgba(250, 173, 20, 0.15);
      color: #faad14;
    }

    &.info-btn {
      background-color: rgba(19, 194, 194, 0.15);
      color: #13c2c2;
    }

    &.primary-btn {
      background-color: rgba(22, 119, 255, 0.15);
      color: var(--primary-color);
    }
  }
}
</style>
