package com.sky.service;

import com.sky.domain.Dept;
import com.sky.dto.DeptDto;
import com.sky.vo.DataGridView;

import java.util.List;

/**
 * @author sky
 * @create 2021-05-24 21:18
 */
public interface DeptService {

    /**
     * 分页查询
     */
    DataGridView listPage(DeptDto deptDto);

    /**
     * 查询所有有效部门
     */
    List<Dept> list();

    /**
     * 根据ID查询一个
     */
    Dept getOne(Long deptId);

    /**
     * 添加一个部门
     */
    int addDept(DeptDto deptDto);

    /**
     * 修改部门
     */
    int updateDept(DeptDto deptDto);

    /**
     * 根据IDS删除部门
     */
    int deleteDeptByIds(Long[] deptIds);

}
