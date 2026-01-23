<template>
  <div class="app-container">
    <a-card v-if="!currentReportId" class="select-card" style="width: 100%; min-height: 500px;">
      <template #title>请选择报表进行查看</template>
      <div class="report-list">
         <a-form layout="inline" style="margin-bottom: 20px;">
            <a-form-item label="搜索报表">
               <a-input v-model:value="searchKeyword" placeholder="请输入报表名称" allow-clear @change="loadReports" />
            </a-form-item>
         </a-form>
         <EnhancedTable 
            :dataSource="reportList" 
            :loading="loadingList" 
            :columns="reportColumns"
            rowKey="id"
            :pagination="false"
            :customRow="customRow"
            :scroll="{ x: '100%' }"
            style="cursor: pointer; width: 100%"
            size="middle"
            @resizeColumn="handleReportResizeColumn"
            :resizable="true"
         >
            <template #bodyCell="{ column, record }">
               <template v-if="column.key === 'updateTime'">
                  {{ formatDate(record.updateTime) }}
               </template>
               <template v-else-if="column.key === 'action'">
                  <a-button type="link" @click.stop="handleSelectReport(record)">进入</a-button>
               </template>
            </template>
         </EnhancedTable>
         <a-pagination 
            v-model:current="pageNo" 
            :total="total" 
            :show-total="(total: number) => `共 ${total} 条`"
            simple
            @change="loadReports" 
            class="mt-4"
            style="text-align: center"
         />
      </div>
    </a-card>

    <div v-else class="display-area">
      <a-card :bordered="false" style="margin-bottom: 16px;">
        <template #title>
          <div style="display: flex; align-items: center;">
            <a-button v-if="!isStandalone" shape="circle" :icon="h(LeftOutlined)" @click="exitReport" style="margin-right: 16px;" />
            <div>
              <div style="font-size: 18px; font-weight: bold;">{{ currentReportName }}</div>
              <div style="font-size: 12px; color: #999;" v-if="currentReportDescription">{{ currentReportDescription }}</div>
              <div style="font-size: 12px; color: #999;" v-if="breadcrumbs.length > 1">
                当前位置: {{ breadcrumbs[breadcrumbs.length - 1].label }}
              </div>
            </div>
          </div>
        </template>
        <div style="overflow-x: auto; white-space: nowrap;">
          <a-breadcrumb separator="/" style="display: inline-flex; align-items: center; white-space: nowrap;">
              <a-breadcrumb-item v-if="isStandalone" style="margin-right: 16px;">
                 <a @click="backToMainReport" class="cursor-pointer" style="color: #1890ff; display: flex; align-items: center; white-space: nowrap;">
                    <LeftOutlined style="margin-right: 4px;" /> 返回主报表
                 </a>
              </a-breadcrumb-item>
              <a-breadcrumb-item v-for="(crumb, index) in breadcrumbs" :key="index" style="white-space: nowrap;">
                 <a v-if="index < breadcrumbs.length - 1" @click="handleBreadcrumb(index)" class="cursor-pointer">
                    {{ crumb.label }}
                 </a>
                 <span v-else>{{ crumb.label }}</span>
              </a-breadcrumb-item>
          </a-breadcrumb>
        </div>
      </a-card>

      <a-card :bordered="false" class="data-table-card">
         

         <!-- 表格容器，固定高度避免跳动 -->
         <div class="table-container">
            <!-- 加载遮罩层 -->
            <div v-if="loadingData" class="loading-overlay">
               <a-spin size="large" tip="加载中..." />
            </div>
            
            <EnhancedTable 
               :dataSource="tableData" 
               :columns="columns" 
               rowKey="uniqueKey"
               :pagination="false"
               :scroll="{ x: 'max-content', y: 400 }"
               :loading="false"
               size="middle"
               class="data-table"
               :bordered="true"
               :style="{ opacity: tableOpacity, transition: 'opacity 0.3s ease' }"
               @resizeColumn="handleResizeColumn"
               :resizable="true"
            >
               <template #bodyCell="{ column, record }">
                  <template v-if="isLinkColumn(column.dataIndex || column.key)">
                     <span 
                        class="link-cell"
                        @click.stop="handleCellClick(record, column.dataIndex || column.key)"
                     >
                        {{ record[column.dataIndex || column.key] }}
                     </span>
                  </template>
                  <template v-else>
                     <span class="normal-cell">
                        {{ record[column.dataIndex || column.key] }}
                     </span>
                  </template>
               </template>
               
               <!-- 空状态处理 -->
               <template #emptyText>
                  <div class="empty-state">
                     <a-empty description="暂无数据" />
                  </div>
               </template>
            </EnhancedTable>
         </div>

         <!-- 分页组件 -->
         <div class="pagination-wrapper">
            
            <a-pagination
               v-model:current="dataPageNo"
               v-model:page-size="dataPageSize"
               :total="dataTotal"
               show-size-changer
               show-quick-jumper
               :show-total="(total: number) => `共 ${total} 条`"
               @change="handlePageChange"
               @showSizeChange="handlePageSizeChange"
               class="custom-pagination"
            />
         </div>
      </a-card>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, reactive, computed, h, onMounted, watch } from "vue";
