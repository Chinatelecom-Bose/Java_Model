<template>
  <div class="drill-config-container">
    <div class="left-tree">
      <div class="tree-toolbar">
        <a-button type="primary" size="small" @click="handleAddRoot" :disabled="hasRoot">添加根节点</a-button>
        <a-button type="primary" size="small" :icon="h(ReloadOutlined)" @click="refreshTree" />
      </div>
      <a-tree
        :tree-data="treeData"
        :field-names="{ key: 'id', title: 'nodeName', children: 'children' }"
        :show-icon="true"
        default-expand-all
        :expand-on-click-node="false"
        @select="handleNodeSelect"
      >
        <template #title="{ dataRef }">
          <span class="custom-tree-node">
            <span>{{ dataRef.nodeName }}</span>
            <span class="tree-actions">
              <a-button type="link" size="small" @click.stop="append(dataRef)">添加下级</a-button>
              <a-popconfirm title="确认删除该节点及其子节点吗?" @confirm="remove(dataRef)">
                <a-button type="link" size="small" danger @click.stop>删除</a-button>
              </a-popconfirm>
            </span>
          </span>
        </template>
      </a-tree>
    </div>
    
    <div class="right-form" v-if="currentNode">
      <a-form ref="formRef" :model="currentNode" :label-col="{ span: 4 }" :wrapper-col="{ span: 18 }" :rules="rules">
        <a-form-item label="节点名称" name="nodeName">
          <a-input v-model:value="currentNode.nodeName" />
        </a-form-item>
        
        <a-form-item label="SQL语句" name="sqlText">
           <div style="display: flex; justify-content: space-between; margin-bottom: 6px; width: 100%;">
              <a-typography-text type="secondary">只读展示，点击右侧按钮编辑</a-typography-text>
              <a-button type="primary" size="small" @click="openSqlDialog">
                编辑SQL
              </a-button>
            </div>
            <div
              :class="['code-static', 'cm-theme-dracula']"
              style="max-height: 300px; width: 100%; overflow: auto;"
              v-html="sqlRunModeHtml"
            ></div>
        </a-form-item>
        
        <template v-if="currentNode.parentId">
            <a-form-item label="父级字段" name="linkField">
              <a-select
                v-model:value="currentNode.linkField"
                placeholder="请选择父级关联字段"
                show-search
                :loading="loadingParentCols"
                @dropdown-open-change="handleParentColsVisible"
              >
                <a-select-option v-for="col in parentColumns" :key="col" :value="col">
                  {{ col }}
                </a-select-option>
              </a-select>
              <div class="form-tip" style="color: #999; font-size: 12px; margin-top: 4px;">
                数据来源：父节点SQL的输出字段（点击下拉自动加载）
              </div>
            </a-form-item>
            
            <a-form-item label="传递字段" name="passField">
               <a-select
                 v-model:value="currentNode.passField"
                 placeholder="请选择传递字段"
                 show-search
                 allow-clear
                 :loading="loadingParentCols"
               >
                 <a-select-option v-for="col in parentColumns" :key="col" :value="col">
                   {{ col }}
                 </a-select-option>
               </a-select>
               <div class="form-tip" style="color: #999; font-size: 12px; margin-top: 4px;">
                 点击父级字段时，实际传递的字段值（为空则传递被点击字段的值）
               </div>
            </a-form-item>

            <a-form-item label="参数名" name="paramName">
               <a-select
                 v-model:value="currentNode.paramName"
                 placeholder="请选择参数名"
                 show-search
                 allow-clear
                 :loading="loadingParamName"
                 @dropdown-open-change="handleParamNameVisible"
               >
                 <a-select-option v-for="param in paramNameOptions" :key="param" :value="param">
                   {{ param }}
                 </a-select-option>
               </a-select>
               <div class="form-tip" style="color: #999; font-size: 12px; margin-top: 4px;">
                 本节点SQL中使用的参数名 (e.g. SELECT ... WHERE id = :dept_id)
               </div>
            </a-form-item>
            
            
        </template>
        
        <a-form-item>
           <a-button type="primary" @click="handleUpdateNode" :loading="saving">保存当前节点</a-button>
        </a-form-item>
      </a-form>
    </div>
    <div v-else class="empty-tip" style="padding: 20px; color: #999;">
      请选择或添加节点进行配置
    </div>

    <a-modal
      v-model:open="sqlDialogVisible"
      :title="'编辑SQL查询语句'"
      :width="sqlDialogWidth"
      :closable="false"
      :mask-closable="false"
      @ok="confirmSqlEdit"
      @cancel="closeSqlDialog"
    >
      <div :class="['code-input', { 'code-input--error': !!sqlEditError }]">
        <Codemirror
          v-model:value="sqlEditorText"
          :options="cmOptions"
          style="height: 360px; width: 100%;"
          :autofocus="true"
        />
      </div>
      <template v-if="sqlEditError">
        <div class="ant-form-item-explain" style="position: relative; padding-top: 4px; color: #ff4d4f;">
          {{ sqlEditError }}
        </div>
      </template>
      <template #footer>
        <div style="display: flex; justify-content: flex-end; gap: 8px;">
          <a-button type="primary" :loading="validating" @click="handleValidateSqlInDialog">
            检测SQL
          </a-button>
          <a-button @click="closeSqlDialog">取消</a-button>
          <a-button type="primary" :disabled="!sqlCheckPassed" @click="confirmSqlEdit">
            确认
          </a-button>
        </div>
      </template>
    </a-modal>
  </div>
