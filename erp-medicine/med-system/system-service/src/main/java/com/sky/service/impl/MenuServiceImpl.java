package com.sky.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.sky.constants.Constants;
import com.sky.domain.SimpleUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

import com.sky.domain.Menu;
import com.sky.mapper.MenuMapper;
import com.sky.service.MenuService;

/**
 * @author sky
 * @create 2021-05-19 20:07
 */
@Service
public class MenuServiceImpl implements MenuService {

    @Autowired
    private MenuMapper menuMapper;

    @Override
    public List<Menu> selectMenuTree(boolean isAdmin, SimpleUser simpleUser) {
        QueryWrapper<Menu> qw = new QueryWrapper<>();
        qw.eq(Menu.COL_STATUS, Constants.STATUS_TRUE);
        qw.in(Menu.COL_MENU_TYPE, Constants.MENU_TYPE_M, Constants.MENU_TYPE_C);
        qw.orderByAsc(Menu.COL_PARENT_ID);
        if (isAdmin) {
            return menuMapper.selectList(qw);
        } else {
            // 根据用户ID查询用户拥有的菜单信息
            return menuMapper.selectList(qw);
        }
    }
}
