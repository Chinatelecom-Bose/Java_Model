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
        <a-button type="default" style="margin-left: 8px" @click="handleSetDefaultReport">
          <BearJiaIcon icon="setting-outlined" />设置默认报表
        </a-button>
        <a-button type="default" style="margin-left: 8px" @click="handleSetParentMenuId">
          <BearJiaIcon icon="apartment-outlined" />设置父级菜单ID
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
        <a-form-item label="报表ID" name="id">
          <a-input-number v-if="!isEditMode" v-model:value="formData.id" :min="1" placeholder="请输入报表ID" />
          <a-input v-else v-model:value="formData.id" disabled />
        </a-form-item>
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
       <DrillConfigTree v-if="configVisible && currentId > 0" :info-id="currentId" @close="configVisible = false" @save-success="onConfigSaveSuccess" />
    </a-modal>

    <a-modal
      v-model:open="defaultReportVisible"
      title="设置默认报表"
      width="500px"
      :confirm-loading="defaultReportLoading"
      @ok="submitDefaultReport"
      @cancel="defaultReportVisible = false"
    >
      <a-form :model="defaultReportForm" :rules="defaultReportRules" :label-col="{ span: 6 }" :wrapper-col="{ span: 18 }">
        <a-form-item label="默认报表ID" name="defaultReportId">
          <a-input-number v-model:value="defaultReportForm.defaultReportId" :min="1" placeholder="请输入默认报表ID" />
        </a-form-item>
        <a-form-item label="说明">
          <a-typography-text type="secondary">
            设置业务免费页面默认进入的报表ID
          </a-typography-text>
        </a-form-item>
      </a-form>
    </a-modal>

    <a-modal
      v-model:open="parentMenuIdVisible"
      title="设置父级菜单ID"
      width="500px"
      :confirm-loading="parentMenuIdLoading"
      @ok="submitParentMenuId"
      @cancel="parentMenuIdVisible = false"
    >
      <a-form :model="parentMenuIdForm" :label-col="{ span: 6 }" :wrapper-col="{ span: 18 }">
        <a-form-item label="父级菜单ID">
          <a-input-number v-model:value="parentMenuIdForm.parentId" :min="0" placeholder="请输入父级菜单ID" style="width: 100%" />
        </a-form-item>
        <a-form-item label="说明">
          <a-typography-text type="secondary">
            设置新增菜单的父级菜单ID，0表示顶级菜单
          </a-typography-text>
        </a-form-item>
      </a-form>
    </a-modal>
  </div>
</template>

<script setup lang="ts">
import { ref, reactive, onMounted, computed, watch } from "vue";
import { message } from "ant-design-vue";
import DrillConfigTree from "./ConfigTree.vue";
import { BearJiaIcon } from "@/utils/BearJiaIcon.js";
import request from "@/utils/request";
import { addMenu, listMenu, delMenu, updateMenu } from "@/api/system/menu";
import dayjs from "dayjs";

// 定义组件的props
const props = defineProps({
  // 是否只读模式
  readonly: {
    type: Boolean,
    default: false
  },
  // 父级菜单名称（用于自动创建菜单时搜索父级菜单ID）
  parentMenuName: {
    type: String,
    default: 'BF_Form'
  }
});

const parentIdRef = ref<number | undefined>(undefined);

// 初始化时从 sys_config 加载父级菜单ID
async function loadParentMenuId() {
  try {
    const res = await request.get('/system/config/getParentMenuId');
    const configValue = res.data?.configValue || res.data?.data?.configValue || '';
    const currentParentMenuId = parseInt(configValue, 10);
    if (!isNaN(currentParentMenuId) && currentParentMenuId > 0) {
      parentIdRef.value = currentParentMenuId;
    }
  } catch (error) {
    console.error('加载父级菜单ID失败:', error);
  }
}

// 定义组件的emit事件
const emit = defineEmits<{
  (e: 'list-updated'): void;
}>();

// 格式化日期
const formatDate = (date: any) => {
  if (!date) return '-';
  return dayjs(date).format('YYYY-MM-DD HH:mm:ss');
};

interface DataDrillInfo {
  id?: number;
  parentId?: number;
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
const isEditMode = ref(false);
const formData = reactive<DataDrillInfo>({
  id: undefined,
  parentId: undefined,
  reportName: "",
  status: "0",
  description: ""
});

const configVisible = ref(false);
const currentId = ref<number>(0);

const defaultReportVisible = ref(false);
const defaultReportLoading = ref(false);
const defaultReportForm = reactive({
  defaultReportId: null as number | null,
});

const parentMenuIdVisible = ref(false);
const parentMenuIdLoading = ref(false);
const parentMenuIdForm = reactive({
  parentId: null as number | null,
});
const defaultReportRules = {
  defaultReportId: [{ required: true, message: "请输入默认报表ID", trigger: "change" }],
};

const rules = computed(() => ({
  id: isEditMode.value ? [] : [{ required: true, message: "请输入报表ID", trigger: "blur" }],
  reportName: [{ required: true, message: "请输入报表名称", trigger: "blur" }],
}));

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
  loadParentMenuId();
});

