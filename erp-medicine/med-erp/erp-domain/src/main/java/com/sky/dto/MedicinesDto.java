package com.sky.dto;

import com.sky.domain.BaseEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.math.BigDecimal;

/**
 * @author sky
 * @create 2021-06-14 20:33
 * 药品信息表
 */
@ApiModel(value = "com-sky-dto-MedicinesSto")
@Data
@EqualsAndHashCode(callSuper = true)
@AllArgsConstructor
@NoArgsConstructor
public class MedicinesDto extends BaseDto {
    /**
     * 药品ID
     */
    @ApiModelProperty(value = "药品ID")
    private Long medicinesId;

    /**
     * 药品编号
     */
    @NotBlank(message = "药品编号不能为空")
    @ApiModelProperty(value = "药品编号")
    private String medicinesNumber;

    /**
     * 药品名称
     */
    @NotBlank(message = "药品名称不能为空")
    @ApiModelProperty(value = "药品名称")
    private String medicinesName;

    /**
     * 药品分类 sys_dict_data表his_medicines_type
     */
    @NotBlank(message = "药品分类不能为空")
    @ApiModelProperty(value = "药品分类 sys_dict_data表his_medicines_type")
    private String medicinesType;

    /**
     * 处方类型 sys_dict_data表his_prescription_type
     */
    @NotBlank(message = "处方类型不能为空")
    @ApiModelProperty(value = "处方类型 sys_dict_data表his_prescription_type")
    private String prescriptionType;

    /**
     * 处方价格
     */
    @NotNull(message = "处方价格不能为空")
    @ApiModelProperty(value = "处方价格")
    private BigDecimal prescriptionPrice;

    /**
     * 单位（g/条）
     */
    @ApiModelProperty(value = "单位（g/条）")
    private String unit;

    /**
     * 换算量
     */
    @ApiModelProperty(value = "换算量")
    private Integer conversion;

    /**
     * 关键字
     */
    @NotBlank(message = "关键字不能为空")
    @ApiModelProperty(value = "关键字")
    private String keywords;

    /**
     * 生产厂家ID
     */
    @NotBlank(message = "生产厂家不能为空")
    @ApiModelProperty(value = "生产厂家ID")
    private String producerId;

    /**
     * 药品状态0正常0停用 sys_dict_data表 sys_normal_disable
     */
    @NotBlank(message = "药品状态0不能为空")
    @ApiModelProperty(value = "药品状态0正常0停用 sys_dict_data表 sys_normal_disable")
    private String status;

    /**
     * 库存量
     */
    @NotNull(message = "库存量不能为空")
    @ApiModelProperty(value = "库存量")
    private Long medicinesStockNum;

    /**
     * 预警值
     */
    @NotNull(message = "预警值不能为空")
    @ApiModelProperty(value = "预警值")
    private Long medicinesStockDangerNum;

}