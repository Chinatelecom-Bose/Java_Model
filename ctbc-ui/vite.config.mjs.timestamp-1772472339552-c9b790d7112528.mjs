// vite.config.mjs
import { defineConfig } from "file:///D:/Desktop/%E7%94%B5%E4%BF%A1%E5%B7%A5%E4%BD%9C%E6%96%87%E6%A1%A3/2026%E5%B9%B4%E6%95%B0%E5%AD%97%E5%8C%96%E9%A1%B9%E7%9B%AE/%E5%85%AC%E5%85%8D%E5%85%AC%E7%BA%B3%E7%B3%BB%E7%BB%9F/Java_Model/ctbc-ui/node_modules/vite/dist/node/index.js";

// config/vite/index.js
import { loadEnv as loadEnv2 } from "file:///D:/Desktop/%E7%94%B5%E4%BF%A1%E5%B7%A5%E4%BD%9C%E6%96%87%E6%A1%A3/2026%E5%B9%B4%E6%95%B0%E5%AD%97%E5%8C%96%E9%A1%B9%E7%9B%AE/%E5%85%AC%E5%85%8D%E5%85%AC%E7%BA%B3%E7%B3%BB%E7%BB%9F/Java_Model/ctbc-ui/node_modules/vite/dist/node/index.js";

// config/vite/base.js
import path from "path";
import { loadEnv } from "file:///D:/Desktop/%E7%94%B5%E4%BF%A1%E5%B7%A5%E4%BD%9C%E6%96%87%E6%A1%A3/2026%E5%B9%B4%E6%95%B0%E5%AD%97%E5%8C%96%E9%A1%B9%E7%9B%AE/%E5%85%AC%E5%85%8D%E5%85%AC%E7%BA%B3%E7%B3%BB%E7%BB%9F/Java_Model/ctbc-ui/node_modules/vite/dist/node/index.js";
function getAlias(dirname) {
  return {
    "@": path.resolve(dirname, "src"),
    "@components": path.resolve(dirname, "src/components"),
    "@utils": path.resolve(dirname, "src/utils"),
    "@api": path.resolve(dirname, "src/api"),
    "@views": path.resolve(dirname, "src/views"),
    "@stores": path.resolve(dirname, "src/stores"),
    "@assets": path.resolve(dirname, "src/assets"),
    "@style": path.resolve(dirname, "src/style")
  };
}
function getServerConfig(mode, cwd) {
  const env = loadEnv(mode, cwd);
  return {
    host: "0.0.0.0",
    port: parseInt(env.VITE_PORT || 3e3),
    open: true,
    proxy: {
      "/dev-api": {
        target: "http://localhost:8080",
        changeOrigin: true,
        rewrite: (path2) => path2.replace(/^\/dev-api/, ""),
        timeout: 3e4,
        ws: true,
        retry: 0,
        configure: (proxy, options) => {
          proxy.on("error", (err) => {
            console.log("\u4EE3\u7406\u9519\u8BEF", err);
          });
          proxy.on("proxyReq", (proxyReq, req) => {
            proxyReq.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            proxyReq.setHeader("Pragma", "no-cache");
            proxyReq.setHeader("Expires", "0");
          });
          proxy.on("proxyRes", (proxyRes, req, res) => {
            proxyRes.headers["cache-control"] = "no-cache, no-store, must-revalidate";
            proxyRes.headers["pragma"] = "no-cache";
            proxyRes.headers["expires"] = "0";
          });
        }
      }
    }
  };
}
function getDefineConfig() {
  return {
    __VUE_PROD_DEVTOOLS__: false,
    __VUE_OPTIONS_API__: true,
    __VUE_PROD_HYDRATION_MISMATCH_DETAILS__: false
  };
}
function getOptimizeDeps() {
  return {
    include: [
      "vue",
      "vue-router",
      "pinia",
      "dayjs",
      "axios",
      "js-cookie",
      "nprogress"
    ],
    exclude: [
      "@wangeditor/editor",
      "@wangeditor/editor-for-vue",
      "@form-create/ant-design-vue",
      "@form-create/antd-designer",
      "ant-design-vue",
      "@ant-design/icons-vue"
    ]
  };
}

// config/vite/build.js
function getBuildBase(isProd) {
  return {
    target: "es2015",
    outDir: "dist",
    emptyOutDir: true,
    sourcemap: isProd ? false : "inline",
    chunkSizeWarningLimit: 1500,
    cssCodeSplit: true,
    cssMinify: isProd,
    assetsInlineLimit: 4096,
    reportCompressedSize: false
  };
}
function getTerserOptions(isProd) {
  if (!isProd) return void 0;
  return {
    compress: {
      drop_console: false,
      // 禁用全局移除，改为使用pure_funcs精确控制
      drop_debugger: true,
      // 只移除非错误类型的console，保留console.error用于生产环境错误展示
      pure_funcs: [
        "console.log",
        "console.info",
        "console.debug",
        "console.trace",
        "console.warn",
        "console.assert",
        "console.dir",
        "console.dirxml",
        "console.group",
        "console.groupCollapsed",
        "console.groupEnd",
        "console.table",
        "console.time",
        "console.timeEnd",
        "console.timeLog",
        "console.timeStamp",
        "console.profile",
        "console.profileEnd",
        "console.count",
        "console.countReset",
        "console.memory"
      ],
      passes: 2
    },
    format: {
      comments: false
    }
  };
}
function getAssetFileNames(assetInfo) {
  const info = assetInfo.name.split(".");
  let extType = info[info.length - 1];
  if (/\.(png|jpe?g|gif|svg|webp|ico)$/i.test(assetInfo.name)) {
    extType = "img";
  } else if (/\.(woff2?|eot|ttf|otf)$/i.test(assetInfo.name)) {
    extType = "fonts";
  } else if (/\.css$/i.test(assetInfo.name)) {
    extType = "css";
  }
  return `${extType}/[name]-[hash].[ext]`;
}
function manualChunks(id) {
  if (id.includes("node_modules")) {
    const packageName = id.split("node_modules/")[1].split("/")[0].replace("@", "");
    if (id.includes("vue/") && !id.includes("vue-router") && !id.includes("vue-request") && !id.includes("ant-design-vue") && !id.includes("@ant-design")) {
      return "vue-core";
    }
    if (id.includes("vue-router")) {
      return "vue-router";
    }
    if (id.includes("pinia")) {
      return "pinia";
    }
    if (id.includes("@vueuse")) {
      return "vueuse";
    }
    if (id.includes("ant-design-vue")) {
      return "ant-design-vue";
    }
    if (id.includes("@ant-design/icons-vue")) {
      return "antd-icons";
    }
    if (id.includes("@form-create/ant-design-vue")) {
      return "form-create-antd";
    }
    if (id.includes("@form-create/antd-designer")) {
      return "form-designer";
    }
    if (id.includes("@form-create")) {
      return "form-create-core";
    }
    if (id.includes("@wangeditor/editor-for-vue")) {
      return "wangeditor-vue";
    }
    if (id.includes("@wangeditor")) {
      return "wangeditor-core";
    }
    if (id.includes("highlight.js")) {
      return "highlight";
    }
    if (id.includes("vue3-highlightjs")) {
      return "vue-highlight";
    }
    if (id.includes("echarts")) {
      if (id.includes("echarts/core")) {
        return "echarts-core";
      }
      if (id.includes("echarts/charts")) {
        return "echarts-charts";
      }
      if (id.includes("echarts/components")) {
        return "echarts-components";
      }
      if (id.includes("echarts/renderers")) {
        return "echarts-renderers";
      }
      return "echarts-base";
    }
    if (id.includes("axios")) {
      return "axios";
    }
    if (id.includes("dayjs")) {
      return "dayjs";
    }
    if (id.includes("js-cookie")) {
      return "js-cookie";
    }
    if (id.includes("nprogress")) {
      return "nprogress";
    }
    if (id.includes("sortablejs")) {
      return "sortable";
    }
    if (id.includes("file-saver")) {
      return "file-saver";
    }
    if (id.includes("particles.js")) {
      return "particles";
    }
    if (id.includes("@vueuse")) {
      return "vueuse";
    }
    if (id.includes("vue-request")) {
      return "vue-request";
    }
    if (id.includes("core-js")) {
      return "polyfills";
    }
    return "vendor-misc";
  }
  if (id.includes("src/")) {
    if (id.includes("src/layout/")) {
      return "layout";
    }
    if (id.includes("src/components/layout")) {
      return "components-layout";
    }
    if (id.includes("src/components/common")) {
      return "components-common";
    }
    if (id.includes("src/components/")) {
      return "components-other";
    }
    if (id.includes("src/router/")) {
      return "router";
    }
    if (id.includes("src/stores/")) {
      return "stores";
    }
    if (id.includes("src/api/system/")) {
      return "api-system";
    }
    if (id.includes("src/api/monitor/")) {
      return "api-monitor";
    }
    if (id.includes("src/api/tool/")) {
      return "api-tool";
    }
    if (id.includes("src/api/")) {
      return "api-common";
    }
    if (id.includes("src/views/system/")) {
      return "views-system";
    }
    if (id.includes("src/views/monitor/")) {
      return "views-monitor";
    }
    if (id.includes("src/views/tool/")) {
      return "views-tool";
    }
    if (id.includes("src/views/frontend/")) {
      return "views-frontend";
    }
    if (id.includes("src/views/")) {
      return "views-common";
    }
    if (id.includes("src/utils/")) {
      return "utils";
    }
    if (id.includes("src/directive/")) {
      return "directive";
    }
    if (id.includes("src/config/")) {
      return "config";
    }
    if (id.includes("src/plugins/")) {
      return "plugins";
    }
    if (id.includes("src/assets/")) {
      return "assets";
    }
  }
}
function getBuildConfig(isProd) {
  const baseConfig = getBuildBase(isProd);
  return {
    ...baseConfig,
    minify: isProd ? "terser" : false,
    terserOptions: getTerserOptions(isProd),
    rollupOptions: {
      output: {
        chunkFileNames: "js/[name]-[hash].js",
        entryFileNames: "js/[name]-[hash].js",
        assetFileNames: getAssetFileNames,
        manualChunks
      },
      external: isProd ? [] : []
    },
    optimizeDeps: {
      include: [
        "vue",
        "vue-router",
        "pinia",
        "dayjs",
        "axios",
        "js-cookie",
        "nprogress"
      ],
      exclude: [
        "@wangeditor/editor",
        "@wangeditor/editor-for-vue",
        "@form-create/ant-design-vue",
        "@form-create/antd-designer",
        "ant-design-vue",
        "@ant-design/icons-vue"
      ]
    }
  };
}

