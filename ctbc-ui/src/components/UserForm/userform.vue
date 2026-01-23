<template>
  <div class="user-info-table" :class="{ 'no-border': !showBorder }">
    <a-table
      :columns="visibleColumns"
      :data-source="userData"
      :pagination="computedPagination"
      :loading="loading"
      :size="size"
      :row-key="rowKeyField"
      :scroll="scrollConfig"
      @change="handleTableChange"
      :style="{ maxWidth: maxWidth }"
    >
      <template #bodyCell="{ column, record }">
        <template v-if="column.key === 'actions' && showActions">
          <slot name="actions" :record="record"></slot>
        </template>
      </template>
      
      <!-- 插槽支持自定义列内容 -->
      <template v-for="slotName in customSlots" #[slotName]="data">
        <slot :name="slotName" v-bind="data"></slot>
      </template>
    </a-table>
  </div>
</template>

<script setup>
import { ref, onMounted, computed, watch, onUnmounted } from 'vue';
import { getUserProfile } from '@/api/system/user'; // 获取当前用户信息API
import { useUserStore } from '@/stores/user'; // 用户store
import BearJiaUtil from '@/utils/BearJiaUtil.js';

// 定义组件属性
const props = defineProps({
  // 是否显示分页
  showPagination: {
    type: Boolean,
    default: false
  },
  // 每页显示数量
  pageSize: {
    type: Number,
    default: 5
  },
  // 表格大小
  size: {
    type: String,
    default: 'small'
  },
  // 是否显示边框
  showBorder: {
    type: Boolean,
    default: true
  },
  // 是否显示操作列
  showActions: {
    type: Boolean,
    default: false
  },
  // 自定义列配置
  customColumns: {
    type: Array,
    default: () => []
  },
  // 滚动配置
  scroll: {
    type: Object,
    default: () => ({})
  },
  // 是否自动刷新
  autoRefresh: {
    type: Boolean,
    default: false
  },
  // 自动刷新间隔（毫秒）
  refreshInterval: {
    type: Number,
    default: 30000 // 默认30秒
  },
  // 最大宽度
  maxWidth: {
    type: String,
    default: '1200px'
  }
});

// 定义组件事件
const emit = defineEmits(['load-success', 'load-error', 'row-click']);

// 表格列配置 - 包含所需的全部字段（不包含登录时间），并设置居中对齐
const defaultColumns = [
  { title: '用户账号', dataIndex: 'userName', key: 'userName', width: 120, show: true, align: 'center' },
  { title: '用户名称', dataIndex: 'nickName', key: 'nickName', width: 120, show: true, align: 'center' },
  { title: '工号', dataIndex: 'staffCode', key: 'staffCode', width: 100, show: true, align: 'center' },
  { title: '所属部门', dataIndex: 'deptName', key: 'deptName', width: 150, show: true, align: 'center' },
  { title: '岗位', dataIndex: 'postNames', key: 'postNames', width: 120, show: true, align: 'center' },
  { title: '角色', dataIndex: 'roleNames', key: 'roleNames', width: 120, show: true, align: 'center' }
];

// 合并默认列和自定义列
const allColumns = computed(() => {
  // 合并自定义列和默认列
  const mergedColumns = [...defaultColumns];
  
  // 添加自定义列
  props.customColumns.forEach(customCol => {
    const existingIndex = mergedColumns.findIndex(col => col.key === customCol.key);
    if (existingIndex >= 0) {
      // 如果已存在同名列，则替换
      mergedColumns[existingIndex] = { ...mergedColumns[existingIndex], ...customCol };
    } else {
      // 否则添加新列
      mergedColumns.push(customCol);
    }
  });
  
  return mergedColumns;
});

// 显示的列（过滤掉不显示的列）
const visibleColumns = computed(() => {
  return allColumns.value.filter(col => col.show !== false);
});

// 表格数据状态
const userData = ref([]); // 存储当前用户信息
const loading = ref(false);
const timer = ref(null);

// 计算属性：分页配置
const computedPagination = computed(() => {
  if (!props.showPagination) {
    return false;
  }
  
  return {
    pageSize: props.pageSize,
    showSizeChanger: false,
    showQuickJumper: false,
    hideOnSinglePage: true,
    total: userData.value.length || 0,
    ...props.pagination // 允许通过props覆盖默认分页配置
  };
});

