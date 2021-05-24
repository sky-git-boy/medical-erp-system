package com.sky.service;


import com.sky.domain.RegisteredItem;
import com.sky.dto.RegisteredItemDto;
import com.sky.vo.DataGridView;

import java.util.List;

/**
 * @author sky
 * @create 2021-05-24 22:14
 */
public interface RegisteredItemService {
    /**
     * 分页查询
     */
    DataGridView listRegisteredItemPage(RegisteredItemDto registeredItemDto);
    
    /**
     * 根据ID查询
     */
    RegisteredItem getOne(Long checkItemId);

    /**
     * 添加
     */
    int addRegisteredItem(RegisteredItemDto registeredItemDto);

    /**
     * 修改
     */
    int updateRegisteredItem(RegisteredItemDto registeredItemDto);

    /**
     * 根据ID删除
     */
    int deleteRegisteredItemByIds(Long[] checkItemIds);

    /**
     * 查询所有可用的挂号费用
     */
    List<RegisteredItem> selectAllRegisteredItem();

}
