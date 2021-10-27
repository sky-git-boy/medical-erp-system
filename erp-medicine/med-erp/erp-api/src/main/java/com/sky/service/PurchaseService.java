package com.sky.service;

import com.sky.domain.Purchase;
import com.sky.domain.PurchaseItem;
import com.sky.domain.SimpleUser;
import com.sky.dto.PurchaseDto;
import com.sky.dto.PurchaseFormDto;
import com.sky.vo.DataGridView;

import java.util.List;

/**
 * @author sky
 * @create 2020-11-12 16:39
 */
public interface PurchaseService {

    /**
     * 分页查询
     */
    DataGridView listPurchasePage(PurchaseDto purchaseDto);

    /**
     * 根据 purchaseId 查询一个单据
     */
    Purchase getPurchaseById(String purchaseId);

    /**
     * 根据 purchaseId 查询一个采购信息详情
     */
    List<PurchaseItem> getPurchaseItemById(String purchaseId);

    /**
     * 提交单据
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
    int auditNoPass(String purchaseId, String examine);

    /**
     * 分页查询所有待审核的入库信息
     */
    DataGridView listPurchasePendingForPage(PurchaseDto purchaseDto);

    /**
     * 暂存采购单数据
     */
    int addPurchaseAndItem(PurchaseFormDto purchaseFormDto);

    /**
     * 保存并提交审核采购单数据和详情
     */
    int addPurchaseAndItemToAudit(PurchaseFormDto purchaseFormDto);

    /**
     * 入库
     */
    int doInventory(String purchaseId, SimpleUser currentSimpleUser);
}
