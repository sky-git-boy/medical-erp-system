package com.sky.service.impl;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sky.constants.Constants;
import com.sky.domain.Purchase;
import com.sky.domain.PurchaseItem;
import com.sky.domain.SimpleUser;
import com.sky.dto.PurchaseDto;
import com.sky.mapper.PurchaseItemMapper;
import com.sky.mapper.PurchaseMapper;
import com.sky.service.PurchaseService;
import com.sky.vo.DataGridView;
import org.apache.commons.lang3.StringUtils;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author sky
 * @create 2021-06-15 8:43
 */
@Service
@Transactional
public class PurchaseServiceImpl implements PurchaseService {

    @Autowired
    private PurchaseMapper purchaseMapper;

    @Autowired
    private PurchaseItemMapper purchaseItemMapper;

    @Override
    public DataGridView listPurchasePage(PurchaseDto purchaseDto) {
        Page<Purchase> page = new Page<>(purchaseDto.getPageNum(), purchaseDto.getPageSize());
        QueryWrapper<Purchase> qw = new QueryWrapper<>();
        qw.eq(StringUtils.isNotBlank(purchaseDto.getProviderId()), Purchase.COL_PROVIDER_ID, purchaseDto.getProviderId());
        qw.eq(StringUtils.isNotBlank(purchaseDto.getStatus()), Purchase.COL_STATUS, purchaseDto.getStatus());
        qw.like(StringUtils.isNotBlank(purchaseDto.getApplyUserName()), Purchase.COL_APPLY_USER_NAME, purchaseDto.getApplyUserName());
        qw.orderByDesc(Purchase.COL_CREATE_TIME);
        this.purchaseMapper.selectPage(page, qw);
        return new DataGridView(page.getTotal(), page.getRecords());
    }

    @Override
    public Purchase getPurchaseById(String purchaseId) {
        return this.purchaseMapper.selectById(purchaseId);
    }

    @Override
    public int doAudit(String purchaseId, SimpleUser simpleUser) {
        // 提交审核
        Purchase purchase = this.purchaseMapper.selectById(purchaseId);
        purchase.setStatus(Constants.STOCK_PURCHASE_STATUS_2); // 设置状态为待审核
        purchase.setApplyUserName(simpleUser.getUserName());
        purchase.setApplyUserId(Long.valueOf(simpleUser.getUserId().toString()));
        return this.purchaseMapper.updateById(purchase);
    }

    @Override
    public int doInvalid(String purchaseId) {
        Purchase purchase = this.purchaseMapper.selectById(purchaseId);
        purchase.setStatus(Constants.STOCK_PURCHASE_STATUS_5); // 设置状态为作废
        return this.purchaseMapper.updateById(purchase);
    }

    @Override
    public int auditPass(String purchaseId) {
        // 审核通过
        Purchase purchase = this.purchaseMapper.selectById(purchaseId);
        purchase.setStatus(Constants.STOCK_PURCHASE_STATUS_3); // 设置状态为审核成功
        return this.purchaseMapper.updateById(purchase);
    }

    @Override
    public int auditNoPass(String purchaseId, String auditMsg) {
        // 审核不通过
        Purchase purchase = this.purchaseMapper.selectById(purchaseId);
        purchase.setStatus(Constants.STOCK_PURCHASE_STATUS_4); // 设置状态为审核失败
        purchase.setExamine(auditMsg);
        return this.purchaseMapper.updateById(purchase);
    }

    @Override
    public List<PurchaseItem> getPurchaseItemById(String purchaseId) {
        // 通过采购单据ID查询采购详情
        if(null != purchaseId) {
            QueryWrapper<PurchaseItem> qw = new QueryWrapper<>();
            qw.eq(PurchaseItem.COL_PURCHASE_ID, purchaseId);
            return this.purchaseItemMapper.selectList(qw);
        }
        return null;
    }
}
