package com.sky.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sky.domain.InventoryLog;
import com.sky.dto.InventoryLogDto;
import com.sky.mapper.InventoryLogMapper;
import com.sky.service.InventoryLogService;
import com.sky.vo.DataGridView;
import org.apache.commons.lang3.StringUtils;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author sky
 * @create 2020-11-13 20:56
 */
@Service
public class InventoryLogServiceImpl implements InventoryLogService {

    @Autowired
    private InventoryLogMapper inventoryLogMapper;

    @Override
    public DataGridView listInventoryLogPage(InventoryLogDto inventoryLogDto) {
        Page<InventoryLog> page = new Page<>(inventoryLogDto.getPageNum(), inventoryLogDto.getPageSize());
        QueryWrapper<InventoryLog> qw = new QueryWrapper<>();

        // 查询条件
        qw.like(StringUtils.isNotBlank(inventoryLogDto.getPurchaseId()), InventoryLog.COL_PURCHASE_ID,inventoryLogDto.getPurchaseId());
        qw.like(StringUtils.isNotBlank(inventoryLogDto.getMedicinesName()), InventoryLog.COL_MEDICINES_NAME,inventoryLogDto.getMedicinesName());
        qw.eq(StringUtils.isNotBlank(inventoryLogDto.getMedicinesType()), InventoryLog.COL_MEDICINES_TYPE,inventoryLogDto.getMedicinesType());
        qw.eq(StringUtils.isNotBlank(inventoryLogDto.getProducerId()), InventoryLog.COL_PRODUCER_ID,inventoryLogDto.getProducerId());
        qw.eq(StringUtils.isNotBlank(inventoryLogDto.getPrescriptionType()), InventoryLog.COL_PRESCRIPTION_TYPE,inventoryLogDto.getPrescriptionType());

        qw.ge(inventoryLogDto.getBeginTime()!=null, InventoryLog.COL_CREATE_TIME,inventoryLogDto.getBeginTime());
        qw.le(inventoryLogDto.getEndTime()!=null, InventoryLog.COL_CREATE_TIME,inventoryLogDto.getEndTime());
        qw.orderByDesc(InventoryLog.COL_CREATE_TIME);

        this.inventoryLogMapper.selectPage(page, qw);

        return new DataGridView(page.getTotal(), page.getRecords());
    }
}
