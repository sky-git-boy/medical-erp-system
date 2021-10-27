package com.sky.service;

import com.sky.dto.InventoryLogDto;
import com.sky.vo.DataGridView;

/**
 * @author sky
 * @create 2020-11-13 20:56
 */
public interface InventoryLogService {
    /**
     * 分页查询
     *
     * @param inventoryLogDto
     * @return
     */
    DataGridView listInventoryLogPage(InventoryLogDto inventoryLogDto);
}
