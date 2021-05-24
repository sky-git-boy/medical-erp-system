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

/**
 * @author sky
 * @create 2021-05-24 21:18
 */
@ApiModel(value = "com-sky-dto-DeptDto")
@Data
@EqualsAndHashCode(callSuper = true)
@AllArgsConstructor
@NoArgsConstructor
public class DeptDto extends BaseDto {
    /**
     * 部门科室id
     */
    @ApiModelProperty(value="部门科室id")
    private Long deptId;

    /**
     * 部门名称
     */
    @NotBlank(message = "科室名称不能为空")
    @ApiModelProperty(value="部门名称")
    private String deptName;

    /**
     * 挂号编号
     */
    @NotBlank(message = "挂号编号不能为空")
    @ApiModelProperty(value="挂号编号")
    private Integer regNumber;

    /**
     * 科室编号
     */
    @NotBlank(message = "科室编号不能为空")
    @ApiModelProperty(value="科室编号")
    private String deptNumber;

    /**
     * 显示顺序
     */
    @NotNull(message = "科室顺序不能为空")
    @ApiModelProperty(value="显示顺序")
    private Integer orderNum;

    /**
     * 负责人
     */
    @ApiModelProperty(value="负责人")
    private String deptLeader;

    /**
     * 联系电话
     */
    @ApiModelProperty(value="联系电话")
    private String leaderPhone;

    /**
     * 部门状态（0正常 1停用）
     */
    @NotBlank(message = "科室状态不能为空")
    @ApiModelProperty(value="部门状态（0正常 1停用）")
    private String status;

}