package com.sky.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.date.DateUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sky.constants.Constants;
import com.sky.domain.*;
import com.sky.dto.PurchaseDto;
import com.sky.dto.PurchaseFormDto;
import com.sky.dto.PurchaseItemDto;
import com.sky.mapper.InventoryLogMapper;
import com.sky.mapper.MedicinesMapper;
import com.sky.mapper.PurchaseItemMapper;
import com.sky.mapper.PurchaseMapper;
import com.sky.service.PurchaseService;
import com.sky.utils.IdGeneratorSnowflake;
import com.sky.vo.DataGridView;
import org.apache.commons.lang3.StringUtils;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collections;
import java.util.List;

/**
 * @author sky
 * @create 2020-11-12 16:39
 */
@Service
@Transactional
public class PurchaseServiceImpl implements PurchaseService {
    @Autowired
    private PurchaseMapper purchaseMapper;

    @Autowired
    private PurchaseItemMapper purchaseItemMapper;

    @Autowired
    private InventoryLogMapper inventoryLogMapper;

    @Autowired
    private MedicinesMapper medicinesMapper;

    @Override
    public DataGridView listPurchasePage(PurchaseDto purchaseDto) {
        Page<Purchase> page = new Page<>(purchaseDto.getPageNum(), purchaseDto.getPageSize());
        QueryWrapper<Purchase> qw = new QueryWrapper<>();
        // 条件
        qw.eq(StringUtils.isNotBlank(purchaseDto.getProviderId()), Purchase.COL_PROVIDER_ID, purchaseDto.getProviderId());
        qw.eq(StringUtils.isNotBlank(purchaseDto.getStatus()), Purchase.COL_STATUS, purchaseDto.getStatus());
        qw.like(StringUtils.isNotBlank(purchaseDto.getApplyUserName()), Purchase.COL_APPLY_USER_NAME, purchaseDto.getApplyUserName());

        qw.orderByDesc(Purchase.COL_CREATE_TIME);
        this.purchaseMapper.selectPage(page,qw);
        return new DataGridView(page.getTotal(),page.getRecords());
    }

    @Override
    public Purchase getPurchaseById(String purchaseId) {
        return this.purchaseMapper.selectById(purchaseId);
    }

    @Override
    public int doAudit(String purchaseId, SimpleUser simpleUser) {
        Purchase purchase = this.purchaseMapper.selectById(purchaseId);
        // 修改单据状态为【待审核】
        purchase.setStatus(Constants.STOCK_PURCHASE_STATUS_2);
        // 设置单据提交人Id
        purchase.setApplyUserId(Long.valueOf(simpleUser.getUserId().toString()));
        // 设置单据提交人姓名
        purchase.setApplyUserName(simpleUser.getUserName());
        return this.purchaseMapper.updateById(purchase);
    }

    @Override
    public int doInvalid(String purchaseId) {
        Purchase purchase = this.purchaseMapper.selectById(purchaseId);
        // 修改单据状态为【作废】
        purchase.setStatus(Constants.STOCK_PURCHASE_STATUS_5);
        return this.purchaseMapper.updateById(purchase);
    }

    @Override
    public int auditPass(String purchaseId) {
        Purchase purchase = this.purchaseMapper.selectById(purchaseId);
        // 修改单据状态为【审核通过】
        purchase.setStatus(Constants.STOCK_PURCHASE_STATUS_3);
        return this.purchaseMapper.updateById(purchase);
    }

    @Override
    public int auditNoPass(String purchaseId, String examine) {
        Purchase purchase = this.purchaseMapper.selectById(purchaseId);
        // 修改单据状态为【审核失败】
        purchase.setStatus(Constants.STOCK_PURCHASE_STATUS_4);
        // 设置失败信息
        purchase.setExamine(examine);
        return this.purchaseMapper.updateById(purchase);
    }

    @Override
    public DataGridView listPurchasePendingForPage(PurchaseDto purchaseDto) {
        Page<Purchase> page = new Page<>(purchaseDto.getPageNum(), purchaseDto.getPageSize());
        QueryWrapper<Purchase> qw = new QueryWrapper<>();
        // 条件
        qw.eq(StringUtils.isNotBlank(purchaseDto.getProviderId()), Purchase.COL_PROVIDER_ID, purchaseDto.getProviderId());
        qw.like(StringUtils.isNotBlank(purchaseDto.getApplyUserName()), Purchase.COL_APPLY_USER_NAME, purchaseDto.getApplyUserName());
        qw.eq(Purchase.COL_STATUS, Constants.STOCK_PURCHASE_STATUS_2);
        this.purchaseMapper.selectPage(page, qw);
        return new DataGridView(page.getTotal(), page.getRecords());
    }

    @Override
    public List<PurchaseItem> getPurchaseItemById(String purchaseId) {
        if(null == purchaseId) {
            return Collections.emptyList();
        }
        QueryWrapper<PurchaseItem> qw = new QueryWrapper<>();
        qw.eq(PurchaseItem.COL_PURCHASE_ID, purchaseId);
        return this.purchaseItemMapper.selectList(qw);
    }

    /**
     * 暂存   采购单的状态是Constants.STOCK_PURCHASE_STATUS_1
     * @param purchaseFormDto
     * @return
     */
    @Override
    public int addPurchaseAndItem(PurchaseFormDto purchaseFormDto) {
        return add(purchaseFormDto, Constants.STOCK_PURCHASE_STATUS_1);
    }

