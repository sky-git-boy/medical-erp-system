package com.sky.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import java.math.BigDecimal;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * @author sky
 * @create 2021-06-16 10:18
 */
@ApiModel(value = "com-sky-domain-InventoryLog")
@Data
@EqualsAndHashCode(callSuper = true)
@AllArgsConstructor
@NoArgsConstructor
@TableName(value = "stock_inventory_log")
public class InventoryLog extends BaseEntity {
    /**
     * 入库ID
     */
    @TableId(value = "inventory_log_id", type = IdType.INPUT)
    @ApiModelProperty(value = "入库ID")
    private String inventoryLogId;

    /**
     * 采购单据ID
     */
    @TableField(value = "purchase_id")
    @ApiModelProperty(value = "采购单据ID")
    private String purchaseId;

    /**
     * 药品ID
     */
    @TableField(value = "medicines_id")
    @ApiModelProperty(value = "药品ID")
    private Long medicinesId;

    /**
     * 入库数量
     */
    @TableField(value = "inventory_log_num")
    @ApiModelProperty(value = "入库数量")
    private Integer inventoryLogNum;

    /**
     * 批发价
     */
    @TableField(value = "trade_price")
    @ApiModelProperty(value = "批发价")
    private BigDecimal tradePrice;

    /**
     * 处方价
     */
    @TableField(value = "prescription_price")
    @ApiModelProperty(value = "处方价")
    private BigDecimal prescriptionPrice;

    /**
     * 批发额
     */
    @TableField(value = "trade_total_amount")
    @ApiModelProperty(value = "批发额")
    private BigDecimal tradeTotalAmount;

    /**
     * 处方额
     */
    @TableField(value = "prescription_total_amount")
    @ApiModelProperty(value = "处方额")
    private BigDecimal prescriptionTotalAmount;

    /**
     * 药品生产批次号
     */
    @TableField(value = "batch_number")
    @ApiModelProperty(value = "药品生产批次号")
    private String batchNumber;

    /**
     * 药品名称
     */
    @TableField(value = "medicines_name")
    @ApiModelProperty(value = "药品名称")
    private String medicinesName;

    /**
     * 药品分类 sys_dict_data表his_medicines_type
     */
    @TableField(value = "medicines_type")
    @ApiModelProperty(value = "药品分类 sys_dict_data表his_medicines_type")
    private String medicinesType;

    /**
     * 处方类型 sys_dict_data表his_prescription_type
     */
    @TableField(value = "prescription_type")
    @ApiModelProperty(value = "处方类型 sys_dict_data表his_prescription_type")
    private String prescriptionType;

    /**
     * 生产厂家ID
     */
    @TableField(value = "producer_id")
    @ApiModelProperty(value = "生产厂家ID")
    private Long producerId;

    /**
     * 换算量
     */
    @TableField(value = "conversion")
    @ApiModelProperty(value = "换算量")
    private Integer conversion;

    /**
     * 单位（g/条）
     */
    @TableField(value = "unit")
    @ApiModelProperty(value = "单位（g/条）")
    private String unit;

    /**
     * 供应商ID
     */
    @TableField(value = "provider_id")
    @ApiModelProperty(value = "供应商ID")
    private Long providerId;

    /**
     * 创建时间
     */
    @TableField(value = "create_time")
    @ApiModelProperty(value = "创建时间")
    private Date createTime;

    /**
     * 创建者
     */
    @TableField(value = "create_by")
    @ApiModelProperty(value = "创建者")
    private String createBy;

    public static final String COL_INVENTORY_LOG_ID = "inventory_log_id";

    public static final String COL_PURCHASE_ID = "purchase_id";

    public static final String COL_MEDICINES_ID = "medicines_id";

    public static final String COL_INVENTORY_LOG_NUM = "inventory_log_num";

    public static final String COL_TRADE_PRICE = "trade_price";

    public static final String COL_PRESCRIPTION_PRICE = "prescription_price";

    public static final String COL_TRADE_TOTAL_AMOUNT = "trade_total_amount";

    public static final String COL_PRESCRIPTION_TOTAL_AMOUNT = "prescription_total_amount";

    public static final String COL_BATCH_NUMBER = "batch_number";

    public static final String COL_MEDICINES_NAME = "medicines_name";

    public static final String COL_MEDICINES_TYPE = "medicines_type";

    public static final String COL_PRESCRIPTION_TYPE = "prescription_type";

    public static final String COL_PRODUCER_ID = "producer_id";

    public static final String COL_CONVERSION = "conversion";

    public static final String COL_UNIT = "unit";

    public static final String COL_PROVIDER_ID = "provider_id";

    public static final String COL_CREATE_TIME = "create_time";

    public static final String COL_CREATE_BY = "create_by";
}