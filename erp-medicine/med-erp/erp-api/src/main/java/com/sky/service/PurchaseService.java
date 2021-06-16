package com.sky.service;

import com.sky.domain.Purchase;
import com.sky.domain.PurchaseItem;
import com.sky.domain.SimpleUser;
import com.sky.dto.PurchaseDto;
import com.sky.vo.DataGridView;

import java.util.List;

/**
 * @author sky
 * @create 2021-06-15 8:43
 */
public interface PurchaseService {

    /**
     * 分页查询
     */
    DataGridView listPurchasePage(PurchaseDto purchaseDto);

    /**
     * 根据采购单据号查询单据信息
     */
    Purchase getPurchaseById(String purchaseId);

    /**
     * 提交 审核
     */
    int doAudit(String purchaseId, SimpleUser simpleUser);

    /**
     * 作废
     */
    int doInvalid(String purchaseId);

    /**
     * 审核通过
     */
    int auditPass(String purchaseId);

    /**
     * 审核不通过
     */
    int auditNoPass(String purchaseId, String auditMsg);

    /**
     * 根据ID查询一个采购信息详情
     */
    List<PurchaseItem> getPurchaseItemById(String purchaseId);
    
}