async function handleQuery() {
  loading.value = true;
  try {
    const res = await request.get("/drill/info/list", { params: queryParams });
    const rows = (res as any)?.rows || [];
    const totalCount = (res as any)?.total || 0;
    tableData.value = [...rows];
    total.value = totalCount;
  } catch (error) {
    console.error("查询报表列表失败:", error);
  } finally {
    loading.value = false;
  }
}

function handleAdd() {
  if (props.readonly) {
    message.warning("当前为只读模式，无法添加新记录");
    return;
  }
  dialogTitle.value = "新增报表";
  isEditMode.value = false;
  Object.assign(formData, { id: null, parentId: undefined, reportName: "", status: "0", description: "" });
  dialogVisible.value = true;
}

function handleEdit(row: DataDrillInfo) {
  if (props.readonly) {
    message.warning("当前为只读模式，无法编辑记录");
    return;
  }
  dialogTitle.value = "编辑报表";
  isEditMode.value = true;
  Object.assign(formData, row);
  dialogVisible.value = true;
}

async function handleDelete(row: DataDrillInfo) {
  if (props.readonly) {
    message.warning("当前为只读模式，无法删除记录");
    return;
  }
  if (row.id) {
    await request.delete("/drill/info/" + row.id);
    message.success("删除成功");
    handleQuery();
    emit('list-updated');
  }
}

async function submitForm() {
  if (props.readonly) {
    message.warning("当前为只读模式，无法提交表单");
    return;
  }
  try {
    await formRef.value?.validate();
    submitLoading.value = true;
    
    // 创建一个新的对象以确保所有字段都被发送，包括空字符串
    const submitData = {
      id: formData.id,
      reportName: formData.reportName,
      status: formData.status,
      description: formData.description || ""  // 确保description始终是字符串
    };
    
    if (isEditMode.value) {
      await request({
        url: "/drill/info",
        method: "put",
        data: submitData
      });
      
      // 编辑报表成功后，更新对应的菜单
      await updateMenuForReport(formData.id!, formData.reportName);
    } else {
      // 检查ID是否已存在
      try {
        const checkRes = await request.get("/drill/info/" + formData.id);
        const checkData = (checkRes as any);
        if (checkData && checkData.id) {
          message.error('报表ID已存在，请使用其他ID');
          return;
        }
      } catch (e) {
        // ID不存在，继续新增
      }
      
      await request.post("/drill/info", submitData);
      
      // 新增报表成功后，自动创建菜单（使用用户输入的ID）
      if (formData.id) {
        await createMenuForReport(formData.id, formData.reportName);
      }
    }
    message.success("保存成功");
    dialogVisible.value = false;
    handleQuery();
    emit('list-updated');
  } catch (error) {
    console.error("保存失败:", error);
  } finally {
    submitLoading.value = false;
  }
}

async function createMenuForReport(reportId: number, reportName: string) {
  try {
    console.log('开始创建菜单，reportId:', reportId, 'reportName:', reportName);
    
    let finalParentId = parentIdRef.value;
    
    // 如果用户没有指定父级菜单ID，则搜索指定的父级菜单的 ID
    if (!finalParentId) {
      try {
        console.log('搜索父级菜单:', props.parentMenuName);
        const response = await listMenu({ menuName: props.parentMenuName });
        const rows = (response as any)?.rows || [];
        console.log('搜索结果:', rows);
        if (rows.length > 0) {
          finalParentId = rows[0].menuId;
          console.log('找到父级菜单ID:', finalParentId);
        } else {
          console.warn(`未找到 ${props.parentMenuName} 菜单，使用顶级菜单`);
          finalParentId = 0;
        }
      } catch (error) {
        console.error(`搜索 ${props.parentMenuName} 菜单失败:`, error);
        finalParentId = 0;
      }
    }
    
    const menuData = {
      menuName: reportName,
      parentId: finalParentId,
      orderNum: 0,
      path: 'BF_Form',
      component: 'business_free/display',
      query: `reportId=${reportId}`,
      isFrame: '1',
      menuType: 'C',
      visible: '0',
      status: '0',
      perms: '',
      icon: 'chart'
    };
    
    console.log('准备创建菜单，数据:', menuData);
    const result = await addMenu(menuData);
    console.log('菜单创建结果:', result);
    message.success(`已自动创建菜单：${reportName}`);
  } catch (error) {
    console.error("创建菜单失败:", error);
    message.error(`菜单创建失败: ${(error as any)?.message || '未知错误'}`);
  }
}

