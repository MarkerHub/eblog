package com.example.service;

import com.example.common.lang.Result;
import com.example.entity.User;
import com.baomidou.mybatisplus.extension.service.IService;
import com.example.shiro.AccountProfile;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 公众号：java思维导图
 * @since 2019-11-17
 */
public interface UserService extends IService<User> {

    Result register(User user);

    AccountProfile login(String username, String password);
}
