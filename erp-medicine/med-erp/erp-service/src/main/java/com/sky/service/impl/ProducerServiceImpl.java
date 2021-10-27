package com.sky.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.date.DateUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sky.constants.Constants;
import com.sky.domain.Producer;
import com.sky.dto.ProducerDto;
import com.sky.mapper.ProducerMapper;
import com.sky.service.ProducerService;
import com.sky.vo.DataGridView;
import org.apache.commons.lang3.StringUtils;
import org.apache.dubbo.config.annotation.Method;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Arrays;
import java.util.List;

/**
 * methods = {@Method(name = "addProducer",retries = 0)
 * 代表当前类里面的addProducer这个主就去只调一次，不重试
 * @author sky
 * @create 2020-11-10 15:28
 */
@Service(methods = {@Method(name = "addProducer", retries = 0)})
public class ProducerServiceImpl implements ProducerService {

    @Autowired
    private ProducerMapper producerMapper;

    @Override
    public DataGridView listProducerPage(ProducerDto producerDto) {
        Page<Producer> page = new Page<>(producerDto.getPageNum(), producerDto.getPageSize());
        QueryWrapper<Producer> qw = new QueryWrapper<>();
        //查询条件
        qw.like(StringUtils.isNotBlank(producerDto.getProducerName()), Producer.COL_PRODUCER_NAME,producerDto.getProducerName());
        qw.like(StringUtils.isNotBlank(producerDto.getKeywords()), Producer.COL_KEYWORDS,producerDto.getKeywords());
        qw.like(StringUtils.isNotBlank(producerDto.getProducerTel()), Producer.COL_PRODUCER_TEL,producerDto.getProducerTel());
        qw.eq(StringUtils.isNotBlank(producerDto.getStatus()), Producer.COL_STATUS,producerDto.getStatus());

        qw.ge(producerDto.getBeginTime()!=null, Producer.COL_CREATE_TIME,producerDto.getBeginTime());
        qw.le(producerDto.getEndTime()!=null, Producer.COL_CREATE_TIME,producerDto.getEndTime());

        this.producerMapper.selectPage(page, qw);
        return new DataGridView(page.getTotal(), page.getRecords());
    }

    @Override
    public Producer getOne(Long producerId) {
        return this.producerMapper.selectById(producerId);
    }

    @Override
    public int addProducer(ProducerDto producerDto) {
        Producer producer = new Producer();
        BeanUtil.copyProperties(producerDto, producer);
        //设置创建人
        producer.setCreateBy(producerDto.getSimpleUser().getUserName());
        producer.setCreateTime(DateUtil.date());
        return this.producerMapper.insert(producer);
    }

    @Override
    public int updateProducer(ProducerDto producerDto) {
        Producer producer = new Producer();
        BeanUtil.copyProperties(producerDto, producer);
        // 设置修改人
        producer.setUpdateBy(producerDto.getSimpleUser().getUserName());
        return this.producerMapper.updateById(producer);
    }

    @Override
    public int deleteProducerByIds(Long[] producerIds) {
        List<Long> ids= Arrays.asList(producerIds);
        if(ids.size()>0){
            return this.producerMapper.deleteBatchIds(ids);
        }
        return -1;
    }

    @Override
    public List<Producer> selectAllProducer() {
        QueryWrapper<Producer> qw=new QueryWrapper<>();
        qw.eq(Producer.COL_STATUS, Constants.STATUS_TRUE);
        return this.producerMapper.selectList(qw);
    }
}
