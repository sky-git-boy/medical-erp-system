package com.sky.controller.system;

import com.sky.dto.DictDataDto;
import com.sky.service.DictDataService;
import com.sky.utils.ShiroSecurityUtils;
import com.sky.vo.AjaxResult;
import com.sky.vo.DataGridView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

/**
 * @author sky
 * @create 2021-05-23 21:59
 */
@RestController
@RequestMapping("/system/dict/data")
public class DictDataController {
    @Autowired
    private DictDataService dictDataService;

    // 分页查询
    @GetMapping("/listForPage")
    public AjaxResult listForPage(DictDataDto dictDataDto) {
        DataGridView dataGridView = dictDataService.listPage(dictDataDto);
        return AjaxResult.success("查询成功", dataGridView.getData(), dataGridView.getTotal());
    }

    // 新增字典数据
    @PostMapping("/addDictData")
    public AjaxResult addDictData(@Validated DictDataDto dictDataDto) {
        dictDataDto.setSimpleUser(ShiroSecurityUtils.getCurrentSimpleUser());
        return AjaxResult.toAjax(this.dictDataService.insert(dictDataDto));
    }

    // 修改字典数据
    @PutMapping("/updateDictData")
    public AjaxResult updateDictData(@Validated DictDataDto dictDataDto) {
        dictDataDto.setSimpleUser(ShiroSecurityUtils.getCurrentSimpleUser());
        return AjaxResult.toAjax(this.dictDataService.update(dictDataDto));
    }

    // 批量删除字典数据
    @DeleteMapping("/deleteDictDataByIds/{dictCodeIds}")
    public AjaxResult deleteDictDataByIds(@PathVariable @Validated @NotEmpty(message = "要删除的ID不能为空") Long[] dictCodeIds) {
        return AjaxResult.toAjax(this.dictDataService.deleteDictDataByIds(dictCodeIds));
    }

    // 根据字典数据ID查询字典数据
    @GetMapping("/getOne/{dictCode}")
    public AjaxResult getOne(@PathVariable @Validated @NotNull(message = "要查找的ID不能为空") Long dictCode) {
        return AjaxResult.success(this.dictDataService.selectDictDataById(dictCode));
    }

    // 通过字典类型查询字典数据【公共的】
    @GetMapping("/getDataByType/{dictType}")
    public AjaxResult getDataByType(@PathVariable @Validated @NotBlank(message = "字典类型不能为空") String dictType) {
        return AjaxResult.success(this.dictDataService.selectDictDataByDictType(dictType));
    }
}
