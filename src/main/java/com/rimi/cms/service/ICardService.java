package com.rimi.cms.service;


import com.rimi.cms.common.Page;
import com.rimi.cms.entity.Card;

import java.util.List;
import java.util.Map;

/**
 * @author junelee
 * @date 2019/9/24 16:01
 */
public interface ICardService {

    /**
     * 获取所有卡片
     * @return 返回一个存了所有card的集合
     */
    List<Card> getAll();

    List<Card> findAllCard(Map<String, String[]> params);

    Card findById(String id);

    Card findForOne(String id);

    void deleteById(Integer id);

    void save(Map<String, String[]> params);

    void deleteByIds(String[] ids);

    void update(Map<String, String[]> modifyInfo);

    Page<Card> myFindPageCard(Page page, Map<String, String[]> parms);
}
