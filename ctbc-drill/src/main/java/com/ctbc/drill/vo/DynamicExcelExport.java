package com.ctbc.drill.vo;

import com.ctbc.common.annotation.Excel;
import com.ctbc.common.annotation.Excel.ColumnType;
import java.util.Map;

/**
 * 动态Excel导出实体
 * 用于将Map数据转换为ExcelUtil可处理的格式
 * 
 * @author ctbc
 */
public class DynamicExcelExport {

    private Map<String, Object> data;

    public DynamicExcelExport(Map<String, Object> data) {
        this.data = data;
    }

    public Map<String, Object> getData() {
        return data;
    }
}