// config/vite/plugins.js
import vue from "file:///D:/Desktop/%E7%94%B5%E4%BF%A1%E5%B7%A5%E4%BD%9C%E6%96%87%E6%A1%A3/2026%E5%B9%B4%E6%95%B0%E5%AD%97%E5%8C%96%E9%A1%B9%E7%9B%AE/%E5%85%AC%E5%85%8D%E5%85%AC%E7%BA%B3%E7%B3%BB%E7%BB%9F/Java_Model/ctbc-ui/node_modules/@vitejs/plugin-vue/dist/index.mjs";
import vueJsx from "file:///D:/Desktop/%E7%94%B5%E4%BF%A1%E5%B7%A5%E4%BD%9C%E6%96%87%E6%A1%A3/2026%E5%B9%B4%E6%95%B0%E5%AD%97%E5%8C%96%E9%A1%B9%E7%9B%AE/%E5%85%AC%E5%85%8D%E5%85%AC%E7%BA%B3%E7%B3%BB%E7%BB%9F/Java_Model/ctbc-ui/node_modules/@vitejs/plugin-vue-jsx/dist/index.mjs";
import AutoImport from "file:///D:/Desktop/%E7%94%B5%E4%BF%A1%E5%B7%A5%E4%BD%9C%E6%96%87%E6%A1%A3/2026%E5%B9%B4%E6%95%B0%E5%AD%97%E5%8C%96%E9%A1%B9%E7%9B%AE/%E5%85%AC%E5%85%8D%E5%85%AC%E7%BA%B3%E7%B3%BB%E7%BB%9F/Java_Model/ctbc-ui/node_modules/unplugin-auto-import/dist/vite.mjs";
import Components from "file:///D:/Desktop/%E7%94%B5%E4%BF%A1%E5%B7%A5%E4%BD%9C%E6%96%87%E6%A1%A3/2026%E5%B9%B4%E6%95%B0%E5%AD%97%E5%8C%96%E9%A1%B9%E7%9B%AE/%E5%85%AC%E5%85%8D%E5%85%AC%E7%BA%B3%E7%B3%BB%E7%BB%9F/Java_Model/ctbc-ui/node_modules/unplugin-vue-components/dist/vite.js";
import { AntDesignVueResolver } from "file:///D:/Desktop/%E7%94%B5%E4%BF%A1%E5%B7%A5%E4%BD%9C%E6%96%87%E6%A1%A3/2026%E5%B9%B4%E6%95%B0%E5%AD%97%E5%8C%96%E9%A1%B9%E7%9B%AE/%E5%85%AC%E5%85%8D%E5%85%AC%E7%BA%B3%E7%B3%BB%E7%BB%9F/Java_Model/ctbc-ui/node_modules/unplugin-vue-components/dist/resolvers.js";
import { visualizer } from "file:///D:/Desktop/%E7%94%B5%E4%BF%A1%E5%B7%A5%E4%BD%9C%E6%96%87%E6%A1%A3/2026%E5%B9%B4%E6%95%B0%E5%AD%97%E5%8C%96%E9%A1%B9%E7%9B%AE/%E5%85%AC%E5%85%8D%E5%85%AC%E7%BA%B3%E7%B3%BB%E7%BB%9F/Java_Model/ctbc-ui/node_modules/rollup-plugin-visualizer/dist/plugin/index.js";
function getPlugins(isProd) {
  const plugins = [
    vue(),
    vueJsx(),
    // 自动导入 Vue API 和 Vue Router API
    AutoImport({
      imports: [
        "vue",
        "vue-router",
        "pinia",
        "@vueuse/core",
        {
          "ant-design-vue/es": [
            "message",
            "notification",
            "Modal"
          ],
          "dayjs": [
            ["default", "dayjs"]
          ],
          "axios": [
            ["default", "axios"]
          ]
        }
      ],
      dts: "config/types/auto-imports.d.ts",
      // 生成类型定义文件到 config 目录
      eslintrc: {
        enabled: true,
        // 生成 .eslintrc-auto-import.json
        filepath: "config/eslint/.eslintrc-auto-import.json"
        // 生成到 config/eslint 目录
      }
    }),
    // 自动导入组件
    Components({
      resolvers: [
        AntDesignVueResolver({
          importStyle: false
          // css in js
        })
      ],
      dts: "config/types/components.d.ts",
      // 生成类型定义文件到 config 目录
      directoryAsNamespace: false,
      globalNamespaces: [],
      directives: true,
      include: [/\.vue$/, /\.vue\?vue/, /\.md$/],
      exclude: [/[\\/]node_modules[\\/]/, /[\\/]\.git[\\/]/, /[\\/]\.nuxt[\\/]/]
    })
  ];
  if (isProd) {
    plugins.push(
      visualizer({
        filename: "dist/stats.html",
        open: true,
        gzipSize: true,
        brotliSize: true
      })
    );
  }
  return plugins;
}

// config/vite/index.js
function getViteConfig({ mode }) {
  const isProd = mode === "prod";
  const cwd = process.cwd();
  const env = loadEnv2(mode, cwd);
  const dirname = cwd;
  return {
    plugins: getPlugins(isProd),
    resolve: {
      alias: getAlias(dirname)
    },
    base: env.VITE_BASE_URL,
    server: getServerConfig(mode, cwd),
    build: getBuildConfig(isProd),
    optimizeDeps: getOptimizeDeps(),
    define: getDefineConfig()
  };
}