import { message, TableColumnType } from "ant-design-vue";
import { LeftOutlined, InfoCircleOutlined } from "@ant-design/icons-vue";
import request from "@/utils/request";
import dayjs from "dayjs";

// 定义组件的props
const props = defineProps({
  // 是否以独立模式运行（不显示报表选择界面）
  standalone: {
    type: Boolean,
    default: false
  },
  // 指定的报表ID（当standalone=true时使用）
  reportId: {
    type: Number,
    default: null
  },
  // 指定的节点ID（当standalone=true时使用）
  nodeId: {
    type: Number,
    default: null
  },
  // 初始化参数
  initialParams: {
    type: Object,
    default: () => ({})
  }
});

// 定义组件的emit事件
const emit = defineEmits(['report-selected', 'node-clicked', 'data-loaded']);

// 格式化日期
const formatDate = (date) => {
  if (!date) return '-';
  return dayjs(date).format('YYYY-MM-DD HH:mm:ss');
};

interface ReportItem {
  id: number;
  reportName: string;
  updateTime: string;
}

interface DrillNode {
  id?: number;
  nodeName: string;
  sqlText: string;
  parentId?: number | null;
  linkField?: string;
  paramName?: string;
  passField?: string;
  children?: DrillNode[];
}

interface BreadcrumbItem {
  id: number;
  label: string;
  paramName?: string;
  paramValue?: string;
}

const loadingList = ref(false);
const reportList = ref<ReportItem[]>([]);
const total = ref(0);
const pageNo = ref(1);
const searchKeyword = ref("");

const loadingData = ref(false);
const tableData = ref<Record<string, any>[]>([]);
const columns = ref<TableColumnType[]>([]);
const dataPageNo = ref(1);
const dataPageSize = ref(10);
const dataTotal = ref(0);
const tableOpacity = ref(1); // 表格透明度控制

const currentReportId = ref<number | null>(null);
const currentReportName = ref("");
const currentReportDescription = ref("");
const breadcrumbs = ref<BreadcrumbItem[]>([]);
const rootNode = ref<DrillNode | null>(null);
const validChildNodes = ref<DrillNode[]>([]);
const isStandalone = ref(false);
const currentNodeId = ref<number | null>(null);
const currentParams = ref<any>({});

const reportColumns = [
  { title: "ID", dataIndex: "id", key: "id", width: 80 },
  { title: "报表名称", dataIndex: "reportName", key: "reportName" },
  { title: "更新时间", dataIndex: "updateTime", key: "updateTime", width: 180 },
  { title: "操作", key: "action", width: 100 },
];

// 根据props初始化
onMounted(() => {
  if (props.standalone && props.reportId) {
    initFromProps();
  } else if (!props.standalone) {
    loadReports();
  }
});

// 监听props变化
watch(() => [props.standalone, props.reportId, props.nodeId], ([newStandalone, newReportId, newNodeId]) => {
  if (newStandalone && newReportId) {
    initFromProps();
  } else if (!newStandalone) {
    loadReports();
  }
});

