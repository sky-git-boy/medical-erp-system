package com.sky.dto;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
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
import java.util.Date;

/**
 * @author sky
 * @create 2021-05-24 22:14
 */
@ApiModel(value = "com-sky-dto-RegisteredItemDto")
@Data
@EqualsAndHashCode(callSuper = true)
@AllArgsConstructor
@NoArgsConstructor
public class RegisteredItemDto extends BaseDto {
    /**
     * 挂号项ID
     */
    @ApiModelProperty(value = "挂号项ID")
    private Long regItemId;

    /**
     * 挂号项目名称
     */
    @NotBlank(message = "挂号项目名称不能为空")
    @ApiModelProperty(value="挂号项目名称")
    private String regItemName;

    /**
     * 金额
     */
    @NotNull(message = "挂号项目金额不能为空")
    @ApiModelProperty(value="金额")
    private BigDecimal regItemFee;

    /**
     * 状态（0正常 1停用）
     */
    @NotBlank(message = "挂号项目状态不能为空")
    @ApiModelProperty(value="状态（0正常 1停用）")
    private String status;

}