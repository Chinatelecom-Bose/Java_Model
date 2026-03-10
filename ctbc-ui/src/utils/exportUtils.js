/**
 * 导出工具类 - 提供数据导出相关的工具函数
 */
import dayjs from 'dayjs';

/**
 * 格式化日期值（用于导出）
 * 支持多种日期格式转换为标准格式 yyyy-MM-dd HH:mm:ss
 * @param {any} value - 需要格式化的值
 * @returns {string} 格式化后的日期字符串
 */
export function formatDateValue(value) {
  if (!value) return '';
  const dateStr = String(value);
  
  const isoMatch = dateStr.match(/^(\d{4})-(\d{2})-(\d{2})T(\d{2}):(\d{2}):(\d{2})/);
  if (isoMatch) {
    const [, year, month, day, hour, minute, second] = isoMatch;
    return `${year}-${month}-${day} ${hour}:${minute}:${second}`;
  }
  
  if (dateStr.match(/^\d{4}-\d{2}-\d{2}$/)) {
    return `${dateStr} 00:00:00`;
  }
  
  if (dateStr.match(/^\d{4}\/\d{2}\/\d{2}$/)) {
    const converted = dateStr.replace(/\//g, '-');
    return `${converted} 00:00:00`;
  }
  
  if (dateStr.match(/^\d{1,2}:\d{2}(:\d{2})?$/)) {
    const timeParts = dateStr.split(':');
    if (timeParts.length === 2) {
      return `${dateStr}:00`;
    }
    return dateStr;
  }
  
  return dateStr;
}

/**
 * 判断值是否为日期字段
 * @param {any} value - 需要判断的值
 * @returns {boolean} 是否为日期字段
 */
export function isDateField(value) {
  if (!value) return false;
  const dateStr = String(value);
  return dateStr.match(/^\d{4}-\d{2}-\d{2}(T\d{2}:\d{2}:\d{2}|$)/) !== null ||
         dateStr.match(/^\d{1,2}:\d{2}(:\d{2})?$/) !== null;
}

/**
 * 格式化单元格值（用于表格显示）
 * @param {any} value - 需要格式化的值
 * @returns {string} 格式化后的字符串
 */
export function formatCellValue(value) {
  if (value === null || value === undefined) return '';
  const stringValue = String(value);
  
  if (stringValue.match(/^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}/)) {
    return dayjs(stringValue).format('YYYY-MM-DD HH:mm:ss');
  }
  
  if (stringValue.match(/^\d{4}-\d{2}-\d{2}$/)) {
    return `${stringValue} 00:00:00`;
  }
  
  if (stringValue.match(/^\d{4}\/\d{2}\/\d{2}$/)) {
    const converted = stringValue.replace(/\//g, '-');
    return `${converted} 00:00:00`;
  }
  
  if (stringValue.match(/^\d{1,2}:\d{2}(:\d{2})?$/)) {
    const timeParts = stringValue.split(':');
    if (timeParts.length === 2) {
      return `${stringValue}:00`;
    }
    return stringValue;
  }
  
  return stringValue;
}

/**
 * 导出数据为CSV文件
 * @param {Array} data - 要导出的数据数组
 * @param {string} fileName - 文件名（不含扩展名）
 * @returns {boolean} 导出是否成功
 */
export function exportToCsv(data, fileName) {
  if (!data || data.length === 0) {
    return false;
  }
  
  const keys = Object.keys(data[0]);
  const header = keys.join(',');
  const rows = data.map(row => {
    return keys.map(key => {
      const value = row[key];
      if (isDateField(value)) {
        return formatDateValue(value);
      }
      if (value === null || value === undefined) return '';
      const stringValue = String(value);
      if (stringValue.includes(',') || stringValue.includes('\n') || stringValue.includes('"')) {
        return `"${stringValue.replace(/"/g, '""')}"`;
      }
      return stringValue;
    }).join(',');
  });
  
  const csvContent = [header, ...rows].join('\n');
  const BOM = '\uFEFF';
  const blob = new Blob([BOM + csvContent], { type: 'text/csv;charset=utf-8;' });
  
  const url = window.URL.createObjectURL(blob);
  const link = document.createElement('a');
  link.href = url;
  link.download = `${fileName || '数据导出'}_${dayjs().format('YYYY-MM-DD_HH-mm-ss')}.csv`;
  document.body.appendChild(link);
  link.click();
  document.body.removeChild(link);
  window.URL.revokeObjectURL(url);
  
  return true;
}

export default {
  formatDateValue,
  isDateField,
  formatCellValue,
  exportToCsv,
};
