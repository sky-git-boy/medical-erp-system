package com.sky.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.date.DateUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sky.constants.Constants;
import com.sky.domain.Medicines;
import com.sky.dto.MedicinesDto;
import com.sky.mapper.MedicinesMapper;
import com.sky.service.MedicinesService;
import com.sky.vo.DataGridView;
import org.apache.commons.lang3.StringUtils;
import org.apache.dubbo.config.annotation.Method;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Arrays;
import java.util.List;

/**
 * @author sky
 * @create 2021-6-11 16:34
 */
@Service(methods = {@Method(name = "addMedicines", retries = 0)})
public class MedicinesServiceImpl implements MedicinesService {

    @Autowired
    private MedicinesMapper medicinesMapper;

    @Override
    public DataGridView listMedicinesPage(MedicinesDto medicinesDto) {
        Page<Medicines> page = new Page<>(medicinesDto.getPageNum(), medicinesDto.getPageSize());
        QueryWrapper<Medicines> qw = new QueryWrapper<>();
        //查询条件
        qw.like(StringUtils.isNotBlank(medicinesDto.getMedicinesName()), Medicines.COL_MEDICINES_NAME,medicinesDto.getMedicinesName());
        qw.like(StringUtils.isNotBlank(medicinesDto.getKeywords()), Medicines.COL_KEYWORDS,medicinesDto.getKeywords());
        qw.eq(StringUtils.isNotBlank(medicinesDto.getMedicinesType()), Medicines.COL_MEDICINES_TYPE,medicinesDto.getMedicinesType());
        qw.eq(StringUtils.isNotBlank(medicinesDto.getProducerId()), Medicines.COL_PRODUCER_ID,medicinesDto.getProducerId());
        qw.eq(StringUtils.isNotBlank(medicinesDto.getPrescriptionType()), Medicines.COL_PRESCRIPTION_TYPE,medicinesDto.getPrescriptionType());
        qw.eq(StringUtils.isNotBlank(medicinesDto.getStatus()), Medicines.COL_STATUS,medicinesDto.getStatus());
        this.medicinesMapper.selectPage(page, qw);
        return new DataGridView(page.getTotal(), page.getRecords());
    }

    @Override
    public Medicines getOne(Long medicinesId) {
        return this.medicinesMapper.selectById(medicinesId);
    }

    @Override
    public int addMedicines(MedicinesDto medicinesDto) {
        Medicines medicines = new Medicines();
        BeanUtil.copyProperties(medicinesDto, medicines);
        //设置创建人
        medicines.setCreateBy(medicinesDto.getSimpleUser().getUserName());
        medicines.setCreateTime(DateUtil.date());
        return this.medicinesMapper.insert(medicines);
    }

    @Override
    public int updateMedicines(MedicinesDto medicinesDto) {
        Medicines medicines = new Medicines();
        BeanUtil.copyProperties(medicinesDto, medicines);
        // 设置修改人
        medicines.setUpdateBy(medicinesDto.getSimpleUser().getUserName());
        return this.medicinesMapper.updateById(medicines);
    }

    @Override
    public int deleteMedicinesByIds(Long[] medicinesIds) {
        List<Long> ids= Arrays.asList(medicinesIds);
        if(ids.size()>0){
            return this.medicinesMapper.deleteBatchIds(ids);
        }
        return -1;
    }

    @Override
    public List<Medicines> selectAllMedicines() {
        QueryWrapper<Medicines> qw=new QueryWrapper<>();
        qw.eq(Medicines.COL_STATUS, Constants.STATUS_TRUE);
        return this.medicinesMapper.selectList(qw);
    }

    @Override
    public int updateMedicinesStorage(Long medicinesId, Long medicinesStockNum) {
        Medicines medicines = new Medicines();
        medicines.setMedicinesId(medicinesId);
        medicines.setMedicinesStockNum(medicinesStockNum);
        return this.medicinesMapper.updateById(medicines);
    }

    @Override
    public int deductionMedicinesStorage(Long medicinesId, long num) {
        return this.medicinesMapper.deductionMedicinesStorage(medicinesId,num);
    }
}
