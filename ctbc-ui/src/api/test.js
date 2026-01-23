import request from '@/utils/request';

// 查询数据详情列表
export function listTestEntity(query) {
  return request({
    url: '/test/list',
    method: 'get',
    params: query,
  });
}

// 获取数据详情详细信息
export function getTestEntity(monthNo) {
  return request({
    url: `/test/${monthNo}`,
    method: 'get',
  });
}

// 新增数据详情
export function addTestEntity(data) {
  return request({
    url: '/test',
    method: 'post',
    data: data,
  });
}

// 修改数据详情
export function updateTestEntity(data) {
  return request({
    url: '/test',
    method: 'put',
    data: data,
  });
}

// 删除数据详情
export function delTestEntity(monthNo) {
  return request({
    url: `/test/${monthNo}`,
    method: 'delete',
  });
}

// 获取测试统计数据
export function getTestStats(query) {
  return request({
    url: '/test/stats',
    method: 'get',
    params: query,
  });
}

// 测试API接口连通性
export function testApiConnectivity() {
  return request({
    url: '/test/api-connectivity',
    method: 'get',
  });
}

// 测试路由配置
export function testRouteConfig(param1, param2) {
  return request({
    url: `/test/route-config/${param1}/${param2}`,
    method: 'get',
  });
}
