package com.sky.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.sky.mapper.UserMapper;
import com.sky.domain.User;
import com.sky.service.UserService;

/**
 * @author sky
 * @create 2021-05-19 19:56
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public User queryUserByPhone(String phone) {
        QueryWrapper<User> qw = new QueryWrapper<>();
        qw.eq(User.COL_PHONE, phone);
        return this.userMapper.selectOne(qw);
    }

    @Override
    public User getOne(Long userId) {
        return this.userMapper.selectById(userId);
    }
}
