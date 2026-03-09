import { useTableConfigStore } from '@/stores/tableConfig';
import { h, computed } from 'vue';
import { Table } from 'ant-design-vue';

export default {
  install: (app) => {
    app.component('EnhancedTable', {
      name: 'EnhancedTable',
      setup(props, { slots, attrs }) {
        const store = useTableConfigStore();

        const handleResizeColumn = (width, column) => {
          if (column && typeof column === 'object') {
            column.width = width;
          }
          if (props.onResizeColumn) {
            props.onResizeColumn(width, column);
          }
        };

        const handleTableChange = (...args) => {
          if (typeof attrs.onChange === 'function') {
            attrs.onChange(...args);
          }
          if (typeof props.onChange === 'function') {
            props.onChange(...args);
          }
        };

        const processColumns = (columns) => {
          if (!Array.isArray(columns)) {
            return columns;
          }
          return columns.map((col) => ({
            ...col,
            resizable: store.resizable ? (col.resizable !== false) : false,
          }));
        };

        const extractColumns = (columns) => {
          if (!Array.isArray(columns)) {
            return columns;
          }
          return columns;
        };

        const mergedProps = computed(() => {
          const globalTableProps = store.getTableProps ? store.getTableProps() : {};
          const globalPaginationProps = store.getPaginationProps
            ? store.getPaginationProps()
            : store.pagination;

          const config = {
            ...globalTableProps,
            size: props.size ?? store.size,
            bordered: props.bordered ?? store.bordered,
            loading: props.loading !== undefined ? props.loading : store.loading,
            scroll: props.scroll ?? (store.fixHeader ? { y: store.tableHeight } : undefined),
            showHeader: props.showHeader ?? store.showHeader,
            rowSelection:
              props.rowSelection !== undefined
                ? props.rowSelection
                : store.rowSelection
                  ? {}
                  : undefined,
            pagination: props.pagination !== undefined ? props.pagination : globalPaginationProps,
            onResizeColumn: handleResizeColumn,
            sortDirections: ['ascend', 'descend', 'null'],
            class: [
              attrs.class,
              store.stripe ? 'bearjia-table-striped' : '',
              `bearjia-table-${store.size}`,
            ]
              .filter(Boolean)
              .join(' '),
          };

          const originalColumns = extractColumns(props.columns);
          if (Array.isArray(originalColumns)) {
            config.columns = originalColumns.map((col) => ({
              ...col,
              resizable: store.resizable ? (col.resizable !== false) : false,
            }));
          } else {
            config.columns = originalColumns;
          }

          config.onChange = handleTableChange;

          return { ...config, ...attrs };
        });

        return () => h(Table, mergedProps.value, slots);
      },
    });

    console.log('Table plugin installed successfully');
  },
};
