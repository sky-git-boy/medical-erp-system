package com.sky.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.date.DateUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sky.constants.Constants;
import com.sky.domain.Role;
import com.sky.dto.RoleDto;
import com.sky.mapper.RoleMapper;
import com.sky.vo.DataGridView;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sky.service.RoleService;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/**
 * @author sky
 * @create 2021-05-25 9:49
 */
@Service
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleMapper roleMapper;

    @Override
    public DataGridView listRolePage(RoleDto roleDto) {
        Page<Role> page=new Page<>(roleDto.getPageNum(),roleDto.getPageSize());
        QueryWrapper<Role> qw=new QueryWrapper<>();
        qw.like(StringUtils.isNotBlank(roleDto.getRoleName()),Role.COL_ROLE_NAME,roleDto.getRoleName());
        qw.like(StringUtils.isNotBlank(roleDto.getRoleCode()),Role.COL_ROLE_CODE,roleDto.getRoleCode());
        qw.eq(StringUtils.isNotBlank(roleDto.getStatus()),Role.COL_STATUS,roleDto.getStatus());
        qw.ge(roleDto.getBeginTime()!=null, Role.COL_CREATE_TIME,roleDto.getBeginTime());
        qw.le(roleDto.getEndTime()!=null,Role.COL_CREATE_TIME,roleDto.getEndTime());
        qw.orderByAsc(Role.COL_ROLE_SORT);
        this.roleMapper.selectPage(page,qw);
        return new DataGridView(page.getTotal(),page.getRecords());
    }

    @Override
    public List<Role> listAllRoles() {
        QueryWrapper<Role> qw=new QueryWrapper<>();
        qw.eq(Role.COL_STATUS, Constants.STATUS_TRUE);
        qw.orderByAsc(Role.COL_ROLE_SORT);
        return this.roleMapper.selectList(qw);
    }

    @Override
    public Role getOne(Long roleId) {
        return this.roleMapper.selectById(roleId);
    }

    @Override
    public int addRole(RoleDto roleDto) {
        Role role=new Role();
        BeanUtil.copyProperties(roleDto,role);
        //????????????????????????
        role.setCreateTime(DateUtil.date());
        role.setCreateBy(roleDto.getSimpleUser().getUserName());
        return this.roleMapper.insert(role);
    }

    @Override
    public int updateRole(RoleDto roleDto) {
        Role role=new Role();
        BeanUtil.copyProperties(roleDto,role);
        //???????????????
        role.setUpdateBy(roleDto.getSimpleUser().getUserName());
        return this.roleMapper.updateById(role);
    }

    @Override
    public int deleteRoleByIds(Long[] roleIds) {
        if(roleIds!=null && roleIds.length>0){
            List<Long> rids = Arrays.asList(roleIds);
            //????????????ID??????sys_role_menu?????????
            this.roleMapper.deleteRoleMenuByRoleIds(rids);
            //????????????ID??????sys_role_user???????????????
            this.roleMapper.deleteRoleUserByRoleIds(rids);
            //????????????
            return this.roleMapper.deleteBatchIds(rids);
        }
        else return 0;
    }

    @Override
    public void saveRoleMenu(Long roleId, Long[] menuIds) {
        //????????????ID?????????sys_role_menu?????????????????????
        this.roleMapper.deleteRoleMenuByRoleIds(Collections.singletonList(roleId));
        for(Long menuId : menuIds) {
            this.roleMapper.saveRoleMenu(roleId, menuId);
        }
    }

    @Override
    public List<Long> getRoleIdsByUserId(Long userId) {
        if(null == userId) {
            return Collections.emptyList();
        }
        return this.roleMapper.selectRoleIdsByUserId(userId);
    }

    @Override
    public void saveRoleUser(Long userId, Long[] roleIds) {
        // ???????????? ID ????????? sys_role_menu ?????????????????????
        this.roleMapper.deleteRoleUserByUserIds(Collections.singletonList(userId));
        for (Long roleId : roleIds) {
            this.roleMapper.saveRoleUser(userId,roleId);
        }
    }
}
