package com.rimi.cms.dao.impl;

import com.rimi.cms.dao.ICardsDao;
import com.rimi.cms.entity.Card;
import com.rimi.cms.util.JDBCUtils;
import com.rimi.cms.util.StringUtils;
import org.apache.poi.ss.formula.functions.T;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @author junelee
 * @date 2019/9/24 16:07
 */
public class CardsDaoImpl implements ICardsDao {

    /**
     * 查找所有卡片
     * @return 返回找到卡片的集合
     */
    @Override
    public List<Card> selectAll() {
        // 定义查询所有卡片的sql语句
        String sql = "select * from card";
        // 返回查找到的所有卡片所组成的集合
        return JDBCUtils.executeQuery(Card.class, sql);
    }

    @Override
    public Integer count() {
        // 定义sql
        String sql = "select count(1) from card";
        // 执行
        return JDBCUtils.executeQueryForCount(sql);
    }

    /**
     * 模糊查询
     * @param parms
     * @return
     */
    @Override
    public Integer count(Map<String, String[]> parms) {
        // 根据条件拼接sql
        StringBuffer sql = new StringBuffer("select count(1) from card where 1 = 1");
        List<String> parmsSql = new ArrayList<>();
        if (parms.get("cardName") != null && StringUtils.isNotEmpty(parms.get("cardName")[0])) {
            sql.append(" and card_name like ?");
            parmsSql.add("%"+parms.get("cardName")[0]+"%");
        }
        if (parms.get("cardType") != null && StringUtils.isNotEmpty(parms.get("cardType")[0])) {
            sql.append(" and card_Type like ?");
            parmsSql.add("%"+parms.get("cardType")[0]+"%");
        }
        if (parms.get("cardFaction") != null && StringUtils.isNotEmpty(parms.get("cardFaction")[0])) {
            sql.append(" and card_Faction like ?");
            parmsSql.add("%"+parms.get("cardFaction")[0]+"%");
        }
        if (parms.get("cardCost") != null && StringUtils.isNotEmpty(parms.get("cardCost")[0])) {
            sql.append(" and card_Cost like ?");
            parmsSql.add("%"+parms.get("cardCost")[0]+"%");
        }
        if (parms.get("cardLevel") != null && StringUtils.isNotEmpty(parms.get("cardLevel")[0])) {
            sql.append(" and card_Level like ?");
            parmsSql.add("%"+parms.get("cardLevel")[0]+"%");
        }
        if (parms.get("cardAtk") != null && StringUtils.isNotEmpty(parms.get("cardAtk")[0])) {
            sql.append(" and card_Atk like ?");
            parmsSql.add("%"+parms.get("cardAtk")[0]+"%");
        }
        if (parms.get("cardHp") != null && StringUtils.isNotEmpty(parms.get("cardHp")[0])) {
            sql.append(" and card_Hp like ?");
            parmsSql.add("%"+parms.get("cardHp")[0]+"%");
        }
        return JDBCUtils.executeQueryForCount(sql.toString(), parmsSql);
    }

    /**
     * 查询所需查询业数的数据
     * @param parms
     * @return
     */
    @Override
    public List<Card> selectByPage(Map<String, String[]> parms) {
        // 根据条件拼接sql
        StringBuffer sql = new StringBuffer("select * from card where 1 = 1");
        List<Object> parmsSql = new ArrayList<>();
        if (parms.get("cardName") != null && StringUtils.isNotEmpty(parms.get("cardName")[0])) {
            sql.append(" and card_name like ?");
            parmsSql.add("%"+parms.get("cardName")[0]+"%");
        }
        if (parms.get("cardType") != null && StringUtils.isNotEmpty(parms.get("cardType")[0])) {
            sql.append(" and card_Type like ?");
            parmsSql.add("%"+parms.get("cardType")[0]+"%");
        }
        if (parms.get("cardFaction") != null && StringUtils.isNotEmpty(parms.get("cardFaction")[0])) {
            sql.append(" and card_Faction like ?");
            parmsSql.add("%"+parms.get("cardFaction")[0]+"%");
        }
        if (parms.get("cardCost") != null && StringUtils.isNotEmpty(parms.get("cardCost")[0])) {
            sql.append(" and card_Cost like ?");
            parmsSql.add("%"+parms.get("cardCost")[0]+"%");
        }
        if (parms.get("cardLevel") != null && StringUtils.isNotEmpty(parms.get("cardLevel")[0])) {
            sql.append(" and card_Level like ?");
            parmsSql.add("%"+parms.get("cardLevel")[0]+"%");
        }
        if (parms.get("cardAtk") != null && StringUtils.isNotEmpty(parms.get("cardAtk")[0])) {
            sql.append(" and card_Atk like ?");
            parmsSql.add("%"+parms.get("cardAtk")[0]+"%");
        }
        if (parms.get("cardHp") != null && StringUtils.isNotEmpty(parms.get("cardHp")[0])) {
            sql.append(" and card_Hp like ?");
            parmsSql.add("%"+parms.get("cardHp")[0]+"%");
        }
        return JDBCUtils.executeQuery(Card.class, sql.toString(), parmsSql);
    }

    /**
     * 根据id删除数据
     * @param id
     */
    @Override
    public void deleteById(Integer id) {
        // 定义sql
        String sql = "delete from card where card_id = ?";
        JDBCUtils.executeUpdate(sql,id);
    }

    @Override
    public Card selectById(String id) {
        // 定义sql
        String sql = "select count(1) from card";
        // 执行sql
        return JDBCUtils.executeQueryForOne(Card.class,sql,id);
    }

    @Override
    public Card selectForOne(String id) {
        String sql = "select * from card where card_id =?";
        List<Card> cards = JDBCUtils.executeQuery(Card.class, sql, id);
        if (cards != null) {
            return cards.get(0);
        }
        return null;

    }

    @Override
    public void insert(Map<String, String[]> params) {
        // 1.定义sql
        String sql = "insert into card(card_id,card_name,card_cost,card_level,card_type,card_faction,card_atk,card_hp,card_power,card_intro) values(null,?,?,?,?,?,?,?,?,?)";
        // 执行插入
        JDBCUtils.executeUpdate(sql,
                params.get("cardName")[0],
                params.get("cardCost")[0],
                params.get("cardLevel")[0],
                params.get("cardType")[0],
                params.get("cardFaction")[0],
                params.get("cardAtk")[0],
                params.get("cardHp")[0],
                params.get("cardPower")[0],
                params.get("cardIntro")[0]);
    }


}
