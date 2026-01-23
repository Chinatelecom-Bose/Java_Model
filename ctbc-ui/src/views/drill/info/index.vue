<template>
  <div class="app-container">
    <a-form :model="queryParams" layout="inline">
      <a-form-item label="报表名称">
        <a-input v-model:value="queryParams.reportName" placeholder="请输入报表名称" allow-clear />
      </a-form-item>
      <a-form-item>
        <a-button type="primary" :loading="loading" @click="handleQuery">
          <BearJiaIcon icon="search-outlined" />查询
        </a-button>
        <a-button type="primary" style="margin-left: 8px" @click="handleAdd">
          <BearJiaIcon icon="plus-outlined" />新增
        </a-button>
      </a-form-item>
    </a-form>

    <a-card style="margin-top: 16px">
      <a-table
        :loading="loading"
        :dataSource="tableData"
        :columns="columns"
        rowKey="id"
        :pagination="false"
        bordered
      >
        <template #bodyCell="{ column, record }">
          <template v-if="column.key === 'status'">
            <a-tag :color="record.status === '0' ? 'green' : 'default'">
              {{ record.status === '0' ? '启用' : '停用' }}
            </a-tag>
          </template>
          <template v-else-if="column.key === 'updateTime'">
            {{ formatDate(record.updateTime) }}
          </template>
          <template v-else-if="column.key === 'action'">
            <a-button type="link" @click="handleConfig(record)">配置下钻</a-button>
            <a-divider type="vertical" />
            <a-button type="link" @click="handleEdit(record)">编辑</a-button>
            <a-divider type="vertical" />
            <a-popconfirm title="确认删除该报表?" @confirm="handleDelete(record)">
              <a-button type="link" danger>删除</a-button>
            </a-popconfirm>
          </template>
        </template>
      </a-table>
      
      <a-pagination
        v-model:current="queryParams.page_no"
        v-model:page-size="queryParams.page_size"
        :total="total"
        show-size-changer
        show-quick-jumper
        :show-total="(total: number) => `共 ${total} 条`"
        style="margin-top: 16px; text-align: right"
        @change="handleQuery"
        @showSizeChange="handleQuery"
      />
    </a-card>

    <a-modal
      v-model:open="dialogVisible"
      :title="dialogTitle"
      width="500px"
      :confirm-loading="submitLoading"
      @ok="submitForm"
      @cancel="dialogVisible = false"
    >
      <a-form ref="formRef" :model="formData" :rules="rules" :label-col="{ span: 4 }" :wrapper-col="{ span: 18 }">
        <a-form-item label="报表名称" name="reportName">
          <a-input v-model:value="formData.reportName" />
        </a-form-item>
        <a-form-item label="状态" name="status">
           <a-radio-group v-model:value="formData.status">
             <a-radio value="0">启用</a-radio>
             <a-radio value="1">停用</a-radio>
           </a-radio-group>
        </a-form-item>
        <a-form-item label="备注" name="description">
          <a-input v-model:value="formData.description" type="textarea" />
        </a-form-item>
      </a-form>
    </a-modal>

    <a-modal
       v-model:open="configVisible"
       title="下钻配置"
       width="80%"
       :footer="null"
       :bodyStyle="{ padding: '0' }"
       @cancel="configVisible = false"
    >
       <DrillConfigTree v-if="configVisible && currentId > 0" :info-id="currentId" @close="configVisible = false" />
    </a-modal>
  </div>
</template>

<script setup lang="ts">
import { ref, reactive, onMounted } from "vue";
import { message } from "ant-design-vue";
import DrillConfigTree from "./components/DrillConfigTree.vue";
import { BearJiaIcon } from "@/utils/BearJiaIcon.js";
import request from "@/utils/request";
import dayjs from "dayjs";

// 格式化日期
const formatDate = (date: any) => {
  if (!date) return '-';
  return dayjs(date).format('YYYY-MM-DD HH:mm:ss');
};

interface DataDrillInfo {
  id?: number;
  reportName: string;
  status: string;
  description?: string;
  updateTime?: string;
}

const loading = ref(false);
const tableData = ref<DataDrillInfo[]>([]);
const total = ref(0);
const queryParams = reactive({
  page_no: 1,
  page_size: 10,
  reportName: "",
});

const dialogVisible = ref(false);
const dialogTitle = ref("");
const submitLoading = ref(false);
const formRef = ref();
const formData = reactive<DataDrillInfo>({
  reportName: "",
  status: "0",
  description: ""
});

const configVisible = ref(false);
const currentId = ref<number>(0);

const rules = {
  reportName: [{ required: true, message: "请输入报表名称", trigger: "blur" }],
};

const columns = [
  { title: "ID", dataIndex: "id", key: "id", width: 80 },
  { title: "报表名称", dataIndex: "reportName", key: "reportName" },
  { title: "状态", dataIndex: "status", key: "status", width: 100 },
  { title: "备注", dataIndex: "description", key: "description" },
  { title: "更新时间", dataIndex: "updateTime", key: "updateTime", width: 180 },
  { title: "操作", key: "action", width: 250, fixed: "right" },
];

onMounted(() => {
  handleQuery();
});

async function handleQuery() {
  loading.value = true;
  try {
    const res = await request.get("/drill/info/list", { params: queryParams });
    tableData.value = res.rows || [];
    total.value = res.total || 0;
  } catch (error) {
    console.error("查询报表列表失败:", error);
  } finally {
    loading.value = false;
  }
}

function handleAdd() {
  dialogTitle.value = "新增报表";
  Object.assign(formData, { id: undefined, reportName: "", status: "0", description: "" });
  dialogVisible.value = true;
}

function handleEdit(row: DataDrillInfo) {
  dialogTitle.value = "编辑报表";
  Object.assign(formData, row);
  dialogVisible.value = true;
}

async function handleDelete(row: DataDrillInfo) {
  if (row.id) {
    await request.delete("/drill/info/" + row.id);
    message.success("删除成功");
    handleQuery();
  }
}

async function submitForm() {
  try {
    await formRef.value?.validate();
    submitLoading.value = true;
    if (formData.id) {
      await request({
        url: "/drill/info",
        method: "put",
        data: formData
      });
    } else {
      await request.post("/drill/info", formData);
    }
    message.success("保存成功");
    dialogVisible.value = false;
    handleQuery();
  } catch (error) {
    console.error("保存失败:", error);
  } finally {
    submitLoading.value = false;
  }
}

function handleConfig(row: DataDrillInfo) {
  if (row.id) {
    currentId.value = row.id;
    configVisible.value = true;
  }
}
</script>

<style scoped>
.pagination-container {
  margin-top: 15px;
  text-align: right;
}
</style>
