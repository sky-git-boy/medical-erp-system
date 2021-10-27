package com.sky.service;

import com.sky.domain.Producer;
import com.sky.dto.ProducerDto;
import com.sky.vo.DataGridView;

import java.util.List;

/**
 * @author sky
 * @create 2020-11-10 15:28
 */
public interface ProducerService {
    /**
     * 分页查询
     */
    DataGridView listProducerPage(ProducerDto producerDto);

    /**
     * 根据ID查询
     */
    Producer getOne(Long ProducerId);

    /**
     * 添加
     */
    int addProducer(ProducerDto producerDto);

    /**
     * 修改
     */
    int updateProducer(ProducerDto producerDto);

    /**
     * 根据ID删除
     */
    int deleteProducerByIds(Long[] producerIds);

    /**
     * 查询所有可用生产厂家
     */
    List<Producer> selectAllProducer();
}
