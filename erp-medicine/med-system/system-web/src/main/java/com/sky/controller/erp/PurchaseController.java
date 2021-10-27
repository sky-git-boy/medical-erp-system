package com.sky.controller.erp;

import com.netflix.hystrix.contrib.javanica.annotation.HystrixCommand;
import com.sky.aspectj.annotation.Log;
import com.sky.aspectj.enums.BusinessType;
import com.sky.constants.Constants;
import com.sky.controller.BaseController;
import com.sky.domain.Purchase;
import com.sky.domain.PurchaseItem;
import com.sky.dto.PurchaseDto;
import com.sky.dto.PurchaseFormDto;
import com.sky.service.PurchaseService;
import com.sky.utils.IdGeneratorSnowflake;
import com.sky.utils.ShiroSecurityUtils;
import com.sky.vo.AjaxResult;
import com.sky.vo.DataGridView;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 消费者
 * @author sky
 * @create 2021-05-25 10:01
 */
@RestController
@RequestMapping("erp/purchase")
public class PurchaseController extends BaseController {

    @Reference //使用 dubbo 的引用
    private PurchaseService purchaseService;

    /**
     * 分页查询
     */
    @GetMapping("listPurchaseForPage")
    @HystrixCommand
    public AjaxResult listPurchaseForPage(PurchaseDto purchaseDto){
        DataGridView gridView = this.purchaseService.listPurchasePage(purchaseDto);
        return AjaxResult.success("查询成功",gridView.getData(),gridView.getTotal());
    }

    /**
     * 分页查询所有待审核的入库信息
     */
    @GetMapping("listPurchasePendingForPage")
    @HystrixCommand
    public AjaxResult listPurchasePendingForPage(PurchaseDto purchaseDto){
        purchaseDto.setStatus(Constants.STOCK_PURCHASE_STATUS_2);
        DataGridView gridView = this.purchaseService.listPurchasePendingForPage(purchaseDto);
        return AjaxResult.success("查询成功",gridView.getData(),gridView.getTotal());
    }

    /**
     * 提交审核【根据采购单号】
     * 什么条件下可以提交审核
     * 只有在【未提交】或【审核失败】状态下才能提交审核
     */
    @PostMapping("doAudit/{purchaseId}")
    @HystrixCommand
    @Log(title = "采购单管理--提交审核", businessType = BusinessType.UPDATE)
    public AjaxResult doAudit(@PathVariable String purchaseId) {
        // 根据 purchaseId 查询单据对象
        Purchase purchase = this.purchaseService.getPurchaseById(purchaseId);
        // 判断单据状态
        if(purchase.getStatus().equals(Constants.STOCK_PURCHASE_STATUS_1)||purchase.getStatus().equals(Constants.STOCK_PURCHASE_STATUS_4)) {
            int i = this.purchaseService.doAudit(purchaseId, ShiroSecurityUtils.getCurrentSimpleUser());
            return AjaxResult.toAjax(i);
        }else {
            return AjaxResult.fail("当前单据不是【未提交】或【审核失败】状态，不能提交审核");
        }
    }

    /**
     * 作废【根据采购单号】
     * 什么条件下可以作废
     * 只有在【未提交】或【审核失败】状态下才能作废单据
     */
    @PostMapping("doInvalid/{purchaseId}")
    @HystrixCommand
    @Log(title = "采购单管理--作废", businessType = BusinessType.UPDATE)
    public AjaxResult doInvalid(@PathVariable String purchaseId) {
        // 根据 purchaseId 查询单据对象
        Purchase purchase = this.purchaseService.getPurchaseById(purchaseId);
        // 判断单据状态
        if(purchase.getStatus().equals(Constants.STOCK_PURCHASE_STATUS_1)||purchase.getStatus().equals(Constants.STOCK_PURCHASE_STATUS_4)) {
            int i = this.purchaseService.doInvalid(purchaseId);
            return AjaxResult.toAjax(i);
        }else {
            return AjaxResult.fail("当前单据不是【未提交】或【审核失败】状态，不能作废");
        }
    }

    /**
     * 审核通过【根据采购订单号】
     * 采购单在什么状态下才能进行审核通过
     * 只有在【待审核】状态下才能进行审核通过
     */
    @PostMapping("auditPass/{purchaseId}")
    @HystrixCommand
    @Log(title = "采购单管理--审核通过", businessType = BusinessType.UPDATE)
    public AjaxResult auditPass(@PathVariable String purchaseId) {
        // 根据 purchaseId 查询单据
        Purchase purchase = this.purchaseService.getPurchaseById(purchaseId);
        // 判断单据状态
        if(purchase.getStatus().equals(Constants.STOCK_PURCHASE_STATUS_2)) {
            int i = this.purchaseService.auditPass(purchaseId);
            return AjaxResult.toAjax(i);
        }else {
            return AjaxResult.fail("当前单据不是【待审核】状态，不能进行审核通过");
        }
    }

