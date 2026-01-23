package com.ctbc.drill.service.impl;

import java.nio.charset.StandardCharsets;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import com.ctbc.common.utils.StringUtils;
import com.ctbc.drill.domain.DataDrillNode;
import com.ctbc.drill.mapper.DataDrillNodeMapper;
import com.ctbc.drill.service.IDataDrillNodeService;
import com.ctbc.drill.service.IDrillExecuteService;
import com.ctbc.drill.vo.DrillExecuteRequest;
import com.ctbc.drill.vo.DrillExecuteResponse;
import com.ctbc.drill.vo.DrillSQLValidateRequest;
import com.ctbc.drill.vo.DrillSQLValidateResponse;

/**
 * 下钻执行Service业务层处理
 * 
 * @author ctbc
 */
@Service
public class DrillExecuteServiceImpl implements IDrillExecuteService {
    private static final Logger log = LoggerFactory.getLogger(DrillExecuteServiceImpl.class);

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Autowired
    private DataDrillNodeMapper dataDrillNodeMapper;

    @Autowired
    private IDataDrillNodeService dataDrillNodeService;

    /**
     * 校验SQL语句
     * 
     * @param request SQL校验请求
     * @return SQL校验响应
     */
    @Override
    public DrillSQLValidateResponse validateSQL(DrillSQLValidateRequest request) {
        DrillSQLValidateResponse response = new DrillSQLValidateResponse();

        if (request == null || StringUtils.isEmpty(request.getSqlText())) {
            response.setValid(false);
            response.setSuccess(false);
            response.setMessage("SQL statement cannot be empty");
            return response;
        }

        String sql = request.getSqlText().trim();

        try {
            // 首先检查SQL是否包含命名参数（支持中文参数名）
            // 使用更宽松的正则表达式来检测参数
            boolean hasNamedParams = sql.contains(":");
            log.info("🔍 Param detection: SQL='{}', containsColon={}, hasNamedParams={}", sql, sql.contains(":"),
                    hasNamedParams);

            if (hasNamedParams) {
                log.info("✅ Param SQL detected, skipping execution validation");
                // 对于包含命名参数的SQL，直接返回成功，不尝试执行带参数的SQL
                response.setValid(true);
                response.setSuccess(true);
                response.setTotal(0L);
                response.setMessage(
                        "SQL statement validated successfully (contains parameters, parameterized SQL does not require field detection)");

                // 尝试从SQL中提取参数名作为参数名选项
                try {
                    log.info("🔍 Extracting param names: '{}'", sql);
                    List<String> columns = extractParameterNamesFromSQL(sql);
                    response.setColumns(columns);
                    log.info("📊 Param names extracted: {}", columns);
                } catch (Exception e) {
                    log.warn("Failed to extract param names, returning empty list", e);
                    response.setColumns(new ArrayList<>());
                }
                return response;
            } else {
                log.info("📝 No params, executing normal validation");
            }

            // 如果不包含参数，再检查是否只读SQL
            List<String> readOnlyKeywords = List.of("SELECT", "SHOW", "DESCRIBE", "EXPLAIN");
            String upperSql = sql.toUpperCase().trim();

            // 修复：检查SQL是否以只读关键字开头（忽略前面的空白字符）
            boolean isReadOnly = readOnlyKeywords.stream().anyMatch(keyword -> upperSql.startsWith(keyword)
                    || upperSql.startsWith("(" + keyword) || upperSql.startsWith("WITH"));

            if (!isReadOnly) {
                response.setValid(false);
                response.setSuccess(false);
                response.setMessage(
                        "Only SELECT, SHOW, DESCRIBE, EXPLAIN and other read-only SQL statements are supported");
                return response;
            } else {
                // 对于不包含参数的SQL，正常执行验证
                String checkSql = "SELECT * FROM (" + sql + ") t LIMIT 1";
                List<Map<String, Object>> checkResults = jdbcTemplate.queryForList(checkSql);

                response.setValid(true);
                response.setSuccess(true);
                response.setMessage("SQL statement validated successfully");

                String countSql = "SELECT COUNT(*) FROM (" + sql + ") t";
                Map<String, Object> countResult = jdbcTemplate.queryForMap(countSql);
                Long total = countResult.values().stream().findFirst().map(v -> ((Number) v).longValue()).orElse(0L);
                response.setTotal(total);

                if (!checkResults.isEmpty()) {
                    List<String> columns = new ArrayList<>(checkResults.get(0).keySet());
                    response.setColumns(columns);
                } else {
                    // 如果查询结果为空，尝试从元数据获取字段信息
                    try {
                        // 使用LIMIT 0查询，但通过ResultSetMetaData获取字段信息
                        String metaSql = "SELECT * FROM (" + sql + ") t LIMIT 0";
                        jdbcTemplate.query(metaSql, (ResultSet rs) -> {
                            ResultSetMetaData metaData = rs.getMetaData();
                            int columnCount = metaData.getColumnCount();
                            List<String> columns = new ArrayList<>();
                            for (int i = 1; i <= columnCount; i++) {
                                columns.add(metaData.getColumnName(i));
                            }
                            response.setColumns(columns);
                            return null;
                        });
                    } catch (Exception metaError) {
                        log.warn("Failed to get field info from metadata", metaError);
                        response.setColumns(new ArrayList<>());
                    }
                }
            }
        } catch (Exception e) {
            log.error("SQL validation failed", e);
            String errMsg = e.getMessage();
            if (errMsg != null && (errMsg.toLowerCase().contains("bind parameter")
                    || errMsg.toLowerCase().contains("parameter"))) {
                response.setValid(false);
                response.setSuccess(false);
                response.setMessage(
                        "SQL contains parameters, cannot automatically validate column structure. Please ensure SQL syntax is correct. Error: "
                                + errMsg);
            } else {
                response.setValid(false);
                response.setSuccess(false);
                response.setMessage("SQL statement syntax error: " + errMsg);
            }
        }

        return response;
    }

