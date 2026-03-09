/**
 * 通用表格页面逻辑 Hook
 * 提供表格数据的查询、分页、排序、筛选、导出等功能
 * 适用于需要调用后端API获取数据的表格页面
 * 
 * @description
 * - 自动处理分页参数
 * - 支持前端排序和筛选
 * - 提供选中行、删除、导出等常用功能
 * - 与 Ant Design Vue 表格组件配合使用
 * 
 * @example
 * const { tableState, pagination, handleSearch, handleTableChange } = useTable({
 *   api: { list: getList, delete: deleteByIds },
 *   columns: tableColumns,
 *   initialSearchParams: { status: '1' },
 *   rowKey: 'id',
 *   exportFileName: '用户数据',
 *   isTreeTable: false,
 *   sortable: true,
 * });
 */
import { computed, onMounted, reactive } from 'vue';
import { message, Modal } from 'ant-design-vue';
import { useTableConfigStore } from '@/stores/tableConfig';
import BearJiaUtil from '@/utils/BearJiaUtil';
import dayjs from 'dayjs';

/**
 * useTable 配置项
 * @typedef {Object} UseTableOptions
 * @property {Object} api - API接口对象
 * @property {Function} api.list - 列表查询接口（必需）
 * @property {Function} [api.delete] - 删除接口（可选）
 * @property {Function} [api.exportUrl] - 导出接口URL（可选）
 * @property {Function} [api.processListData] - 数据处理函数（可选）
 * @property {Array} columns - 表格列定义
 * @property {Object} [initialSearchParams={}] - 初始查询参数
 * @property {string} [rowKey='id'] - 行唯一标识字段名
 * @property {string} [exportFileName='导出数据'] - 导出文件名
 * @property {boolean} [isTreeTable=false] - 是否为树形表格
 * @property {boolean} [sortable=true] - 是否启用排序功能
 */

/**
 * 通用表格 Hook
 * @param {UseTableOptions} options - 配置项
 * @returns {Object} 表格相关的状态和方法
 */
