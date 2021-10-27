package com.sky.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.sky.domain.Medicines;
import org.apache.ibatis.annotations.Param;

/**
 * @author sky
 * @create 2021-6-11 16:34
 */
public interface MedicinesMapper extends BaseMapper<Medicines> {
    // 减少库存
    int deductionMedicinesStorage(@Param("medicinesId") Long medicinesId, @Param("num") long num);
}