    /**
     * 保存并提交审核  状态应该是Constants.STOCK_PURCHASE_STATUS_2
     * @param purchaseFormDto
     * @return
     */
    @Override
    public int addPurchaseAndItemToAudit(PurchaseFormDto purchaseFormDto) {
        return add(purchaseFormDto, Constants.STOCK_PURCHASE_STATUS_2);
    }

    /**
     * 入库
     * 逻辑
     * 向stock_inventory_log表里面添加数据 并更新stock_medicines的库存
     * @param purchaseId
     * @param currentSimpleUser
     * @return
     */
    @Override
    public int doInventory(String purchaseId, SimpleUser currentSimpleUser) {
        Purchase purchase = this.purchaseMapper.selectById(purchaseId);
        // 只有状态为【审核通过】才能进行入库操作
        if(null!=purchase && purchase.getStatus().equals(Constants.STOCK_PURCHASE_STATUS_3)){
            // 查询详情
            QueryWrapper<PurchaseItem> qw = new QueryWrapper<>();
            qw.eq(PurchaseItem.COL_PURCHASE_ID,purchase.getPurchaseId());
            List<PurchaseItem> purchaseItems = this.purchaseItemMapper.selectList(qw);
            for (PurchaseItem purchaseItem : purchaseItems) {
                // 创建入库日志对象
                InventoryLog inventoryLog=new InventoryLog();
                inventoryLog.setInventoryLogId(purchaseItem.getItemId());
                inventoryLog.setPurchaseId(purchaseItem.getPurchaseId());
                inventoryLog.setMedicinesId(purchaseItem.getMedicinesId());
                inventoryLog.setInventoryLogNum(purchaseItem.getPurchaseNumber());
                inventoryLog.setTradePrice(purchaseItem.getTradePrice());
                inventoryLog.setTradeTotalAmount(purchaseItem.getTradeTotalAmount());
                inventoryLog.setBatchNumber(purchaseItem.getBatchNumber());
                inventoryLog.setMedicinesName(purchaseItem.getMedicinesName());
                inventoryLog.setMedicinesType(purchaseItem.getMedicinesType());
                inventoryLog.setPrescriptionType(purchaseItem.getPrescriptionType());
                inventoryLog.setProducerId(purchaseItem.getProducerId());
                inventoryLog.setConversion(purchaseItem.getConversion());
                inventoryLog.setUnit(purchaseItem.getUnit());
                inventoryLog.setCreateTime(DateUtil.date());
                inventoryLog.setCreateBy(currentSimpleUser.getUserName());

                // 保存数据
                inventoryLogMapper.insert(inventoryLog);

                // 更新药品库存
                Medicines medicines=this.medicinesMapper.selectById(purchaseItem.getMedicinesId());
                medicines.setMedicinesStockNum(medicines.getMedicinesStockNum()+purchaseItem.getPurchaseNumber());
                medicines.setUpdateBy(currentSimpleUser.getUserName());
                this.medicinesMapper.updateById(medicines);
            }
            // 入库成功  修改单据的状态为入库成功
            purchase.setStatus(Constants.STOCK_PURCHASE_STATUS_6);//入库成功
            purchase.setStorageOptTime(DateUtil.date());
            purchase.setStorageOptUser(currentSimpleUser.getUserName());
            return this.purchaseMapper.updateById(purchase);
        }
        return -1;
    }

    /**
     * addPurchaseAndItem 和 addPurchaseAndItemToAudit 方法的共用
     * @param purchaseFormDto
     * @param status   要设置的状态
     * @return
     */
    private int add(PurchaseFormDto purchaseFormDto, String status) {
        // 获取购物单对象
        Purchase purchase = this.purchaseMapper.selectById(purchaseFormDto.getPurchaseDto().getPurchaseId());
        if(null != purchase) {
            // 删除之前的数据
            this.purchaseMapper.deleteById(purchase.getPurchaseId());
            // 删除之前的相信数据
            QueryWrapper<PurchaseItem> qw = new QueryWrapper<>();
            qw.eq(PurchaseItem.COL_PURCHASE_ID, purchase.getPurchaseId());
            this.purchaseItemMapper.delete(qw);
        }
        // 保存采购单主表数据
        Purchase newPurchase=new Purchase();
        BeanUtil.copyProperties(purchaseFormDto.getPurchaseDto(),newPurchase);
        newPurchase.setStatus(status);// 设置状态
        // 获取当前用户，并设置采购单创建者及创建时间
        newPurchase.setCreateBy(purchaseFormDto.getPurchaseDto().getSimpleUser().getUserName());
        newPurchase.setCreateTime(DateUtil.date());
        // 如果是 addPurchaseAndItemToAudit 方法，需要设置申请人
        if(status.equals(Constants.STOCK_PURCHASE_STATUS_2)) {
            // 设置申请人和申请人的ID
            newPurchase.setApplyUserId(Long.valueOf(purchaseFormDto.getPurchaseDto().getSimpleUser().getUserId().toString()));
            newPurchase.setApplyUserName(purchaseFormDto.getPurchaseDto().getSimpleUser().getUserName());
        }
        int a = this.purchaseMapper.insert(newPurchase);
        // 保存详情数据
        for (PurchaseItemDto item : purchaseFormDto.getPurchaseItemDtos()) {
            PurchaseItem purchaseItem = new PurchaseItem();
            BeanUtil.copyProperties(item,purchaseItem);
            purchaseItem.setPurchaseId(newPurchase.getPurchaseId());
            purchaseItem.setItemId(IdGeneratorSnowflake.snowflakeId().toString());
            this.purchaseItemMapper.insert(purchaseItem);
        }
        return a;
    }
}
