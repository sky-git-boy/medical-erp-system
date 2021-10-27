package com.sky.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @author sky
 * @create 2020-11-13 20:56
 */
@ApiModel(value = "com-sky-domain-InventoryLog")
@Data
public class InventoryLogDto extends BaseDto {

    /**
     * 采购单据ID
     */
    @ApiModelProperty(value = "采购单据ID")
    private String purchaseId;

    /**
     * 药品名称
     */
    @ApiModelProperty(value = "药品名称")
    private String medicinesName;

    /**
     * 药品分类 sys_dict_data表his_medicines_type
     */
    @ApiModelProperty(value = "药品分类 sys_dict_data表his_medicines_type")
    private String medicinesType;

    /**
     * 处方类型 sys_dict_data表his_prescription_type
     */
    @ApiModelProperty(value = "处方类型 sys_dict_data表his_prescription_type")
    private String prescriptionType;

    /**
     * 生产厂家ID
     */
    @ApiModelProperty(value = "生产厂家ID")
    private String producerId;

}