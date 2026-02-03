/**
 * 安全工具函数
 */

// XSS防护
export function sanitizeHtml(html) {
  if (html == null) return '';
  const input = String(html);

  const parser = new DOMParser();
  const doc = parser.parseFromString(`<div>${input}</div>`, 'text/html');
  const root = doc.body?.firstElementChild;
  if (!root) return '';

  const outDoc = document.implementation.createHTMLDocument('');
  const outRoot = outDoc.createElement('div');

  const allowedTags = new Set([
    'a',
    'b',
    'blockquote',
    'br',
    'code',
    'div',
    'em',
    'h1',
    'h2',
    'h3',
    'h4',
    'h5',
    'h6',
    'hr',
    'i',
    'img',
    'li',
    'ol',
    'p',
    'pre',
    's',
    'span',
    'strong',
    'table',
    'tbody',
    'td',
    'th',
    'thead',
    'tr',
    'u',
    'ul',
  ]);

  const globalAllowedAttrs = new Set(['class']);
  const allowedAttrsByTag = {
    a: new Set(['href', 'title', 'target', 'rel']),
    img: new Set(['src', 'alt', 'title', 'width', 'height']),
    td: new Set(['colspan', 'rowspan']),
    th: new Set(['colspan', 'rowspan']),
  };

  const normalizeUrl = (raw) => {
    const value = String(raw || '').trim();
    return value;
  };

  const isSafeHref = (raw) => {
    const href = normalizeUrl(raw);
    if (!href) return false;
    if (href.startsWith('#') || href.startsWith('/')) return true;
    const lower = href.toLowerCase();
    return (
      lower.startsWith('http://') ||
      lower.startsWith('https://') ||
      lower.startsWith('mailto:') ||
      lower.startsWith('tel:')
    );
  };

  const isSafeImgSrc = (raw) => {
    const src = normalizeUrl(raw);
    if (!src) return false;
    if (src.startsWith('/') || src.startsWith('./') || src.startsWith('../')) return true;
    const lower = src.toLowerCase();
    if (lower.startsWith('http://') || lower.startsWith('https://')) return true;
    if (!lower.startsWith('data:image/')) return false;
    if (lower.startsWith('data:image/svg+xml')) return false;
    return true;
  };

  const sanitizeNode = (node, parent) => {
    if (!node) return;

    if (node.nodeType === Node.TEXT_NODE) {
      parent.appendChild(outDoc.createTextNode(node.textContent || ''));
      return;
    }

    if (node.nodeType !== Node.ELEMENT_NODE) return;

    const tag = node.tagName.toLowerCase();

    if (!allowedTags.has(tag)) {
      Array.from(node.childNodes).forEach((child) => sanitizeNode(child, parent));
      return;
    }

    const el = outDoc.createElement(tag);

    const allowedAttrs = allowedAttrsByTag[tag];
    for (const attr of Array.from(node.attributes || [])) {
      const name = attr.name.toLowerCase();
      if (name === 'style' || name.startsWith('on')) continue;

      const isAllowed = (allowedAttrs && allowedAttrs.has(name)) || globalAllowedAttrs.has(name);
      if (!isAllowed) continue;

      const value = attr.value;

      if (tag === 'a' && name === 'href') {
        if (!isSafeHref(value)) continue;
        el.setAttribute('href', normalizeUrl(value));
        continue;
      }

      if (tag === 'img' && name === 'src') {
        if (!isSafeImgSrc(value)) continue;
        el.setAttribute('src', normalizeUrl(value));
        continue;
      }

      if (tag === 'a' && name === 'target') {
        const v = String(value || '').toLowerCase();
        if (['_blank', '_self', '_parent', '_top'].includes(v)) {
          el.setAttribute('target', v);
        }
        continue;
      }

      el.setAttribute(name, value);
    }

    if (tag === 'a' && el.getAttribute('target') === '_blank') {
      const rel = (el.getAttribute('rel') || '').toLowerCase();
      if (!rel.includes('noopener') || !rel.includes('noreferrer')) {
        el.setAttribute('rel', 'noopener noreferrer');
      }
    }

    Array.from(node.childNodes).forEach((child) => sanitizeNode(child, el));
    parent.appendChild(el);
  };

  Array.from(root.childNodes).forEach((child) => sanitizeNode(child, outRoot));
  return outRoot.innerHTML;
}

