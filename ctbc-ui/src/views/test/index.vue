<template>
  <div class="test-page">
    <a-card title="测试数据展示" :bordered="false">
      <!-- 搜索区域 -->
      <div class="search-area">
        <a-row :gutter="[16, 16]">
          <a-col :span="6">
            <a-input
              v-model:value="searchForm.saleCenterName"
              placeholder="经营单位"
              allow-clear
              @change="handleSearch"
            />
          </a-col>
          <a-col :span="6">
            <a-input
              v-model:value="searchForm.orgName"
              placeholder="支局"
              allow-clear
              @change="handleSearch"
            />
          </a-col>
          <a-col :span="6">
            <a-input
              v-model:value="searchForm.staffName"
              placeholder="姓名"
              allow-clear
              @change="handleSearch"
            />
          </a-col>
          <a-col :span="6">
            <a-button type="primary" @click="handleSearch">
              <BearJiaIcon icon="search-outlined" /> 搜索
            </a-button>
            <a-button style="margin-left: 8px" @click="handleReset">
              <BearJiaIcon icon="reload-outlined" /> 重置
            </a-button>
          </a-col>
        </a-row>
      </div>

      <!-- 数据表格 -->
      <a-table
        :columns="columns"
        :data-source="tableData"
        :pagination="pagination"
        :loading="loading"
        row-key="monthNo"
        @change="handleTableChange"
      >
        <template #operation="{ record }">
          <a-button type="link" size="small" @click="handleView(record)"> 查看 </a-button>
        </template>
      </a-table>
    </a-card>

    <!-- 查看详情模态框 -->
    <a-modal v-model:open="detailModalVisible" title="数据详情" :footer="null" width="600px">
      <a-descriptions :column="2" bordered>
        <a-descriptions-item label="月份">{{ detailData.monthNo }}</a-descriptions-item>
        <a-descriptions-item label="经营单位">{{ detailData.saleCenterName }}</a-descriptions-item>
        <a-descriptions-item label="支局">{{ detailData.orgName }}</a-descriptions-item>
        <a-descriptions-item label="工号">{{ detailData.staffCode }}</a-descriptions-item>
        <a-descriptions-item label="姓名">{{ detailData.staffName }}</a-descriptions-item>
        <a-descriptions-item label="类型">{{ detailData.dataType }}</a-descriptions-item>
        <a-descriptions-item label="竣工数">{{ detailData.completeNum }}</a-descriptions-item>
        <a-descriptions-item label="激活数">{{ detailData.activateNum }}</a-descriptions-item>
        <a-descriptions-item label="创建时间" :span="2">{{
          detailData.createTime
        }}</a-descriptions-item>
        <a-descriptions-item label="备注" :span="2">{{ detailData.remark }}</a-descriptions-item>
      </a-descriptions>
    </a-modal>
  </div>
</template>

<script setup>
import { ref, reactive, onMounted } from 'vue';
import { listTestEntity, getTestEntity } from '@/api/test';
import { BearJiaIcon } from '@/utils/BearJiaIcon';
import { message } from 'ant-design-vue';

// 搜索表单
const searchForm = reactive({
  saleCenterName: '',
  orgName: '',
  staffName: '',
});

// 表格数据
const tableData = ref([]);
const loading = ref(false);
const pagination = reactive({
  current: 1,
  pageSize: 10,
  total: 0,
  showSizeChanger: true,
  pageSizeOptions: ['10', '20', '50', '100'],
  showTotal: (total) => `共 ${total} 条记录`,
});

// 查看详情模态框
const detailModalVisible = ref(false);
const detailData = ref({});

// 表格列配置
const columns = [
  {
    title: '月份',
    dataIndex: 'monthNo',
    key: 'monthNo',
    width: 100,
  },
  {
    title: '经营单位',
    dataIndex: 'saleCenterName',
    key: 'saleCenterName',
  },
  {
    title: '支局',
    dataIndex: 'orgName',
    key: 'orgName',
  },
  {
    title: '工号',
    dataIndex: 'staffCode',
    key: 'staffCode',
    width: 120,
  },
  {
    title: '姓名',
    dataIndex: 'staffName',
    key: 'staffName',
    width: 120,
  },
  {
    title: '类型',
    dataIndex: 'dataType',
    key: 'dataType',
    width: 100,
  },
  {
    title: '竣工数',
    dataIndex: 'completeNum',
    key: 'completeNum',
    width: 100,
  },
  {
    title: '激活数',
    dataIndex: 'activateNum',
    key: 'activateNum',
    width: 100,
  },
  {
    title: '操作',
    key: 'operation',
    width: 80,
    fixed: 'right',
    slots: { customRender: 'operation' },
  },
];

// 获取数据列表
const getDataList = async () => {
  loading.value = true;
  try {
    const params = {
      ...searchForm,
      pageNum: pagination.current,
      pageSize: pagination.pageSize,
    };
    const res = await listTestEntity(params);
    if (res.code === 200) {
      tableData.value = res.rows;
      pagination.total = res.total;
    } else {
      message.error(res.msg || '获取数据失败');
    }
  } catch (error) {
    message.error('获取数据失败');
    console.error('获取数据失败:', error);
  } finally {
    loading.value = false;
  }
};

// 搜索
const handleSearch = () => {
  pagination.current = 1;
  getDataList();
};

// 重置
const handleReset = () => {
  searchForm.saleCenterName = '';
  searchForm.orgName = '';
  searchForm.staffName = '';
  pagination.current = 1;
  getDataList();
};

// 表格变化
const handleTableChange = (pagination) => {
  Object.assign(pagination, pagination);
  getDataList();
};

// 查看详情
const handleView = async (record) => {
  try {
    const res = await getTestEntity(record.monthNo);
    if (res.code === 200) {
      detailData.value = res.data;
      detailModalVisible.value = true;
    } else {
      message.error(res.msg || '获取详情失败');
    }
  } catch (error) {
    message.error('获取详情失败');
    console.error('获取详情失败:', error);
  }
};

// 初始化
onMounted(() => {
  getDataList();
});
</script>

<style scoped>
.test-page {
  padding: 20px;
  background-color: #f0f2f5;
  min-height: calc(100vh - 104px);
}

.search-area {
  margin-bottom: 16px;
}
</style>
