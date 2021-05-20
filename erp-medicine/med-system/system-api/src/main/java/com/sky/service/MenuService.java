package com.sky.service;

import com.sky.domain.Menu;
import com.baomidou.mybatisplus.extension.service.IService;
import com.sky.domain.SimpleUser;

import java.util.List;

/**
@author sky
@create 2021-05-19 20:07
*/
public interface MenuService {

    /**
     * 查询菜单信息
     * 如果是管理员，那么d直接查询所有菜单和权限
     * 如果登录用户为普通用户，那么根据用户ID关联角色和权限
     * @param isAdmin   是否是管理员
     * @param simpleUser    如果isAdmin为true，simpleUser 可以为空
     */
    List<Menu> selectMenuTree(boolean isAdmin, SimpleUser simpleUser);
}
