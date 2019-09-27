package com.rimi.cms.dao;

import com.rimi.cms.entity.User;
import com.rimi.cms.util.JDBCUtils;
import org.junit.Assert;
import org.junit.Test;

import static org.junit.Assert.*;

/**
 * @author junelee
 * @date 2019/9/24 19:35
 */
public class IUserDaoTest {

    @Test
    public void login() {
        String sql = "select * from user";
        Assert.assertNotNull(JDBCUtils.executeQuery(User.class, sql));
    }
}