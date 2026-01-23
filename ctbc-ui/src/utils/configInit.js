/**
 * 全局配置初始化工具
 * 用于在应用启动时初始化各种配置
 */

import { useAppStore } from '@/stores/app';
import { useTableConfigStore } from '@/stores/tableConfig';

/**
 * 初始化应用配置
 */
export function initAppConfig() {
  try {
    const appStore = useAppStore();

    // 从localStorage加载布局设置
    const savedSettings = localStorage.getItem('layoutSettings');
    if (savedSettings) {
      try {
        const parsedSettings = JSON.parse(savedSettings);
        appStore.updateSettings(parsedSettings);
        console.log('✅ 布局设置已从localStorage加载');
      } catch (error) {
        console.warn('⚠️ 布局设置解析失败，使用默认设置:', error);
        localStorage.removeItem('layoutSettings');
      }
    }

    // 应用主题设置
    appStore.applyTheme();

    // 设置系统标题
    if (appStore.systemConfig && appStore.systemConfig.title) {
      document.title = appStore.systemConfig.title;
    }

    // 设置meta信息
    updateMetaInfo(appStore.systemConfig);

    console.log('✅ 应用配置初始化完成');
  } catch (error) {
    console.error('❌ 应用配置初始化失败:', error);
  }
}

/**
 * 初始化表格配置
 */
export function initTableConfig() {
  try {
    const tableConfigStore = useTableConfigStore();

    // 从localStorage加载表格配置
    tableConfigStore.loadConfig();

    console.log('✅ 表格配置初始化完成');
  } catch (error) {
    console.error('❌ 表格配置初始化失败:', error);
    // 如果初始化失败，使用默认配置
    try {
      const tableConfigStore = useTableConfigStore();
      tableConfigStore.resetConfig();
      console.log('✅ 已重置为默认表格配置');
    } catch (resetError) {
      console.error('❌ 重置表格配置也失败:', resetError);
    }
  }
}

/**
 * 更新页面meta信息
 */
function updateMetaInfo(systemConfig) {
  // 更新description
  if (systemConfig.description) {
    updateMetaTag('description', systemConfig.description);
  }

  // 更新keywords
  if (systemConfig.keywords) {
    updateMetaTag('keywords', systemConfig.keywords);
  }

  // 更新author
  updateMetaTag('author', 'BearJia Team');

  // 更新viewport
  updateMetaTag('viewport', 'width=device-width, initial-scale=1.0');
}

/**
 * 更新或创建meta标签
 */
function updateMetaTag(name, content) {
  let meta = document.querySelector(`meta[name="${name}"]`);

  if (!meta) {
    meta = document.createElement('meta');
    meta.name = name;
    document.head.appendChild(meta);
  }

  meta.content = content;
}

/**
 * 初始化CSS变量 (已优化：主要CSS变量设置移至 stores/app.js 的 applyTheme 方法)
 * 这里只处理一些额外的变量设置
 */
export function initCSSVariables() {
  const appStore = useAppStore();

  // 主要的CSS变量设置已移至 appStore.applyTheme() 方法
  // 这里只处理一些特殊的变量设置
  const root = document.documentElement;
  const primaryColor = appStore.layoutSettings.primaryColor;
  const primaryColorRgb = hexToRgb(primaryColor);

  if (primaryColorRgb) {
    // 设置额外的透明度变体（applyTheme 中没有的）
    root.style.setProperty(
      '--ant-primary-2',
      `rgba(${primaryColorRgb.r}, ${primaryColorRgb.g}, ${primaryColorRgb.b}, 0.2)`
    );
    root.style.setProperty(
      '--ant-primary-3',
      `rgba(${primaryColorRgb.r}, ${primaryColorRgb.g}, ${primaryColorRgb.b}, 0.3)`
    );
    root.style.setProperty(
      '--ant-primary-4',
      `rgba(${primaryColorRgb.r}, ${primaryColorRgb.g}, ${primaryColorRgb.b}, 0.4)`
    );
    root.style.setProperty(
      '--ant-primary-5',
      `rgba(${primaryColorRgb.r}, ${primaryColorRgb.g}, ${primaryColorRgb.b}, 0.5)`
    );
  }

  console.log('✅ 额外CSS变量初始化完成');
}

/**
 * 将十六进制颜色转换为RGB
 */
function hexToRgb(hex) {
  const result = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(hex);
  return result
    ? {
        r: parseInt(result[1], 16),
        g: parseInt(result[2], 16),
        b: parseInt(result[3], 16),
      }
    : null;
}

/**
 * 初始化色弱模式 (已优化：CSS样式已移至 theme.less，这里只处理类名切换)
 */
export function initColorWeakMode() {
  const appStore = useAppStore();

  // 色弱模式的样式已在 theme.less 中定义，这里只需要切换类名
  // 注意：初始化时不显示消息提示，避免页面刷新时重复提示
  if (appStore.layoutSettings.colorWeak) {
    document.documentElement.classList.add('color-weak');
  } else {
    document.documentElement.classList.remove('color-weak');
  }

  console.log('✅ 色弱模式初始化完成');
}

/**
 * 初始化所有配置
 */
export function initAllConfigs() {
  try {
    initAppConfig();
    initTableConfig();
    initCSSVariables();
    initColorWeakMode();

    console.log('🎉 所有配置初始化完成');
  } catch (error) {
    console.error('❌ 配置初始化失败:', error);
  }
}

/**
 * 监听配置变化
 */
export function watchConfigChanges() {
  const appStore = useAppStore();

  // 监听主题变化
  appStore.$subscribe((mutation, state) => {
    if (mutation.type === 'direct' && mutation.events && Array.isArray(mutation.events)) {
      const changedKeys = mutation.events.map((event) => event.key);

      // 如果主题相关配置发生变化，重新应用主题
      if (changedKeys.some((key) => ['primaryColor', 'darkMode', 'colorWeak'].includes(key))) {
        appStore.applyTheme();
        // 只在主题色变化时重新设置额外的CSS变量
        if (changedKeys.includes('primaryColor')) {
          initCSSVariables();
        }
      }

      // 如果系统配置发生变化，更新页面信息
      if (changedKeys.some((key) => key.startsWith('system'))) {
        updateMetaInfo(state.systemConfig);
        if (state.systemConfig.title) {
          document.title = state.systemConfig.title;
        }
      }
    }
  });

  console.log('✅ 配置变化监听已启动');
}

export default {
  initAppConfig,
  initTableConfig,
  initCSSVariables,
  initColorWeakMode,
  initAllConfigs,
  watchConfigChanges,
};
