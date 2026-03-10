# DataDrill 组件使用指南

这是一个可复用的数据下钻功能组件，支持数据报表的选择、浏览和多层级下钻功能。

## 组件结构

该组件包包含以下子组件：

- `display.vue`: 主要的数据下钻展示组件
- `DrillManager.vue`: 下钻报表信息管理组件
- `ConfigTree.vue`: 下钻节点配置树组件

## 安装和使用

### 1. 数据下钻展示组件

#### 基本用法

```vue
<template>
  <div>
    <DataDrill ref="dataDrillRef" />
  </div>
</template>

<script setup>
import { ref } from 'vue';
import DataDrill from '@/components/DataDrill/display.vue';

const dataDrillRef = ref();
</script>
```

#### 属性 (Props)

| 属性名 | 类型 | 默认值 | 说明 |
|--------|------|--------|------|
| standalone | Boolean | false | 是否以独立模式运行（不显示报表选择界面） |
| reportId | Number | null | 指定的报表ID（当standalone=true时使用） |
| nodeId | Number | null | 指定的节点ID（当standalone=true时使用） |
| initialParams | Object | {} | 初始化参数 |
| enableSms | Boolean | false | 是否启用短信发送功能 |
| phoneFieldMapping | String | '' | 电话号码字段映射（逗号分隔的字段名列表） |
| hasSmsPermission | Boolean | false | 是否具有短信发送权限 |
| enableExport | Boolean | false | 是否启用导出功能 |
| hasExportPermission | Boolean | false | 是否具有导出权限 |
| enableVirtualScroll | Boolean | true | 是否启用虚拟滚动 |
| virtualScrollConfig | Object | { threshold: 100, buffer: 5 } | 虚拟滚动配置 |
| tableSize | String | 'middle' | 表格尺寸（'small' / 'middle' / 'large'） |

#### 事件 (Events)

| 事件名 | 说明 | 回调参数 |
|--------|------|----------|
| report-selected | 选择报表时触发 | `{ id, reportName, ... }` |
| node-clicked | 点击下钻节点时触发 | `{ fromNode, toNode, clickedValue, params }` |
| data-loaded | 数据加载完成时触发 | `{ reportId, nodeId, data, columns, total }` |

#### 方法

| 方法名 | 说明 | 参数 |
|--------|------|------|
| loadReports | 重新加载报表列表 | 无 |
| refreshCurrentNode | 刷新当前节点数据 | 无 |
| exitReport | 退出当前报表 | 无 |
| backToMainReport | 返回主报表 | 无 |

#### 使用示例

```vue
<template>
  <div>
    <!-- 正常模式：显示报表选择界面 -->
    <DataDrill @report-selected="onReportSelected" @data-loaded="onDataLoaded" />
    
    <!-- 独立模式：直接显示指定报表 -->
    <DataDrill 
      :standalone="true" 
      :reportId="123" 
      :nodeId="456"
      :initialParams="{ dept_id: '001' }"
      @node-clicked="onNodeClicked"
    />
  </div>
</template>

<script setup>
import { ref } from 'vue';
import DataDrill from '@/components/DataDrill/display.vue';

const onReportSelected = (report) => {
  console.log('选择了报表:', report);
};

const onDataLoaded = (data) => {
  console.log('数据加载完成:', data);
};

const onNodeClicked = (event) => {
  console.log('节点点击事件:', event);
};
</script>
```

### 2. 下钻报表信息管理组件

#### 基本用法

```vue
<template>
  <div>
    <DrillManager @list-updated="onListUpdated" />
  </div>
</template>

<script setup>
import DrillManager from '@/components/DataDrill/DrillManager.vue';

const onListUpdated = () => {
  console.log('报表列表已更新');
};
</script>
```

#### 属性 (Props)

| 属性名 | 类型 | 默认值 | 说明 |
|--------|------|--------|------|
| readonly | Boolean | false | 是否只读模式 |
| menuPath | String | '' | 菜单路径（用于创建菜单时使用） |
| menuComponent | String | '' | 菜单组件路径（用于创建菜单时使用） |
| parentMenuPath | String | '' | 父级菜单路径 |
| parentMenuName | String | '' | 父级菜单名称 |

#### 事件 (Events)

| 事件名 | 说明 |
|--------|------|
| list-updated | 列表更新时触发 |

#### 方法

| 方法名 | 说明 | 参数 |
|--------|------|------|
| handleQuery | 查询报表列表 | 无 |
| handleReset | 重置查询条件 | 无 |
| handleAdd | 添加报表 | 无 |
| handleEdit | 编辑报表 | `{ id, reportName, ... }` |
| handleDelete | 删除报表（同时删除关联菜单） | `{ id, reportName, ... }` |
| submitForm | 提交表单 | 无 |

### 3. 下钻节点配置树组件

