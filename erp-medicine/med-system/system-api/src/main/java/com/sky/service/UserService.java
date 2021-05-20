package com.sky.service;

import com.sky.domain.User;

/**
 *
 @author sky
 @create 2021-05-19 19:56
 */
public interface UserService {
    /**
     * 根据手机号查询用户
     * @param phone 手机号
     */
    User queryUserByPhone(String phone);

    /**
     * 根据用户 ID 查询用户
     * @param userId 用户ID
     */
    User getOne(Long userId);
}
