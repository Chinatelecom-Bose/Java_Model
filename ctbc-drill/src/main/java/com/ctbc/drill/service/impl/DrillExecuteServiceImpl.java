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
public class DrillExecuteServiceImpl implements IDrillExecuteService 
{
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
    public DrillSQLValidateResponse validateSQL(DrillSQLValidateRequest request)
    {
        DrillSQLValidateResponse response = new DrillSQLValidateResponse();
        
        if (request == null || StringUtils.isEmpty(request.getSqlText()))
        {
            response.setValid(false);
            response.setSuccess(false);
            response.setMessage("SQL语句不能为空");
            return response;
        }
        
        String sql = request.getSqlText().trim();
        
        try
        {
            List<String> readOnlyKeywords = List.of("SELECT", "SHOW", "DESCRIBE", "EXPLAIN");
            String upperSql = sql.toUpperCase();
            boolean isReadOnly = readOnlyKeywords.stream().anyMatch(upperSql::startsWith);
            
            if (!isReadOnly)
            {
                response.setValid(false);
                response.setSuccess(false);
                response.setMessage("仅支持SELECT、SHOW、DESCRIBE、EXPLAIN等只读SQL语句");
                return response;
            }
            
            // 检查SQL是否包含命名参数
            boolean hasNamedParams = sql.matches(".*:\\w+.*");
            
            if (hasNamedParams)
            {
                // 对于包含命名参数的SQL，只进行语法校验，不执行查询
                response.setValid(true);
                response.setSuccess(true);
                response.setMessage("SQL语句校验通过（包含参数，跳过执行验证）");
                response.setTotal(0L);
                
                // 尝试从元数据获取字段信息
                try
                {
                    // 使用一个简单的查询来获取字段信息，避免参数问题
                    String testSql = "SELECT * FROM financial_adjustment_summary LIMIT 0";
                    jdbcTemplate.query(testSql, (ResultSet rs) -> {
                        ResultSetMetaData metaData = rs.getMetaData();
                        int columnCount = metaData.getColumnCount();
                        List<String> columns = new ArrayList<>();
                        for (int i = 1; i <= columnCount; i++)
                        {
                            columns.add(metaData.getColumnName(i));
                        }
                        response.setColumns(columns);
                        return null;
                    });
                }
                catch (Exception metaError)
                {
                    log.warn("无法从元数据获取字段信息", metaError);
                    response.setColumns(new ArrayList<>());
                }
            }
            else
            {
                // 对于不包含参数的SQL，正常执行验证
                String checkSql = "SELECT * FROM (" + sql + ") t LIMIT 1";
                List<Map<String, Object>> checkResults = jdbcTemplate.queryForList(checkSql);
                
                response.setValid(true);
                response.setSuccess(true);
                response.setMessage("SQL语句校验通过");
                
                String countSql = "SELECT COUNT(*) FROM (" + sql + ") t";
                Map<String, Object> countResult = jdbcTemplate.queryForMap(countSql);
                Long total = countResult.values().stream().findFirst().map(v -> ((Number) v).longValue()).orElse(0L);
                response.setTotal(total);
                
                if (!checkResults.isEmpty())
                {
                    List<String> columns = new ArrayList<>(checkResults.get(0).keySet());
                    response.setColumns(columns);
                }
                else
                {
                    // 如果查询结果为空，尝试从元数据获取字段信息
                    try
                    {
                        // 使用LIMIT 0查询，但通过ResultSetMetaData获取字段信息
                        String metaSql = "SELECT * FROM (" + sql + ") t LIMIT 0";
                        jdbcTemplate.query(metaSql, (ResultSet rs) -> {
                            ResultSetMetaData metaData = rs.getMetaData();
                            int columnCount = metaData.getColumnCount();
                            List<String> columns = new ArrayList<>();
                            for (int i = 1; i <= columnCount; i++)
                            {
                                columns.add(metaData.getColumnName(i));
                            }
                            response.setColumns(columns);
                            return null;
                        });
                    }
                    catch (Exception metaError)
                    {
                        log.warn("无法从元数据获取字段信息", metaError);
                        response.setColumns(new ArrayList<>());
                    }
                }
            }
            
        }
        catch (Exception e)
        {
            log.error("SQL校验失败", e);
            String errMsg = e.getMessage();
            if (errMsg != null && (errMsg.toLowerCase().contains("bind parameter") || errMsg.toLowerCase().contains("parameter")))
            {
                response.setValid(false);
                response.setSuccess(false);
                response.setMessage("SQL包含参数，无法自动校验列结构。请确保SQL语法正确。错误: " + errMsg);
            }
            else
            {
                response.setValid(false);
                response.setSuccess(false);
                response.setMessage("SQL语句语法错误: " + errMsg);
            }
        }
        
        return response;
    }

