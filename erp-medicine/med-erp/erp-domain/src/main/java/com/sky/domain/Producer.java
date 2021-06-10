package com.sky.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * @author sky
 * @create 2021-06-05 21:26
 * 生产厂家表
 */
@ApiModel(value = "com-sky-domain-Producer")
@Data
@EqualsAndHashCode(callSuper = true)
@AllArgsConstructor
@NoArgsConstructor
@TableName(value = "stock_producer")
public class Producer extends BaseEntity {
    /**
     * 厂家ID
     */
    @TableId(value = "producer_id", type = IdType.AUTO)
    @ApiModelProperty(value = "厂家ID")
    private Long producerId;

    /**
     * 厂家名称
     */
    @TableField(value = "producer_name")
    @ApiModelProperty(value = "厂家名称")
    private String producerName;

    /**
     * 厂家简码 搜索用
     */
    @TableField(value = "producer_code")
    @ApiModelProperty(value = "厂家简码 搜索用")
    private String producerCode;

    /**
     * 厂家地址 
     */
    @TableField(value = "producer_address")
    @ApiModelProperty(value = "厂家地址 ")
    private String producerAddress;

    /**
     * 厂家电话
     */
    @TableField(value = "producer_tel")
    @ApiModelProperty(value = "厂家电话")
    private String producerTel;

    /**
     * 联系人
     */
    @TableField(value = "producer_person")
    @ApiModelProperty(value = "联系人")
    private String producerPerson;

    /**
     * 关键字
     */
    @TableField(value = "keywords")
    @ApiModelProperty(value = "关键字")
    private String keywords;

    /**
     * 状态标志（0正常 1停用）sys_normal_disable
     */
    @TableField(value = "status")
    @ApiModelProperty(value = "状态标志（0正常 1停用）sys_normal_disable")
    private String status;

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

    public static final String COL_PRODUCER_ID = "producer_id";

    public static final String COL_PRODUCER_NAME = "producer_name";

    public static final String COL_PRODUCER_CODE = "producer_code";

    public static final String COL_PRODUCER_ADDRESS = "producer_address";

    public static final String COL_PRODUCER_TEL = "producer_tel";

    public static final String COL_PRODUCER_PERSON = "producer_person";

    public static final String COL_KEYWORDS = "keywords";

    public static final String COL_STATUS = "status";

    public static final String COL_CREATE_TIME = "create_time";

    public static final String COL_UPDATE_TIME = "update_time";

    public static final String COL_CREATE_BY = "create_by";

    public static final String COL_UPDATE_BY = "update_by";
}