#### 基本用法

```vue
<template>
  <div>
    <DrillConfigTree :info-id="reportId" @save-success="onSaveSuccess" />
  </div>
</template>

<script setup>
import DrillConfigTree from '@/components/DataDrill/ConfigTree.vue';
import { ref } from 'vue';

const reportId = ref(123);

const onSaveSuccess = () => {
  console.log('配置保存成功');
};
</script>
```

#### 属性 (Props)

| 属性名 | 类型 | 必需 | 说明 |
|--------|------|------|------|
| infoId | Number | 是 | 报表信息ID |

#### 事件 (Events)

| 事件名 | 说明 |
|--------|------|
| close | 关闭配置时触发 |
| save-success | 保存成功时触发 |
| save-error | 保存失败时触发 |

#### 方法

| 方法名 | 说明 | 参数 |
|--------|------|------|
| refreshTree | 刷新树结构 | 无 |
| handleAddRoot | 添加根节点 | 无 |
| handleUpdateNode | 更新当前节点 | 无 |

## 数据结构

### 报表信息结构

```typescript
interface DataDrillInfo {
  id?: number;
  reportName: string;        // 报表名称
  status: string;            // 状态 ('0': 启用, '1': 停用)
  description?: string;      // 备注
  updateTime?: string;       // 更新时间
}
```

### 下钻节点结构

```typescript
interface DrillNode {
  id?: number;
  infoId: number;            // 关联的报表ID
  nodeName: string;          // 节点名称
  sqlText: string;           // SQL语句
  parentId?: number | null;  // 父节点ID
  linkField?: string;        // 关联字段
  paramName?: string;        // 参数名
  status?: string;           // 状态
  children?: DrillNode[];    // 子节点
}
```

### 面包屑结构

```typescript
interface BreadcrumbItem {
  id: number;                // 节点ID
  label: string;             // 显示标签
  paramName?: string;        // 参数名
  paramValue?: string;       // 参数值
}
```

## API 接口

该组件依赖以下后端API接口：

- `/drill/info/list` - 获取报表列表
- `/drill/info/detail/{id}` - 获取报表详情
- `/drill/info` - 创建/更新报表信息
- `/drill/info/{id}` - 删除报表
- `/drill/node` - 创建/更新节点
- `/drill/node/{id}` - 删除节点
- `/drill/execute/execute` - 执行查询
- `/drill/execute/validateSQL` - 验证SQL
- `/system/config/getParentMenuId` - 获取父级菜单ID
- `/system/config/setParentMenuId` - 设置父级菜单ID
- `/system/menu/add` - 创建菜单
- `/system/menu/list` - 获取菜单列表
- `/system/menu/{menuId}` - 删除菜单
- `/system/menu` - 更新菜单

## 导出工具

组件提供了独立的导出工具文件 `exportUtils.js`，可复用于其他模块：

### 文件位置
`src/utils/exportUtils.js`

### 导出函数

| 函数名 | 说明 | 参数 |
|--------|------|------|
| formatDateValue | 格式化日期值用于导出 | `value: any` |
| isDateField | 判断值是否为日期字段 | `value: any` |
| formatCellValue | 格式化单元格值用于表格显示 | `value: any` |
| exportToCsv | 导出数据为CSV文件 | `data: Array, fileName: string` |

### 使用示例

```javascript
import { formatDateValue, isDateField, exportToCsv } from '@/utils/exportUtils';

// 格式化日期值
const formattedDate = formatDateValue('2026-03-04T11:15:19');

// 判断是否为日期字段
const isDate = isDateField('2026-03-04');

// 导出CSV
exportToCsv(dataArray, '导出数据');
```

## 注意事项

1. 确保后端API接口已正确实现
2. SQL语句中使用命名参数格式（如 `:dept_id`）
3. 在独立模式下使用时，需要提供有效的 `reportId`
4. 配置下钻节点时，需要正确设置关联字段和参数名
5. **URL参数模式**：当父页面通过 `?reportId=xxx` 参数调用时，组件会自动根据URL参数决定显示模式
   - 有 `reportId` 参数 → 以独立模式直接进入对应报表
   - 无 `reportId` 参数 → 显示报表选择列表
6. 导出功能支持多种日期格式的自动转换

## 扩展功能

可以通过监听组件事件来实现自定义功能：

```vue
<template>
  <DataDrill 
    @node-clicked="handleNodeClick"
    @data-loaded="handleDataLoaded"
  />
</template>

<script setup>
const handleNodeClick = (event) => {
  // 可以在这里添加自定义逻辑，比如记录用户行为
  console.log('用户点击了下钻节点:', event);
};

const handleDataLoaded = (data) => {
  // 可以在这里添加数据处理逻辑
  console.log('加载了', data.total, '条数据');
};
</script>
```