</template>

<script setup lang="ts">
import { ref, reactive, onMounted, computed, h, nextTick } from "vue";
import { message, Modal } from "ant-design-vue";
import { ReloadOutlined } from "@ant-design/icons-vue";
import Codemirror from "codemirror-editor-vue3";
import CodeMirrorLib from "codemirror";
import "codemirror/lib/codemirror.css";
import "codemirror/mode/sql/sql.js";
import "codemirror/theme/dracula.css";
import "codemirror/addon/runmode/runmode.js";
import "codemirror/addon/hint/show-hint.css";
import "codemirror/addon/hint/show-hint.js";
import "codemirror/addon/hint/sql-hint.js";
import { format as sqlFormat } from "sql-formatter";
import request from "@/utils/request";

// 定义组件的props
const props = defineProps<{
  infoId: number;
}>();

// 定义组件的emit事件
const emit = defineEmits<{
  (e: 'close'): void;
  (e: 'save-success'): void;
  (e: 'save-error'): void;
}>();

interface DrillNode {
  id?: number;
  infoId: number;
  nodeName: string;
  sqlText: string;
  parentId?: number | null;
  linkField?: string;
  paramName?: string;
  passField?: string;
  status?: string;
  children?: DrillNode[];
}

const treeData = ref<DrillNode[]>([]);
const currentNode = ref<DrillNode | null>(null);
const saving = ref(false);
const validating = ref(false);
const parentColumns = ref<string[]>([]);
const loadingParentCols = ref(false);

const sqlDialogVisible = ref(false);
const sqlEditorText = ref("");
const sqlEditError = ref("");
const sqlCheckPassed = ref(false);

const cmOptions = {
  mode: "text/x-sql",
  theme: "dracula",
  lineNumbers: true,
  smartIndent: true,
  indentUnit: 2,
  lineWrapping: true,
};

const rules = {
  nodeName: [{ required: true, message: "请输入节点名称", trigger: "blur" }],
  sqlText: [{ required: true, message: "请输入SQL", trigger: "blur" }],
};

const hasRoot = computed(() => treeData.value.length > 0);
const sqlDialogWidth = computed(() => (window.innerWidth < 768 ? "90%" : "800px"));

