import request from '@/utils/request';

// 查询安装激活统计
export function getInstallationStats(query) {
  return request({
    url: '/statistics/datainfo/stats',
    method: 'get',
    params: query,
  });
}
