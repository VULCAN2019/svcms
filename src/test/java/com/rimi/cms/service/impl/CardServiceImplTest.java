package com.rimi.cms.service.impl;

import com.rimi.cms.dao.ICardsDao;
import com.rimi.cms.dao.impl.CardsDaoImpl;
import com.rimi.cms.entity.Card;
import org.junit.Assert;
import org.junit.Test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.junit.Assert.*;

/**
 * @author junelee
 * @date 2019/9/27 15:52
 */
public class CardServiceImplTest {

    private ICardsDao cardsDao = new CardsDaoImpl();

    @Test
    public void getAll() {

        List<Card> cards = cardsDao.selectAll();
        Assert.assertNotNull(cards);

    }

    @Test
    public void findPageCard() {
        Map<String, String[]> params = new HashMap<>();



    }

    @Test
    public void findForOne() {
        String id = "30";
        Card card = cardsDao.selectForOne(id);
        Assert.assertNotNull(card);
    }

    @Test
    public void save() {

        Map<String, String[]> params = new HashMap<>();
        cardsDao.insert(params);

    }

    @Test
    public void deleteById() {
        Integer idd = 20;
        cardsDao.deleteById(idd);

    }

    @Test
    public void deleteByIds() {
        String ids[] = {"32","34"};
        for (String id : ids) {
            cardsDao.deleteById(Integer.valueOf(id));
        }
    }

    @Test
    public void update() {
        Map<String, String[]> modifyInfo = new HashMap<>();
        cardsDao.update(modifyInfo);

    }
}