    /**
     * 从SQL中提取字段别名，增强版，支持处理星号(*)
     */
    private List<String> extractColumnAliasesFromSQLWithStarHandling(String sql) {
        List<String> aliases = new ArrayList<>();

        // 如果SQL中包含 SELECT *, 我们需要尝试从实际表结构中获取字段
        if (sql.toUpperCase().contains("SELECT *")) {
            // 在这种情况下，我们先尝试基础的别名提取
            aliases.addAll(extractOriginalColumnAliasesFromSQL(sql));

            // 如果基础提取没得到任何字段，但SQL确实包含参数，我们可能需要返回参数相关的字段
            // 但更合理的做法是告知前端无法确定具体字段
            if (aliases.isEmpty()) {
                // 当使用 SELECT * 时，我们无法静态分析字段，返回空列表
                // 前端应理解这种情况
                log.info("⚠️ SQL contains SELECT *, cannot statically analyze field names");
                return new ArrayList<>();
            }
        } else {
            // 对于非 SELECT * 的SQL，使用标准方法
            aliases = extractOriginalColumnAliasesFromSQL(sql);
        }

        return aliases;
    }

    /**
     * 从SQL中提取字段别名（原始版本）
     */
    private List<String> extractOriginalColumnAliasesFromSQL(String sql) {
        List<String> aliases = new ArrayList<>();

        // 简单的正则表达式匹配字段别名（AS 别名 或 字段名 别名）
        java.util.regex.Pattern pattern = java.util.regex.Pattern.compile("\\bAS\\s+([a-zA-Z_][a-zA-Z0-9_]*)\\b",
                java.util.regex.Pattern.CASE_INSENSITIVE);
        java.util.regex.Matcher matcher = pattern.matcher(sql);

        while (matcher.find()) {
            String alias = matcher.group(1);
            if (!aliases.contains(alias)) {
                aliases.add(alias);
            }
        }

        // 如果没有找到AS别名，尝试从SELECT子句中提取字段名
        if (aliases.isEmpty()) {
            java.util.regex.Pattern selectPattern = java.util.regex.Pattern.compile("SELECT\\s+(.*?)\\s+FROM",
                    java.util.regex.Pattern.CASE_INSENSITIVE | java.util.regex.Pattern.DOTALL);
            java.util.regex.Matcher selectMatcher = selectPattern.matcher(sql);

            if (selectMatcher.find()) {
                String selectClause = selectMatcher.group(1);
                // 简单的字段名提取（逗号分隔）
                String[] fields = selectClause.split(",");
                for (String field : fields) {
                    field = field.trim();
                    // 如果是 *，跳过
                    if (field.equals("*"))
                        continue;

                    // 提取字段名（最后一个单词）
                    String[] parts = field.split("\\s+");
                    if (parts.length > 0) {
                        String fieldName = parts[parts.length - 1];
                        if (fieldName.matches("[a-zA-Z_][a-zA-Z0-9_]*") && !aliases.contains(fieldName)) {
                            aliases.add(fieldName);
                        }
                    }
                }
            }
        }

        return aliases;
    }

