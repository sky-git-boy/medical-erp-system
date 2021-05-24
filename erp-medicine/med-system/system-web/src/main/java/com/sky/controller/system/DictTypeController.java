package com.sky.controller.system;

import com.sky.dto.DictTypeDto;
import com.sky.service.DictTypeService;
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
 * @create 2021-05-23 20:06
 */
@RestController
@RequestMapping("system/dict/type")
public class DictTypeController {
    @Autowired
    private DictTypeService dictTypeService;

    // 分页查询字典类型
    @GetMapping("/listForPage")
    public AjaxResult listForPage(DictTypeDto dictTypeDto) {
        DataGridView dataGridView = dictTypeService.listPage(dictTypeDto);
        return AjaxResult.success("查询成功", dataGridView.getData(), dataGridView.getTotal());
    }

    // 新增字典类型
    @PostMapping("/addDictType")
    public AjaxResult addDictType(@Validated DictTypeDto dictTypeDto) {
        if(dictTypeService.checkDictTypeUnique(dictTypeDto.getDictId(), dictTypeDto.getDictType())) {
            return AjaxResult.fail("新增字典【" + dictTypeDto.getDictName() + "】失败，字典类型已存在");
        }
        dictTypeDto.setSimpleUser(ShiroSecurityUtils.getCurrentSimpleUser());
        return AjaxResult.toAjax(dictTypeService.insert(dictTypeDto));
    }

    // 根据字典类型ID查询一个字典信息
    @GetMapping("/getOne/{dictId}")
    public AjaxResult getOne(@PathVariable @Validated @NotNull(message = "要查找的ID不能为空") Long dictId) {
        return AjaxResult.success(this.dictTypeService.selectDictTypeById(dictId));
    }

    // 更新字典类型数据
    @PutMapping("/updateDictType")
    public AjaxResult updateDictType(@Validated DictTypeDto dictTypeDto) {
        if(dictTypeService.checkDictTypeUnique(dictTypeDto.getDictId(), dictTypeDto.getDictType())) {
            return AjaxResult.fail("修改字典【" + dictTypeDto.getDictName() + "】失败，字典类型已存在");
        }
        dictTypeDto.setSimpleUser(ShiroSecurityUtils.getCurrentSimpleUser());
        return AjaxResult.toAjax(this.dictTypeService.update(dictTypeDto));
    }

    // 删除字典类型
    @DeleteMapping("/deleteDictTypeByIds/{dictIds}")
    public AjaxResult deleteDictTypeByIds(@PathVariable @Validated @NotEmpty(message = "要删除的ID不能为空") Long[] dictIds) {
        return AjaxResult.toAjax(this.dictTypeService.deleteDictTypeByIds(dictIds));
    }

    // 查询所有字典类型数据
    @GetMapping("selectAllDictType")
    public AjaxResult selectAllDictType() {
        return AjaxResult.success(this.dictTypeService.list().getData());
    }

    // 字典缓存同步 (待完善)

}