export function useTable(options) {
  // 解构配置项，提供默认值
  const {
    api,                              // API接口对象
    columns,                          // 表格列定义
    initialSearchParams = {},          // 初始查询参数
    rowKey = 'id',                    // 行唯一标识
    exportFileName = '导出数据',       // 导出文件名
    isTreeTable = false,               // 是否为树形表格
    sortable = true,                   // 是否启用排序
  } = options;

  // 获取表格配置 Store
  const tableConfigStore = useTableConfigStore();

  // 搜索表单数据（响应式）
  const searchFormData = reactive({ ...initialSearchParams });

  // 查询参数（包含分页和排序）
  const queryParams = reactive({
    pageNum: 1,                       // 当前页码
    pageSize: tableConfigStore.pageSize, // 每页条数（从Store获取）
    orderByColumn: null,              // 排序字段
    isAsc: null,                      // 排序方向：asc/desc
    ...initialSearchParams,            // 合并初始查询参数
  });

  /**
   * 处理列配置，自动添加排序功能
   * @description
   * - 如果列已有sorter配置，保持不变
   * - 跳过操作列（action/operation）和无dataIndex的列
   * - 其他列自动添加 sorter: true
   */
  const processedColumns = computed(() => {
    // 不启用排序时直接返回原列定义
    if (!sortable) return columns;

    return columns.map((col) => {
      // 已有sorter配置则保留
      if (col.sorter !== undefined) return col;

      // 跳过操作列和无dataIndex的列
      if (
        col.dataIndex === 'action' ||
        col.key === 'action' ||
        col.dataIndex === 'operation' ||
        col.key === 'operation' ||
        !col.dataIndex
      ) {
        return col;
      }

      // 自动添加排序功能
      return {
        ...col,
        sorter: true,
        sortDirections: ['ascend', 'descend'],
      };
    });
  });

  // 表格状态
  const tableState = reactive({
    dataSource: [],   // 表格数据
    total: 0,         // 总记录数
    loading: false,   // 加载状态
    selectedRowKeys: [], // 选中的行Key
    columns: processedColumns, // 处理后的列定义
  });

  /**
   * 查询表格数据
   * @description
   * - 处理不同的响应格式（rows/total、Array、data）
   * - 调用 processListData 处理数据（如有）
   * - 自动保存原始数据用于前端筛选
   */
  const queryTableData = async () => {
    tableState.loading = true;
    try {
      // 构建请求参数
      let requestParams = isTreeTable
        ? { ...searchFormData }
        : { ...queryParams, ...searchFormData };

      // 过滤掉空值参数
      requestParams = Object.fromEntries(
        Object.entries(requestParams).filter(
          ([, value]) => value !== null && value !== undefined && value !== ''
        )
      );

      // 调用API获取数据
      const response = await api.list(requestParams);

      // 处理响应数据
      let rows, total;
      if (response.rows !== undefined) {
        // 标准分页格式 { rows, total }
        rows = response.rows;
        total = response.total;
      } else if (Array.isArray(response)) {
        // 直接返回数组
        rows = response;
        total = response.length;
      } else if (response.data) {
        // 其他格式
        rows = response.data;
        total = response.total || rows.length;
      } else {
        rows = [];
        total = 0;
      }

      // 自定义数据处理
      if (api.processListData && typeof api.processListData === 'function') {
        rows = api.processListData(rows);
        if (isTreeTable) {
          total = rows.length;
        }
      }

      // 更新表格状态
      tableState.dataSource = rows;
      tableState.total = total;
    } catch (error) {
      console.error('Failed to fetch table data:', error);
      message.error('数据加载失败');
    } finally {
      tableState.loading = false;
    }
  };

  // 组件挂载时自动查询数据
  onMounted(() => {
    queryTableData();
  });

  /**
   * 搜索处理
   * @description 重置页码为1并重新查询数据
   */
  const handleSearch = () => {
    queryParams.pageNum = 1;
    queryTableData();
  };

  /**
   * 重置搜索表单
   * @description 恢复初始查询参数并重新搜索
   */
  const handleReset = () => {
    Object.keys(initialSearchParams).forEach((key) => {
      searchFormData[key] = initialSearchParams[key];
    });
    handleSearch();
  };

  /**
   * 表格变化处理
   * @description 处理分页、排序变化，重新查询数据
   * @param {Object} pagination - 分页信息
   * @param {Object} filters - 筛选信息（此 Hook 不处理前端筛选）
   * @param {Object} sorter - 排序信息
   */
  const handleTableChange = (pagination, filters, sorter) => {
    // 处理分页变化
    if (pagination) {
      queryParams.pageNum = Number(pagination.current);
      queryParams.pageSize = Number(pagination.pageSize);
    }

    // 处理排序变化
    if (sorter && sorter.field) {
      queryParams.orderByColumn = sorter.field;
      queryParams.isAsc = sorter.order === 'ascend' ? 'asc' : 'desc';
    } else {
      // 清除排序
      delete queryParams.orderByColumn;
      delete queryParams.isAsc;
    }

    // 重新查询数据
    queryTableData();
  };

  /**
   * 选择行变化处理
   * @param {Array} keys - 选中的行Key数组
   */
  const onSelectionChange = (keys) => {
    tableState.selectedRowKeys = keys;
  };

  /**
   * 删除数据
   * @param {Array} [ids] - 要删除的ID数组，默认删除选中的行
   * @description 弹出确认框，确认后调用删除API
   */
  const handleDelete = (ids) => {
    if (!api.delete) {
      console.error("API 'delete' function is not provided.");
      return;
    }
    const targetIds = ids || tableState.selectedRowKeys;
    if (!targetIds || targetIds.length === 0) {
      message.warning('请至少选择一条数据');
      return;
    }
    Modal.confirm({
      title: '确认删除',
      content: `您确定要删除选中的 ${targetIds.length} 条数据吗？`,
      okText: '确认',
      cancelText: '取消',
      onOk: async () => {
        await api.delete(targetIds);
        message.success('删除成功');
        tableState.selectedRowKeys = [];
        queryTableData();
      },
    });
  };

  /**
   * 导出数据
   * @description 使用 BearJiaUtil.download 下载数据
   */
  const handleExport = () => {
    if (!api.exportUrl) {
      console.error("API 'exportUrl' is not provided.");
      return;
    }
    const finalExportFileName = `${exportFileName}_${dayjs().format('YYYY-MM-DD_HH-mm-ss')}.xlsx`;
    BearJiaUtil.download(api.exportUrl, queryParams, finalExportFileName);
  };

  /**
   * 分页配置计算属性
   * @description 根据配置和数据量决定是否显示分页
   */
  const pagination = computed(() => {
    // 树形表格或数据量小于等于每页条数时不显示分页
    if (isTreeTable || tableState.total <= queryParams.pageSize) {
      return false;
    }

    return {
      total: tableState.total,
      current: queryParams.pageNum,
      pageSize: queryParams.pageSize,
      showSizeChanger: tableConfigStore.showSizeChanger,
      showQuickJumper: tableConfigStore.showQuickJumper,
      pageSizeOptions: tableConfigStore.pageSizeOptions,
      showTotal: tableConfigStore.showTotal ? (total) => `共 ${total} 条` : undefined,
    };
  });

  /**
   * 行选择配置计算属性
   */
  const rowSelection = computed(() => ({
    selectedRowKeys: tableState.selectedRowKeys,
    onChange: onSelectionChange,
  }));

  // 返回表格相关的所有状态和方法
  return {
    // 状态
    searchFormData,      // 搜索表单数据
    tableState,          // 表格状态（数据、总数、加载状态、选中行）
    pagination,          // 分页配置
    rowSelection,        // 行选择配置

    // 方法
    queryTableData,      // 查询数据
    handleSearch,        // 搜索
    handleReset,         // 重置
    handleTableChange,   // 表格变化处理
    handleDelete,        // 删除
    handleExport,        // 导出
  };
}