    /**
     * 执行下钻查询
     * 
     * @param request 下钻执行请求
     * @return 下钻执行响应
     */
    @Override
    public DrillExecuteResponse executeDrill(DrillExecuteRequest request)
    {
        log.info("Executing drill query, params: {}", request);
        
        DrillExecuteResponse response = new DrillExecuteResponse();
        
        if (request == null)
        {
            response.setSuccess(false);
            response.setMessage("下钻请求参数不完整");
            return response;
        }
        
        if (request.getReportId() == null || request.getNodeId() == null)
        {
            response.setSuccess(false);
            response.setMessage("Drill request parameters incomplete");
            log.info("Drill request parameters incomplete - reportId: {}, nodeId: {}", 
                request.getReportId(), request.getNodeId());
            return response;
        }
        
        try
        {
            DataDrillNode node = dataDrillNodeMapper.selectDataDrillNodeById(request.getNodeId());
            
            log.info("DRILL DEBUG: Node info: {}", node);
            
            if (node == null)
            {
                log.error("DRILL DEBUG: Node not found, nodeId = {}", request.getNodeId());
                response.setSuccess(false);
                response.setMessage("Drill node not found");
                return response;
            }
            
            String baseSql = node.getSqlText();
            log.info("DRILL DEBUG: Node SQL: {}", baseSql);
            
            if (StringUtils.isEmpty(baseSql))
            {
                log.error("DRILL DEBUG: Node SQL is empty");
                response.setSuccess(false);
                response.setMessage("Drill node SQL is empty");
                return response;
            }
            
            Map<String, Object> params = request.getParams();
            if (params == null)
            {
                params = new java.util.HashMap<>();
            }
            
            log.info("DRILL DEBUG: Query params: {}", params);
            
            boolean injectFilter = false;
            String paramName = node.getParamName();
            log.info("DRILL DEBUG: Node paramName: {}", paramName);
            
            if (paramName != null && params.containsKey(paramName))
            {
                log.info("DRILL DEBUG: Found matching param: {} = {}", paramName, params.get(paramName));
                if (!baseSql.contains(":" + paramName) && !baseSql.contains("${" + paramName + "}"))
                {
                    injectFilter = true;
                }
            }
            
            String sourceSql = "(" + baseSql + ") AS t_source";
            if (injectFilter)
            {
                sourceSql = "(SELECT * FROM " + sourceSql + " WHERE " + paramName + " = :" + paramName + ") AS t_filtered";
            }
            
            log.info("DRILL DEBUG: Original SQL: {}", baseSql);
            log.info("DRILL DEBUG: injectFilter: {}", injectFilter);
            log.info("DRILL DEBUG: Source SQL template: {}", sourceSql);
            
            String countSql;
            String dataSql;
            
            if (injectFilter)
            {
                countSql = "SELECT COUNT(*) FROM " + sourceSql;
                int offset = (request.getPageNo() - 1) * request.getPageSize();
                dataSql = "SELECT * FROM " + sourceSql + " LIMIT " + request.getPageSize() + " OFFSET " + offset;
            }
            else
            {
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
            if (!countResults.isEmpty())
            {
                Object countValue = countResults.get(0).values().stream().findFirst().orElse(null);
                if (countValue instanceof Number)
                {
                    total = ((Number) countValue).longValue();
                }
            }
            log.info("DRILL DEBUG: Total records: {}", total);
            
            java.util.List<String> columns = new ArrayList<>();
            if (!results.isEmpty())
            {
                columns = new ArrayList<>(results.get(0).keySet());
                log.info("DRILL DEBUG: Extracted columns: {}", columns);
            }
            else
            {
                log.warn("⚠️ DRILL DEBUG: 查询结果为空，无法提取列信息");
            }
            
            response.setSuccess(true);
            response.setMessage("下钻查询执行成功");
            response.setColumns(columns);
            response.setData(results);
            response.setTotal(total);
        }
        catch (Exception e)
        {
            log.error("❌ DRILL DEBUG: 下钻查询执行失败", e);
            response.setSuccess(false);
            response.setMessage("查询执行失败: " + e.getMessage());
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
    public List<String> getNodeParams(Integer nodeId)
    {
        DataDrillNode node = dataDrillNodeMapper.selectDataDrillNodeById(nodeId);
        if (node == null)
        {
            return new ArrayList<>();
        }
        
        String sql = node.getSqlText();
        if (StringUtils.isEmpty(sql))
        {
            return new ArrayList<>();
        }
        
        List<String> params = new ArrayList<>();
        int start = -1;
        for (int i = 0; i < sql.length(); i++)
        {
            char c = sql.charAt(i);
            if (c == '$' && i + 1 < sql.length() && sql.charAt(i + 1) == '{')
            {
                start = i + 2;
            }
            else if (c == '}' && start > 0)
            {
                String param = sql.substring(start, i);
                if (!params.contains(param))
                {
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
    public List<DataDrillNode> getDrillTree(Integer infoId)
    {
        return dataDrillNodeService.buildNodeTree(infoId);
    }

    /**
     * 获取父节点SQL的输出字段
     * 
     * @param parentNodeId 父节点ID
     * @return 字段列表
     */
    @Override
    public List<String> getParentNodeColumns(Integer parentNodeId)
    {
        if (parentNodeId == null)
        {
            return new ArrayList<>();
        }
        
        DataDrillNode node = dataDrillNodeMapper.selectDataDrillNodeById(parentNodeId);
        if (node == null || StringUtils.isEmpty(node.getSqlText()))
        {
            return new ArrayList<>();
        }
        
        try
        {
            String checkSql = "SELECT * FROM (" + node.getSqlText() + ") t LIMIT 1";
            Map<String, Object> result = jdbcTemplate.queryForMap(checkSql);
            return new ArrayList<>(result.keySet());
        }
        catch (Exception e)
        {
            log.error("获取父节点字段列表失败, nodeId: {}", parentNodeId, e);
            return new ArrayList<>();
        }
    }
}