    /**
     * 审核不通过【根据采购订单号】
     * 采购单在什么状态下才能进行审核不通过
     * 只有在【待审核】状态下才能进行审核不通过
     */
    @PostMapping("auditNoPass/{purchaseId}/{auditMsg}")
    @HystrixCommand
    @Log(title = "采购单管理--审核不通过", businessType = BusinessType.UPDATE)
    public AjaxResult auditNoPass(@PathVariable String purchaseId, @PathVariable String auditMsg) {
        // 根据 purchaseId 查询单据
        Purchase purchase = this.purchaseService.getPurchaseById(purchaseId);
        // 判断单据状态
        if(purchase.getStatus().equals(Constants.STOCK_PURCHASE_STATUS_2)) {
            int i = this.purchaseService.auditNoPass(purchaseId, auditMsg);
            return AjaxResult.toAjax(i);
        }else {
            return AjaxResult.fail("当前单据不是【待审核】状态，不能进行审核不通过");
        }
    }

    /**
     * 根据ID查询一个采购信息详情
     */
    @GetMapping("getPurchaseItemById/{purchaseId}")
    @HystrixCommand
    public AjaxResult getPurchaseItemById(@PathVariable String purchaseId){
        List<PurchaseItem> list = this.purchaseService.getPurchaseItemById(purchaseId);
        return AjaxResult.success(list);
    }

    /**
     * 生成单据号
     */
    @GetMapping("generatePurchaseId")
    public AjaxResult generatePurchaseId() {
        return AjaxResult.success(IdGeneratorSnowflake.generatorIdWithProfix(Constants.ID_PREFIX_CG));
    }

    /**
     * 暂存采购单数据
     */
    @PostMapping("addPurchase")
    @Log(title = "采购单管理--暂存采购单位和详情数据", businessType = BusinessType.INSERT)
    public AjaxResult addPurchase(@RequestBody PurchaseFormDto purchaseFormDto) {
        // 判断当前采购单的状态
        if (checkPurchase(purchaseFormDto)) {
            return AjaxResult.fail("当前单据状态不是【未提交】或【审核失败】状态，不能进行修改");
        }
        purchaseFormDto.getPurchaseDto().setSimpleUser(ShiroSecurityUtils.getCurrentSimpleUser());
        return AjaxResult.toAjax(this.purchaseService.addPurchaseAndItem(purchaseFormDto));
    }

    /**
     * 保存并提交审核采购单数据和详情
     */
    @PostMapping("addPurchaseToAudit")
    @Log(title = "采购单管理--添加并提交审核采购单位和详情数据", businessType = BusinessType.INSERT)
    public AjaxResult addPurchaseToAudit(@RequestBody PurchaseFormDto purchaseFormDto) {
        // 判断当前采购单的状态
        if (checkPurchase(purchaseFormDto)) {
            return AjaxResult.fail("当前单据状态不是【未提交】或【审核失败】状态，不能进行修改");
        }
        purchaseFormDto.getPurchaseDto().setSimpleUser(ShiroSecurityUtils.getCurrentSimpleUser());
        return AjaxResult.toAjax(this.purchaseService.addPurchaseAndItemToAudit(purchaseFormDto));
    }

    /**
     * 公共验证采购单的方法
     */
    private boolean checkPurchase(PurchaseFormDto purchaseFormDto) {
        String purchaseId = purchaseFormDto.getPurchaseDto().getPurchaseId();
        // 通过 ID 获取采购单对象
        Purchase purchase = this.purchaseService.getPurchaseById(purchaseId);
        // 判断 ID 在数据库里面是否存在，如果存在，说明是再次暂存
        if(null == purchase) {
            return false;
        }
        // 采购单的状态为【未提交】或【审核失败】返回 false
        return !purchase.getStatus().equals(Constants.STOCK_PURCHASE_STATUS_1)
                && !purchase.getStatus().equals(Constants.STOCK_PURCHASE_STATUS_4);
    }

    /**
     * 根据采购单号查询采购单信息和详情信息
     */
    @GetMapping("queryPurchaseAndItemByPurchaseId/{purchaseId}")
    public AjaxResult queryPurchaseAndItemByPurchaseId(@PathVariable String purchaseId) {
        Purchase purchase = this.purchaseService.getPurchaseById(purchaseId);
        if(null == purchase) {
            return AjaxResult.fail("单据号【" + purchaseId + "】不存在");
        }
        // 查询详情
        List<PurchaseItem> items = this.purchaseService.getPurchaseItemById(purchaseId);
        Map<String, Object> res = new HashMap<>();
        res.put("purchase", purchase);
        res.put("items", items);
        return AjaxResult.success(res);
    }

    /**
     * 入库
     * 只有在【审核通过】状态下，才能入库
     */
    @PostMapping("doInventory/{purchaseId}")
    @Log(title = "采购单管理--入库", businessType = BusinessType.UPDATE)
    public AjaxResult doInventory(@PathVariable String purchaseId) {
        Purchase purchase = this.purchaseService.getPurchaseById(purchaseId);
        if(purchase.getStatus().equals(Constants.STOCK_PURCHASE_STATUS_3)) {
            // 如果采购单状态为【审核通过】
            // 则进行入库
            return AjaxResult.toAjax(this.purchaseService.doInventory(purchaseId, ShiroSecurityUtils.getCurrentSimpleUser()));
        }else if (purchase.getStatus().equals(Constants.STOCK_PURCHASE_STATUS_6)) {
            // 如果采购单状态为【入库成功】
            return AjaxResult.fail("采购单【" + purchaseId + "】已入库，不能重复入库");
        } else {
            return AjaxResult.fail("采购单【" + purchaseId + "】没有审核通过，不能入库");
        }
    }
}
