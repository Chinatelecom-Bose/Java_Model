<template>
  <div class="app-container">
    <a-card v-if="!currentReportId" class="select-card" style="width: 100%; min-height: 500px;">
      <template #title>请选择报表进行查看</template>
      <div class="report-list">
         <a-form layout="inline">
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
        <a-breadcrumb separator="/">
            <a-breadcrumb-item v-if="isStandalone">
               <a @click="backToMainReport" class="cursor-pointer" style="color: #1890ff; display: flex; align-items: center;">
                  <LeftOutlined style="margin-right: 4px;" /> 返回主报表
               </a>
            </a-breadcrumb-item>
            <a-breadcrumb-item v-for="(crumb, index) in breadcrumbs" :key="index">
               <a v-if="!isStandalone && index < breadcrumbs.length - 1" @click="handleBreadcrumb(index)" class="cursor-pointer">
                  {{ crumb.label }}
               </a>
               <span v-else>{{ crumb.label }}</span>
            </a-breadcrumb-item>
        </a-breadcrumb>
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
import { useRouter, useRoute } from "vue-router";
import { message, TableColumnType } from "ant-design-vue";
import { LeftOutlined, InfoCircleOutlined } from "@ant-design/icons-vue";
import request from "@/utils/request";
import dayjs from "dayjs";

const router = useRouter();
const route = useRoute();

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

// 路由参数初始化
onMounted(() => {
  if (route.query.report_id) {
    initFromQuery();
  } else {
    loadReports();
  }
});

// 监听路由变化
watch(() => route.query, (newQuery) => {
  if (newQuery.report_id) {
    // 简化条件，直接触发初始化
    initFromQuery();
  }
}, { immediate: true });