    /**
     * 从SQL语句中提取表名
     * 
     * @param sql SQL语句
     * @return 表名，如果无法提取则返回空字符串
     */
    private String extractTableNameFromSQL(String sql) {
        if (StringUtils.isEmpty(sql)) {
            return "";
        }

        try {
            // 简单的正则表达式提取表名
            // 匹配 FROM 关键字后面的表名
            java.util.regex.Pattern pattern = java.util.regex.Pattern.compile(
                    "(?i)FROM\\s+([\\w.]+)(?:\\s+|$)",
                    java.util.regex.Pattern.CASE_INSENSITIVE);
            java.util.regex.Matcher matcher = pattern.matcher(sql);

            if (matcher.find()) {
                String tableName = matcher.group(1);
                // 去除可能的模式前缀（如schema.table）
                if (tableName.contains(".")) {
                    tableName = tableName.substring(tableName.lastIndexOf(".") + 1);
                }
                return tableName;
            }

            // 如果没有找到FROM，尝试查找其他表引用
            pattern = java.util.regex.Pattern.compile(
                    "(?i)\\b(?:JOIN|INTO)\\s+([\\w.]+)(?:\\s+|$)",
                    java.util.regex.Pattern.CASE_INSENSITIVE);
            matcher = pattern.matcher(sql);

            if (matcher.find()) {
                String tableName = matcher.group(1);
                if (tableName.contains(".")) {
                    tableName = tableName.substring(tableName.lastIndexOf(".") + 1);
                }
                return tableName;
            }

            return "";
        } catch (Exception e) {
            log.warn("Failed to extract table name", e);
            return "";
        }
    }