const formattedSQL = computed(() => {
  const s = currentNode.value?.sqlText || "";
  if (!s) return "";
  try {
    return sqlFormat(s, { language: "postgresql" });
  } catch {
    // 如果格式化失败，返回原始SQL，但确保去除多余空行和格式问题
    return s.replace(/\n\s*\n/g, '\n').trim();
  }
});

const sqlRunModeHtml = computed(() => {
  const text = formattedSQL.value || "";
  const mode = "text/x-sql";
  let html = "";
  const lines = text.split("\n");
  for (let i = 0; i < lines.length; i++) {
    (CodeMirrorLib as any).runMode(lines[i], mode, (tokenText: string, style?: string | null) => {
      if (!tokenText) return;
      const esc = tokenText.replace(
        /[&<>]/g,
        (ch: string) => ({ "&": "&amp;", "<": "&lt;", ">": "&gt;" })[ch] as string
      );
      if (style) {
        html += `<span class="cm-${style}">${esc}</span>`;
      } else {
        html += esc;
      }
    });
    if (i < lines.length - 1) html += "<br>";
  }
  return html;
});

onMounted(() => {
  refreshTree();
});

async function refreshTree() {
  if (!props.infoId) return;
  
  try {
    const response = await request.get("/drill/info/detail/" + props.infoId);
    const nodes = response.data?.nodes || [];
    treeData.value = nodes;
    currentNode.value = null;
  } catch (error) {
    console.error("加载树失败:", error);
    message.error("加载树失败");
  }
}

function buildTree(nodes: DrillNode[]) {
  const map: Record<number, DrillNode> = {};
  const roots: DrillNode[] = [];
  const list = JSON.parse(JSON.stringify(nodes));
  list.forEach((node: DrillNode) => {
    map[node.id!] = node;
    node.children = [];
  });
  list.forEach((node: DrillNode) => {
    if (node.parentId && map[node.parentId]) {
      map[node.parentId].children?.push(node);
    } else {
      roots.push(node);
    }
  });
  return roots;
}

async function handleAddRoot() {
  const newNode: DrillNode = {
    infoId: props.infoId,
    nodeName: "初始查询",
    sqlText: "SELECT * FROM ...",
    parentId: null,
    status: "0"
  };
  
  try {
    await request.post("/drill/node", newNode);
    message.success("添加成功");
    refreshTree();
    emit('save-success');
  } catch (error) {
    console.error("添加根节点失败:", error);
    message.error("添加失败: " + (error.response?.data?.msg || error.message));
    emit('save-error');
  }
}

async function append(data: DrillNode) {
  const newNode: DrillNode = {
    infoId: props.infoId,
    nodeName: "新节点",
    sqlText: "",
    parentId: data.id,
    linkField: "",
    paramName: "",
    passField: "",
    status: "0"
  };
  try {
    await request.post("/drill/node", newNode);
    message.success("添加成功");
    refreshTree();
    emit('save-success');
  } catch (error) {
    console.error("添加失败:", error);
    message.error("添加失败: " + (error.response?.data?.msg || error.message));
    emit('save-error');
  }
}

async function remove(data: DrillNode) {
  if (data.id) {
    await request.delete("/drill/node/" + data.id);
    message.success("删除成功");
    refreshTree();
    emit('save-success');
  }
}

const paramNameOptions = ref<string[]>([]);
const loadingParamName = ref(false);

async function handleParamNameVisible(visible: boolean) {
  if (visible) {
    await loadParamNameOptions();
  }
}

