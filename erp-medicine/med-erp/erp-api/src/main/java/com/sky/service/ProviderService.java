package com.sky.service;

import com.sky.domain.Provider;
import com.sky.dto.ProviderDto;
import com.sky.vo.DataGridView;

import java.util.List;

/**
 * @author sky
 * @create 2021-6-11 22:46
 */
public interface ProviderService {

    /**
     * 分页查询
     */
    DataGridView listProviderPage(ProviderDto providerDto);

    /**
     * 根据ID查询
     */
    Provider getOne(Long ProviderId);

    /**
     * 添加
     */
    int addProvider(ProviderDto providerDto);

    /**
     * 修改
     */
    int updateProvider(ProviderDto providerDto);

    /**
     * 根据ID删除
     */
    int deleteProviderByIds(Long[] providerIds);

    /**
     * 查询所有可用供应商
     */
    List<Provider> selectAllProvider();
}
