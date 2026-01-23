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

#### 事件 (Events)

| 事件名 | 说明 |
|--------|------|
| list-updated | 列表更新时触发 |

#### 方法

| 方法名 | 说明 | 参数 |
|--------|------|------|
| handleQuery | 查询报表列表 | 无 |
| handleAdd | 添加报表 | 无 |
| handleEdit | 编辑报表 | `{ id, reportName, ... }` |
| handleDelete | 删除报表 | `{ id, reportName, ... }` |

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

## 注意事项

1. 确保后端API接口已正确实现
2. SQL语句中使用命名参数格式（如 `:dept_id`）
3. 在独立模式下使用时，需要提供有效的 `reportId`
4. 配置下钻节点时，需要正确设置关联字段和参数名

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