// 计算属性：滚动配置
const scrollConfig = computed(() => ({
  x: 800,
  ...props.scroll
}));

// 计算属性：行键字段
const rowKeyField = computed(() => 'userId');

// 计算属性：自定义插槽名称
const customSlots = computed(() => {
  // 从slots中提取自定义插槽名称
  return [];
});



// 加载当前用户详细信息
const loadUserData = async () => {
  loading.value = true;
  try {
    // 获取当前登录用户信息
    const response = await getUserProfile();
    
    if (response && response.code === 200) {
      // 根据实际响应结构处理数据
      // 响应格式: {msg: '操作成功', postGroup: '', code: 200, data: {...}, roleGroup: '...'}
      const user = response.data;  // 用户信息在 data 字段中
      const postGroup = response.postGroup;
      const roleGroup = response.roleGroup;
      
      // 创建格式化用户对象，确保每个字段都有默认值
      const formattedUser = {
        userId: user?.userId || '1',
        userName: user?.userName || '-',           // 用户账号
        nickName: user?.nickName || '-',          // 用户名称
        staffCode: user?.staffCode || '-',        // 工号
        deptName: user?.dept?.deptName || '-', // 所属部门
        postNames: postGroup || '-',          // 岗位
        roleNames: roleGroup || '-'           // 角色
      };
      
      userData.value = [formattedUser]; // 只显示当前用户，所以放入数组中
      emit('load-success', userData.value);
    } else {
      console.error('API响应失败或格式不正确:', response);
      
      // 如果API调用失败，创建一个默认用户记录以显示表格结构
      const defaultUser = {
        userId: '1',
        userName: 'API调用失败',
        nickName: 'API调用失败',
        staffCode: 'API调用失败',
        deptName: 'API调用失败',
        postNames: 'API调用失败',
        roleNames: 'API调用失败'
      };
      
      userData.value = [defaultUser];
      emit('load-success', userData.value);
    }
  } catch (error) {
    console.error('请求当前用户信息时发生错误:', error);
    
    // 如果捕获到错误，创建一个默认用户记录以显示表格结构
    const errorUser = {
      userId: '1',
      userName: '网络错误',
      nickName: '网络错误',
      staffCode: '网络错误',
      deptName: '网络错误',
      postNames: '网络错误',
      roleNames: '网络错误'
    };
    
    userData.value = [errorUser];
    emit('load-error', error.message);
  } finally {
    loading.value = false;
  }
};

// 表格变更处理
const handleTableChange = (pagination, filters, sorter) => {
  // 处理排序、筛选等变更
  console.log('表格变更:', { pagination, filters, sorter });
};

// 设置自动刷新
const setupAutoRefresh = () => {
  if (props.autoRefresh && !timer.value) {
    timer.value = setInterval(() => {
      loadUserData();
    }, props.refreshInterval);
  }
};

// 清除自动刷新
const clearAutoRefresh = () => {
  if (timer.value) {
    clearInterval(timer.value);
    timer.value = null;
  }
};

// 组件挂载时加载数据
onMounted(() => {
  loadUserData();
  setupAutoRefresh();
});

// 监听属性变化
watch(
  () => props.autoRefresh,
  (newVal) => {
    if (newVal) {
      setupAutoRefresh();
    } else {
      clearAutoRefresh();
    }
  }
);

// 监听刷新间隔变化
watch(
  () => props.refreshInterval,
  () => {
    if (props.autoRefresh) {
      clearAutoRefresh();
      setupAutoRefresh();
    }
  }
);

// 组件卸载前清理定时器
onUnmounted(() => {
  clearAutoRefresh();
});

// 定义组件方法，用于外部调用刷新数据
defineExpose({
  refresh: loadUserData,
  reload: loadUserData
});
</script>

<style scoped>
.user-info-table {
  background-color: #fff;
  padding: 12px;
  border-radius: 6px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.09);
  width: 80%;  
  max-width: v-bind(maxWidth);
  margin: 0 auto;
}

.user-info-table.no-border {
  border: none;
  box-shadow: none;
  padding: 0;
}
</style>