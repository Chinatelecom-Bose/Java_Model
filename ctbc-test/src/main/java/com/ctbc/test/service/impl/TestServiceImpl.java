package com.ctbc.test.service.impl;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ctbc.test.domain.TestEntity;
import com.ctbc.test.mapper.TestMapper;
import com.ctbc.test.service.ITestService;

/**
 * 测试Service业务层处理
 * 
 * @author ctbc
 */
@Service
public class TestServiceImpl implements ITestService 
{
    @Autowired
    private TestMapper testMapper;

    /**
     * 查询数据详情
     * 
     * @param monthNo 数据详情主键
     * @return 数据详情
     */
    @Override
    public TestEntity selectTestEntityByMonthNo(Integer monthNo)
    {
        return testMapper.selectTestEntityByMonthNo(monthNo);
    }

    /**
     * 查询数据详情列表
     * 
     * @param testEntity 数据详情
     * @return 数据详情集合
     */
    @Override
    public List<TestEntity> selectTestEntityList(TestEntity testEntity)
    {
        return testMapper.selectTestEntityList(testEntity);
    }

    /**
     * 新增数据详情
     * 
     * @param testEntity 数据详情
     * @return 结果
     */
    @Override
    public int insertTestEntity(TestEntity testEntity)
    {
        return testMapper.insertTestEntity(testEntity);
    }

    /**
     * 修改数据详情
     * 
     * @param testEntity 数据详情
     * @return 结果
     */
    @Override
    public int updateTestEntity(TestEntity testEntity)
    {
        return testMapper.updateTestEntity(testEntity);
    }

    /**
     * 批量删除数据详情
     * 
     * @param monthNos 需要删除的数据主键集合
     * @return 结果
     */
    @Override
    public int deleteTestEntityByMonthNos(Integer[] monthNos)
    {
        return testMapper.deleteTestEntityByMonthNos(monthNos);
    }

    /**
     * 删除数据详情信息
     * 
     * @param monthNo 数据详情主键
     * @return 结果
     */
    @Override
    public int deleteTestEntityByMonthNo(Integer monthNo)
    {
        return testMapper.deleteTestEntityByMonthNo(monthNo);
    }

    /**
     * 获取测试统计数据
     * 
     * @param testEntity 查询参数
     * @return 统计列表
     */
    @Override
    public List<Map<String, Object>> getTestStats(TestEntity testEntity)
    {
        return testMapper.selectTestStats(testEntity);
    }

    /**
     * 测试API接口连通性
     * 
     * @param params 测试参数
     * @return 测试结果
     */
    @Override
    public Map<String, Object> testApiConnectivity(Map<String, Object> params)
    {
        return testMapper.testApiConnectivity(params);
    }

    /**
     * 测试路由配置
     * 
     * @param params 测试参数
     * @return 测试结果
     */
    @Override
    public Map<String, Object> testRouteConfig(Map<String, Object> params)
    {
        return testMapper.testRouteConfig(params);
    }
}