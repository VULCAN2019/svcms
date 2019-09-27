package com.rimi.cms.dao.impl;

import com.rimi.cms.entity.Card;
import com.rimi.cms.util.JDBCUtils;
import org.junit.Assert;
import org.junit.Test;

import static org.junit.Assert.*;

/**
 * @author junelee
 * @date 2019/9/24 19:32
 */
public class CardsDaoImplTest {

    @Test
    public void selectAll() {
        // 创建sql语句
        String sql = "select * from card";
        // 判断返回值不为空
        Assert.assertNotNull(JDBCUtils.executeQuery(Card.class, sql));

    }
}