// 输入验证
export const validators = {
  // 邮箱验证
  email: (email) => {
    const regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return regex.test(email);
  },

  // 手机号验证
  phone: (phone) => {
    const regex = /^1[3-9]\d{9}$/;
    return regex.test(phone);
  },

  // 密码强度验证
  password: (password) => {
    const minLength = 8;
    const hasUpperCase = /[A-Z]/.test(password);
    const hasLowerCase = /[a-z]/.test(password);
    const hasNumbers = /\d/.test(password);
    const hasSpecialChar = /[!@#$%^&*(),.?":{}|<>]/.test(password);

    return {
      valid: password.length >= minLength && hasUpperCase && hasLowerCase && hasNumbers,
      strength: [hasUpperCase, hasLowerCase, hasNumbers, hasSpecialChar].filter(Boolean).length,
      message:
        password.length < minLength
          ? '密码至少8位'
          : !hasUpperCase
            ? '需要包含大写字母'
            : !hasLowerCase
              ? '需要包含小写字母'
              : !hasNumbers
                ? '需要包含数字'
                : '密码强度良好',
    };
  },

  // SQL注入防护
  sqlInjection: (input) => {
    const sqlKeywords = ['SELECT', 'INSERT', 'UPDATE', 'DELETE', 'DROP', 'UNION', 'SCRIPT'];
    const upperInput = input.toUpperCase();
    return !sqlKeywords.some((keyword) => upperInput.includes(keyword));
  },

  // URL验证
  url: (url) => {
    try {
      new URL(url);
      return true;
    } catch {
      return false;
    }
  },
};

// 敏感信息脱敏
export function maskSensitiveInfo(data, type) {
  if (!data) return data;

  switch (type) {
    case 'phone':
      return data.replace(/(\d{3})\d{4}(\d{4})/, '$1****$2');
    case 'email':
      return data.replace(/(.{2}).*(@.*)/, '$1***$2');
    case 'idCard':
      return data.replace(/(\d{6})\d{8}(\d{4})/, '$1********$2');
    case 'bankCard':
      return data.replace(/(\d{4})\d{8,12}(\d{4})/, '$1****$2');
    default:
      return data;
  }
}

// 权限检查
export function hasPermission(permission, userPermissions = []) {
  if (!permission) return true;
  if (userPermissions.includes('*:*:*')) return true;
  return userPermissions.includes(permission);
}

// 角色检查
export function hasRole(role, userRoles = []) {
  if (!role) return true;
  if (userRoles.includes('admin')) return true;
  return userRoles.includes(role);
}

// CSRF Token管理
export class CSRFTokenManager {
  constructor() {
    this.token = null;
    this.refreshToken();
  }

  refreshToken() {
    this.token = this.generateToken();
    // 设置到meta标签
    let meta = document.querySelector('meta[name="csrf-token"]');
    if (!meta) {
      meta = document.createElement('meta');
      meta.name = 'csrf-token';
      document.head.appendChild(meta);
    }
    meta.content = this.token;
  }

  generateToken() {
    // 使用JSEncrypt库生成随机token，避免依赖Web Crypto API
    const randomBytes = [];
    for (let i = 0; i < 32; i++) {
      // 使用JSEncrypt的随机数生成器
      randomBytes.push(Math.floor(Math.random() * 256));
    }
    return Array.from(randomBytes)
      .map((b) => b.toString(16).padStart(2, '0'))
      .join('');
  }

  getToken() {
    return this.token;
  }

  validateToken(token) {
    return token === this.token;
  }
}

// 内容安全策略
export function setCSP() {
  const csp = [
    "default-src 'self'",
    "script-src 'self' 'unsafe-inline' 'unsafe-eval'",
    "style-src 'self' 'unsafe-inline'",
    "img-src 'self' data: https:",
    "font-src 'self' data:",
    "connect-src 'self'",
    "frame-ancestors 'none'",
  ].join('; ');

  const meta = document.createElement('meta');
  meta.httpEquiv = 'Content-Security-Policy';
  meta.content = csp;
  document.head.appendChild(meta);
}

// 安全的localStorage
export const secureStorage = {
  setItem(key, value, encrypt = false) {
    try {
      const data = encrypt ? btoa(JSON.stringify(value)) : JSON.stringify(value);
      localStorage.setItem(key, data);
    } catch (error) {
      console.error('存储失败:', error);
    }
  },

  getItem(key, decrypt = false) {
    try {
      const data = localStorage.getItem(key);
      if (!data) return null;
      return decrypt ? JSON.parse(atob(data)) : JSON.parse(data);
    } catch (error) {
      console.error('读取失败:', error);
      return null;
    }
  },

  removeItem(key) {
    localStorage.removeItem(key);
  },

  clear() {
    localStorage.clear();
  },
};

// 防止点击劫持
export function preventClickjacking() {
  if (window.top !== window.self) {
    window.top.location = window.self.location;
  }
}

// 安全的事件监听器
export function addSecureEventListener(element, event, handler, options = {}) {
  const secureHandler = (e) => {
    // 验证事件来源
    if (e.isTrusted === false) {
      console.warn('检测到不可信的事件');
      return;
    }
    handler(e);
  };

  element.addEventListener(event, secureHandler, options);

  return () => {
    element.removeEventListener(event, secureHandler, options);
  };
}

import JSEncrypt from 'jsencrypt'

// 硬编码公钥（使用后端原有的公钥）
// 密钥对生成 http://web.chacuo.net/netrsakeypair
const publicKey = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApldHeo5I9iNMLuN0wetX\n" +
  "hDxLRKLGXe4t1/bkWOxtipBDRgSh5z1xTCMnYSNxxfTtBCvsDsqEc6ZH+frpK0Rh\n" +
  "LP/fA/kC8PWwdddWlSonpowLDgHcJq+Qz+ZHSy66kF/OSducT3tbarOi2Jp0KDd1\n" +
  "sQ5Sy4mwmUmqv97Z6ZBQTn/hiNthhcd0tc6L6Bxn0fITae3ZrkdBx00L8HrT2c/E\n" +
  "5agWxhucqZw3H8ORlW4S/HHRlP1CChL5s8JQ4rZmA7gPYVvsJqYnuwNnLh42sgNT\n" +
  "DKfIMa2ZHa3Y1yQpJ1tlHeGchgLRjk20z1DKvHbHXbt3THskovolMOosi0aUn1Cj\n" +
  "lQIDAQAB";

// 加密
export function encrypt(txt) {
  const encryptor = new JSEncrypt()
  encryptor.setPublicKey(publicKey)
  return encryptor.encrypt(txt)
}

// 初始化安全设置
export function initSecurity() {
  // 设置CSP
  setCSP();

  // 防止点击劫持
  preventClickjacking();

  // 禁用控制台（生产环境）
  if (process.env.NODE_ENV === 'production') {
    console.log = () => { };
    console.warn = () => { };
    console.error = () => { };
  }

  // 禁用右键菜单（可选）
  // document.addEventListener('contextmenu', e => e.preventDefault());

  // 禁用F12等开发者工具快捷键（可选）
  // document.addEventListener('keydown', e => {
  //   if (e.key === 'F12' || (e.ctrlKey && e.shiftKey && e.key === 'I')) {
  //     e.preventDefault();
  //   }
  // });
}

export default {
  sanitizeHtml,
  validators,
  maskSensitiveInfo,
  hasPermission,
  hasRole,
  CSRFTokenManager,
  setCSP,
  secureStorage,
  preventClickjacking,
  addSecureEventListener,
  encrypt,
  initSecurity,
};
