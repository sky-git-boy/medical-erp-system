package com.sky.service.impl;

import cn.hutool.core.date.DateUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sky.constants.Constants;
import com.sky.dto.DeptDto;
import com.sky.vo.DataGridView;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.List;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.sky.mapper.DeptMapper;
import com.sky.domain.Dept;
import com.sky.service.DeptService;

/**
 * @author sky
 * @create 2021-05-24 21:18
 */
@Service
public class DeptServiceImpl implements DeptService {

    @Autowired
    private DeptMapper deptMapper;

    @Override
    public DataGridView listPage(DeptDto deptDto) {
        Page<Dept> page=new Page<>(deptDto.getPageNum(),deptDto.getPageSize());
        QueryWrapper<Dept> qw=new QueryWrapper<>();
        qw.like(StringUtils.isNotBlank(deptDto.getDeptName()),Dept.COL_DEPT_NAME,deptDto.getDeptName());
        qw.eq(StringUtils.isNotBlank(deptDto.getStatus()),Dept.COL_STATUS,deptDto.getStatus());

        qw.ge(deptDto.getBeginTime()!=null,Dept.COL_CREATE_TIME,deptDto.getBeginTime());
        qw.le(deptDto.getEndTime()!=null,Dept.COL_CREATE_TIME,deptDto.getEndTime());

        qw.orderByAsc(Dept.COL_ORDER_NUM);
        this.deptMapper.selectPage(page,qw);
        return new DataGridView(page.getTotal(),page.getRecords());
    }

    @Override
    public List<Dept> list() {
        QueryWrapper<Dept> qw=new QueryWrapper<>();
        qw.eq(Dept.COL_STATUS, Constants.STATUS_TRUE);
        qw.orderByAsc(Dept.COL_ORDER_NUM);
        return this.deptMapper.selectList(qw);
    }

    @Override
    public Dept getOne(Long deptId) {
        if(deptId!=null && deptId>0) {
            return this.deptMapper.selectById(deptId);
        } else {
            return null;
        }
    }

    @Override
    public int addDept(DeptDto deptDto) {
        Dept dept = new Dept();
        BeanUtils.copyProperties(deptDto, dept);
        dept.setCreateTime(DateUtil.date());
        dept.setCreateBy(deptDto.getSimpleUser().getUserName());
        return this.deptMapper.insert(dept);
    }

    @Override
    public int updateDept(DeptDto deptDto) {
        Dept dept = new Dept();
        BeanUtils.copyProperties(deptDto, dept);
        dept.setUpdateBy(deptDto.getSimpleUser().getUserName());
        return this.deptMapper.updateById(dept);
    }

    @Override
    public int deleteDeptByIds(Long[] deptIds) {
        if(deptIds!=null && deptIds.length>0) {
            return this.deptMapper.deleteBatchIds(Arrays.asList(deptIds));
        } else
            return 0;
    }
}