async function loadParamNameOptions() {
  const sql = currentNode.value?.sqlText;
  if (!sql) return;
  loadingParamName.value = true;
  try {
    // 从SQL中提取参数名，而不是查询结果的字段名
    const res = await request.post("/drill/execute/validateSQL", { sqlText: sql });
    
    if (res.data.valid) {
      // 对于参数化SQL，res.data.columns 包含的是参数名（如果SQL包含参数）
      // 对于非参数化SQL，res.data.columns 包含的是查询结果的字段名
      paramNameOptions.value = res.data.columns || [];
      console.log("🎯 参数名选项加载成功:", paramNameOptions.value);
      
      if (paramNameOptions.value.length === 0) {
        message.info("该SQL没有返回字段或参数");
      }
    } else {
      paramNameOptions.value = [];
      console.warn("⚠️ SQL校验未通过，无法获取字段或参数:", res.data.message);
      message.warning("SQL校验未通过，无法获取字段或参数: " + res.data.message);
    }
  } catch (error) {
    console.error("💥 获取参数失败:", error);
    message.error("获取参数失败");
  } finally {
    loadingParamName.value = false;
  }
}

function handleNodeSelect(selectedKeys: number[], info: any) {
  if (selectedKeys.length > 0) {
    const node = findNode(treeData.value, selectedKeys[0]);
    if (node) {
      currentNode.value = { ...node };
      parentColumns.value = [];
      paramNameOptions.value = [];
      
      // 如果节点有父节点，预加载父级字段
      if (node.parentId) {
        loadParentColumns();
      }
      
      // 如果节点有SQL语句，预加载参数名选项
      if (node.sqlText && node.sqlText.trim()) {
        loadParamNameOptions();
      }
    }
  } else {
    currentNode.value = null;
  }
}

function openSqlDialog() {
  sqlEditorText.value = currentNode.value?.sqlText || "";
  sqlEditError.value = "";
  sqlCheckPassed.value = false;
  sqlDialogVisible.value = true;
}

function closeSqlDialog() {
  sqlDialogVisible.value = false;
  sqlCheckPassed.value = false;
  sqlEditError.value = "";
}

async function handleValidateSqlInDialog() {
  if (!sqlEditorText.value || !sqlEditorText.value.trim()) {
    sqlEditError.value = "SQL语句不能为空";
    return;
  }
  validating.value = true;
  sqlEditError.value = "";
  try {
    // 原始模板的正确实现：直接使用编辑的SQL，后端会自动处理
    const res = await request.post("/drill/execute/validateSQL", { sqlText: sqlEditorText.value });
    const { valid, message: msg } = res.data;
    
    if (valid) {
      sqlCheckPassed.value = true;
      message.success(msg);
      console.log("✅ SQL校验成功:", msg);
      
      // 更新当前节点的SQL内容并重新加载参数名选项
      if (currentNode.value) {
        currentNode.value.sqlText = sqlEditorText.value;
        loadParamNameOptions();
      }
    } else {
      sqlCheckPassed.value = false;
      sqlEditError.value = msg;
      console.error("❌ SQL校验失败:", msg);
    }
  } catch (error) {
    const errorMsg = error.response?.data?.msg || error.message;
    console.error("💥 SQL校验请求失败:", errorMsg);
    sqlEditError.value = "校验请求失败: " + errorMsg;
    sqlCheckPassed.value = false;
  } finally {
    validating.value = false;
  }
}

function confirmSqlEdit() {
  const s = sqlEditorText.value || "";
  try {
    const fmt = sqlFormat(s, { language: "postgresql" });
    if (currentNode.value) {
      currentNode.value.sqlText = fmt;
    }
    closeSqlDialog();
  } catch (error) {
    // 格式化失败时，仍然保存原始SQL，不显示错误
    console.warn("SQL格式化失败，使用原始SQL:", error);
    if (currentNode.value) {
      currentNode.value.sqlText = s.trim();
    }
    closeSqlDialog();
  }
}

async function handleParentColsVisible(visible: boolean) {
  if (visible && parentColumns.value.length === 0 && currentNode.value?.parentId) {
    await loadParentColumns();
  }
}

