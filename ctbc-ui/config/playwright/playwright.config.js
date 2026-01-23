// playwright.config.js
const { defineConfig } = require('@playwright/test');

module.exports = defineConfig({
  // 使用Chromium浏览器
  use: {
    browserName: 'chromium',
    headless: true, // 无头模式运行
    viewport: { width: 1920, height: 1080 }, // 设置视口大小
    ignoreHTTPSErrors: true, // 忽略HTTPS错误
    video: 'on-first-retry', // 只在第一次重试时录制视频
    screenshot: 'only-on-failure', // 只在失败时截图
    trace: 'retain-on-failure', // 只在失败时保留跟踪记录
  },
  // 测试超时设置
  timeout: 30000,
  // 每个测试的超时时间
  testTimeout: 30000,
  // 重试次数
  retries: 0,
  // 测试文件匹配模式
  testDir: './tests',
  // 测试文件格式
  testMatch: '**/*.spec.js',
  // 并行测试数量
  workers: 1,
  // 报告生成
  reporter: [
    ['list'], // 终端输出报告
    ['html', { outputFolder: 'playwright-report' }], // HTML格式报告
  ],
  // 关闭浏览器之间的上下文隔离
  fullyParallel: false,
  // 关闭共享浏览器上下文
  useSharedBrowserContext: false,
});
