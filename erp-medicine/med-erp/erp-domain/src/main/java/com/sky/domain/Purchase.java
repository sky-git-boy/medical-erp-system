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
 * @create 2021-06-15 8:43
 */
@ApiModel(value = "com-sky-domain-Purchase")
@Data
@EqualsAndHashCode(callSuper = true)
@AllArgsConstructor
@NoArgsConstructor
@TableName(value = "stock_purchase")
public class Purchase extends BaseEntity {
    /**
     * 制单号ID 全局ID雪花算法
     */
    @TableId(value = "purchase_id", type = IdType.INPUT)
    @ApiModelProperty(value = "制单号ID 全局ID雪花算法")
    private String purchaseId;

    /**
     * 供应商ID
     */
    @TableField(value = "provider_id")
    @ApiModelProperty(value = "供应商ID")
    private String providerId;

    /**
     * 采购批发总额
     */
    @TableField(value = "purchase_trade_total_amount")
    @ApiModelProperty(value = "采购批发总额")
    private BigDecimal purchaseTradeTotalAmount;

    /**
     * 单据状态； 1未提交2待审核 3审核通过 4审核失败 5作废 6入库成功 字典表 his_order_status
     */
    @TableField(value = "status")
    @ApiModelProperty(value = "单据状态； 1未提交2待审核 3审核通过 4审核失败 5作废 6入库成功 字典表 his_order_status")
    private String status;

    /**
     * 申请人ID
     */
    @TableField(value = "apply_user_id")
    @ApiModelProperty(value = "申请人ID")
    private Long applyUserId;

    /**
     * 申请人名称
     */
    @TableField(value = "apply_user_name")
    @ApiModelProperty(value = "申请人名称")
    private String applyUserName;

    /**
     * 入库操作人
     */
    @TableField(value = "storage_opt_user")
    @ApiModelProperty(value = "入库操作人")
    private String storageOptUser;

    /**
     * 入库操作时间
     */
    @TableField(value = "storage_opt_time")
    @ApiModelProperty(value = "入库操作时间")
    private Date storageOptTime;

    /**
     * 创建时间
     */
    @TableField(value = "create_time")
    @ApiModelProperty(value = "创建时间")
    private Date createTime;

    /**
     * 更新时间
     */
    @TableField(value = "update_time")
    @ApiModelProperty(value = "更新时间")
    private Date updateTime;

    /**
     * 创建者
     */
    @TableField(value = "create_by")
    @ApiModelProperty(value = "创建者")
    private String createBy;

    /**
     * 更新者
     */
    @TableField(value = "update_by")
    @ApiModelProperty(value = "更新者")
    private String updateBy;

    /**
     * 审核信息
     */
    @TableField(value = "examine")
    @ApiModelProperty(value = "审核信息")
    private String examine;

    public static final String COL_PURCHASE_ID = "purchase_id";

    public static final String COL_PROVIDER_ID = "provider_id";

    public static final String COL_PURCHASE_TRADE_TOTAL_AMOUNT = "purchase_trade_total_amount";

    public static final String COL_STATUS = "status";

    public static final String COL_APPLY_USER_ID = "apply_user_id";

    public static final String COL_APPLY_USER_NAME = "apply_user_name";

    public static final String COL_STORAGE_OPT_USER = "storage_opt_user";

    public static final String COL_STORAGE_OPT_TIME = "storage_opt_time";

    public static final String COL_CREATE_TIME = "create_time";

    public static final String COL_UPDATE_TIME = "update_time";

    public static final String COL_CREATE_BY = "create_by";

    public static final String COL_UPDATE_BY = "update_by";

    public static final String COL_EXAMINE = "examine";
}