// 从props初始化（用于独立模式）
async function initFromProps() {
  currentReportId.value = props.reportId;
  isStandalone.value = true;
  
  // 重置分页状态
  dataPageNo.value = 1;
  dataPageSize.value = 10;

  try {
    const res = await request.get("/drill/info/detail/" + props.reportId);
    
    currentReportName.value = res.data?.reportName || res.data?.data?.reportName || "";
    currentReportDescription.value = res.data?.description || res.data?.data?.description || "";
    
    // 构建节点树
    const nodes: DrillNode[] = res.data?.nodes || [];
    
    if (nodes.length > 0) {
      const tree = buildNodeTree(nodes);
      rootNode.value = tree[0] || null;
      
      if (props.nodeId) {
        // 有节点ID：下钻模式
        let node = findNode(rootNode.value!, props.nodeId);
        
        if (!node) {
          // 如果节点树中不存在，尝试通过API获取节点信息
          try {
            const nodeRes = await request.get(`/drill/node/${props.nodeId}`);
            if (nodeRes.data && nodeRes.data.id) {
              node = nodeRes.data;
              
              // 将获取到的节点添加到节点树中
              if (rootNode.value && node.parentId) {
                const parentNode = findNode(rootNode.value, node.parentId);
                if (parentNode) {
                  if (!parentNode.children) {
                    parentNode.children = [];
                  }
                  parentNode.children.push(node);
                }
              }
            }
          } catch (e) {
            console.error("通过API获取节点失败:", e);
          }
        }
        
        if (node) {
          breadcrumbs.value = buildBreadcrumbs(node, rootNode.value!);
          await loadData(node, props.initialParams);
        } else {
          console.error("节点不存在，目标节点ID:", props.nodeId, "可用节点:", nodes.map(n => n.id));
          message.error("节点不存在");
        }
      } else {
        // 无节点ID：报表选择模式
        const rootLabel = res.data?.description || rootNode.value?.nodeName || "主数据";
        breadcrumbs.value = [{
          id: rootNode.value?.id || 0,
          label: rootLabel,
        }];
        await loadData(rootNode.value!, props.initialParams);
      }
    }
  } catch(e) {
    console.error("初始化失败:", e);
    message.error("初始化失败");
  }
}

// 构建面包屑
function buildBreadcrumbs(node: DrillNode, root: DrillNode): BreadcrumbItem[] {
  const crumbs: BreadcrumbItem[] = [];
  const addedNodeIds = new Set<number>(); // 用于跟踪已添加的节点ID
  
  // 添加根节点
  if (!addedNodeIds.has(root.id!)) {
    crumbs.push({
      id: root.id!,
      label: currentReportDescription.value || root.nodeName || "主数据",
    });
    addedNodeIds.add(root.id!);
  }
  
  // 检查节点是否在根节点的子树中
  const nodeInTree = findNode(root, node.id!);
  
  if (nodeInTree) {
    // 节点在树中：递归添加父节点
    function addParent(n: DrillNode) {
      if (n.parentId && root.children) {
        const parent = findNode(root, n.parentId);
        if (parent) {
          addParent(parent);
          // 检查父节点是否已经在面包屑中（避免重复添加）
          if (!addedNodeIds.has(parent.id!)) {
            crumbs.push({
              id: parent.id!,
              label: parent.nodeName,
              paramName: parent.paramName,
              paramValue: parent.paramName && currentParams.value ? currentParams.value[parent.paramName] : undefined,
            });
            addedNodeIds.add(parent.id!);
          }
        }
      }
    }
    
    addParent(node);
  } else {
    // 节点不在树中（通过API获取的）：简化面包屑，只显示根节点和当前节点
    console.log("节点不在当前节点树中，使用简化面包屑");
  }
  
  // 检查当前节点是否已经在面包屑中（避免重复添加）
  if (!addedNodeIds.has(node.id!)) {
    // 添加当前节点，确保paramName存在才设置paramValue
    crumbs.push({
      id: node.id!,
      label: node.nodeName,
      paramName: node.paramName,
      paramValue: node.paramName && currentParams.value ? currentParams.value[node.paramName] : undefined,
    });
    addedNodeIds.add(node.id!);
  }
  
  return crumbs;
}