    /**
     * 执行下钻查询
     * 
     * @param request 下钻执行请求
     * @return 下钻执行响应
     */
    @Override
    public DrillExecuteResponse executeDrill(DrillExecuteRequest request) {
        log.info("Executing drill query, params: {}", request);

        DrillExecuteResponse response = new DrillExecuteResponse();

        if (request == null) {
            response.setSuccess(false);
            response.setMessage("Drill-down request parameters are incomplete");
            return response;
        }

        if (request.getReportId() == null || request.getNodeId() == null) {
            response.setSuccess(false);
            response.setMessage("Drill request parameters incomplete");
            log.info("Drill request parameters incomplete - reportId: {}, nodeId: {}",
                    request.getReportId(), request.getNodeId());
            return response;
        }

        try {
            DataDrillNode node = dataDrillNodeMapper.selectDataDrillNodeById(request.getNodeId());

            log.info("DRILL DEBUG: Node info: {}", node);

            if (node == null) {
                log.error("DRILL DEBUG: Node not found, nodeId = {}", request.getNodeId());
                response.setSuccess(false);
                response.setMessage("Drill node not found");
                return response;
            }

            String baseSql = node.getSqlText();
            log.info("DRILL DEBUG: Node SQL: {}", baseSql);

            if (StringUtils.isEmpty(baseSql)) {
                log.error("DRILL DEBUG: Node SQL is empty");
                response.setSuccess(false);
                response.setMessage("Drill node SQL is empty");
                return response;
            }

            Map<String, Object> params = request.getParams();
            if (params == null) {
                params = new java.util.HashMap<>();
            }

            log.info("DRILL DEBUG: Query params: {}", params);

            boolean injectFilter = false;
            String paramName = node.getParamName();
            log.info("DRILL DEBUG: Node paramName: {}", paramName);

            if (paramName != null && params.containsKey(paramName)) {
                log.info("DRILL DEBUG: Found matching param: {} = {}", paramName, params.get(paramName));
                if (!baseSql.contains(":" + paramName) && !baseSql.contains("${" + paramName + "}")) {
                    injectFilter = true;
                }
            }

            String sourceSql = "(" + baseSql + ") AS t_source";
            if (injectFilter) {
                sourceSql = "(SELECT * FROM " + sourceSql + " WHERE " + paramName + " = :" + paramName
                        + ") AS t_filtered";
            }

            log.info("DRILL DEBUG: Original SQL: {}", baseSql);
            log.info("DRILL DEBUG: injectFilter: {}", injectFilter);
            log.info("DRILL DEBUG: Source SQL template: {}", sourceSql);

            String countSql;
            String dataSql;

            if (injectFilter) {
                countSql = "SELECT COUNT(*) FROM " + sourceSql;
                int offset = (request.getPageNo() - 1) * request.getPageSize();
                dataSql = "SELECT * FROM " + sourceSql + " LIMIT " + request.getPageSize() + " OFFSET " + offset;
            } else {
                int offset = (request.getPageNo() - 1) * request.getPageSize();
                countSql = "SELECT COUNT(*) FROM (" + baseSql + ") AS t";

                // 检查SQL是否以分号结尾，如果有则去掉
                String cleanSql = baseSql.trim();
                if (cleanSql.endsWith(";")) {
                    cleanSql = cleanSql.substring(0, cleanSql.length() - 1);
                }

                // 添加PostgreSQL分页语法
                dataSql = cleanSql + " LIMIT " + request.getPageSize() + " OFFSET " + offset;
            }

            log.info("DRILL DEBUG: Final SQL: {}", dataSql);
            log.info("DRILL DEBUG: Query params: {}", params);

            // 检查是否需要参数绑定
            boolean hasParameters = dataSql.contains(":") || dataSql.contains("?");
            log.info("DRILL DEBUG: SQL has parameters: {}", hasParameters);

            java.util.List<Map<String, Object>> results;
            if (hasParameters && !params.isEmpty()) {
                log.info("DRILL DEBUG: Executing SQL with parameters");

                // 将命名参数转换为位置参数
                if (dataSql.contains(":")) {
                    // 提取命名参数并转换为位置参数
                    String positionalSql = dataSql;
                    java.util.List<Object> positionalParams = new ArrayList<>();

                    // 处理命名参数
                    for (java.util.Map.Entry<String, Object> entry : params.entrySet()) {
                        String dataParamName = entry.getKey();
                        Object dataParamValue = entry.getValue();

                        if (positionalSql.contains(":" + dataParamName)) {
                            positionalSql = positionalSql.replace(":" + dataParamName, "?");
                            positionalParams.add(dataParamValue);
                        }
                    }

                    log.info("DRILL DEBUG: Converted SQL: {}", positionalSql);
                    log.info("DRILL DEBUG: Positional params: {}", positionalParams);

                    results = jdbcTemplate.queryForList(positionalSql, positionalParams.toArray());
                } else {
                    // 已经是位置参数语法
                    results = jdbcTemplate.queryForList(dataSql, params);
                }
            } else {
                log.info("DRILL DEBUG: Executing SQL without parameters");
                results = jdbcTemplate.queryForList(dataSql);
            }

            log.info("DRILL DEBUG: SQL executed successfully");
            log.info("DRILL DEBUG: Query result count: {}", results.size());

            java.util.List<Map<String, Object>> countResults;
            if (countSql.contains(":") || countSql.contains("?")) {
                // 将命名参数转换为位置参数
                if (countSql.contains(":")) {
                    // 提取命名参数并转换为位置参数
                    String positionalCountSql = countSql;
                    java.util.List<Object> positionalParams = new ArrayList<>();

                    // 处理命名参数
                    for (java.util.Map.Entry<String, Object> entry : params.entrySet()) {
                        String countParamName = entry.getKey();
                        Object countParamValue = entry.getValue();

                        if (positionalCountSql.contains(":" + countParamName)) {
                            positionalCountSql = positionalCountSql.replace(":" + countParamName, "?");
                            positionalParams.add(countParamValue);
                        }
                    }

                    log.info("DRILL DEBUG: Converted count SQL: {}", positionalCountSql);
                    countResults = jdbcTemplate.queryForList(positionalCountSql, positionalParams.toArray());
                } else {
                    // 已经是位置参数语法
                    countResults = jdbcTemplate.queryForList(countSql, params);
                }
            } else {
                countResults = jdbcTemplate.queryForList(countSql);
            }
            Long total = 0L;
            if (!countResults.isEmpty()) {
                Object countValue = countResults.get(0).values().stream().findFirst().orElse(null);
                if (countValue instanceof Number) {
                    total = ((Number) countValue).longValue();
                }
            }
            log.info("DRILL DEBUG: Total records: {}", total);

            java.util.List<String> columns = new ArrayList<>();
            if (!results.isEmpty()) {
                columns = new ArrayList<>(results.get(0).keySet());
                log.info("DRILL DEBUG: Extracted columns: {}", columns);
            } else {
                log.warn("⚠️ DRILL DEBUG: Query result is empty, cannot extract column info");
            }

            response.setSuccess(true);
            response.setMessage("Drill-down query executed successfully");
            response.setColumns(columns);
            response.setData(results);
            response.setTotal(total);
        } catch (Exception e) {
            log.error("❌ DRILL DEBUG: Drill query execution failed", e);
            response.setSuccess(false);
            response.setMessage("Query execution failed: " + e.getMessage());
        }

        return response;
    }

