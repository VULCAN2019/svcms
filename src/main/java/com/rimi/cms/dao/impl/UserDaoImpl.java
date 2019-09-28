package com.rimi.cms.dao.impl;

import com.rimi.cms.dao.IUserDao;
import com.rimi.cms.entity.User;
import com.rimi.cms.util.JDBCUtils;
import com.rimi.cms.util.StringUtils;

import java.util.List;

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

    @Override
    public int checkUsername(User user) {

        // 定义sql
        String sql = "select * from user where username = ?";
        // 返回查找到的用户
        if (user.getUsername() != null) {
            List<User> users = JDBCUtils.executeQuery(User.class, sql, user.getUsername());
            for (User user1 : users) {
                System.out.println(user1.getUsername());
                System.out.println(user1.getPassword());
            }
            if (users.size() != 0) {
                // 返回1表示已存在该用户
                return 1;

            }
        }
        // 返回-1表示不存在该用户
        return -1;

    }

    @Override
    public Integer updatePwd(User user) {
        if (user != null) {
            // 定义sql语句
            String sql = "update user set password = ? where id = ?";
            // 调用工具类中的方法获取执行sql的结果
            return JDBCUtils.executeUpdate(sql,user.getPassword(), user.getUsername());
        }
        return -1;
    }

    @Override
    public Integer insert(String username, String password) {
        if (StringUtils.isNotEmpty(username) || StringUtils.isNotEmpty(password)) {
            // 定义sql
            String sql = "insert into user(id,username,password) values(null,?,?)";
            // 调用工具类中的方法获取执行结果
            return JDBCUtils.executeUpdate(sql,username,password);
        }
        return null;
    }
}
