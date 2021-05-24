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
@author sky
@create 2021-05-24 22:14
*/
@ApiModel(value="com-sky-domain-RegisteredItem")
@Data
@EqualsAndHashCode(callSuper=true)
@AllArgsConstructor
@NoArgsConstructor
@TableName(value = "sys_registered_item")
public class RegisteredItem extends BaseEntity {
    /**
     * 挂号项ID
     */
    @TableId(value = "reg_item_id", type = IdType.AUTO)
    @ApiModelProperty(value="挂号项ID")
    private Long regItemId;

    /**
     * 挂号项目名称
     */
    @TableField(value = "reg_item_name")
    @ApiModelProperty(value="挂号项目名称")
    private String regItemName;

    /**
     * 金额
     */
    @TableField(value = "reg_item_fee")
    @ApiModelProperty(value="金额")
    private BigDecimal regItemFee;

    /**
     * 创建时间
     */
    @TableField(value = "create_time")
    @ApiModelProperty(value="创建时间")
    private Date createTime;

    /**
     * 更新时间
     */
    @TableField(value = "update_time")
    @ApiModelProperty(value="更新时间")
    private Date updateTime;

    /**
     * 创建者
     */
    @TableField(value = "create_by")
    @ApiModelProperty(value="创建者")
    private String createBy;

    /**
     * 更新者
     */
    @TableField(value = "update_by")
    @ApiModelProperty(value="更新者")
    private String updateBy;

    /**
     * 状态（0正常 1停用）
     */
    @TableField(value = "status")
    @ApiModelProperty(value="状态（0正常 1停用）")
    private String status;

    /**
     * 删除标志（0正常 1删除）
     */
    @TableField(value = "del_flag")
    @ApiModelProperty(value="删除标志（0正常 1删除）")
    private String delFlag;

    public static final String COL_REG_ITEM_ID = "reg_item_id";

    public static final String COL_REG_ITEM_NAME = "reg_item_name";

    public static final String COL_REG_ITEM_FEE = "reg_item_fee";

    public static final String COL_CREATE_TIME = "create_time";

    public static final String COL_UPDATE_TIME = "update_time";

    public static final String COL_CREATE_BY = "create_by";

    public static final String COL_UPDATE_BY = "update_by";

    public static final String COL_STATUS = "status";

    public static final String COL_DEL_FLAG = "del_flag";
}