    /**
     * 获取下钻节点参数
     * 
     * @param nodeId 节点ID
     * @return 参数列表
     */
    @Override
    public List<String> getNodeParams(Integer nodeId) {
        DataDrillNode node = dataDrillNodeMapper.selectDataDrillNodeById(nodeId);
        if (node == null) {
            return new ArrayList<>();
        }

        String sql = node.getSqlText();
        if (StringUtils.isEmpty(sql)) {
            return new ArrayList<>();
        }

        List<String> params = new ArrayList<>();
        int start = -1;
        for (int i = 0; i < sql.length(); i++) {
            char c = sql.charAt(i);
            if (c == '$' && i + 1 < sql.length() && sql.charAt(i + 1) == '{') {
                start = i + 2;
            } else if (c == '}' && start > 0) {
                String param = sql.substring(start, i);
                if (!params.contains(param)) {
                    params.add(param);
                }
                start = -1;
            }
        }

        return params;
    }

    /**
     * 获取下钻树结构
     * 
     * @param infoId 主表ID
     * @return 下钻树结构
     */
    @Override
    public List<DataDrillNode> getDrillTree(Integer infoId) {
        return dataDrillNodeService.buildNodeTree(infoId);
    }

    /**
     * 获取父节点SQL的输出字段
     * 
     * @param parentNodeId 父节点ID
     * @return 字段列表
     */
    @Override
    public List<String> getParentNodeColumns(Integer parentNodeId) {
        if (parentNodeId == null) {
            return new ArrayList<>();
        }

        DataDrillNode node = dataDrillNodeMapper.selectDataDrillNodeById(parentNodeId);
        if (node == null || StringUtils.isEmpty(node.getSqlText())) {
            return new ArrayList<>();
        }

        try {
            String checkSql = "SELECT * FROM (" + node.getSqlText() + ") t LIMIT 1";
            Map<String, Object> result = jdbcTemplate.queryForMap(checkSql);
            return new ArrayList<>(result.keySet());
        } catch (Exception e) {
            log.error("Failed to get parent node field list, nodeId: {}", parentNodeId, e);
            return new ArrayList<>();
        }
    }

    /**
     * 从SQL中提取参数名
     * 
     * @param sql SQL语句
     * @return 参数名列表
     */
    private List<String> extractParameterNamesFromSQL(String sql) {
        List<String> paramNames = new ArrayList<>();

        // 使用正则表达式匹配参数（格式为 :paramName 或 :参数名）
        // 支持字母数字下划线和中文字符
        java.util.regex.Pattern pattern = java.util.regex.Pattern.compile(
                ":[\u4e00-\u9fa5a-zA-Z_][\u4e00-\u9fa5a-zA-Z0-9_]*",
                java.util.regex.Pattern.CASE_INSENSITIVE);

        java.util.regex.Matcher matcher = pattern.matcher(sql);

        while (matcher.find()) {
            String paramName = matcher.group();
            // 去掉开头的冒号
            paramName = paramName.substring(1);
            if (!paramNames.contains(paramName)) {
                paramNames.add(paramName);
            }
        }

        return paramNames;
    }
}