// 查找节点
function findNode(node: DrillNode | null, id: number): DrillNode | null {
  if (!node) return null;
  
  if (node.id === id) return node;
  
  if (node.children) {
    for (const child of node.children) {
      const found = findNode(child, id);
      if (found) return found;
    }
  }
  return null;
}

async function loadReports() {
  loadingList.value = true;
  try {
    const res = await request.get("/drill/info/list", {
      params: { page_no: pageNo.value, page_size: 10, reportName: searchKeyword.value }
    });
    // 修复数据解析：后端返回的数据结构是 res.rows（直接位于响应对象上）
    const rows = (res as any)?.rows || [];
    const totalCount = (res as any)?.total || 0;
    
    // 强制重新赋值，确保Vue响应式更新
    reportList.value = [...rows];
    total.value = totalCount;
  } catch (error) {
    console.error("加载报表列表失败:", error);
  } finally {
    loadingList.value = false;
  }
}

function customRow(record: ReportItem) {
  return {
    onClick: () => {
      handleSelectReport(record);
    },
  };
}

async function handleSelectReport(record: ReportItem) {
  currentReportId.value = record.id;
  isStandalone.value = false;
  
  // 触发报表选择事件
  emit('report-selected', record);
  
  try {
    const res = await request.get("/drill/info/detail/" + record.id);
    currentReportName.value = res.data?.reportName || "";
    currentReportDescription.value = res.data?.description || "";
    
    const nodes: DrillNode[] = res.data?.nodes || [];
    
    if (nodes.length > 0) {
      const tree = buildNodeTree(nodes);
      rootNode.value = tree[0] || null;
      
      validChildNodes.value = (rootNode.value?.children || []).filter((n: DrillNode) => n.sqlText);
      
      const rootLabel = res.data?.description || rootNode.value?.nodeName || "主数据";
      breadcrumbs.value = [{
        id: rootNode.value?.id || 0,
        label: rootLabel,
      }];
      await loadData(rootNode.value!, null);
    }
  } catch (error) {
    console.error("加载报表结构失败:", error);
    message.error("加载报表结构失败");
  }
}

function buildNodeTree(nodes: DrillNode[]) {
  const map: Record<number, DrillNode> = {};
  const roots: DrillNode[] = [];
  
  // 第一步：创建所有节点的映射
  nodes.forEach((n) => {
    map[n.id!] = { ...n, children: [] };
  });
  
  // 第二步：构建父子关系
  nodes.forEach((n) => {
    if (n.parentId && map[n.parentId]) {
      map[n.parentId].children!.push(map[n.id!]);
    } else {
      roots.push(map[n.id!]);
    }
  });
  
  return roots;
}

