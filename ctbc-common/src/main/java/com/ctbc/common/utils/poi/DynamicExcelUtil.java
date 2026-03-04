package com.ctbc.common.utils.poi;

import java.io.OutputStream;
import java.util.List;
import java.util.Map;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.streaming.SXSSFSheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 动态Excel导出工具
 * 用于导出动态Map数据到Excel
 * 
 * @author ctbc
 */
public class DynamicExcelUtil {
    private static final Logger log = LoggerFactory.getLogger(DynamicExcelUtil.class);

    /**
     * 导出动态数据到Excel
     * 
     * @param data 数据列表
     * @param headers 表头映射（字段名 -> 显示名称）
     * @param sheetName 工作表名称
     * @param outputStream 输出流
     */
    public static void exportDynamicData(List<Map<String, Object>> data, 
                                       Map<String, String> headers, 
                                       String sheetName, 
                                       OutputStream outputStream) {
        if (data == null || data.isEmpty()) {
            log.warn("No data to export");
            return;
        }

        try (SXSSFWorkbook workbook = new SXSSFWorkbook()) {
            SXSSFSheet sheet = workbook.createSheet(sheetName != null ? sheetName : "导出数据");

            List<String> columns = headers.isEmpty() ? 
                new java.util.ArrayList<>(data.get(0).keySet()) : 
                new java.util.ArrayList<>(headers.keySet());

            Row headerRow = sheet.createRow(0);
            CellStyle headerStyle = createHeaderStyle(workbook);

            for (int i = 0; i < columns.size(); i++) {
                String column = columns.get(i);
                Cell cell = headerRow.createCell(i);
                cell.setCellValue(headers.getOrDefault(column, column));
                cell.setCellStyle(headerStyle);
            }

            CellStyle dataStyle = createDataStyle(workbook);

            for (int i = 0; i < data.size(); i++) {
                Row row = sheet.createRow(i + 1);
                Map<String, Object> rowData = data.get(i);

                for (int j = 0; j < columns.size(); j++) {
                    String column = columns.get(j);
                    Object value = rowData.get(column);

                    Cell cell = row.createCell(j);
                    cell.setCellStyle(dataStyle);

                    if (value != null) {
                        if (value instanceof Number) {
                            cell.setCellValue(((Number) value).doubleValue());
                        } else if (value instanceof Boolean) {
                            cell.setCellValue((Boolean) value);
                        } else if (value instanceof java.util.Date) {
                            // 格式化日期为 "yyyy-MM-dd HH:mm:ss" 格式
                            java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                            cell.setCellValue(sdf.format((java.util.Date) value));
                        } else {
                            // 处理ISO 8601格式的日期字符串 (如: 2026-03-04T11:15:19.914+08:00)
                            String stringValue = value.toString();
                            if (stringValue.matches("\\d{4}-\\d{2}-\\d{2}T\\d{2}:\\d{2}:\\d{2}.*")) {
                                try {
                                    java.time.OffsetDateTime odt = java.time.OffsetDateTime.parse(stringValue);
                                    java.time.LocalDateTime ldt = odt.toLocalDateTime();
                                    java.time.format.DateTimeFormatter formatter = java.time.format.DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                                    cell.setCellValue(ldt.format(formatter));
                                } catch (Exception e) {
                                    cell.setCellValue(stringValue);
                                }
                            } else if (stringValue != null && !stringValue.trim().isEmpty()) {
                                cell.setCellValue(stringValue);
                            } else {
                                cell.setCellValue(""); // 空值设为空字符串
                            }
                        }
                    } else {
                        cell.setCellValue(""); // null值设为空字符串
                    }
                }
            }

            // 注释掉自动列宽调整功能，避免POI版本兼容性问题
            // sheet.trackAllColumnsForAutoSizing();
            // 
            // for (int i = 0; i < columns.size(); i++) {
            //     sheet.autoSizeColumn(i);
            // }

            workbook.write(outputStream);
            outputStream.flush();

            log.info("Export completed successfully, {} rows exported", data.size());
        } catch (Exception e) {
            log.error("Export failed", e);
            throw new RuntimeException("Export failed: " + e.getMessage(), e);
        }
    }

    private static CellStyle createHeaderStyle(SXSSFWorkbook workbook) {
        CellStyle style = workbook.createCellStyle();
        Font font = workbook.createFont();
        font.setBold(true);
        style.setFont(font);
        style.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
        style.setFillPattern(FillPatternType.SOLID_FOREGROUND);
        style.setBorderBottom(BorderStyle.THIN);
        style.setBorderTop(BorderStyle.THIN);
        style.setBorderLeft(BorderStyle.THIN);
        style.setBorderRight(BorderStyle.THIN);
        return style;
    }

    private static CellStyle createDataStyle(SXSSFWorkbook workbook) {
        CellStyle style = workbook.createCellStyle();
        style.setBorderBottom(BorderStyle.THIN);
        style.setBorderTop(BorderStyle.THIN);
        style.setBorderLeft(BorderStyle.THIN);
        style.setBorderRight(BorderStyle.THIN);
        return style;
    }
}
