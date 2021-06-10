package com.sky.controller.erp;

import com.netflix.hystrix.contrib.javanica.annotation.HystrixCommand;
import com.sky.aspectj.annotation.Log;
import com.sky.aspectj.enums.BusinessType;
import com.sky.controller.BaseController;
import com.sky.dto.ProducerDto;
import com.sky.service.ProducerService;
import com.sky.utils.ShiroSecurityUtils;
import com.sky.vo.AjaxResult;
import com.sky.vo.DataGridView;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

/**
 * @author sky
 * @create 2021-06-06 14:56
 */
@RestController
@RequestMapping("erp/producer")
public class ProducerController extends BaseController {
    @Reference
    private ProducerService producerService;

    @GetMapping("listProducerForPage")
    @HystrixCommand
    public AjaxResult listProducerForPage(ProducerDto producerDto) {
        DataGridView gridView = this.producerService.listProducerPage(producerDto);
        return AjaxResult.success("查询成功", gridView.getData(), gridView.getTotal());
    }

    @PostMapping("addProducer")
    @HystrixCommand
    @Log(title = "添加生产厂家", businessType = BusinessType.INSERT)
    public AjaxResult addProducer(@Validated ProducerDto producerDto) {
        producerDto.setSimpleUser(ShiroSecurityUtils.getCurrentSimpleUser());
        return AjaxResult.toAjax(this.producerService.addProducer(producerDto));
    }

    @PutMapping("updateProducer")
    @HystrixCommand
    @Log(title = "修改生产厂家", businessType = BusinessType.UPDATE)
    public AjaxResult updateProducer(@Validated ProducerDto producerDto) {
        producerDto.setSimpleUser(ShiroSecurityUtils.getCurrentSimpleUser());
        return AjaxResult.toAjax(this.producerService.updateProducer(producerDto));
    }

    @GetMapping("getProducerById/{producerId}")
    @HystrixCommand
    public AjaxResult getProducerById(@PathVariable @Validated @NotNull(message = "生产厂家 ID 不 能为空") Long producerId) {
        return AjaxResult.success(this.producerService.getOne(producerId));
    }

    @DeleteMapping("deleteProducerByIds/{producerIds}")
    @HystrixCommand
    @Log(title = "删除生产厂家", businessType = BusinessType.DELETE)
    public AjaxResult deleteProducerByIds(@PathVariable @Validated @NotEmpty(message = "要删除的 ID 不能为空") Long[] producerIds) {
        return AjaxResult.toAjax(this.producerService.deleteProducerByIds(producerIds));
    }

    @GetMapping("selectAllProducer")
    @HystrixCommand
    public AjaxResult selectAllProducer() {
        return AjaxResult.success(this.producerService.selectAllProducer());
    }
}