async function loadData(node: DrillNode, params: any) {
  loadingData.value = true;
  tableOpacity.value = 0.7; // 开始加载时降低透明度
  
  try {
    if (!node.id) {
      console.warn("当前节点ID无效:", node);
      message.warning("当前节点ID无效");
      tableData.value = [];
      columns.value = [];
      return;
    }
    
    currentNodeId.value = node.id;
    currentParams.value = params;
    
    const req: Record<string, any> = {
              reportId: currentReportId.value,
              nodeId: node.id,
              pageNo: dataPageNo.value,
              pageSize: dataPageSize.value,
            };
            
    if (params && Object.keys(params).length > 0) {
      req.params = params;
    }
    
    const res = await request.post("/drill/execute/execute", req);
    
    // 修复数据解析逻辑：检查响应结构
    let responseData = res.data || res;
    
    // 检查响应结构，适配不同的响应格式
    let actualData = responseData.data || responseData;
    let actualColumns = responseData.columns || [];
    let actualTotal = responseData.total || 0;
    
    dataTotal.value = actualTotal;
    
    // 如果actualData是数组，直接使用；否则检查是否有其他数据字段
    if (!Array.isArray(actualData) && actualData.data) {
      actualData = actualData.data;
    }
    
    // 确保数据是数组
    const finalData = Array.isArray(actualData) ? actualData : [];
    
    tableData.value = finalData.map((row: Record<string, any>, idx: number) => ({
      ...row,
      uniqueKey: (params && Object.values(params).join("")) + "_" + idx,
    }));
    
    // 修复列定义格式：将字符串数组转换为对象数组
    const columnKeys = actualColumns.length > 0 ? actualColumns : 
                      (finalData.length > 0 ? Object.keys(finalData[0]) : []);
    
    // 计算表格总宽度和可用空间
     const totalColumns = columnKeys.length;
     const containerWidth = document.querySelector('.table-container')?.clientWidth || 1200; // 默认容器宽度
     const availableWidth = containerWidth - 50; // 预留滚动条和边框空间
     
     columns.value = columnKeys.map((key: string) => {
        // 计算基于表头字长的最小宽度：统一按中文宽度计算
         const headerTextLength = key.length;
         const chineseCharWidth = 14; // 中文字符宽度约14px
         const padding = 30; // 增加额外间距
         const minWidth = Math.max(headerTextLength * chineseCharWidth + padding, 80); // 最小宽度80px，基于中文表头字长
        
        // 计算初始宽度：只基于表头字长和列数，不考虑内容长度
        let initialWidth;
        if (totalColumns <= 8) {
          // 列数较少时，使用表头字长计算的宽度
          initialWidth = minWidth;
        } else if (totalColumns <= 15) {
          // 中等列数时，在最小宽度和平均宽度之间平衡
          const avgWidth = Math.max(minWidth, availableWidth / totalColumns);
          initialWidth = Math.max(minWidth, avgWidth * 1.1);
        } else {
          // 列数很多时，优先保证最小宽度
          initialWidth = Math.max(minWidth, availableWidth / totalColumns);
        }
        
        return {
          title: () => h('div', { style: { textAlign: 'center' } }, key), // 表头居中对齐
          dataIndex: key,
          key: key,
          width: initialWidth,
          minWidth: minWidth, // 设置基于表头字长的最小宽度限制
          ellipsis: true, // 启用文本省略
          resizable: true, // 明确启用列宽调整
          // 不设置align属性，让表格内容保持默认左对齐
        };
      });
    
    // 确保总数设置正确 - 应以后端返回的总数为准
    dataTotal.value = actualTotal > 0 ? actualTotal : finalData.length;
    
    // 检查后端是否支持分页：只有当返回的总数与实际数据长度不一致时，才认为后端进行了分页
    // 如果总数大于0且与实际数据长度相等，说明后端返回了所有数据，需要前端分页
    const hasBackendPagination = actualTotal > 0 && actualTotal !== finalData.length;
    
    if (hasBackendPagination) {
      // 后端已处理分页，直接使用返回的数据
      tableData.value = finalData.map((row: Record<string, any>, idx: number) => ({
        ...row,
        uniqueKey: (params && Object.values(params).join("")) + "_" + idx,
      }));
    } else {
      // 后端未分页或一次性返回了所有数据，需要前端分页
      if (finalData.length > dataPageSize.value) {
        const startIndex = (dataPageNo.value - 1) * dataPageSize.value;
        const endIndex = Math.min(startIndex + dataPageSize.value, finalData.length);
        const paginatedData = finalData.slice(startIndex, endIndex);
        
        tableData.value = paginatedData.map((row: Record<string, any>, idx: number) => ({
          ...row,
          uniqueKey: (params && Object.values(params).join("")) + "_" + ((dataPageNo.value - 1) * dataPageSize.value + idx),
        }));
      } else {
        // 数据量小于等于每页大小，无需分页
        tableData.value = finalData.map((row: Record<string, any>, idx: number) => ({
          ...row,
          uniqueKey: (params && Object.values(params).join("")) + "_" + idx,
        }));
      }
    }
    
    
    
    // 获取当前节点的子节点用于下钻
    if (node.id) {
      try {
        const childRes = await request.get(`/drill/node/children/${node.id}`);
        
        // 修复API响应解析逻辑
        let childNodesData = childRes.data?.data || childRes.data || [];
        
        // 如果childNodesData是数组，直接使用
        validChildNodes.value = Array.isArray(childNodesData) ? childNodesData : [];
      } catch (error) {
        console.error("获取子节点失败:", error);
        validChildNodes.value = [];
      }
    }

    // 触发数据加载完成事件
    emit('data-loaded', {
      reportId: currentReportId.value,
      nodeId: node.id,
      data: finalData,
      columns: columns.value,
      total: dataTotal.value,
      validChildNodes: validChildNodes.value
    });
  } catch (error) {
    console.error("加载数据失败:", error);
    message.error("加载数据失败");
    tableData.value = [];
    columns.value = [];
    validChildNodes.value = []; // 确保在出错时清空有效子节点
  } finally {
    loadingData.value = false;
    tableOpacity.value = 1; // 加载完成后恢复透明度
  }
}

