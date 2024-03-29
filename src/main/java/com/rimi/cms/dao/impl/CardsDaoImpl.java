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
     *
     * @return 返回找到卡片的集合
     */
    @Override
    public List<Card> selectAll() {
        // 定义查询所有卡片的sql语句
        String sql = "select * from card";
        // 返回查找到的所有卡片所组成的集合
        return JDBCUtils.executeQuery(Card.class, sql);
    }

    /**
     * 查询数据的总条数
     * @return 返回数据的总条数
     */
    @Override
    public Integer count() {
        // 定义sql
        String sql = "select count(1) from card";
        // 执行
        return JDBCUtils.executeQueryForCount(sql);
    }

    /**
     * 模糊查询查询到结果的总页数
     *
     * @param parms 这里面存着查询的条件
     * @return 返回查询到的总页数
     */
    @Override
    public Integer count(Map<String, String[]> parms) {
        // 根据条件拼接sql
        StringBuffer sql = new StringBuffer("select count(1) from card where 1 = 1");
        List<String> parmsSql = new ArrayList<>();
        if (parms.get("cardName") != null && StringUtils.isNotEmpty(parms.get("cardName")[0])) {
            sql.append(" and card_name like ?");
            parmsSql.add("%" + parms.get("cardName")[0] + "%");
        }
        if (parms.get("cardType") != null && StringUtils.isNotEmpty(parms.get("cardType")[0])) {
            sql.append(" and card_Type like ?");
            parmsSql.add("%" + parms.get("cardType")[0] + "%");
        }
        if (parms.get("cardFaction") != null && StringUtils.isNotEmpty(parms.get("cardFaction")[0])) {
            sql.append(" and card_Faction like ?");
            parmsSql.add("%" + parms.get("cardFaction")[0] + "%");
        }
        if (parms.get("cardCost") != null && StringUtils.isNotEmpty(parms.get("cardCost")[0])) {
            sql.append(" and card_Cost like ?");
            parmsSql.add("%" + parms.get("cardCost")[0] + "%");
        }
        if (parms.get("cardLevel") != null && StringUtils.isNotEmpty(parms.get("cardLevel")[0])) {
            sql.append(" and card_Level like ?");
            parmsSql.add("%" + parms.get("cardLevel")[0] + "%");
        }
        if (parms.get("cardAtk") != null && StringUtils.isNotEmpty(parms.get("cardAtk")[0])) {
            sql.append(" and card_Atk like ?");
            parmsSql.add("%" + parms.get("cardAtk")[0] + "%");
        }
        if (parms.get("cardHp") != null && StringUtils.isNotEmpty(parms.get("cardHp")[0])) {
            sql.append(" and card_Hp like ?");
            parmsSql.add("%" + parms.get("cardHp")[0] + "%");
        }
        return JDBCUtils.executeQueryForCount(sql.toString(), parmsSql);
    }

    /**
     * 模糊查询所有满足条件的数据，但不分页
     *
     * @param parms 装着查询体检的集合
     * @return 返回找到的所有卡牌
     */
    @Override
    public List<Card> selectByAll(Map<String, String[]> parms) {
        // 根据条件拼接sql
        StringBuffer sql = new StringBuffer("select * from card where 1 = 1");
        List<Object> parmsSql = new ArrayList<>();
        if (parms.get("cardName") != null && StringUtils.isNotEmpty(parms.get("cardName")[0])) {
            sql.append(" and card_name like ?");
            parmsSql.add("%" + parms.get("cardName")[0] + "%");
        }
        if (parms.get("cardType") != null && StringUtils.isNotEmpty(parms.get("cardType")[0])) {
            sql.append(" and card_Type like ?");
            parmsSql.add("%" + parms.get("cardType")[0] + "%");
        }
        if (parms.get("cardFaction") != null && StringUtils.isNotEmpty(parms.get("cardFaction")[0])) {
            sql.append(" and card_Faction like ?");
            parmsSql.add("%" + parms.get("cardFaction")[0] + "%");
        }
        if (parms.get("cardCost") != null && StringUtils.isNotEmpty(parms.get("cardCost")[0])) {
            sql.append(" and card_Cost like ?");
            parmsSql.add("%" + parms.get("cardCost")[0] + "%");
        }
        if (parms.get("cardLevel") != null && StringUtils.isNotEmpty(parms.get("cardLevel")[0])) {
            sql.append(" and card_Level like ?");
            parmsSql.add("%" + parms.get("cardLevel")[0] + "%");
        }
        if (parms.get("cardAtk") != null && StringUtils.isNotEmpty(parms.get("cardAtk")[0])) {
            sql.append(" and card_Atk like ?");
            parmsSql.add("%" + parms.get("cardAtk")[0] + "%");
        }
        if (parms.get("cardHp") != null && StringUtils.isNotEmpty(parms.get("cardHp")[0])) {
            sql.append(" and card_Hp like ?");
            parmsSql.add("%" + parms.get("cardHp")[0] + "%");
        }
        return JDBCUtils.executeQuery(Card.class, sql.toString(), parmsSql);
    }

    /**
     * 根据id删除数据
     *
     * @param id
     */
    @Override
    public void deleteById(Integer id) {
        // 定义sql
        String sql = "delete from card where card_id = ?";
        JDBCUtils.executeUpdate(sql, id);
    }

    /**
     * 根据id查询到数据
     * @param id 将被查询的id号
     * @return 返回查询到满足条件的一张卡牌集合
     */
    @Override
    public Card selectById(String id) {
        // 定义sql
        String sql = "select count(1) from card";
        // 执行sql
        return JDBCUtils.executeQueryForOne(Card.class, sql, id);
    }

    /**
     * 根据id查询一张卡牌
     * @param id 将被查询的id号
     * @return 返回一张卡牌
     */
    @Override
    public Card selectForOne(String id) {
        String sql = "select * from card where card_id =?";
        List<Card> cards = JDBCUtils.executeQuery(Card.class, sql, id);
        if (cards != null) {
            return cards.get(0);
        }
        return null;

    }

    /**
     * 插入一张卡牌
     * @param params 装着卡牌信息的map集合
     */
    @Override
    public int insert(Map<String, String[]> params) {
        // 1.定义sql
        String sql = "insert into card(card_id,card_name,card_cost,card_level,card_type,card_faction,card_atk," +
                "card_hp,card_power,card_intro) values(null,?,?,?,?,?,?,?,?,?)";
        // 执行插入
        int i = JDBCUtils.executeUpdate(sql,
                params.get("cardName")[0],
                params.get("cardCost")[0],
                params.get("cardLevel")[0],
                params.get("cardType")[0],
                params.get("cardFaction")[0],
                params.get("cardAtk")[0],
                params.get("cardHp")[0],
                params.get("cardPower")[0],
                params.get("cardIntro")[0]);
        return i;
    }

    /**
     * 更新卡牌信息
     * @param modifyInfo 这里装着将被修改后的卡牌数据信息
     */
    @Override
    public void update(Map<String, String[]> modifyInfo) {
        // 定义sql
        String sql = "update card set card_name = ?,card_cost = ?,card_level = ?,card_type = ?,card_faction = ?,card_atk = ?,card_hp = ?,card_power = ?,card_intro = ? where card_id = ?";
        // 执行sql
        JDBCUtils.executeUpdate(sql,
                modifyInfo.get("cardName")[0],
                modifyInfo.get("cardCost")[0],
                modifyInfo.get("cardLevel")[0],
                modifyInfo.get("cardType")[0],
                modifyInfo.get("cardFaction")[0],
                modifyInfo.get("cardAtk")[0],
                modifyInfo.get("cardHp")[0],
                modifyInfo.get("cardPower")[0],
                modifyInfo.get("cardIntro")[0],
                modifyInfo.get("cardId")[0]
        );
    }

    /**
     * 模糊查询满足条件的数据并分页显示
     *
     * @param currentSize   当前的页码
     * @param pageSize  页面显示的条数
     * @param parms 查询条件
     * @return
     */
    @Override
    public List<Card> mySelectByPage(int currentSize, Integer pageSize, Map<String, String[]> parms) {

        // 根据条件拼接sql
        StringBuffer sql = new StringBuffer("select * from card where 1 = 1");
        List<Object> parmsSql = new ArrayList<>();
        if (parms.get("cardName") != null && StringUtils.isNotEmpty(parms.get("cardName")[0])) {
            sql.append(" and card_name like ?");
            parmsSql.add("%" + parms.get("cardName")[0] + "%");
        }
        if (parms.get("cardType") != null && StringUtils.isNotEmpty(parms.get("cardType")[0])) {
            sql.append(" and card_Type like ?");
            parmsSql.add("%" + parms.get("cardType")[0] + "%");
        }
        if (parms.get("cardFaction") != null && StringUtils.isNotEmpty(parms.get("cardFaction")[0])) {
            sql.append(" and card_Faction like ?");
            parmsSql.add("%" + parms.get("cardFaction")[0] + "%");
        }
        if (parms.get("cardCost") != null && StringUtils.isNotEmpty(parms.get("cardCost")[0])) {
            sql.append(" and card_Cost like ?");
            parmsSql.add("%" + parms.get("cardCost")[0] + "%");
        }
        if (parms.get("cardLevel") != null && StringUtils.isNotEmpty(parms.get("cardLevel")[0])) {
            sql.append(" and card_Level like ?");
            parmsSql.add("%" + parms.get("cardLevel")[0] + "%");
        }
        if (parms.get("cardAtk") != null && StringUtils.isNotEmpty(parms.get("cardAtk")[0])) {
            sql.append(" and card_Atk like ?");
            parmsSql.add("%" + parms.get("cardAtk")[0] + "%");
        }
        if (parms.get("cardHp") != null && StringUtils.isNotEmpty(parms.get("cardHp")[0])) {
            sql.append(" and card_Hp like ?");
            parmsSql.add("%" + parms.get("cardHp")[0] + "%");
        }

        // 追加分页
        sql.append(" limit ?,?");
        // 添加一个当前的页码
        parmsSql.add(currentSize);
        // 添加一个页面总页数
        parmsSql.add(pageSize);
        // 执行结果，返回一个通过条件查询后得到的卡牌集合
        /**
         * Card.class 是将要查询的对象的类型
         * sql.toString() 是sql语句，这里加toString()的原因是当前sql是StringBuffer可动态拼接字符串
         * parmsSql为sql语句里面?的填充物
         */
        return JDBCUtils.executeQuery(Card.class,sql.toString(), parmsSql);

    }


}
