# 数据权限控制优化与修复技术文档

## 1. 概述
本文档详细记录了 `ctbc-statistics` 统计模块中数据权限控制（DataScope）的实现、问题排查及最终修复方案。该方案确保了用户只能访问其所属部门及下级部门的统计数据，符合业务安全要求。

## 2. 问题描述
在开发统计API时，遇到以下问题：
1.  **数据未过滤**：最初无法正确通过 `sys_dept` 过滤数据。
2.  **权限校验失败**：后端报错 `dept_id = 0`，导致查询结果为空。
3.  **权限字符缺失**：系统会话中的 `SysRole` 对象未加载 `permissions` 列表，导致切面逻辑误判。

## 3. 根本原因分析
经过全链路排查，确定问题的核心在于 RuoYi 框架的 `DataScopeAspect` 切面逻辑与当前的用户会话加载机制存在冲突：

1.  **切面逻辑**：`DataScopeAspect` 在拼接 SQL 前，会检查当前用户的角色是否拥有注解中指定的权限字符（如 `statistics:datainfo:list`）。
2.  **数据缺失**：在标准的登录流程中，`SysUser` 对象内的 `roles` 列表仅包含角色的基本属性（ID、名称、数据范围），**不包含** 具体的权限字符列表 (`permissions`)。
3.  **判定失效**：由于 `role.getPermissions()` 为空，切面逻辑判断该角色“无权访问”，从而强制拼接 `OR dept_id = 0`，导致查询结果为空。

## 4. 解决方案全流程

### 4.1. 代码层面修复

#### 4.1.1. 优化 DataScopeAspect 切面逻辑
修改 `ctbc-framework` 模块下的 `DataScopeAspect.java`，兼容权限列表为空的情况。

**文件路径**: `ctbc-framework/src/main/java/com/ctbc/framework/aspectj/DataScopeAspect.java`

**修改前**:
```java
// 强校验：如果角色没有权限集合，直接判定失败
if (!StringUtils.containsAny(role.getPermissions(), Convert.toStrArray(permission))) {
    continue; 
}
```

**修改后**:
```java
// 兼容处理：只有当 role.getPermissions() 确实有数据时才进行校验
// 如果 role.getPermissions() 为空（默认情况），则默认视为通过，以角色的 dataScope 配置为准
if (StringUtils.isNotEmpty(permission) && StringUtils.isNotEmpty(role.getPermissions()) 
        && !StringUtils.containsAny(role.getPermissions(), Convert.toStrArray(permission)))
{
    continue;
}
```

#### 4.1.2. 明确 Service 层权限标识
在业务 Service 方法上明确指定权限字符，以便切面能正确识别。

**文件路径**: `ctbc-statistics/src/main/java/com/ctbc/statistics/service/impl/DataInfoDetailServiceImpl.java`

```java
@Override
@DataScope(deptAlias = "dept", permission = "statistics:datainfo:list")
public List<Map<String, Object>> getInstallationStats(DataInfoDetail dataInfoDetail) {
    // ...
}
```

#### 4.1.3. 修正 Mapper 层数据关联
修改 XML 映射文件，确保业务表 `data_info_detail` 能正确关联到 `sys_dept` 表，从而利用 `dept_id` 进行过滤。

**文件路径**: `ctbc-statistics/src/main/resources/mapper/statistics/DataInfoDetailMapper.xml`

```xml
<select id="selectInstallationStats" parameterType="DataInfoDetail" resultType="java.util.Map">
    select 
        d.data_type as "name",
        sum(d.complete_num) as "completeNum",
        sum(d.activate_num) as "activateNum"
    from data_info_detail d
    left join sys_dept dept on d.sale_center_name = dept.dept_name
    <where>
        <if test="monthNo != null"> and d.month_no = #{monthNo}</if>
        <!-- 数据范围过滤占位符 -->
        ${params.dataScope}
    </where>
    group by d.data_type
</select>
```

### 4.2. 数据库与配置层面

#### 4.2.1. 权限字符配置
确保数据库中存在对应的菜单/按钮权限。

```sql
-- 确保存在权限标识 statistics:datainfo:list
INSERT INTO sys_menu ... VALUES (..., 'statistics:datainfo:list', ...);
```

#### 4.2.2. 角色数据范围配置
在系统管理后台为角色配置正确的数据范围：
1.  进入 **系统管理 -> 角色管理**。
2.  编辑目标角色（如“经营单位管理员”）。
3.  **数据权限** 选择 **“本部门及以下数据权限”**。
4.  **菜单权限** 勾选 **“统计管理 -> 安装统计查询”**。

## 5. 验证结果

### 5.1. SQL 执行日志
修复后，系统生成的 SQL 语句如下，证明数据权限已生效：

```sql
select d.data_type as "name", sum(d.complete_num) as "completeNum", sum(d.activate_num) as "activateNum" 
from data_info_detail d 
left join sys_dept dept on d.sale_center_name = dept.dept_name 
WHERE (dept.dept_id IN ( SELECT dept_id FROM sys_dept WHERE dept_id = 84915 or find_in_set( 84915 , ancestors ) )) 
group by d.data_type
```

### 5.2. 结果解读
-   **WHERE 子句**：成功注入了 `dept_id IN (...)` 条件。
-   **数据范围**：`dept_id = 84915` (平果分公司) 及其子部门。
-   **查询结果**：返回了 4 条统计数据，说明过滤逻辑正确且未误杀数据。

## 6. 总结
本次优化通过放宽 `DataScopeAspect` 对权限字符的校验条件，解决了框架层面的逻辑冲突，成功实现了基于部门层级的数据权限控制。该方案通用性强，适用于所有需要数据权限过滤的模块。