// 判断是否为链接列
function isLinkColumn(key: string) {
  // 检查当前节点是否有可下钻的子节点
  return validChildNodes.value.some((n) => n.linkField === key);
}

// 处理单元格点击
async function handleCellClick(record: Record<string, any>, key: string) {
  if (!isLinkColumn(key)) return;
  
  // 查找使用当前列作为关联字段的子节点
  const childNode = validChildNodes.value.find(node => 
    node.linkField === key
  );
  
  if (!childNode) {
    message.warning("未找到对应的下钻节点");
    return;
  }
  
  // 构建下钻参数 - 新增传递字段逻辑
  let valueToPass = record[key]; // 默认传递被点击字段的值
  
  // 如果配置了传递字段，则传递该字段的值
  if (childNode.passField && record[childNode.passField] !== undefined) {
    valueToPass = record[childNode.passField];
    console.log("🔍 DRILL_DEBUG: 使用传递字段 - 点击字段:", key, ", 传递字段:", childNode.passField, ", 传递值:", valueToPass);
  } else {
    console.log("🔍 DRILL_DEBUG: 使用默认字段 - 点击字段:", key, ", 传递值:", valueToPass);
  }
  
  const drillParams = {
    ...(currentParams.value || {}), // 保留当前参数
    [childNode.paramName || key]: valueToPass
  };
  
  // 更新面包屑
  const newBreadcrumb: BreadcrumbItem = {
    id: childNode.id!,
    label: childNode.nodeName,
    paramName: childNode.paramName,
    paramValue: record[key],
  };
  
  // 检查面包屑中是否已存在此节点，避免重复添加
  const existingIndex = breadcrumbs.value.findIndex(bc => bc.id === childNode.id);
  if (existingIndex !== -1) {
    // 如果已存在，截断到该节点并添加新参数
    breadcrumbs.value = breadcrumbs.value.slice(0, existingIndex + 1);
    // 更新参数
    breadcrumbs.value[existingIndex].paramValue = record[key];
  } else {
    // 否则添加新的面包屑项
    breadcrumbs.value = [
      ...breadcrumbs.value,
      newBreadcrumb
    ];
  }
  
  // 触发节点点击事件
  emit('node-clicked', {
    fromNode: { id: currentNodeId.value, name: breadcrumbs.value[breadcrumbs.value.length - 2]?.label || '' },
    toNode: childNode,
    clickedValue: record[key],
    params: drillParams
  });
  
  // 重置分页状态
  dataPageNo.value = 1;
  dataPageSize.value = 10;
  
  // 加载下钻数据
  await loadData(childNode, drillParams);
}

// 处理面包屑点击
async function handleBreadcrumb(index: number) {
  if (index >= breadcrumbs.value.length - 1) return; // 最后一项不可点击
  
  const targetBreadcrumb = breadcrumbs.value[index];
  if (!rootNode.value) return;
  
  const targetNode = findNode(rootNode.value, targetBreadcrumb.id);
  if (!targetNode) {
    message.error("目标节点不存在");
    return;
  }
  
  // 截断面包屑到目标位置
  breadcrumbs.value = breadcrumbs.value.slice(0, index + 1);
  
  // 重新构建参数
  const params = {};
  for (let i = 1; i < breadcrumbs.value.length; i++) {
    const crumb = breadcrumbs.value[i];
    if (crumb.paramName && crumb.paramValue !== undefined) {
      params[crumb.paramName] = crumb.paramValue;
    }
  }
  
  // 重置分页状态
  dataPageNo.value = 1;
  dataPageSize.value = 10;
  
  // 加载目标节点数据
  await loadData(targetNode, params);
}

