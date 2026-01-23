package com.ctbc.test.mapper;

import java.util.List;
import java.util.Map;
import com.ctbc.test.domain.TestEntity;

/**
 * 测试Mapper接口
 * 
 * @author ctbc
 */
public interface TestMapper 
{
    /**
     * 查询数据详情
     * 
     * @param monthNo 数据详情主键
     * @return 数据详情
     */
    public TestEntity selectTestEntityByMonthNo(Integer monthNo);

    /**
     * 查询数据详情列表
     * 
     * @param testEntity 数据详情
     * @return 数据详情集合
     */
    public List<TestEntity> selectTestEntityList(TestEntity testEntity);

    /**
     * 新增数据详情
     * 
     * @param testEntity 数据详情
     * @return 结果
     */
    public int insertTestEntity(TestEntity testEntity);

    /**
     * 修改数据详情
     * 
     * @param testEntity 数据详情
     * @return 结果
     */
    public int updateTestEntity(TestEntity testEntity);

    /**
     * 删除数据详情
     * 
     * @param monthNo 数据详情主键
     * @return 结果
     */
    public int deleteTestEntityByMonthNo(Integer monthNo);

    /**
     * 批量删除数据详情
     * 
     * @param monthNos 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteTestEntityByMonthNos(Integer[] monthNos);

    /**
     * 统计测试数据
     * 
     * @param testEntity 测试实体
     * @return 统计结果
     */
    public List<Map<String, Object>> selectTestStats(TestEntity testEntity);

    /**
     * 测试API接口连通性
     * 
     * @param params 参数
     * @return 结果
     */
    public Map<String, Object> testApiConnectivity(Map<String, Object> params);

    /**
     * 测试路由配置
     * 
     * @param params 参数
     * @return 结果
     */
    public Map<String, Object> testRouteConfig(Map<String, Object> params);
}