// 从路由参数初始化
async function initFromQuery() {
  const rId = Number(route.query.report_id);
  const nId = route.query.node_id ? Number(route.query.node_id) : null;
  const pStr = route.query.params as string;
  const pageNoFromQuery = route.query.page_no ? Number(route.query.page_no) : null;
  const pageSizeFromQuery = route.query.page_size ? Number(route.query.page_size) : null;
  let params = {};
  
  try {
    params = pStr ? JSON.parse(pStr) : {};
  } catch(e) {
    console.error("解析参数失败", e);
  }
  
  currentReportId.value = rId;
  
  // 每个节点使用独立的分页状态：总是重置到第一页
  dataPageNo.value = 1;
  dataPageSize.value = 10;

  
  // 加载报表信息
  try {
    const res = await request.get("/drill/info/detail/" + rId);
    
    currentReportName.value = res.data?.reportName || res.data?.data?.reportName || "";
    currentReportDescription.value = res.data?.description || res.data?.data?.description || "";
    
    // 构建节点树
    const nodes: DrillNode[] = res.data?.nodes || [];
    
    if (nodes.length > 0) {
      const tree = buildNodeTree(nodes);
      rootNode.value = tree[0] || null;
      
      if (nId) {
        // 有节点ID：下钻模式
        isStandalone.value = true;
        let node = findNode(rootNode.value!, nId);
        
        if (!node) {
          // 如果节点树中不存在，尝试通过API获取节点信息
          try {
            const nodeRes = await request.get(`/drill/node/${nId}`);
            if (nodeRes.data && nodeRes.data.id) {
              node = nodeRes.data;
              
              // 关键修复：将获取到的节点添加到节点树中
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
          await loadData(node, params);
        } else {
          console.error("节点不存在，目标节点ID:", nId, "可用节点:", nodes.map(n => n.id));
          message.error("节点不存在");
        }
      } else {
        // 无节点ID：报表选择模式
        isStandalone.value = false;
        const rootLabel = res.data?.description || rootNode.value?.nodeName || "主数据";
        breadcrumbs.value = [{
          id: rootNode.value?.id || 0,
          label: rootLabel,
        }];
        await loadData(rootNode.value!, {});
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
  
  // 添加根节点
  crumbs.push({
    id: root.id!,
    label: currentReportDescription.value || root.nodeName || "主数据",
  });
  
  // 检查节点是否在根节点的子树中
  const nodeInTree = findNode(root, node.id!);
  
  if (nodeInTree) {
    // 节点在树中：递归添加父节点
    function addParent(n: DrillNode) {
      if (n.parentId && root.children) {
        const parent = findNode(root, n.parentId);
        if (parent) {
          addParent(parent);
          // 确保paramName存在才设置paramValue
          crumbs.push({
            id: parent.id!,
            label: parent.nodeName,
            paramName: parent.paramName,
            paramValue: parent.paramName && currentParams.value ? currentParams.value[parent.paramName] : undefined,
          });
        }
      }
    }
    
    addParent(node);
  } else {
    // 节点不在树中（通过API获取的）：简化面包屑，只显示根节点和当前节点
    console.log("节点不在当前节点树中，使用简化面包屑");
  }
  
  // 添加当前节点，确保paramName存在才设置paramValue
  crumbs.push({
    id: node.id!,
    label: node.nodeName,
    paramName: node.paramName,
    paramValue: node.paramName && currentParams.value ? currentParams.value[node.paramName] : undefined,
  });
  
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

loadReports();

async function loadReports() {
  loadingList.value = true;
  try {
    const res = await request.get("/drill/info/list", {
      params: { page_no: pageNo.value, page_size: 10, reportName: searchKeyword.value }
    });
    reportList.value = res.rows || [];
    total.value = res.total || 0;
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
  // 通过路由跳转选择报表
  const query = {
    report_id: record.id,
    _t: Date.now()
  };
  
  // 直接调用initFromQuery来初始化状态，而不是依赖路由监听器
  await router.push({ path: route.path, query });
  
  // 手动触发初始化，确保状态同步
  await initFromQuery();
}

async function loadReportStructure() {
  if (!currentReportId.value) return;
  try {
    const res = await request.get("/drill/info/detail/" + currentReportId.value);
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
    
    // 显示当前节点信息
  
    
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
    
    // 确保总数设置正确
            dataTotal.value = actualTotal > 0 ? actualTotal : finalData.length;
            
            // 检查后端是否支持分页：如果返回的数据量等于请求的pageSize，说明可能支持分页
            const isBackendPaginationSupported = actualTotal > 0 && actualTotal !== finalData.length;
    
    // 如果后端不支持分页，在前端实现分页
    if (!isBackendPaginationSupported && finalData.length > dataPageSize.value) {
      console.log("后端不支持分页，启用前端分页");
      const startIndex = (dataPageNo.value - 1) * dataPageSize.value;
      const endIndex = startIndex + dataPageSize.value;
      const paginatedData = finalData.slice(startIndex, endIndex);
      
      tableData.value = paginatedData.map((row: Record<string, any>, idx: number) => ({
        ...row,
        uniqueKey: (params && Object.values(params).join("")) + "_" + idx,
      }));
      
      dataTotal.value = finalData.length;
      console.log("前端分页结果:", {
        startIndex,
        endIndex,
        total: finalData.length,
        paginatedCount: paginatedData.length
      });
    }
    
    // 获取子节点用于下钻
    if (node.id) {
      try {
        const childRes = await request.get(`/drill/node/children/${node.id}`);
        
        // 修复API响应解析逻辑
        let childNodesData = childRes.data?.data || childRes.data || [];
        
        // 如果childNodesData是Proxy对象，尝试获取其原始值
        if (childNodesData && typeof childNodesData === 'object' && 'length' in childNodesData) {
          // 如果是数组或类似数组的对象，直接使用
          validChildNodes.value = Array.isArray(childNodesData) ? childNodesData : [];
        } else {
          // 如果是其他对象，尝试转换为数组
          validChildNodes.value = [];
        }
        
        if (validChildNodes.value.length > 0) {
          // 有可下钻的子节点
        } else {
          // 当前节点没有配置子节点，因此没有可下钻的字段
        }
      } catch (error) {
        console.error("获取子节点失败:", error);
        validChildNodes.value = [];
      }
    }
    

  } catch (error) {
    console.error("加载数据失败:", error);
    message.error("加载数据失败");
    tableData.value = [];
    columns.value = [];
  } finally {
    loadingData.value = false;
    // 延迟恢复透明度，确保动画效果
    setTimeout(() => {
      tableOpacity.value = 1;
    }, 100);
  }
}

function isLinkColumn(col: string) {
  return validChildNodes.value.some((n) => n.linkField === col);
}

function handleCellClick(row: Record<string, any>, col: string) {
  const targets = validChildNodes.value.filter((n) => n.linkField === col);
  if (targets.length === 0) return;

  const val = row[col];
  if (val === null || val === undefined) {
    message.warning("该字段值为空，无法下钻");
    return;
  }

  // 单一下钻目标：直接跳转
  if (targets.length === 1) {
    confirmDrillOpen(targets[0], val);
  } 
  // 多下钻目标：显示选择弹窗
  else {
    // 这里可以添加多下钻目标选择逻辑
    // 暂时只选择第一个
    confirmDrillOpen(targets[0], val);
  }
}

function confirmDrillOpen(nextNode: DrillNode, value: any) {
  if (!nextNode.id) return;
  
  if (!nextNode.linkField) {
    message.warning("未配置关联字段");
    return;
  }
  
  // 验证目标节点是否存在 - 在整个节点树中查找
  if (rootNode.value) {
    // 首先检查当前节点树中是否存在目标节点
    const targetNode = findNode(rootNode.value, nextNode.id);
    if (!targetNode) {
      // 如果节点树中不存在，尝试从API获取子节点中查找
      const foundInChildNodes = validChildNodes.value.find(node => node.id === nextNode.id);
      if (!foundInChildNodes) {
        message.error("目标节点不存在，无法下钻");
        return;
      }
    }
  }
  
  // 准备参数
  const newParams = { ...currentParams.value };
  if (nextNode.paramName) {
    newParams[nextNode.paramName] = value;
  }
  
  // 通过路由跳转实现下钻
  const query = {
    report_id: currentReportId.value,
    node_id: nextNode.id,
    params: JSON.stringify(newParams),
    // 不传递分页参数，让每个子节点使用独立的分页状态
    _t: Date.now() // 时间戳确保唯一性
  };
  
  console.log("下钻跳转参数:", query);
  router.push({ path: route.path, query });
}

async function handleBreadcrumb(index: number) {
  const target = breadcrumbs.value[index];
  
  // 构建新的参数
  const params = {};
  for (let i = 0; i <= index; i++) {
    const crumb = breadcrumbs.value[i];
    if (crumb.paramName && crumb.paramValue) {
      params[crumb.paramName] = crumb.paramValue;
    }
  }
  
  // 保持当前分页状态，不重置到第一页
  console.log("面包屑导航，保持分页状态:", { pageNo: dataPageNo.value, pageSize: dataPageSize.value });
  
  // 直接加载数据，而不是通过路由跳转
  if (rootNode.value) {
    const node = findNode(rootNode.value, target.id);
    if (node) {
      await loadData(node, params);
      
      // 更新面包屑状态
      breadcrumbs.value = breadcrumbs.value.slice(0, index + 1);
    }
  }
}

async function refreshCurrentData(page?: number, pageSize?: number) {
  // 更新分页参数
  if (page !== undefined) {
    dataPageNo.value = page;
  }
  if (pageSize !== undefined) {
    dataPageSize.value = pageSize;
  }
  
  // 添加淡出效果
  tableOpacity.value = 0.3;
  
  // 使用setTimeout确保动画效果可见
  setTimeout(async () => {
    if (currentNodeId.value && rootNode.value) {
    const node = findNode(rootNode.value, currentNodeId.value);
    if (node) {
      await loadData(node, currentParams.value);
    }
  }
  
  // 数据加载完成后恢复透明度
  tableOpacity.value = 1;
  }, 50);
}

function handlePageChange(page: number) {
  refreshCurrentData(page);
}

function handlePageSizeChange(current: number, size: number) {
  console.log("分页大小切换事件: 从第", current, "页切换到每页", size, "条");
  refreshCurrentData(1, size);
}

// 调试控制函数
function resetPagination() {
  console.log("手动重置分页参数");
  dataPageNo.value = 1;
  dataPageSize.value = 10;
  refreshCurrentData();
}

function testPagination() {
  console.log("测试分页功能");
  console.log("当前分页参数:", {
    pageNo: dataPageNo.value,
    pageSize: dataPageSize.value,
    total: dataTotal.value
  });
  
  // 模拟分页操作
  if (dataTotal.value > 0) {
    const testPage = Math.min(2, Math.ceil(dataTotal.value / dataPageSize.value));
    console.log("测试切换到第", testPage, "页");
    handlePageChange(testPage);
  } else {
    console.log("暂无数据，无法测试分页");
  }
}

async function exitReport() {
  // 清除所有状态
  currentReportId.value = null;
  currentReportName.value = "";
  currentReportDescription.value = "";
  tableData.value = [];
  columns.value = [];
  breadcrumbs.value = [];
  rootNode.value = null;
  validChildNodes.value = [];
  isStandalone.value = false;
  
  // 清除URL参数，回到初始状态
  await router.push({ path: route.path });
  
  // 重新加载报表列表
  loadReports();
}

function backToMainReport() {
  if (!currentReportId.value) return;
  
  const reportId = currentReportId.value;
  const reportName = currentReportName.value;
  const description = currentReportDescription.value;
  
  router.push({ path: route.path }).then(async () => {
    currentReportId.value = reportId;
    currentReportName.value = reportName;
    currentReportDescription.value = description;
    isStandalone.value = false;
    
    // 保留当前分页状态，不重置到第一页
    breadcrumbs.value = breadcrumbs.value.slice(0, 1);
    
    if (rootNode.value) {
      await loadData(rootNode.value, null);
    }
  });
}

// 处理列宽调整
function handleResizeColumn(width: number, column: any) {
  column.width = width;
}

// 处理报表表格列宽调整
function handleReportResizeColumn(width: number, column: any) {
  column.width = width;
}
</script>

<style scoped>
.app-container {
  width: 100%;
  max-width: none;
  padding: 16px;
}

.select-card {
  width: 100%;
  max-width: none;
  margin: 0;
}
.cursor-pointer {
  cursor: pointer;
}
.mt-4 {
  margin-top: 16px;
}

/* 表格卡片样式 */
.data-table-card {
  border-radius: 8px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.06);
  border: 1px solid #f0f0f0;
  width: 100%;
  max-width: none;
}

/* 表格操作区域 */
.table-actions {
  display: flex;
  align-items: center;
  gap: 12px;
}

.drill-tip {
  color: #666;
  font-size: 14px;
  display: flex;
  align-items: center;
  gap: 4px;
}



/* 报表列表容器 */
.report-list {
  width: 100%;
  display: flex;
  flex-direction: column;
}

/* 表格容器 - 固定高度避免跳动 */
.table-container {
  min-height: 440px; /* 表格高度 + 分页高度 */
  position: relative;
  width: 100%;
  overflow-x: auto; /* 允许水平滚动 */
  overflow-y: hidden; /* 垂直方向由表格自身控制 */
}

/* 确保表格容器有足够的空间显示滚动条 */
.table-container::-webkit-scrollbar {
  width: 8px;
  height: 8px;
}

.table-container::-webkit-scrollbar-track {
  background: #f1f1f1;
  border-radius: 4px;
}

.table-container::-webkit-scrollbar-thumb {
  background: #c1c1c1;
  border-radius: 4px;
}

.table-container::-webkit-scrollbar-thumb:hover {
  background: #a8a8a8;
}

/* 表格样式 */
.data-table {
  transition: all 0.3s ease;
  width: auto; /* 改为auto，让表格根据内容自适应宽度 */
  min-width: 100%; /* 确保表格至少占满容器宽度 */
}

.data-table :deep(.ant-table-thead > tr > th) {
  background-color: #fafafa;
  font-weight: 600;
  color: #333;
  border-bottom: 2px solid #f0f0f0;
  white-space: nowrap; /* 表头不换行 */
  overflow: visible; /* 允许表头内容溢出，便于调整列宽 */
  text-overflow: ellipsis;
  position: relative; /* 为列宽调整手柄提供定位上下文 */
  min-width: auto; /* 使用列配置中的minWidth */
}

.data-table :deep(.ant-table-tbody > tr > td) {
  border-bottom: 1px solid #f0f0f0;
  transition: background-color 0.2s ease;
  white-space: nowrap; /* 表格内容不换行 */
  overflow: hidden;
  text-overflow: ellipsis;
  /* 移除max-width限制，允许列宽调整 */
  min-width: auto; /* 使用列配置中的minWidth */
}

/* 列宽调整手柄样式 */
.data-table :deep(.ant-table-resize-handle) {
  position: absolute;
  top: 0;
  right: -5px;
  bottom: 0;
  width: 10px;
  cursor: col-resize;
  z-index: 1;
}

.data-table :deep(.ant-table-resize-handle:hover) {
  background-color: #1890ff;
  opacity: 0.3;
}

.data-table :deep(.ant-table-tbody > tr:hover > td) {
  background-color: #fafafa;
}

/* 链接单元格样式 */
.link-cell {
  color: #1890ff;
  cursor: pointer;
  text-decoration: none;
  font-weight: 500;
  transition: all 0.2s ease;
  padding: 2px 4px;
  border-radius: 2px;
}

.link-cell:hover {
  color: #40a9ff;
  background-color: #f0f8ff;
  text-decoration: underline;
}

/* 普通单元格样式 */
.normal-cell {
  color: #333;
  padding: 2px 4px;
}

/* 空状态样式 */
.empty-state {
  padding: 60px 0;
}

.empty-state :deep(.ant-empty-description) {
  color: #999;
}

/* 分页包装器 */
.pagination-wrapper {
  margin-top: 16px;
  padding: 16px 0;
  border-top: 1px solid #f0f0f0;
  background-color: #fafafa;
  border-radius: 0 0 8px 8px;
}

/* 自定义分页样式 */
.custom-pagination {
  display: flex;
  justify-content: flex-end;
  align-items: center;
}

.custom-pagination :deep(.ant-pagination-item) {
  border-radius: 4px;
  border: 1px solid #d9d9d9;
}

.custom-pagination :deep(.ant-pagination-item:hover) {
  border-color: #1890ff;
}

.custom-pagination :deep(.ant-pagination-item-active) {
  background-color: #1890ff;
  border-color: #1890ff;
}

.custom-pagination :deep(.ant-pagination-item-active a) {
  color: white;
}

.custom-pagination :deep(.ant-pagination-prev),
.custom-pagination :deep(.ant-pagination-next) {
  border-radius: 4px;
}

.custom-pagination :deep(.ant-pagination-options) {
  margin-left: 16px;
}

/* 加载遮罩层 */
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
  border-radius: 8px;
  animation: fadeIn 0.2s ease;
}

/* 加载动画优化 */
.data-table :deep(.ant-spin-nested-loading) {
  min-height: 300px;
}

.data-table :deep(.ant-spin-container) {
  transition: opacity 0.3s ease;
}

.data-table :deep(.ant-table-placeholder) {
  height: 300px;
  display: flex;
  align-items: center;
  justify-content: center;
}

/* 响应式设计 */
@media (max-width: 768px) {
  .table-container {
    min-height: 360px;
  }
  
  .data-table :deep(.ant-table-scroll) {
    overflow-x: auto;
  }
  
  .pagination-wrapper {
    padding: 12px 0;
  }
  
  .custom-pagination {
    justify-content: center;
  }
}

/* 显示区域样式 */
.display-area {
  animation: fadeIn 0.3s ease;
}

@keyframes fadeIn {
  from {
    opacity: 0;
    transform: translateY(10px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}
</style>
