package com.rimi.cms.service.impl;

import com.rimi.cms.common.Page;
import com.rimi.cms.dao.ICardsDao;
import com.rimi.cms.dao.impl.CardsDaoImpl;
import com.rimi.cms.entity.Card;
import com.rimi.cms.service.ICardService;
import com.rimi.cms.util.StringUtils;

import java.util.List;
import java.util.Map;

/**
 * @author junelee
 * @date 2019/9/24 16:04
 */
public class CardServiceImpl implements ICardService {

    /**
     * 初始化一个全局对象
     */
    private ICardsDao cardsDao = new CardsDaoImpl();

    /**
     * 获取所有卡片
     *
     * @return 返回一个存了所有card的集合
     */
    @Override
    public List<Card> getAll() {
        // 查询数据库
        return cardsDao.selectAll();
    }

    /**
     * 查找所有卡牌
     *
     * @param parms 找到的所有卡牌组成的一个集合map集合
     * @return 返回找到的卡牌集合
     */
    @Override
    public List<Card> findAllCard(Map<String, String[]> parms) {
        // 根据条件查询所有的记录
        Integer count = cardsDao.count(parms);

        // 调用方法
        List<Card> cards = cardsDao.selectByAll(parms);
        return cards;
    }


    /**
     * 根据id获取到所选数据，并删除
     *
     * @param id 将被删除的卡牌的id
     * @return 返回找到的结果
     */
    @Override
    public Card findById(String id) {
        if (StringUtils.isNotEmpty(id)) {
            // 调用Dao方法，获取数据
            return cardsDao.selectById(id);
        }
        return null;
    }

    /**
     * 根据id查询卡牌
     *
     * @param id 将被查询的卡牌id
     * @return 返回查询到的卡牌
     */
    @Override
    public Card findForOne(String id) {
        return cardsDao.selectForOne(id);
    }


    /**
     * 插入数据
     *
     * @param params 一张卡牌的信息所组成的map集合
     */
    @Override
    public boolean save(Map<String, String[]> params) {
        // 调用dao层插入方法，把数据插入到数据库
        return cardsDao.insert(params)==1;
    }

    /**
     * 删除一条数据
     *
     * @param id 将被删除的数据
     */
    @Override
    public void deleteById(Integer id) {
        cardsDao.deleteById(id);
    }

    /**
     * 删除一堆数据
     *
     * @param ids 将被删除的一堆数据
     */
    @Override
    public void deleteByIds(String[] ids) {
        for (String id : ids) {
            deleteById(Integer.valueOf(id));
        }
    }

    /**
     * 更新卡牌信息
     *
     * @param modifyInfo 这里装着卡牌将被修改后的卡牌信息
     */
    @Override
    public void update(Map<String, String[]> modifyInfo) {
        cardsDao.update(modifyInfo);
    }

    /**
     * 查询所有卡牌并分页显示
     *
     * @param page  分页对象
     * @param parms 存着查询条件的map集合
     * @return 返回一个page对象，一个page对象里存着一页里将被显示的卡牌
     */
    @Override
    public Page<Card> myFindPageCard(Page page, Map<String, String[]> parms) {
        // 根据条件查询所有的卡牌，没有条件的话就能查到所有的卡牌
        Integer count = cardsDao.count(parms);
        // 设置总页数
        page.setTotalCount(count);

        // 调用方法 传入当前页面的页码数，页面的总页数，查询条件；
        // 然后根据方法里面根据条件，总页数，页码数，
        // 返回一个分页后找到的所有卡牌组成的list集合
        List<Card> cards = cardsDao.mySelectByPage(page.getCurrentSize(),
                page.getPageSize(), parms);

        // 传入一个分页后查询到的卡牌集合
        page.setPageData(cards);

        return page;
    }
}