async function updateMenuForReport(reportId: number, reportName: string) {
  try {
    console.log('开始更新菜单，reportId:', reportId, 'reportName:', reportName);
    
    const response = await listMenu({ query: `reportId=${reportId}` });
    const rows = (response as any)?.rows || [];
    
    if (rows.length > 0) {
      const menu = rows[0];
      console.log('找到对应菜单:', menu);
      
      const menuData = {
        menuId: menu.menuId,
        menuName: reportName,
        parentId: menu.parentId,
        orderNum: menu.orderNum,
        path: menu.path,
        component: menu.component,
        query: menu.query,
        isFrame: menu.isFrame,
        menuType: menu.menuType,
        visible: menu.visible,
        status: menu.status,
        perms: menu.perms,
        icon: menu.icon
      };
      
      console.log('准备更新菜单，数据:', menuData);
      await updateMenu(menuData);
      console.log('菜单更新成功');
    } else {
      console.warn(`未找到 reportId=${reportId} 对应的菜单`);
    }
  } catch (error) {
    console.error("更新菜单失败:", error);
    message.error(`菜单更新失败: ${(error as any)?.message || '未知错误'}`);
  }
}

function handleConfig(row: DataDrillInfo) {
  if (props.readonly) {
    message.warning("当前为只读模式，无法配置下钻");
    return;
  }
  if (row.id) {
    currentId.value = row.id;
    configVisible.value = true;
  }
}

// 下钻配置保存成功回调
function onConfigSaveSuccess() {
  // 配置保存成功后，可以刷新列表或执行其他操作
  console.log("下钻配置保存成功");
}

// 设置默认报表
async function handleSetDefaultReport() {
  try {
    // 获取当前的默认报表ID
    const res = await request.get('/system/config/getDefaultReportId');
    const configValue = res.data?.configValue || res.data?.data?.configValue || '';
    const currentReportId = parseInt(configValue, 10);
    
    defaultReportForm.defaultReportId = !isNaN(currentReportId) && currentReportId > 0 ? currentReportId : null;
    defaultReportVisible.value = true;
  } catch (error) {
    console.error('获取当前默认报表ID失败:', error);
    defaultReportForm.defaultReportId = null;
    defaultReportVisible.value = true;
  }
}

// 提交默认报表设置
async function submitDefaultReport() {
  try {
    await request({
      url: '/system/config/setDefaultReportId',
      method: 'post',
      data: {
        configKey: 'sys.defaultReportId',
        configName: '默认报表ID',
        configValue: defaultReportForm.defaultReportId?.toString() || '',
        configType: 'Y'
      }
    });
    message.success('设置成功');
    defaultReportVisible.value = false;
  } catch (error) {
    console.error('设置默认报表失败:', error);
    message.error('设置失败，请重试');
  }
}

async function handleSetParentMenuId() {
  try {
    const res = await request.get('/system/config/getParentMenuId');
    const configValue = res.data?.configValue || res.data?.data?.configValue || '';
    const currentParentMenuId = parseInt(configValue, 10);
    parentMenuIdForm.parentId = !isNaN(currentParentMenuId) && currentParentMenuId > 0 ? currentParentMenuId : null;
    parentMenuIdVisible.value = true;
  } catch (error) {
    console.error('获取当前父级菜单ID失败:', error);
    parentMenuIdForm.parentId = null;
    parentMenuIdVisible.value = true;
  }
}

async function submitParentMenuId() {
  try {
    parentMenuIdLoading.value = true;
    await request({
      url: '/system/config/setParentMenuId',
      method: 'post',
      data: {
        configKey: 'sys.parentMenuId',
        configName: '父级菜单ID',
        configValue: parentMenuIdForm.parentId?.toString() || '',
        configType: 'Y'
      }
    });
    parentIdRef.value = parentMenuIdForm.parentId || undefined;
    message.success('设置成功');
    parentMenuIdVisible.value = false;
  } catch (error) {
    console.error('设置父级菜单ID失败:', error);
    message.error('设置失败，请重试');
  } finally {
    parentMenuIdLoading.value = false;
  }
}

// 公共方法，供父组件调用
defineExpose({
  handleQuery,
  handleAdd,
  handleEdit,
  handleDelete,
  submitForm
});
</script>

<style scoped>
.app-container {
  padding: 16px;
}

.pagination-container {
  margin-top: 15px;
  text-align: right;
}
</style>