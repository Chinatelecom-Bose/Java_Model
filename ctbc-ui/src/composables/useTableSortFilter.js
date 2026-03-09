/**
 * 表格排序与筛选 Composable
 * 提供前端表格排序和筛选功能
 * 适用于数据已加载到前端、需要在前端进行排序筛选的场景
 * 
 * @description
 * - 支持单字段排序（升序/降序/取消）
 * - 支持列筛选（从数据中自动提取唯一值）
 * - 支持筛选值搜索
 * - 不依赖后端API，直接在前端处理数据
 * 
 * @example
 * const tableData = ref([]);
 * const {
 *   handleTableChange,
 *   handleFilterConfirm,
 *   handleFilterReset,
 *   getFilteredOptions,
 * } = useTableSortFilter(tableData);
 * 
 * // 初始化原始数据（首次加载数据后调用）
 * initOriginalData(tableData.value);
 * 
 * // 在表格的 @change 事件中使用
 * <a-table @change="handleTableChange" />
 */
import { ref } from 'vue';

/**
 * 表格排序筛选 Composable
 * @param {import('vue').Ref<Array>} dataSource - 表格数据源（Ref）
 * @returns {Object} 排序筛选相关的状态和方法
 */
export function useTableSortFilter(dataSource) {
  // ==================== 状态 ====================
  
  /** 原始数据备份，用于取消排序/筛选时恢复 */
  const originalData = ref([]);
  
  /** 当前排序信息 */
  const sortedInfo = ref(null);
  
  /** 列筛选值 */
  const columnFilters = ref({});
  
  /** 列筛选选项（从数据中自动提取） */
  const filterOptions = ref({});
  
  /** 筛选选项加载状态 */
  const filterLoading = ref({});
  
  /** 筛选搜索关键词 */
  const filterSearch = ref({});

  // ==================== 方法 ====================

  /**
   * 初始化原始数据
   * @description 在首次加载数据后调用，保存原始数据用于排序/筛选恢复
   * @param {Array} data - 表格数据数组
   */
  const initOriginalData = (data) => {
    originalData.value = [...data];
  };

  /**
   * 表格变化处理
   * @description 处理排序和筛选变化
   * @param {Object} pag - 分页信息（此 Hook 不处理分页）
   * @param {Object} filters - 筛选信息
   * @param {Object} sorter - 排序信息
   */
  const handleTableChange = (pag, filters, sorter) => {
    // 保存排序信息
    sortedInfo.value = sorter;

    // 处理筛选
    if (filters && Object.keys(filters).length > 0) {
      applyFilters(filters);
    }

    // 处理排序
    if (sorter.field && sorter.order && sorter.order !== 'null') {
      const field = sorter.field;
      const order = sorter.order;

      // 本地排序
      dataSource.value = [...dataSource.value].sort((a, b) => {
        const aVal = a[field];
        const bVal = b[field];

        // 处理空值
        if (aVal == null && bVal == null) return 0;
        if (aVal == null) return order === 'ascend' ? 1 : -1;
        if (bVal == null) return order === 'ascend' ? -1 : 1;

        // 数值比较
        if (typeof aVal === 'number' && typeof bVal === 'number') {
          return order === 'ascend' ? aVal - bVal : bVal - aVal;
        }

        // 字符串比较（忽略大小写）
        const aStr = String(aVal).toLowerCase();
        const bStr = String(bVal).toLowerCase();
        const cmp = aStr.localeCompare(bStr);
        return order === 'ascend' ? cmp : -cmp;
      });
    } else {
      // 取消排序时恢复原始数据
      if (originalData.value.length > 0) {
        dataSource.value = [...originalData.value];
      }
    }
  };

  /**
   * 应用筛选（Ant Design 表格筛选）
   * @description 根据筛选条件过滤数据
   * @param {Object} filters - 筛选条件对象
   */
  const applyFilters = (filters) => {
    let data = [...originalData.value];

    Object.keys(filters).forEach(key => {
      const filterValue = filters[key];
      if (filterValue !== undefined && filterValue !== null && filterValue !== '') {
        data = data.filter(row => {
          const cellValue = row[key];
          return String(cellValue) === String(filterValue);
        });
      }
    });

    dataSource.value = data;
  };

  /**
   * 显示/加载筛选选项
   * @description 首次点击筛选图标时，从数据中提取该列的唯一值作为筛选选项
   * @param {string} col - 列名（dataIndex）
   */
  const handleFilterShow = (col) => {
    // 已加载过则跳过
    if (filterOptions.value[col] && filterOptions.value[col].length > 0) return;

    filterLoading.value[col] = true;

    // 从原始数据中提取唯一值
    const values = new Set();
    originalData.value.forEach(row => {
      const val = row[col];
      if (val !== null && val !== undefined) {
        values.add(String(val));
      }
    });

    // 排序后保存
    filterOptions.value[col] = Array.from(values).sort();
    filterLoading.value[col] = false;
  };

  /**
   * 确认筛选
   * @description 用户选择筛选值后应用筛选
   * @param {string} col - 列名
   * @param {*} val - 筛选值
   */
  const handleFilterConfirm = (col, val) => {
    if (val === undefined || val === null || val === '') {
      delete columnFilters.value[col];
    } else {
      columnFilters.value[col] = val;
    }
    applyColumnFilters();
  };

  /**
   * 重置筛选
   * @description 清除指定列的筛选条件
   * @param {string} col - 列名
   */
  const handleFilterReset = (col) => {
    delete columnFilters.value[col];
    filterSearch.value[col] = '';
    applyColumnFilters();
  };

  /**
   * 获取筛选后的选项
   * @description 支持搜索过滤的选项列表
   * @param {string} col - 列名
   * @returns {Array} 筛选后的选项数组
   */
  const getFilteredOptions = (col) => {
    const options = filterOptions.value[col] || [];
    const search = filterSearch.value[col] || '';
    
    // 无搜索关键词时返回全部选项
    if (!search) return options;
    
    // 根据搜索关键词过滤选项
    return options.filter((opt) => 
      String(opt).toLowerCase().includes(search.toLowerCase())
    );
  };

  /**
   * 应用列筛选（手动筛选）
   * @description 根据 columnFilters 应用筛选
   */
  const applyColumnFilters = () => {
    // 无筛选条件时恢复原始数据
    if (Object.keys(columnFilters.value).length === 0) {
      dataSource.value = [...originalData.value];
      return;
    }

    let data = [...originalData.value];
    Object.keys(columnFilters.value).forEach(key => {
      const filterValue = columnFilters.value[key];
      if (filterValue !== undefined && filterValue !== null && filterValue !== '') {
        data = data.filter(row => {
          const cellValue = row[key];
          return String(cellValue) === String(filterValue);
        });
      }
    });

    dataSource.value = data;
  };

  /**
   * 清除所有筛选
   * @description 重置所有列的筛选条件
   */
  const clearAllFilters = () => {
    columnFilters.value = {};
    applyColumnFilters();
  };

  // ==================== 返回 ====================
  
  return {
    // 状态
    sortedInfo,           // 当前排序信息
    columnFilters,        // 列筛选值
    filterOptions,        // 列筛选选项
    filterLoading,        // 筛选选项加载状态
    filterSearch,         // 筛选搜索关键词

    // 方法
    initOriginalData,     // 初始化原始数据
    handleTableChange,    // 表格变化处理
    applyFilters,         // 应用 Ant Design 筛选
    handleFilterShow,    // 显示筛选选项
    handleFilterConfirm,  // 确认筛选
    handleFilterReset,    // 重置筛选
    getFilteredOptions,   // 获取筛选后的选项
    applyColumnFilters,   // 应用列筛选
    clearAllFilters,      // 清除所有筛选
  };
}
