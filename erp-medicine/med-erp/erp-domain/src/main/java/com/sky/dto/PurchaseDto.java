package com.sky.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.math.BigDecimal;
import java.util.Date;

/**
 * @author sky
 * @create 2020-11-12 16:39
 */
@ApiModel(value = "com-sky-dto-PurchaseDto")
@Data
public class PurchaseDto extends BaseDto {
    /**
     * 制单号ID 全局ID雪花算法
     */
    @ApiModelProperty(value = "制单号ID 全局ID雪花算法")
    @NotBlank(message = "采购单据号不能为空")
    private String purchaseId;

    /**
     * 供应商ID
     */
    @ApiModelProperty(value = "供应商ID")
    @NotBlank(message = "供应商ID不能为空")
    private String providerId;

    /**
     * 采购批发总额
     */
    @ApiModelProperty(value = "采购批发总额")
    @NotNull(message = "采购批发总额不能为空")
    private BigDecimal purchaseTradeTotalAmount;

    /**
     * 单据状态； 1未提交2待审核 3审核通过 4审核失败 5作废 6入库成功 字典表 his_order_status
     */
    @ApiModelProperty(value = "单据状态； 1未提交2待审核 3审核通过 4审核失败 5作废 6入库成功 字典表 his_order_status")
    private String status;

    /**
     * 申请人ID
     */
    @ApiModelProperty(value = "申请人ID")
    private Long applyUserId;

    /**
     * 申请人名称
     */
    @ApiModelProperty(value = "申请人名称")
    private String applyUserName;

    /**
     * 入库操作人
     */
    @ApiModelProperty(value = "入库操作人")
    private String storageOptUser;

    /**
     * 入库操作时间
     */
    @ApiModelProperty(value = "入库操作时间")
    private Date storageOptTime;

    /**
     * 审核信息
     */
    @ApiModelProperty(value = "审核信息")
    private String examine;

}