package com.sky.dto;

import io.swagger.annotations.ApiModel;
import lombok.Data;

import java.util.List;

/**
 * @author sky
 * @create 2020-11-13 16:56
 */
@ApiModel(value = "com-sky-dto-PurchaseFormDto")
@Data
public class PurchaseFormDto extends BaseDto {

    //存放采购单主表数据
    private PurchaseDto purchaseDto;

    //存放采购单详情数据
    private List<PurchaseItemDto> purchaseItemDtos;

}
