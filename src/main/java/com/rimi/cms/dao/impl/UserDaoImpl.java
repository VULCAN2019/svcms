package com.rimi.cms.dao.impl;

import com.rimi.cms.dao.IUserDao;
import com.rimi.cms.entity.User;
import com.rimi.cms.util.JDBCUtils;

/**
 * @author junelee
 * @date 2019/9/23 14:34
 */
public class UserDaoImpl implements IUserDao {
    @Override
    public User login(String username, String password) {

        // 定义sql
        String sql = "select * from user where username = ? and password = ?";
        //返回查找到的用户
        return JDBCUtils.executeQueryForOne(User.class,sql,username,password);


    }
}
