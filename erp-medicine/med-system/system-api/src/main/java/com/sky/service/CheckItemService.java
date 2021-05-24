package com.sky.service;

import com.sky.domain.CheckItem;
import com.sky.dto.CheckItemDto;
import com.sky.vo.DataGridView;

import java.util.List;

/**
 * @author sky
 * @create 2021-05-24 22:07
 */
public interface CheckItemService {
    /**
     * 分页查询
     */
    DataGridView listCheckItemPage(CheckItemDto checkItemDto);

    /**
     * 根据ID查询
     */
    CheckItem getOne(Long checkItemId);

    /**
     * 添加
     */
    int addCheckItem(CheckItemDto checkItemDto);

    /**
     * 修改
     */
    int updateCheckItem(CheckItemDto checkItemDto);

    /**
     * 根据ID删除
     */
    int deleteCheckItemByIds(Long[] checkItemIds);

    /**
     * 查询所有可用的检查项目
     */
    List<CheckItem> selectAllCheckItem();

}