// 退出当前报表
function exitReport() {
  currentReportId.value = null;
  isStandalone.value = false;
  tableData.value = [];
  columns.value = [];
  breadcrumbs.value = [];
  loadReports(); // 重新加载报表列表
}

// 返回主报表
function backToMainReport() {
  if (!rootNode.value) return;
  
  const rootLabel = currentReportDescription.value || rootNode.value.nodeName || "主数据";
  breadcrumbs.value = [{
    id: rootNode.value.id!,
    label: rootLabel,
  }];
  
  // 重置分页状态
  dataPageNo.value = 1;
  dataPageSize.value = 10;
  
  loadData(rootNode.value, {});
}

// 分页相关方法
async function handlePageChange(page: number) {
  dataPageNo.value = page;
  // 直接调用loadData，而不是通过refreshCurrentNode
  if (currentNodeId.value) {
    try {
      // 直接通过API获取节点信息，而不是从根节点树中查找
      const nodeRes = await request.get(`/drill/node/${currentNodeId.value}`);
      const node = nodeRes.data;
      if (node && node.id) {
        loadData(node, currentParams.value);
      }
    } catch (error) {
      console.error("获取节点信息失败:", error);
      // 如果API获取失败，尝试从根节点树中查找作为备用方案
      if (rootNode.value) {
        const node = findNode(rootNode.value, currentNodeId.value);
        if (node) {
          loadData(node, currentParams.value);
        }
      }
    }
  }
}

async function handlePageSizeChange(current: number, size: number) {
  dataPageSize.value = size;
  dataPageNo.value = 1; // 改变每页数量时回到第一页
  // 直接调用loadData，而不是通过refreshCurrentNode
  if (currentNodeId.value) {
    try {
      // 直接通过API获取节点信息，而不是从根节点树中查找
      const nodeRes = await request.get(`/drill/node/${currentNodeId.value}`);
      const node = nodeRes.data;
      if (node && node.id) {
        loadData(node, currentParams.value);
      }
    } catch (error) {
      console.error("获取节点信息失败:", error);
      // 如果API获取失败，尝试从根节点树中查找作为备用方案
      if (rootNode.value) {
        const node = findNode(rootNode.value, currentNodeId.value);
        if (node) {
          loadData(node, currentParams.value);
        }
      }
    }
  }
}

async function refreshCurrentNode() {
  if (!rootNode.value || !currentNodeId.value) return;
  
  const node = findNode(rootNode.value, currentNodeId.value);
  if (node) {
    // 保持当前分页状态，只刷新数据
    await loadData(node, currentParams.value);
  }
}

// 列宽调整相关方法
function handleResizeColumn(w: number, col: any) {
  // 更新列宽度
  const colIndex = columns.value.findIndex(c => c.key === col.key);
  if (colIndex > -1) {
    columns.value[colIndex].width = w;
  }
}

function handleReportResizeColumn(w: number, col: any) {
  // 更新报表列宽度
  const colIndex = reportColumns.findIndex(c => c.key === col.key);
  if (colIndex > -1) {
    reportColumns[colIndex].width = w;
  }
}

// 公共方法，供父组件调用
defineExpose({
  loadReports,
  refreshCurrentNode,
  exitReport,
  backToMainReport,
  loadData
});
</script>

<style scoped>
.app-container {
  padding: 16px;
}

.select-card {
  margin: 20px auto;
  max-width: 1200px;
}

.report-list {
  padding: 20px 0;
}

.display-area {
  width: 100%;
}

.data-table-card {
  width: 100%;
}

.table-container {
  position: relative;
  min-height: 400px;
}

.loading-overlay {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: rgba(255, 255, 255, 0.8);
  display: flex;
  align-items: center;
  justify-content: center;
  z-index: 10;
}

.data-table {
  width: 100%;
}

.pagination-wrapper {
  margin-top: 16px;
  text-align: center;
}

.custom-pagination {
  display: inline-block;
}

.link-cell {
  color: #1890ff;
  cursor: pointer;
  text-decoration: underline;
}

.link-cell:hover {
  color: #40a9ff;
}

.normal-cell {
  color: inherit;
}

.empty-state {
  padding: 40px 0;
}

.cursor-pointer {
  cursor: pointer;
}

.mt-4 {
  margin-top: 16px;
}
</style>