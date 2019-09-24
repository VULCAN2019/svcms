package com.rimi.cms.dao;

import com.rimi.cms.entity.User;

/**
 * @author junelee
 * @date 2019/9/23 14:33
 */
public interface IUserDao {
    User login(String username, String password);
}
