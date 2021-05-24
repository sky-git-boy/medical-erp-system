package com.sky.controller.system;

import com.sky.aspectj.annotation.Log;
import com.sky.aspectj.enums.BusinessType;
import com.sky.dto.RegisteredItemDto;
import com.sky.service.RegisteredItemService;
import com.sky.utils.ShiroSecurityUtils;
import com.sky.vo.AjaxResult;
import com.sky.vo.DataGridView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

/**
 * @author sky
 * @create 2021-05-24 21:56
 */
@RestController
@RequestMapping("system/registeredItem")
public class RegisteredItemController {

    @Autowired
    private RegisteredItemService registeredItemService;

    /**
     * 分页查询
     */
    @GetMapping("listRegisteredItemForPage")
    public AjaxResult listRegisteredItemForPage(RegisteredItemDto registeredItemDto){
        DataGridView gridView = this.registeredItemService.listRegisteredItemPage(registeredItemDto);
        return AjaxResult.success("查询成功",gridView.getData(),gridView.getTotal());
    }
    /**
     * 添加
     */
    @PostMapping("addRegisteredItem")
    @Log(title = "添加挂号费用", businessType = BusinessType.INSERT)
    public AjaxResult addRegisteredItem(@Validated RegisteredItemDto registeredItemDto) {
        registeredItemDto.setSimpleUser(ShiroSecurityUtils.getCurrentSimpleUser());
        return AjaxResult.toAjax(this.registeredItemService.addRegisteredItem(registeredItemDto));
    }

    /**
     * 修改
     */
    @PutMapping("updateRegisteredItem")
    @Log(title = "修改挂号费用", businessType = BusinessType.UPDATE)
    public AjaxResult updateRegisteredItem(@Validated RegisteredItemDto registeredItemDto) {
        registeredItemDto.setSimpleUser(ShiroSecurityUtils.getCurrentSimpleUser());
        return AjaxResult.toAjax(this.registeredItemService.updateRegisteredItem(registeredItemDto));
    }


    /**
     * 根据ID查询一个挂号费用信息
     */
    @GetMapping("getRegisteredItemById/{registeredItemId}")
    public AjaxResult getRegisteredItemById(@PathVariable @Validated @NotNull(message = "挂号费用ID不能为空") Long registeredItemId) {
        return AjaxResult.success(this.registeredItemService.getOne(registeredItemId));
    }

    /**
     * 删除
     */
    @DeleteMapping("deleteRegisteredItemByIds/{registeredItemIds}")
    @Log(title = "删除挂号费用", businessType = BusinessType.DELETE)
    public AjaxResult deleteRegisteredItemByIds(@PathVariable @Validated @NotEmpty(message = "要删除的ID不能为空") Long[] registeredItemIds) {
        return AjaxResult.toAjax(this.registeredItemService.deleteRegisteredItemByIds(registeredItemIds));
    }

    /**
     * 查询所有可用的挂号费用
     */
    @GetMapping("selectAllRegisteredItem")
    public AjaxResult selectAllRegisteredItem() {
        return AjaxResult.success(this.registeredItemService.selectAllRegisteredItem());
    }

}
