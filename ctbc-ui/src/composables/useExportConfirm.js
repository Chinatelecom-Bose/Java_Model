import { reactive } from 'vue';
import { message } from 'ant-design-vue';

/**
 * 导出确认对话框 Hook
 * 用于管理导出确认对话框的状态和逻辑
 */
export function useExportConfirm() {
  const exportConfirm = reactive({
    open: false,
    loading: false,
    count: 0,
    selectedCount: 0,
    startMonth: null,
    endMonth: null,
    filtersPreview: {},
    labelMap: {},
    onConfirm: null,
  });

  const openExportConfirm = (options = {}) => {
    exportConfirm.count = options.count || 0;
    exportConfirm.selectedCount = options.selectedCount || 0;
    exportConfirm.startMonth = options.startMonth || null;
    exportConfirm.endMonth = options.endMonth || null;
    exportConfirm.filtersPreview = options.filtersPreview || {};
    exportConfirm.labelMap = options.labelMap || {};
    exportConfirm.onConfirm = options.onConfirm || null;
    exportConfirm.open = true;
  };

  const cancelExport = () => {
    exportConfirm.open = false;
    exportConfirm.loading = false;
  };

  const confirmExport = async () => {
    if (!exportConfirm.onConfirm) {
      message.warning('导出功能未配置');
      return;
    }

    exportConfirm.loading = true;
    try {
      await exportConfirm.onConfirm();
      message.success('导出成功');
      cancelExport();
    } catch (error) {
      console.error('导出失败:', error);
      message.error('导出失败，请重试');
      exportConfirm.loading = false;
    }
  };

  return {
    exportConfirm,
    openExportConfirm,
    cancelExport,
    confirmExport,
  };
}