async function loadParentColumns() {
  if (!currentNode.value?.parentId) return;
  const parent = findNode(treeData.value, currentNode.value.parentId);
  if (parent && parent.sqlText) {
    loadingParentCols.value = true;
    try {
      // 原始模板的正确实现：直接使用父节点的SQL，后端会自动处理
      const res = await request.post("/drill/execute/validateSQL", { sqlText: parent.sqlText });
      
      if (res.data.valid) {
        parentColumns.value = res.data.columns || [];
        console.log("🎯 父级字段加载成功:", parentColumns.value);
      } else {
        message.warning("父节点SQL校验未通过，无法获取字段: " + res.data.message);
      }
    } catch (error) {
      console.error("💥 加载父级字段失败:", error);
      message.error("加载父级字段失败");
    } finally {
      loadingParentCols.value = false;
    }
  } else {
    message.warning("未找到父节点配置");
  }
}

function findNode(nodes: DrillNode[], id: number): DrillNode | null {
  for (const node of nodes) {
    if (node.id === id) return node;
    if (node.children) {
      const found = findNode(node.children, id);
      if (found) return found;
    }
  }
  return null;
}

async function handleUpdateNode() {
  if (!currentNode.value?.id) return;
  if (!currentNode.value.nodeName) {
    message.warning("请输入节点名称");
    return;
  }
  if (!currentNode.value.sqlText) {
    message.warning("请输入SQL");
    return;
  }
  if (currentNode.value.parentId) {
    if (!currentNode.value.linkField || !currentNode.value.paramName) {
      message.warning("请配置父级关联字段和参数名");
      return;
    }
  }
  
  saving.value = true;
  try {
    await request({
      url: "/drill/node",
      method: "put",
      data: currentNode.value
    });
    message.success("保存成功");
    refreshTree();
    emit('save-success');
  } catch (error) {
    console.error(error);
    message.error("保存失败: " + (error.response?.data?.msg || error.message));
    emit('save-error');
  } finally {
    saving.value = false;
  }
}

// 公共方法，供父组件调用
defineExpose({
  refreshTree,
  handleAddRoot,
  handleUpdateNode
});
</script>

<style scoped>
.drill-config-container {
  display: flex;
  height: 600px;
  border: 1px solid #eee;
}
.left-tree {
  width: 300px;
  border-right: 1px solid #eee;
  padding: 10px;
  display: flex;
  flex-direction: column;
  overflow: auto;
}
.tree-toolbar {
  margin-bottom: 10px;
  display: flex;
  gap: 8px;
}
.right-form {
  flex: 1;
  padding: 20px;
  overflow-y: auto;
}
.custom-tree-node {
  flex: 1;
  display: flex;
  align-items: center;
  justify-content: space-between;
  font-size: 14px;
  padding-right: 8px;
}
.tree-actions {
  margin-left: 8px;
}
.form-tip {
  margin-top: 4px;
  line-height: 1.4;
}

.code-input {
  border: 1px solid #e5e7eb;
  border-radius: 4px;
  min-height: 360px;
  width: 100%;
}
.code-input--error {
  border-color: #ff4d4f;
}

.code-static {
  padding: 8px;
  overflow: auto;
  background-color: #fafafa;
  border: 1px solid #e5e7eb;
  border-radius: 4px;
  font-family: ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, "Liberation Mono", "Courier New", monospace;
  font-size: 12px;
  line-height: 1.6;
  white-space: normal;
  word-break: break-word;
}

.cm-theme-dracula {
  background: #282a36;
  color: #f8f8f2;
}

:deep(.cm-keyword) { color: #bd93f9; font-weight: 600; }
:deep(.cm-def) { color: #50fa7b; }
:deep(.cm-variable) { color: #f8f8f2; }
:deep(.cm-string) { color: #f1fa8c; }
:deep(.cm-number) { color: #8be9fd; }
:deep(.cm-comment) { color: #6272a4; }

:deep(.ant-tree-treenode) {
  padding: 2px 0;
  width: 100%;
}
</style>