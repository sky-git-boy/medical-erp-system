package com.sky.service;

import com.sky.domain.Producer;
import com.sky.dto.ProducerDto;
import com.sky.vo.DataGridView;

import java.util.List;

/**
 * @author sky
 * @create 2021-06-05 21:26
 */
public interface ProducerService {

    DataGridView listProducerPage(ProducerDto producerDto);

    Producer getOne(Long producerId);

    int addProducer(ProducerDto producerDto);

    int updateProducer(ProducerDto producerDto);

    int deleteProducerByIds(Long[] producerIds);

    List<Producer> selectAllProducer();
}