// vite.config.mjs
var vite_config_default = defineConfig(getViteConfig);
export {
  vite_config_default as default
};
//# sourceMappingURL=data:application/json;base64,ewogICJ2ZXJzaW9uIjogMywKICAic291cmNlcyI6IFsidml0ZS5jb25maWcubWpzIiwgImNvbmZpZy92aXRlL2luZGV4LmpzIiwgImNvbmZpZy92aXRlL2Jhc2UuanMiLCAiY29uZmlnL3ZpdGUvYnVpbGQuanMiLCAiY29uZmlnL3ZpdGUvcGx1Z2lucy5qcyJdLAogICJzb3VyY2VzQ29udGVudCI6IFsiY29uc3QgX192aXRlX2luamVjdGVkX29yaWdpbmFsX2Rpcm5hbWUgPSBcIkQ6XFxcXERlc2t0b3BcXFxcXHU3NTM1XHU0RkUxXHU1REU1XHU0RjVDXHU2NTg3XHU2ODYzXFxcXDIwMjZcdTVFNzRcdTY1NzBcdTVCNTdcdTUzMTZcdTk4NzlcdTc2RUVcXFxcXHU1MTZDXHU1MTREXHU1MTZDXHU3RUIzXHU3Q0ZCXHU3RURGXFxcXEphdmFfTW9kZWxcXFxcY3RiYy11aVwiO2NvbnN0IF9fdml0ZV9pbmplY3RlZF9vcmlnaW5hbF9maWxlbmFtZSA9IFwiRDpcXFxcRGVza3RvcFxcXFxcdTc1MzVcdTRGRTFcdTVERTVcdTRGNUNcdTY1ODdcdTY4NjNcXFxcMjAyNlx1NUU3NFx1NjU3MFx1NUI1N1x1NTMxNlx1OTg3OVx1NzZFRVxcXFxcdTUxNkNcdTUxNERcdTUxNkNcdTdFQjNcdTdDRkJcdTdFREZcXFxcSmF2YV9Nb2RlbFxcXFxjdGJjLXVpXFxcXHZpdGUuY29uZmlnLm1qc1wiO2NvbnN0IF9fdml0ZV9pbmplY3RlZF9vcmlnaW5hbF9pbXBvcnRfbWV0YV91cmwgPSBcImZpbGU6Ly8vRDovRGVza3RvcC8lRTclOTQlQjUlRTQlQkYlQTElRTUlQjclQTUlRTQlQkQlOUMlRTYlOTYlODclRTYlQTElQTMvMjAyNiVFNSVCOSVCNCVFNiU5NSVCMCVFNSVBRCU5NyVFNSU4QyU5NiVFOSVBMSVCOSVFNyU5QiVBRS8lRTUlODUlQUMlRTUlODUlOEQlRTUlODUlQUMlRTclQkElQjMlRTclQjMlQkIlRTclQkIlOUYvSmF2YV9Nb2RlbC9jdGJjLXVpL3ZpdGUuY29uZmlnLm1qc1wiOy8qKlxyXG4gKiBWaXRlIFx1NEUzQlx1OTE0RFx1N0Y2RVx1NjU4N1x1NEVGNlxyXG4gKiBcdTkxNERcdTdGNkVcdTVERjJcdTZBMjFcdTU3NTdcdTUzMTZcdUZGMENcdThCRTZcdTg5QzEgY29uZmlnL3ZpdGUgXHU3NkVFXHU1RjU1XHJcbiAqL1xyXG5pbXBvcnQgeyBkZWZpbmVDb25maWcgfSBmcm9tICd2aXRlJztcclxuaW1wb3J0IHsgZ2V0Vml0ZUNvbmZpZyB9IGZyb20gJy4vY29uZmlnL3ZpdGUvaW5kZXguanMnO1xyXG5cclxuZXhwb3J0IGRlZmF1bHQgZGVmaW5lQ29uZmlnKGdldFZpdGVDb25maWcpO1xyXG4iLCAiY29uc3QgX192aXRlX2luamVjdGVkX29yaWdpbmFsX2Rpcm5hbWUgPSBcIkQ6XFxcXERlc2t0b3BcXFxcXHU3NTM1XHU0RkUxXHU1REU1XHU0RjVDXHU2NTg3XHU2ODYzXFxcXDIwMjZcdTVFNzRcdTY1NzBcdTVCNTdcdTUzMTZcdTk4NzlcdTc2RUVcXFxcXHU1MTZDXHU1MTREXHU1MTZDXHU3RUIzXHU3Q0ZCXHU3RURGXFxcXEphdmFfTW9kZWxcXFxcY3RiYy11aVxcXFxjb25maWdcXFxcdml0ZVwiO2NvbnN0IF9fdml0ZV9pbmplY3RlZF9vcmlnaW5hbF9maWxlbmFtZSA9IFwiRDpcXFxcRGVza3RvcFxcXFxcdTc1MzVcdTRGRTFcdTVERTVcdTRGNUNcdTY1ODdcdTY4NjNcXFxcMjAyNlx1NUU3NFx1NjU3MFx1NUI1N1x1NTMxNlx1OTg3OVx1NzZFRVxcXFxcdTUxNkNcdTUxNERcdTUxNkNcdTdFQjNcdTdDRkJcdTdFREZcXFxcSmF2YV9Nb2RlbFxcXFxjdGJjLXVpXFxcXGNvbmZpZ1xcXFx2aXRlXFxcXGluZGV4LmpzXCI7Y29uc3QgX192aXRlX2luamVjdGVkX29yaWdpbmFsX2ltcG9ydF9tZXRhX3VybCA9IFwiZmlsZTovLy9EOi9EZXNrdG9wLyVFNyU5NCVCNSVFNCVCRiVBMSVFNSVCNyVBNSVFNCVCRCU5QyVFNiU5NiU4NyVFNiVBMSVBMy8yMDI2JUU1JUI5JUI0JUU2JTk1JUIwJUU1JUFEJTk3JUU1JThDJTk2JUU5JUExJUI5JUU3JTlCJUFFLyVFNSU4NSVBQyVFNSU4NSU4RCVFNSU4NSVBQyVFNyVCQSVCMyVFNyVCMyVCQiVFNyVCQiU5Ri9KYXZhX01vZGVsL2N0YmMtdWkvY29uZmlnL3ZpdGUvaW5kZXguanNcIjsvKipcclxuICogVml0ZSBcdTkxNERcdTdGNkVcdTUxNjVcdTUzRTNcclxuICovXHJcbmltcG9ydCB7IGxvYWRFbnYgfSBmcm9tICd2aXRlJztcclxuaW1wb3J0IHsgZ2V0QWxpYXMsIGdldFNlcnZlckNvbmZpZywgZ2V0RGVmaW5lQ29uZmlnLCBnZXRPcHRpbWl6ZURlcHMgfSBmcm9tICcuL2Jhc2UuanMnO1xyXG5pbXBvcnQgeyBnZXRCdWlsZENvbmZpZyB9IGZyb20gJy4vYnVpbGQuanMnO1xyXG5pbXBvcnQgeyBnZXRQbHVnaW5zIH0gZnJvbSAnLi9wbHVnaW5zLmpzJztcclxuXHJcbi8qKlxyXG4gKiBcdTgzQjdcdTUzRDZcdTVCOENcdTY1NzRcdTc2ODQgVml0ZSBcdTkxNERcdTdGNkVcclxuICovXHJcbmV4cG9ydCBmdW5jdGlvbiBnZXRWaXRlQ29uZmlnKHsgbW9kZSB9KSB7XHJcbiAgY29uc3QgaXNQcm9kID0gbW9kZSA9PT0gJ3Byb2QnO1xyXG4gIGNvbnN0IGN3ZCA9IHByb2Nlc3MuY3dkKCk7XHJcbiAgY29uc3QgZW52ID0gbG9hZEVudihtb2RlLCBjd2QpO1xyXG4gIGNvbnN0IGRpcm5hbWUgPSBjd2Q7XHJcbiAgXHJcbiAgcmV0dXJuIHtcclxuICAgIHBsdWdpbnM6IGdldFBsdWdpbnMoaXNQcm9kKSxcclxuICAgIHJlc29sdmU6IHtcclxuICAgICAgYWxpYXM6IGdldEFsaWFzKGRpcm5hbWUpXHJcbiAgICB9LFxyXG4gICAgYmFzZTogZW52LlZJVEVfQkFTRV9VUkwsXHJcbiAgICBzZXJ2ZXI6IGdldFNlcnZlckNvbmZpZyhtb2RlLCBjd2QpLFxyXG4gICAgYnVpbGQ6IGdldEJ1aWxkQ29uZmlnKGlzUHJvZCksXHJcbiAgICBvcHRpbWl6ZURlcHM6IGdldE9wdGltaXplRGVwcygpLFxyXG4gICAgZGVmaW5lOiBnZXREZWZpbmVDb25maWcoKSxcclxuICB9O1xyXG59IiwgImNvbnN0IF9fdml0ZV9pbmplY3RlZF9vcmlnaW5hbF9kaXJuYW1lID0gXCJEOlxcXFxEZXNrdG9wXFxcXFx1NzUzNVx1NEZFMVx1NURFNVx1NEY1Q1x1NjU4N1x1Njg2M1xcXFwyMDI2XHU1RTc0XHU2NTcwXHU1QjU3XHU1MzE2XHU5ODc5XHU3NkVFXFxcXFx1NTE2Q1x1NTE0RFx1NTE2Q1x1N0VCM1x1N0NGQlx1N0VERlxcXFxKYXZhX01vZGVsXFxcXGN0YmMtdWlcXFxcY29uZmlnXFxcXHZpdGVcIjtjb25zdCBfX3ZpdGVfaW5qZWN0ZWRfb3JpZ2luYWxfZmlsZW5hbWUgPSBcIkQ6XFxcXERlc2t0b3BcXFxcXHU3NTM1XHU0RkUxXHU1REU1XHU0RjVDXHU2NTg3XHU2ODYzXFxcXDIwMjZcdTVFNzRcdTY1NzBcdTVCNTdcdTUzMTZcdTk4NzlcdTc2RUVcXFxcXHU1MTZDXHU1MTREXHU1MTZDXHU3RUIzXHU3Q0ZCXHU3RURGXFxcXEphdmFfTW9kZWxcXFxcY3RiYy11aVxcXFxjb25maWdcXFxcdml0ZVxcXFxiYXNlLmpzXCI7Y29uc3QgX192aXRlX2luamVjdGVkX29yaWdpbmFsX2ltcG9ydF9tZXRhX3VybCA9IFwiZmlsZTovLy9EOi9EZXNrdG9wLyVFNyU5NCVCNSVFNCVCRiVBMSVFNSVCNyVBNSVFNCVCRCU5QyVFNiU5NiU4NyVFNiVBMSVBMy8yMDI2JUU1JUI5JUI0JUU2JTk1JUIwJUU1JUFEJTk3JUU1JThDJTk2JUU5JUExJUI5JUU3JTlCJUFFLyVFNSU4NSVBQyVFNSU4NSU4RCVFNSU4NSVBQyVFNyVCQSVCMyVFNyVCMyVCQiVFNyVCQiU5Ri9KYXZhX01vZGVsL2N0YmMtdWkvY29uZmlnL3ZpdGUvYmFzZS5qc1wiOy8qKlxyXG4gKiBWaXRlIFx1NTdGQVx1Nzg0MFx1OTE0RFx1N0Y2RVxyXG4gKi9cclxuaW1wb3J0IHBhdGggZnJvbSAncGF0aCc7XHJcbmltcG9ydCB7IGxvYWRFbnYgfSBmcm9tICd2aXRlJztcclxuXHJcbi8qKlxyXG4gKiBcdTgzQjdcdTUzRDZcdTUyMkJcdTU0MERcdTkxNERcdTdGNkVcclxuICovXHJcbmV4cG9ydCBmdW5jdGlvbiBnZXRBbGlhcyhkaXJuYW1lKSB7XHJcbiAgcmV0dXJuIHtcclxuICAgICdAJzogcGF0aC5yZXNvbHZlKGRpcm5hbWUsICdzcmMnKSxcclxuICAgICdAY29tcG9uZW50cyc6IHBhdGgucmVzb2x2ZShkaXJuYW1lLCAnc3JjL2NvbXBvbmVudHMnKSxcclxuICAgICdAdXRpbHMnOiBwYXRoLnJlc29sdmUoZGlybmFtZSwgJ3NyYy91dGlscycpLFxyXG4gICAgJ0BhcGknOiBwYXRoLnJlc29sdmUoZGlybmFtZSwgJ3NyYy9hcGknKSxcclxuICAgICdAdmlld3MnOiBwYXRoLnJlc29sdmUoZGlybmFtZSwgJ3NyYy92aWV3cycpLFxyXG4gICAgJ0BzdG9yZXMnOiBwYXRoLnJlc29sdmUoZGlybmFtZSwgJ3NyYy9zdG9yZXMnKSxcclxuICAgICdAYXNzZXRzJzogcGF0aC5yZXNvbHZlKGRpcm5hbWUsICdzcmMvYXNzZXRzJyksXHJcbiAgICAnQHN0eWxlJzogcGF0aC5yZXNvbHZlKGRpcm5hbWUsICdzcmMvc3R5bGUnKVxyXG4gIH07XHJcbn1cclxuXHJcbi8qKlxyXG4gKiBcdTgzQjdcdTUzRDZcdTY3MERcdTUyQTFcdTU2NjhcdTkxNERcdTdGNkVcclxuICovXHJcbmV4cG9ydCBmdW5jdGlvbiBnZXRTZXJ2ZXJDb25maWcobW9kZSwgY3dkKSB7XHJcbiAgY29uc3QgZW52ID0gbG9hZEVudihtb2RlLCBjd2QpO1xyXG4gIFxyXG4gIHJldHVybiB7XHJcbiAgICBob3N0OiAnMC4wLjAuMCcsXHJcbiAgICBwb3J0OiBwYXJzZUludChlbnYuVklURV9QT1JUIHx8IDMwMDApLFxyXG4gICAgb3BlbjogdHJ1ZSxcclxuICAgIHByb3h5OiB7XHJcbiAgICAgICcvZGV2LWFwaSc6IHtcclxuICAgICAgICB0YXJnZXQ6ICdodHRwOi8vbG9jYWxob3N0OjgwODAnLFxyXG4gICAgICAgIGNoYW5nZU9yaWdpbjogdHJ1ZSxcclxuICAgICAgICByZXdyaXRlOiAocGF0aCkgPT4gcGF0aC5yZXBsYWNlKC9eXFwvZGV2LWFwaS8sICcnKSxcclxuICAgICAgICB0aW1lb3V0OiAzMDAwMCxcclxuICAgICAgICB3czogdHJ1ZSxcclxuICAgICAgICByZXRyeTogMCxcclxuICAgICAgICBjb25maWd1cmU6IChwcm94eSwgb3B0aW9ucykgPT4ge1xyXG4gICAgICAgICAgcHJveHkub24oJ2Vycm9yJywgKGVycikgPT4ge1xyXG4gICAgICAgICAgICBjb25zb2xlLmxvZygnXHU0RUUzXHU3NDA2XHU5NTE5XHU4QkVGJywgZXJyKTtcclxuICAgICAgICAgIH0pO1xyXG4gICAgICAgICAgcHJveHkub24oJ3Byb3h5UmVxJywgKHByb3h5UmVxLCByZXEpID0+IHtcclxuICAgICAgICAgICAgLy8gXHU0RkVFXHU2NTM5XHU4QkY3XHU2QzQyXHU1OTM0XHVGRjBDXHU3OTgxXHU3NTI4XHU3RjEzXHU1QjU4XHJcbiAgICAgICAgICAgIHByb3h5UmVxLnNldEhlYWRlcignQ2FjaGUtQ29udHJvbCcsICduby1jYWNoZSwgbm8tc3RvcmUsIG11c3QtcmV2YWxpZGF0ZScpO1xyXG4gICAgICAgICAgICBwcm94eVJlcS5zZXRIZWFkZXIoJ1ByYWdtYScsICduby1jYWNoZScpO1xyXG4gICAgICAgICAgICBwcm94eVJlcS5zZXRIZWFkZXIoJ0V4cGlyZXMnLCAnMCcpO1xyXG4gICAgICAgICAgfSk7XHJcbiAgICAgICAgICBwcm94eS5vbigncHJveHlSZXMnLCAocHJveHlSZXMsIHJlcSwgcmVzKSA9PiB7XHJcbiAgICAgICAgICAgIC8vIFx1NEZFRVx1NjUzOVx1NTRDRFx1NUU5NFx1NTkzNFx1RkYwQ1x1Nzk4MVx1NzUyOFx1N0YxM1x1NUI1OFxyXG4gICAgICAgICAgICBwcm94eVJlcy5oZWFkZXJzWydjYWNoZS1jb250cm9sJ10gPSAnbm8tY2FjaGUsIG5vLXN0b3JlLCBtdXN0LXJldmFsaWRhdGUnO1xyXG4gICAgICAgICAgICBwcm94eVJlcy5oZWFkZXJzWydwcmFnbWEnXSA9ICduby1jYWNoZSc7XHJcbiAgICAgICAgICAgIHByb3h5UmVzLmhlYWRlcnNbJ2V4cGlyZXMnXSA9ICcwJztcclxuICAgICAgICAgIH0pO1xyXG4gICAgICAgIH1cclxuICAgICAgfSxcclxuICAgIH0sXHJcbiAgfTtcclxufVxyXG5cclxuLyoqXHJcbiAqIFx1ODNCN1x1NTNENlx1NTE2OFx1NUM0MFx1NUUzOFx1OTFDRlx1NUI5QVx1NEU0OVxyXG4gKi9cclxuZXhwb3J0IGZ1bmN0aW9uIGdldERlZmluZUNvbmZpZygpIHtcclxuICByZXR1cm4ge1xyXG4gICAgX19WVUVfUFJPRF9ERVZUT09MU19fOiBmYWxzZSxcclxuICAgIF9fVlVFX09QVElPTlNfQVBJX186IHRydWUsXHJcbiAgICBfX1ZVRV9QUk9EX0hZRFJBVElPTl9NSVNNQVRDSF9ERVRBSUxTX186IGZhbHNlXHJcbiAgfTtcclxufVxyXG5cclxuLyoqXHJcbiAqIFx1ODNCN1x1NTNENlx1NEY5RFx1OEQ1Nlx1NEYxOFx1NTMxNlx1OTE0RFx1N0Y2RVxyXG4gKi9cclxuZXhwb3J0IGZ1bmN0aW9uIGdldE9wdGltaXplRGVwcygpIHtcclxuICByZXR1cm4ge1xyXG4gICAgaW5jbHVkZTogW1xyXG4gICAgICAndnVlJyxcclxuICAgICAgJ3Z1ZS1yb3V0ZXInLFxyXG4gICAgICAncGluaWEnLFxyXG4gICAgICAnZGF5anMnLFxyXG4gICAgICAnYXhpb3MnLFxyXG4gICAgICAnanMtY29va2llJyxcclxuICAgICAgJ25wcm9ncmVzcydcclxuICAgIF0sXHJcbiAgICBleGNsdWRlOiBbXHJcbiAgICAgICdAd2FuZ2VkaXRvci9lZGl0b3InLFxyXG4gICAgICAnQHdhbmdlZGl0b3IvZWRpdG9yLWZvci12dWUnLFxyXG4gICAgICAnQGZvcm0tY3JlYXRlL2FudC1kZXNpZ24tdnVlJyxcclxuICAgICAgJ0Bmb3JtLWNyZWF0ZS9hbnRkLWRlc2lnbmVyJyxcclxuICAgICAgJ2FudC1kZXNpZ24tdnVlJyxcclxuICAgICAgJ0BhbnQtZGVzaWduL2ljb25zLXZ1ZSdcclxuICAgIF1cclxuICB9O1xyXG59IiwgImNvbnN0IF9fdml0ZV9pbmplY3RlZF9vcmlnaW5hbF9kaXJuYW1lID0gXCJEOlxcXFxEZXNrdG9wXFxcXFx1NzUzNVx1NEZFMVx1NURFNVx1NEY1Q1x1NjU4N1x1Njg2M1xcXFwyMDI2XHU1RTc0XHU2NTcwXHU1QjU3XHU1MzE2XHU5ODc5XHU3NkVFXFxcXFx1NTE2Q1x1NTE0RFx1NTE2Q1x1N0VCM1x1N0NGQlx1N0VERlxcXFxKYXZhX01vZGVsXFxcXGN0YmMtdWlcXFxcY29uZmlnXFxcXHZpdGVcIjtjb25zdCBfX3ZpdGVfaW5qZWN0ZWRfb3JpZ2luYWxfZmlsZW5hbWUgPSBcIkQ6XFxcXERlc2t0b3BcXFxcXHU3NTM1XHU0RkUxXHU1REU1XHU0RjVDXHU2NTg3XHU2ODYzXFxcXDIwMjZcdTVFNzRcdTY1NzBcdTVCNTdcdTUzMTZcdTk4NzlcdTc2RUVcXFxcXHU1MTZDXHU1MTREXHU1MTZDXHU3RUIzXHU3Q0ZCXHU3RURGXFxcXEphdmFfTW9kZWxcXFxcY3RiYy11aVxcXFxjb25maWdcXFxcdml0ZVxcXFxidWlsZC5qc1wiO2NvbnN0IF9fdml0ZV9pbmplY3RlZF9vcmlnaW5hbF9pbXBvcnRfbWV0YV91cmwgPSBcImZpbGU6Ly8vRDovRGVza3RvcC8lRTclOTQlQjUlRTQlQkYlQTElRTUlQjclQTUlRTQlQkQlOUMlRTYlOTYlODclRTYlQTElQTMvMjAyNiVFNSVCOSVCNCVFNiU5NSVCMCVFNSVBRCU5NyVFNSU4QyU5NiVFOSVBMSVCOSVFNyU5QiVBRS8lRTUlODUlQUMlRTUlODUlOEQlRTUlODUlQUMlRTclQkElQjMlRTclQjMlQkIlRTclQkIlOUYvSmF2YV9Nb2RlbC9jdGJjLXVpL2NvbmZpZy92aXRlL2J1aWxkLmpzXCI7LyoqXHJcbiAqIFZpdGUgXHU2MjUzXHU1MzA1XHU5MTREXHU3RjZFXHJcbiAqL1xyXG5cclxuLyoqXHJcbiAqIFx1ODNCN1x1NTNENlx1NjI1M1x1NTMwNVx1NTdGQVx1Nzg0MFx1OTE0RFx1N0Y2RVxyXG4gKi9cclxuZXhwb3J0IGZ1bmN0aW9uIGdldEJ1aWxkQmFzZShpc1Byb2QpIHtcclxuICByZXR1cm4ge1xyXG4gICAgdGFyZ2V0OiAnZXMyMDE1JyxcclxuICAgIG91dERpcjogJ2Rpc3QnLFxyXG4gICAgZW1wdHlPdXREaXI6IHRydWUsXHJcbiAgICBzb3VyY2VtYXA6IGlzUHJvZCA/IGZhbHNlIDogJ2lubGluZScsXHJcbiAgICBjaHVua1NpemVXYXJuaW5nTGltaXQ6IDE1MDAsXHJcbiAgICBjc3NDb2RlU3BsaXQ6IHRydWUsXHJcbiAgICBjc3NNaW5pZnk6IGlzUHJvZCxcclxuICAgIGFzc2V0c0lubGluZUxpbWl0OiA0MDk2LFxyXG4gICAgcmVwb3J0Q29tcHJlc3NlZFNpemU6IGZhbHNlXHJcbiAgfTtcclxufVxyXG5cclxuLyoqXHJcbiAqIFx1ODNCN1x1NTNENlx1NTM4Qlx1N0YyOVx1OTE0RFx1N0Y2RVxyXG4gKi9cclxuZXhwb3J0IGZ1bmN0aW9uIGdldFRlcnNlck9wdGlvbnMoaXNQcm9kKSB7XHJcbiAgaWYgKCFpc1Byb2QpIHJldHVybiB1bmRlZmluZWQ7XHJcbiAgXHJcbiAgcmV0dXJuIHtcclxuICAgIGNvbXByZXNzOiB7XHJcbiAgICAgIGRyb3BfY29uc29sZTogZmFsc2UsIC8vIFx1Nzk4MVx1NzUyOFx1NTE2OFx1NUM0MFx1NzlGQlx1OTY2NFx1RkYwQ1x1NjUzOVx1NEUzQVx1NEY3Rlx1NzUyOHB1cmVfZnVuY3NcdTdDQkVcdTc4NkVcdTYzQTdcdTUyMzZcclxuICAgICAgZHJvcF9kZWJ1Z2dlcjogdHJ1ZSxcclxuICAgICAgLy8gXHU1M0VBXHU3OUZCXHU5NjY0XHU5NzVFXHU5NTE5XHU4QkVGXHU3QzdCXHU1NzhCXHU3Njg0Y29uc29sZVx1RkYwQ1x1NEZERFx1NzU1OWNvbnNvbGUuZXJyb3JcdTc1MjhcdTRFOEVcdTc1MUZcdTRFQTdcdTczQUZcdTU4ODNcdTk1MTlcdThCRUZcdTVDNTVcdTc5M0FcclxuICAgICAgcHVyZV9mdW5jczogW1xyXG4gICAgICAgICdjb25zb2xlLmxvZycsICdjb25zb2xlLmluZm8nLCAnY29uc29sZS5kZWJ1ZycsICdjb25zb2xlLnRyYWNlJyxcclxuICAgICAgICAnY29uc29sZS53YXJuJywgJ2NvbnNvbGUuYXNzZXJ0JywgJ2NvbnNvbGUuZGlyJyxcclxuICAgICAgICAnY29uc29sZS5kaXJ4bWwnLCAnY29uc29sZS5ncm91cCcsICdjb25zb2xlLmdyb3VwQ29sbGFwc2VkJyxcclxuICAgICAgICAnY29uc29sZS5ncm91cEVuZCcsICdjb25zb2xlLnRhYmxlJywgJ2NvbnNvbGUudGltZScsICdjb25zb2xlLnRpbWVFbmQnLFxyXG4gICAgICAgICdjb25zb2xlLnRpbWVMb2cnLCAnY29uc29sZS50aW1lU3RhbXAnLCAnY29uc29sZS5wcm9maWxlJyxcclxuICAgICAgICAnY29uc29sZS5wcm9maWxlRW5kJywgJ2NvbnNvbGUuY291bnQnLCAnY29uc29sZS5jb3VudFJlc2V0JyxcclxuICAgICAgICAnY29uc29sZS5tZW1vcnknXHJcbiAgICAgIF0sXHJcbiAgICAgIHBhc3NlczogMixcclxuICAgIH0sXHJcbiAgICBmb3JtYXQ6IHtcclxuICAgICAgY29tbWVudHM6IGZhbHNlLFxyXG4gICAgfVxyXG4gIH07XHJcbn1cclxuXHJcbi8qKlxyXG4gKiBcdTgzQjdcdTUzRDZcdTk3NTlcdTYwMDFcdThENDRcdTZFOTBcdTY1ODdcdTRFRjZcdTU0MERcdTkxNERcdTdGNkVcclxuICovXHJcbmV4cG9ydCBmdW5jdGlvbiBnZXRBc3NldEZpbGVOYW1lcyhhc3NldEluZm8pIHtcclxuICBjb25zdCBpbmZvID0gYXNzZXRJbmZvLm5hbWUuc3BsaXQoJy4nKTtcclxuICBsZXQgZXh0VHlwZSA9IGluZm9baW5mby5sZW5ndGggLSAxXTtcclxuICBcclxuICBpZiAoL1xcLihwbmd8anBlP2d8Z2lmfHN2Z3x3ZWJwfGljbykkL2kudGVzdChhc3NldEluZm8ubmFtZSkpIHtcclxuICAgIGV4dFR5cGUgPSAnaW1nJztcclxuICB9IGVsc2UgaWYgKC9cXC4od29mZjI/fGVvdHx0dGZ8b3RmKSQvaS50ZXN0KGFzc2V0SW5mby5uYW1lKSkge1xyXG4gICAgZXh0VHlwZSA9ICdmb250cyc7XHJcbiAgfSBlbHNlIGlmICgvXFwuY3NzJC9pLnRlc3QoYXNzZXRJbmZvLm5hbWUpKSB7XHJcbiAgICBleHRUeXBlID0gJ2Nzcyc7XHJcbiAgfVxyXG4gIFxyXG4gIHJldHVybiBgJHtleHRUeXBlfS9bbmFtZV0tW2hhc2hdLltleHRdYDtcclxufVxyXG5cclxuLyoqXHJcbiAqIFx1NjI0Qlx1NTJBOFx1NEVFM1x1NzgwMVx1NTIwNlx1NTI3Mlx1N0I1Nlx1NzU2NSAtIFx1NEYxOFx1NTMxNlx1NzI0OFxyXG4gKi9cclxuZXhwb3J0IGZ1bmN0aW9uIG1hbnVhbENodW5rcyhpZCkge1xyXG4gIC8vIFx1NUMwNiBub2RlX21vZHVsZXMgXHU0RTJEXHU3Njg0XHU0RUUzXHU3ODAxXHU1MjA2XHU1MjcyXHU0RTNBXHU0RTBEXHU1NDBDXHU3Njg0IGNodW5rXHJcbiAgaWYgKGlkLmluY2x1ZGVzKCdub2RlX21vZHVsZXMnKSkge1xyXG4gICAgLy8gXHU4M0I3XHU1M0Q2XHU1MzA1XHU1NDBEXHJcbiAgICBjb25zdCBwYWNrYWdlTmFtZSA9IGlkLnNwbGl0KCdub2RlX21vZHVsZXMvJylbMV0uc3BsaXQoJy8nKVswXS5yZXBsYWNlKCdAJywgJycpO1xyXG4gICAgXHJcbiAgICAvLyBcdTY4MzhcdTVGQzNWdWVcdTc1MUZcdTYwMDFcdTVFOTMgLSBcdTY3MDBcdTlBRDhcdTRGMThcdTUxNDhcdTdFQTdcdUZGMENcdTc4NkVcdTRGRERcdTU3RkFcdTc4NDBcdTY4NDZcdTY3QjZcdTcyRUNcdTdBQ0JcclxuICAgIGlmIChpZC5pbmNsdWRlcygndnVlLycpICYmICFpZC5pbmNsdWRlcygndnVlLXJvdXRlcicpICYmICFpZC5pbmNsdWRlcygndnVlLXJlcXVlc3QnKSAmJiAhaWQuaW5jbHVkZXMoJ2FudC1kZXNpZ24tdnVlJykgJiYgIWlkLmluY2x1ZGVzKCdAYW50LWRlc2lnbicpKSB7XHJcbiAgICAgIHJldHVybiAndnVlLWNvcmUnO1xyXG4gICAgfVxyXG4gICAgaWYgKGlkLmluY2x1ZGVzKCd2dWUtcm91dGVyJykpIHtcclxuICAgICAgcmV0dXJuICd2dWUtcm91dGVyJztcclxuICAgIH1cclxuICAgIGlmIChpZC5pbmNsdWRlcygncGluaWEnKSkge1xyXG4gICAgICByZXR1cm4gJ3BpbmlhJztcclxuICAgIH1cclxuICAgIGlmIChpZC5pbmNsdWRlcygnQHZ1ZXVzZScpKSB7XHJcbiAgICAgIHJldHVybiAndnVldXNlJztcclxuICAgIH1cclxuICAgIFxyXG4gICAgLy8gQW50IERlc2lnbiBWdWUgXHU2NTNFXHU1NzI4XHU0RTAwXHU0RTJBIGNodW5rIFx1NEUyRFx1RkYwQ1x1OTA3Rlx1NTE0RFx1NkEyMVx1NTc1N1x1NEU0Qlx1OTVGNFx1NzZGOFx1NEU5Mlx1NUYxNVx1NzUyOFx1NUJGQ1x1ODFGNFx1OEZEMFx1ODg0Q1x1NjVGNlx1NjJBNVx1OTUxOVxyXG4gICAgaWYgKGlkLmluY2x1ZGVzKCdhbnQtZGVzaWduLXZ1ZScpKSB7XHJcbiAgICAgIHJldHVybiAnYW50LWRlc2lnbi12dWUnO1xyXG4gICAgfVxyXG4gICAgaWYgKGlkLmluY2x1ZGVzKCdAYW50LWRlc2lnbi9pY29ucy12dWUnKSkge1xyXG4gICAgICByZXR1cm4gJ2FudGQtaWNvbnMnO1xyXG4gICAgfVxyXG4gICAgXHJcbiAgICAvLyBcdTg4NjhcdTUzNTVcdThCQkVcdThCQTFcdTU2NjhcclxuICAgIGlmIChpZC5pbmNsdWRlcygnQGZvcm0tY3JlYXRlL2FudC1kZXNpZ24tdnVlJykpIHtcclxuICAgICAgcmV0dXJuICdmb3JtLWNyZWF0ZS1hbnRkJztcclxuICAgIH1cclxuICAgIGlmIChpZC5pbmNsdWRlcygnQGZvcm0tY3JlYXRlL2FudGQtZGVzaWduZXInKSkge1xyXG4gICAgICByZXR1cm4gJ2Zvcm0tZGVzaWduZXInO1xyXG4gICAgfVxyXG4gICAgaWYgKGlkLmluY2x1ZGVzKCdAZm9ybS1jcmVhdGUnKSkge1xyXG4gICAgICByZXR1cm4gJ2Zvcm0tY3JlYXRlLWNvcmUnO1xyXG4gICAgfVxyXG4gICAgXHJcbiAgICAvLyBcdTdGMTZcdThGOTFcdTU2NjhcdTc2RjhcdTUxNzNcclxuICAgIGlmIChpZC5pbmNsdWRlcygnQHdhbmdlZGl0b3IvZWRpdG9yLWZvci12dWUnKSkge1xyXG4gICAgICByZXR1cm4gJ3dhbmdlZGl0b3ItdnVlJztcclxuICAgIH1cclxuICAgIGlmIChpZC5pbmNsdWRlcygnQHdhbmdlZGl0b3InKSkge1xyXG4gICAgICByZXR1cm4gJ3dhbmdlZGl0b3ItY29yZSc7XHJcbiAgICB9XHJcbiAgICBpZiAoaWQuaW5jbHVkZXMoJ2hpZ2hsaWdodC5qcycpKSB7XHJcbiAgICAgIHJldHVybiAnaGlnaGxpZ2h0JztcclxuICAgIH1cclxuICAgIGlmIChpZC5pbmNsdWRlcygndnVlMy1oaWdobGlnaHRqcycpKSB7XHJcbiAgICAgIHJldHVybiAndnVlLWhpZ2hsaWdodCc7XHJcbiAgICB9XHJcbiAgICBcclxuICAgIC8vIFx1NTZGRVx1ODg2OFx1NUU5M1xyXG4gICAgaWYgKGlkLmluY2x1ZGVzKCdlY2hhcnRzJykpIHtcclxuICAgICAgaWYgKGlkLmluY2x1ZGVzKCdlY2hhcnRzL2NvcmUnKSkge1xyXG4gICAgICAgIHJldHVybiAnZWNoYXJ0cy1jb3JlJztcclxuICAgICAgfVxyXG4gICAgICBpZiAoaWQuaW5jbHVkZXMoJ2VjaGFydHMvY2hhcnRzJykpIHtcclxuICAgICAgICByZXR1cm4gJ2VjaGFydHMtY2hhcnRzJztcclxuICAgICAgfVxyXG4gICAgICBpZiAoaWQuaW5jbHVkZXMoJ2VjaGFydHMvY29tcG9uZW50cycpKSB7XHJcbiAgICAgICAgcmV0dXJuICdlY2hhcnRzLWNvbXBvbmVudHMnO1xyXG4gICAgICB9XHJcbiAgICAgIGlmIChpZC5pbmNsdWRlcygnZWNoYXJ0cy9yZW5kZXJlcnMnKSkge1xyXG4gICAgICAgIHJldHVybiAnZWNoYXJ0cy1yZW5kZXJlcnMnO1xyXG4gICAgICB9XHJcbiAgICAgIHJldHVybiAnZWNoYXJ0cy1iYXNlJztcclxuICAgIH1cclxuICAgIFxyXG4gICAgLy8gXHU1REU1XHU1MTc3XHU1RTkzXHJcbiAgICBpZiAoaWQuaW5jbHVkZXMoJ2F4aW9zJykpIHtcclxuICAgICAgcmV0dXJuICdheGlvcyc7XHJcbiAgICB9XHJcbiAgICBpZiAoaWQuaW5jbHVkZXMoJ2RheWpzJykpIHtcclxuICAgICAgcmV0dXJuICdkYXlqcyc7XHJcbiAgICB9XHJcbiAgICBpZiAoaWQuaW5jbHVkZXMoJ2pzLWNvb2tpZScpKSB7XHJcbiAgICAgIHJldHVybiAnanMtY29va2llJztcclxuICAgIH1cclxuICAgIGlmIChpZC5pbmNsdWRlcygnbnByb2dyZXNzJykpIHtcclxuICAgICAgcmV0dXJuICducHJvZ3Jlc3MnO1xyXG4gICAgfVxyXG4gICAgXHJcbiAgICAvLyBcdTUxNzZcdTRFRDZcdTVERTVcdTUxNzdcdTVFOTNcclxuICAgIGlmIChpZC5pbmNsdWRlcygnc29ydGFibGVqcycpKSB7XHJcbiAgICAgIHJldHVybiAnc29ydGFibGUnO1xyXG4gICAgfVxyXG4gICAgaWYgKGlkLmluY2x1ZGVzKCdmaWxlLXNhdmVyJykpIHtcclxuICAgICAgcmV0dXJuICdmaWxlLXNhdmVyJztcclxuICAgIH1cclxuICAgIGlmIChpZC5pbmNsdWRlcygncGFydGljbGVzLmpzJykpIHtcclxuICAgICAgcmV0dXJuICdwYXJ0aWNsZXMnO1xyXG4gICAgfVxyXG4gICAgaWYgKGlkLmluY2x1ZGVzKCdAdnVldXNlJykpIHtcclxuICAgICAgcmV0dXJuICd2dWV1c2UnO1xyXG4gICAgfVxyXG4gICAgaWYgKGlkLmluY2x1ZGVzKCd2dWUtcmVxdWVzdCcpKSB7XHJcbiAgICAgIHJldHVybiAndnVlLXJlcXVlc3QnO1xyXG4gICAgfVxyXG4gICAgXHJcbiAgICAvLyBwb2x5ZmlsbHNcclxuICAgIGlmIChpZC5pbmNsdWRlcygnY29yZS1qcycpKSB7XHJcbiAgICAgIHJldHVybiAncG9seWZpbGxzJztcclxuICAgIH1cclxuICAgIFxyXG4gICAgcmV0dXJuICd2ZW5kb3ItbWlzYyc7XHJcbiAgfVxyXG4gIFxyXG4gIC8vIFx1OTg3OVx1NzZFRVx1NTE4NVx1OTBFOFx1NEVFM1x1NzgwMVx1NTIwNlx1NTI3MiAtIFx1NEYxOFx1NTMxNlx1NzI0OFxyXG4gIGlmIChpZC5pbmNsdWRlcygnc3JjLycpKSB7XHJcbiAgICAvLyBcdTVFMDNcdTVDNDBcdTU0OENcdTY4MzhcdTVGQzNcdTdFQzRcdTRFRjYgLSBcdTRGMThcdTUxNDhcdTdFQTdcdTlBRDhcdUZGMENcdTUzNTVcdTcyRUNcdTYyNTNcdTUzMDVcclxuICAgIGlmIChpZC5pbmNsdWRlcygnc3JjL2xheW91dC8nKSkge1xyXG4gICAgICByZXR1cm4gJ2xheW91dCc7XHJcbiAgICB9XHJcbiAgICBpZiAoaWQuaW5jbHVkZXMoJ3NyYy9jb21wb25lbnRzL2xheW91dCcpKSB7XHJcbiAgICAgIHJldHVybiAnY29tcG9uZW50cy1sYXlvdXQnO1xyXG4gICAgfVxyXG4gICAgaWYgKGlkLmluY2x1ZGVzKCdzcmMvY29tcG9uZW50cy9jb21tb24nKSkge1xyXG4gICAgICByZXR1cm4gJ2NvbXBvbmVudHMtY29tbW9uJztcclxuICAgIH1cclxuICAgIGlmIChpZC5pbmNsdWRlcygnc3JjL2NvbXBvbmVudHMvJykpIHtcclxuICAgICAgcmV0dXJuICdjb21wb25lbnRzLW90aGVyJztcclxuICAgIH1cclxuICAgIFxyXG4gICAgLy8gXHU4REVGXHU3NTMxXHU3NkY4XHU1MTczIC0gXHU2MzA5XHU2QTIxXHU1NzU3XHU1MjA2XHU1MjcyXHJcbiAgICBpZiAoaWQuaW5jbHVkZXMoJ3NyYy9yb3V0ZXIvJykpIHtcclxuICAgICAgcmV0dXJuICdyb3V0ZXInO1xyXG4gICAgfVxyXG4gICAgXHJcbiAgICAvLyBcdTcyQjZcdTYwMDFcdTdCQTFcdTc0MDZcclxuICAgIGlmIChpZC5pbmNsdWRlcygnc3JjL3N0b3Jlcy8nKSkge1xyXG4gICAgICByZXR1cm4gJ3N0b3Jlcyc7XHJcbiAgICB9XHJcbiAgICBcclxuICAgIC8vIEFQSSBcdTYzMDlcdTRFMUFcdTUyQTFcdTZBMjFcdTU3NTdcdTUyMDZcdTUyNzJcclxuICAgIGlmIChpZC5pbmNsdWRlcygnc3JjL2FwaS9zeXN0ZW0vJykpIHtcclxuICAgICAgcmV0dXJuICdhcGktc3lzdGVtJztcclxuICAgIH1cclxuICAgIGlmIChpZC5pbmNsdWRlcygnc3JjL2FwaS9tb25pdG9yLycpKSB7XHJcbiAgICAgIHJldHVybiAnYXBpLW1vbml0b3InO1xyXG4gICAgfVxyXG4gICAgaWYgKGlkLmluY2x1ZGVzKCdzcmMvYXBpL3Rvb2wvJykpIHtcclxuICAgICAgcmV0dXJuICdhcGktdG9vbCc7XHJcbiAgICB9XHJcbiAgICBpZiAoaWQuaW5jbHVkZXMoJ3NyYy9hcGkvJykpIHtcclxuICAgICAgcmV0dXJuICdhcGktY29tbW9uJztcclxuICAgIH1cclxuICAgIFxyXG4gICAgLy8gXHU0RTFBXHU1MkExXHU5ODc1XHU5NzYyXHU2MzA5XHU2QTIxXHU1NzU3XHU1MjA2XHU1MjcyXHJcbiAgICBpZiAoaWQuaW5jbHVkZXMoJ3NyYy92aWV3cy9zeXN0ZW0vJykpIHtcclxuICAgICAgcmV0dXJuICd2aWV3cy1zeXN0ZW0nO1xyXG4gICAgfVxyXG4gICAgaWYgKGlkLmluY2x1ZGVzKCdzcmMvdmlld3MvbW9uaXRvci8nKSkge1xyXG4gICAgICByZXR1cm4gJ3ZpZXdzLW1vbml0b3InO1xyXG4gICAgfVxyXG4gICAgaWYgKGlkLmluY2x1ZGVzKCdzcmMvdmlld3MvdG9vbC8nKSkge1xyXG4gICAgICByZXR1cm4gJ3ZpZXdzLXRvb2wnO1xyXG4gICAgfVxyXG4gICAgaWYgKGlkLmluY2x1ZGVzKCdzcmMvdmlld3MvZnJvbnRlbmQvJykpIHtcclxuICAgICAgcmV0dXJuICd2aWV3cy1mcm9udGVuZCc7XHJcbiAgICB9XHJcbiAgICBpZiAoaWQuaW5jbHVkZXMoJ3NyYy92aWV3cy8nKSkge1xyXG4gICAgICByZXR1cm4gJ3ZpZXdzLWNvbW1vbic7XHJcbiAgICB9XHJcbiAgICBcclxuICAgIC8vIFx1NURFNVx1NTE3N1x1NTQ4Q1x1OTE0RFx1N0Y2RVxyXG4gICAgaWYgKGlkLmluY2x1ZGVzKCdzcmMvdXRpbHMvJykpIHtcclxuICAgICAgcmV0dXJuICd1dGlscyc7XHJcbiAgICB9XHJcbiAgICBpZiAoaWQuaW5jbHVkZXMoJ3NyYy9kaXJlY3RpdmUvJykpIHtcclxuICAgICAgcmV0dXJuICdkaXJlY3RpdmUnO1xyXG4gICAgfVxyXG4gICAgaWYgKGlkLmluY2x1ZGVzKCdzcmMvY29uZmlnLycpKSB7XHJcbiAgICAgIHJldHVybiAnY29uZmlnJztcclxuICAgIH1cclxuICAgIGlmIChpZC5pbmNsdWRlcygnc3JjL3BsdWdpbnMvJykpIHtcclxuICAgICAgcmV0dXJuICdwbHVnaW5zJztcclxuICAgIH1cclxuICAgIFxyXG4gICAgLy8gXHU5NzU5XHU2MDAxXHU4RDQ0XHU2RTkwXHJcbiAgICBpZiAoaWQuaW5jbHVkZXMoJ3NyYy9hc3NldHMvJykpIHtcclxuICAgICAgcmV0dXJuICdhc3NldHMnO1xyXG4gICAgfVxyXG4gIH1cclxufVxyXG5cclxuLyoqXHJcbiAqIFx1ODNCN1x1NTNENlx1NUI4Q1x1NjU3NFx1NzY4NFx1NjI1M1x1NTMwNVx1OTE0RFx1N0Y2RVxyXG4gKi9cclxuZXhwb3J0IGZ1bmN0aW9uIGdldEJ1aWxkQ29uZmlnKGlzUHJvZCkge1xyXG4gIGNvbnN0IGJhc2VDb25maWcgPSBnZXRCdWlsZEJhc2UoaXNQcm9kKTtcclxuICBcclxuICByZXR1cm4ge1xyXG4gICAgLi4uYmFzZUNvbmZpZyxcclxuICAgIG1pbmlmeTogaXNQcm9kID8gJ3RlcnNlcicgOiBmYWxzZSxcclxuICAgIHRlcnNlck9wdGlvbnM6IGdldFRlcnNlck9wdGlvbnMoaXNQcm9kKSxcclxuICAgIHJvbGx1cE9wdGlvbnM6IHtcclxuICAgICAgb3V0cHV0OiB7XHJcbiAgICAgICAgY2h1bmtGaWxlTmFtZXM6ICdqcy9bbmFtZV0tW2hhc2hdLmpzJyxcclxuICAgICAgICBlbnRyeUZpbGVOYW1lczogJ2pzL1tuYW1lXS1baGFzaF0uanMnLFxyXG4gICAgICAgIGFzc2V0RmlsZU5hbWVzOiBnZXRBc3NldEZpbGVOYW1lcyxcclxuICAgICAgICBtYW51YWxDaHVua3NcclxuICAgICAgfSxcclxuICAgICAgZXh0ZXJuYWw6IGlzUHJvZCA/IFtdIDogW10sXHJcbiAgICB9LFxyXG4gICAgb3B0aW1pemVEZXBzOiB7XHJcbiAgICAgIGluY2x1ZGU6IFtcclxuICAgICAgICAndnVlJyxcclxuICAgICAgICAndnVlLXJvdXRlcicsXHJcbiAgICAgICAgJ3BpbmlhJyxcclxuICAgICAgICAnZGF5anMnLFxyXG4gICAgICAgICdheGlvcycsXHJcbiAgICAgICAgJ2pzLWNvb2tpZScsXHJcbiAgICAgICAgJ25wcm9ncmVzcydcclxuICAgICAgXSxcclxuICAgICAgZXhjbHVkZTogW1xyXG4gICAgICAgICdAd2FuZ2VkaXRvci9lZGl0b3InLFxyXG4gICAgICAgICdAd2FuZ2VkaXRvci9lZGl0b3ItZm9yLXZ1ZScsXHJcbiAgICAgICAgJ0Bmb3JtLWNyZWF0ZS9hbnQtZGVzaWduLXZ1ZScsXHJcbiAgICAgICAgJ0Bmb3JtLWNyZWF0ZS9hbnRkLWRlc2lnbmVyJyxcclxuICAgICAgICAnYW50LWRlc2lnbi12dWUnLFxyXG4gICAgICAgICdAYW50LWRlc2lnbi9pY29ucy12dWUnXHJcbiAgICAgIF1cclxuICAgIH1cclxuICB9O1xyXG59XHJcbiIsICJjb25zdCBfX3ZpdGVfaW5qZWN0ZWRfb3JpZ2luYWxfZGlybmFtZSA9IFwiRDpcXFxcRGVza3RvcFxcXFxcdTc1MzVcdTRGRTFcdTVERTVcdTRGNUNcdTY1ODdcdTY4NjNcXFxcMjAyNlx1NUU3NFx1NjU3MFx1NUI1N1x1NTMxNlx1OTg3OVx1NzZFRVxcXFxcdTUxNkNcdTUxNERcdTUxNkNcdTdFQjNcdTdDRkJcdTdFREZcXFxcSmF2YV9Nb2RlbFxcXFxjdGJjLXVpXFxcXGNvbmZpZ1xcXFx2aXRlXCI7Y29uc3QgX192aXRlX2luamVjdGVkX29yaWdpbmFsX2ZpbGVuYW1lID0gXCJEOlxcXFxEZXNrdG9wXFxcXFx1NzUzNVx1NEZFMVx1NURFNVx1NEY1Q1x1NjU4N1x1Njg2M1xcXFwyMDI2XHU1RTc0XHU2NTcwXHU1QjU3XHU1MzE2XHU5ODc5XHU3NkVFXFxcXFx1NTE2Q1x1NTE0RFx1NTE2Q1x1N0VCM1x1N0NGQlx1N0VERlxcXFxKYXZhX01vZGVsXFxcXGN0YmMtdWlcXFxcY29uZmlnXFxcXHZpdGVcXFxccGx1Z2lucy5qc1wiO2NvbnN0IF9fdml0ZV9pbmplY3RlZF9vcmlnaW5hbF9pbXBvcnRfbWV0YV91cmwgPSBcImZpbGU6Ly8vRDovRGVza3RvcC8lRTclOTQlQjUlRTQlQkYlQTElRTUlQjclQTUlRTQlQkQlOUMlRTYlOTYlODclRTYlQTElQTMvMjAyNiVFNSVCOSVCNCVFNiU5NSVCMCVFNSVBRCU5NyVFNSU4QyU5NiVFOSVBMSVCOSVFNyU5QiVBRS8lRTUlODUlQUMlRTUlODUlOEQlRTUlODUlQUMlRTclQkElQjMlRTclQjMlQkIlRTclQkIlOUYvSmF2YV9Nb2RlbC9jdGJjLXVpL2NvbmZpZy92aXRlL3BsdWdpbnMuanNcIjsvKipcclxuICogVml0ZSBcdTYzRDJcdTRFRjZcdTkxNERcdTdGNkVcclxuICovXHJcbmltcG9ydCB2dWUgZnJvbSAnQHZpdGVqcy9wbHVnaW4tdnVlJztcclxuaW1wb3J0IHZ1ZUpzeCBmcm9tICdAdml0ZWpzL3BsdWdpbi12dWUtanN4JztcclxuaW1wb3J0IEF1dG9JbXBvcnQgZnJvbSAndW5wbHVnaW4tYXV0by1pbXBvcnQvdml0ZSc7XHJcbmltcG9ydCBDb21wb25lbnRzIGZyb20gJ3VucGx1Z2luLXZ1ZS1jb21wb25lbnRzL3ZpdGUnO1xyXG5pbXBvcnQgeyBBbnREZXNpZ25WdWVSZXNvbHZlciB9IGZyb20gJ3VucGx1Z2luLXZ1ZS1jb21wb25lbnRzL3Jlc29sdmVycyc7XHJcbmltcG9ydCB7IHZpc3VhbGl6ZXIgfSBmcm9tICdyb2xsdXAtcGx1Z2luLXZpc3VhbGl6ZXInO1xyXG5cclxuLyoqXHJcbiAqIFx1ODNCN1x1NTNENlx1NTdGQVx1Nzg0MFx1NjNEMlx1NEVGNlx1OTE0RFx1N0Y2RVxyXG4gKi9cclxuZXhwb3J0IGZ1bmN0aW9uIGdldFBsdWdpbnMoaXNQcm9kKSB7XHJcbiAgY29uc3QgcGx1Z2lucyA9IFtcclxuICAgIHZ1ZSgpLFxyXG4gICAgdnVlSnN4KCksXHJcbiAgICBcclxuICAgIC8vIFx1ODFFQVx1NTJBOFx1NUJGQ1x1NTE2NSBWdWUgQVBJIFx1NTQ4QyBWdWUgUm91dGVyIEFQSVxyXG4gICAgQXV0b0ltcG9ydCh7XHJcbiAgICAgIGltcG9ydHM6IFtcclxuICAgICAgICAndnVlJyxcclxuICAgICAgICAndnVlLXJvdXRlcicsXHJcbiAgICAgICAgJ3BpbmlhJyxcclxuICAgICAgICAnQHZ1ZXVzZS9jb3JlJyxcclxuICAgICAgICB7XHJcbiAgICAgICAgICAnYW50LWRlc2lnbi12dWUvZXMnOiBbXHJcbiAgICAgICAgICAgICdtZXNzYWdlJyxcclxuICAgICAgICAgICAgJ25vdGlmaWNhdGlvbicsXHJcbiAgICAgICAgICAgICdNb2RhbCcsXHJcbiAgICAgICAgICBdLFxyXG4gICAgICAgICAgJ2RheWpzJzogW1xyXG4gICAgICAgICAgICBbJ2RlZmF1bHQnLCAnZGF5anMnXVxyXG4gICAgICAgICAgXSxcclxuICAgICAgICAgICdheGlvcyc6IFtcclxuICAgICAgICAgICAgWydkZWZhdWx0JywgJ2F4aW9zJ11cclxuICAgICAgICAgIF0sXHJcbiAgICAgICAgfVxyXG4gICAgICBdLFxyXG4gICAgICBkdHM6ICdjb25maWcvdHlwZXMvYXV0by1pbXBvcnRzLmQudHMnLCAvLyBcdTc1MUZcdTYyMTBcdTdDN0JcdTU3OEJcdTVCOUFcdTRFNDlcdTY1ODdcdTRFRjZcdTUyMzAgY29uZmlnIFx1NzZFRVx1NUY1NVxyXG4gICAgICBlc2xpbnRyYzoge1xyXG4gICAgICAgIGVuYWJsZWQ6IHRydWUsIC8vIFx1NzUxRlx1NjIxMCAuZXNsaW50cmMtYXV0by1pbXBvcnQuanNvblxyXG4gICAgICAgIGZpbGVwYXRoOiAnY29uZmlnL2VzbGludC8uZXNsaW50cmMtYXV0by1pbXBvcnQuanNvbicsIC8vIFx1NzUxRlx1NjIxMFx1NTIzMCBjb25maWcvZXNsaW50IFx1NzZFRVx1NUY1NVxyXG4gICAgICB9LFxyXG4gICAgfSksXHJcbiAgICBcclxuICAgIC8vIFx1ODFFQVx1NTJBOFx1NUJGQ1x1NTE2NVx1N0VDNFx1NEVGNlxyXG4gICAgQ29tcG9uZW50cyh7XHJcbiAgICAgIHJlc29sdmVyczogW1xyXG4gICAgICAgIEFudERlc2lnblZ1ZVJlc29sdmVyKHtcclxuICAgICAgICAgIGltcG9ydFN0eWxlOiBmYWxzZSwgLy8gY3NzIGluIGpzXHJcbiAgICAgICAgfSksXHJcbiAgICAgIF0sXHJcbiAgICAgIGR0czogJ2NvbmZpZy90eXBlcy9jb21wb25lbnRzLmQudHMnLCAvLyBcdTc1MUZcdTYyMTBcdTdDN0JcdTU3OEJcdTVCOUFcdTRFNDlcdTY1ODdcdTRFRjZcdTUyMzAgY29uZmlnIFx1NzZFRVx1NUY1NVxyXG4gICAgICBkaXJlY3RvcnlBc05hbWVzcGFjZTogZmFsc2UsXHJcbiAgICAgIGdsb2JhbE5hbWVzcGFjZXM6IFtdLFxyXG4gICAgICBkaXJlY3RpdmVzOiB0cnVlLFxyXG4gICAgICBpbmNsdWRlOiBbL1xcLnZ1ZSQvLCAvXFwudnVlXFw/dnVlLywgL1xcLm1kJC9dLFxyXG4gICAgICBleGNsdWRlOiBbL1tcXFxcL11ub2RlX21vZHVsZXNbXFxcXC9dLywgL1tcXFxcL11cXC5naXRbXFxcXC9dLywgL1tcXFxcL11cXC5udXh0W1xcXFwvXS9dLFxyXG4gICAgfSksXHJcbiAgXTtcclxuICBcclxuICAvLyBcdTc1MUZcdTRFQTdcdTczQUZcdTU4ODNcdTZERkJcdTUyQTBcdTk4OURcdTU5MTZcdTc2ODRcdTYzRDJcdTRFRjZcclxuICBpZiAoaXNQcm9kKSB7XHJcbiAgICAvLyBcdTZERkJcdTUyQTBcdTYyNTNcdTUzMDVcdTUyMDZcdTY3OTBcdTYzRDJcdTRFRjZcclxuICAgIHBsdWdpbnMucHVzaChcclxuICAgICAgdmlzdWFsaXplcih7XHJcbiAgICAgICAgZmlsZW5hbWU6ICdkaXN0L3N0YXRzLmh0bWwnLFxyXG4gICAgICAgIG9wZW46IHRydWUsXHJcbiAgICAgICAgZ3ppcFNpemU6IHRydWUsXHJcbiAgICAgICAgYnJvdGxpU2l6ZTogdHJ1ZSxcclxuICAgICAgfSlcclxuICAgICk7XHJcbiAgfVxyXG4gIFxyXG4gIHJldHVybiBwbHVnaW5zO1xyXG59Il0sCiAgIm1hcHBpbmdzIjogIjtBQUlBLFNBQVMsb0JBQW9COzs7QUNEN0IsU0FBUyxXQUFBQSxnQkFBZTs7O0FDQXhCLE9BQU8sVUFBVTtBQUNqQixTQUFTLGVBQWU7QUFLakIsU0FBUyxTQUFTLFNBQVM7QUFDaEMsU0FBTztBQUFBLElBQ0wsS0FBSyxLQUFLLFFBQVEsU0FBUyxLQUFLO0FBQUEsSUFDaEMsZUFBZSxLQUFLLFFBQVEsU0FBUyxnQkFBZ0I7QUFBQSxJQUNyRCxVQUFVLEtBQUssUUFBUSxTQUFTLFdBQVc7QUFBQSxJQUMzQyxRQUFRLEtBQUssUUFBUSxTQUFTLFNBQVM7QUFBQSxJQUN2QyxVQUFVLEtBQUssUUFBUSxTQUFTLFdBQVc7QUFBQSxJQUMzQyxXQUFXLEtBQUssUUFBUSxTQUFTLFlBQVk7QUFBQSxJQUM3QyxXQUFXLEtBQUssUUFBUSxTQUFTLFlBQVk7QUFBQSxJQUM3QyxVQUFVLEtBQUssUUFBUSxTQUFTLFdBQVc7QUFBQSxFQUM3QztBQUNGO0FBS08sU0FBUyxnQkFBZ0IsTUFBTSxLQUFLO0FBQ3pDLFFBQU0sTUFBTSxRQUFRLE1BQU0sR0FBRztBQUU3QixTQUFPO0FBQUEsSUFDTCxNQUFNO0FBQUEsSUFDTixNQUFNLFNBQVMsSUFBSSxhQUFhLEdBQUk7QUFBQSxJQUNwQyxNQUFNO0FBQUEsSUFDTixPQUFPO0FBQUEsTUFDTCxZQUFZO0FBQUEsUUFDVixRQUFRO0FBQUEs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QVM7QUFBQSxZQUNQLENBQUMsV0FBVyxPQUFPO0FBQUEsVUFDckI7QUFBQSxVQUNBLFNBQVM7QUFBQSxZQUNQLENBQUMsV0FBVyxPQUFPO0FBQUEsVUFDckI7QUFBQSxRQUNGO0FBQUEsTUFDRjtBQUFBLE1BQ0EsS0FBSztBQUFBO0FBQUEsTUFDTCxVQUFVO0FBQUEsUUFDUixTQUFTO0FBQUE7QUFBQSxRQUNULFVBQVU7QUFBQTtBQUFBLE1BQ1o7QUFBQSxJQUNGLENBQUM7QUFBQTtBQUFBLElBR0QsV0FBVztBQUFBLE1BQ1QsV0FBVztBQUFBLFFBQ1QscUJBQXFCO0FBQUEsVUFDbkIsYUFBYTtBQUFBO0FBQUEsUUFDZixDQUFDO0FBQUEsTUFDSDtBQUFBLE1BQ0EsS0FBSztBQUFBO0FBQUEsTUFDTCxzQkFBc0I7QUFBQSxNQUN0QixrQkFBa0IsQ0FBQztBQUFBLE1BQ25CLFlBQVk7QUFBQSxNQUNaLFNBQVMsQ0FBQyxVQUFVLGNBQWMsT0FBTztBQUFBLE1BQ3pDLFNBQVMsQ0FBQywwQkFBMEIsbUJBQW1CLGtCQUFrQjtBQUFBLElBQzNFLENBQUM7QUFBQSxFQUNIO0FBR0EsTUFBSSxRQUFRO0FBRVYsWUFBUTtBQUFBLE1BQ04sV0FBVztBQUFBLFFBQ1QsVUFBVTtBQUFBLFFBQ1YsTUFBTTtBQUFBLFFBQ04sVUFBVTtBQUFBLFFBQ1YsWUFBWTtBQUFBLE1BQ2QsQ0FBQztBQUFBLElBQ0g7QUFBQSxFQUNGO0FBRUEsU0FBTztBQUNUOzs7QUhqRU8sU0FBUyxjQUFjLEVBQUUsS0FBSyxHQUFHO0FBQ3RDLFFBQU0sU0FBUyxTQUFTO0FBQ3hCLFFBQU0sTUFBTSxRQUFRLElBQUk7QUFDeEIsUUFBTSxNQUFNQyxTQUFRLE1BQU0sR0FBRztBQUM3QixRQUFNLFVBQVU7QUFFaEIsU0FBTztBQUFBLElBQ0wsU0FBUyxXQUFXLE1BQU07QUFBQSxJQUMxQixTQUFTO0FBQUEsTUFDUCxPQUFPLFNBQVMsT0FBTztBQUFBLElBQ3pCO0FBQUEsSUFDQSxNQUFNLElBQUk7QUFBQSxJQUNWLFFBQVEsZ0JBQWdCLE1BQU0sR0FBRztBQUFBLElBQ2pDLE9BQU8sZUFBZSxNQUFNO0FBQUEsSUFDNUIsY0FBYyxnQkFBZ0I7QUFBQSxJQUM5QixRQUFRLGdCQUFnQjtBQUFBLEVBQzFCO0FBQ0Y7OztBRHJCQSxJQUFPLHNCQUFRLGFBQWEsYUFBYTsiLAogICJuYW1lcyI6IFsibG9hZEVudiIsICJwYXRoIiwgImxvYWRFbnYiXQp9Cg==
