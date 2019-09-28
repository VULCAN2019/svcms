package com.rimi.cms.dao;

import com.rimi.cms.entity.Card;

import java.util.List;
import java.util.Map;

/**
 * @author junelee
 * @date 2019/9/24 16:06
 */
public interface ICardsDao {

    /**
     * 查询数据库
     * @return 返回集合
     */
    List<Card> selectAll();

    Integer count();

    Integer count(Map<String, String[]> parms);

    List<Card> selectByPage(Map<String, String[]> parms);

    void deleteById(Integer id);

    Card selectById(String id);

    Card selectForOne(String id );

    void insert(Map<String, String[]> params);

    void update(Map<String, String[]> modifyInfo);

    List<Card> mySelectByPage(int currentSize, Integer pageSize, Map<String, String[]> parms);

}
