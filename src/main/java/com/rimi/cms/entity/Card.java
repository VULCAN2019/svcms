package com.rimi.cms.entity;

import java.util.List;

/**
 * 卡牌实体类
 *
 * @author junelee
 * @date 2019/9/23 15:31
 */
public class Card {
    private Integer cardId;
    private String cardName;
    private Integer cardCost;
    private String cardLevel;
    private String cardType;
    private String cardFaction;
    private Integer cardAtk;
    private Integer cardHp;
    private String cardPower;
    private String cardIntro;
    private List<Card> cardsData;

    public List<Card> getCardsData() {
        return cardsData;
    }

    public void setCardsData(List<Card> cardsData) {
        this.cardsData = cardsData;
    }

    @Override
    public String toString() {
        return "Card{" +
                "cardId=" + cardId +
                ", cardName='" + cardName + '\'' +
                ", cardCost=" + cardCost +
                ", cardLevel=" + cardLevel +
                ", cardType='" + cardType + '\'' +
                ", cardFaction='" + cardFaction + '\'' +
                ", cardAtk=" + cardAtk +
                ", cardHp=" + cardHp +
                ", cardPower='" + cardPower + '\'' +
                ", cardIntro='" + cardIntro + '\'' +
                '}';
    }

    public Integer getCardId() {
        return cardId;
    }

    public void setCardId(Integer cardId) {
        this.cardId = cardId;
    }

    public String getCardName() {
        return cardName;
    }

    public void setCardName(String cardName) {
        this.cardName = cardName;
    }

    public Integer getCardCost() {
        return cardCost;
    }

    public void setCardCost(Integer cardCost) {
        this.cardCost = cardCost;
    }

    public String getCardLevel() {
        return cardLevel;
    }

    public void setCardLevel(String cardLevel) {
        this.cardLevel = cardLevel;
    }

    public String getCardType() {
        return cardType;
    }

    public void setCardType(String cardType) {
        this.cardType = cardType;
    }

    public String getCardFaction() {
        return cardFaction;
    }

    public void setCardFaction(String cardFaction) {
        this.cardFaction = cardFaction;
    }

    public Integer getCardAtk() {
        return cardAtk;
    }

    public void setCardAtk(Integer cardAtk) {
        this.cardAtk = cardAtk;
    }

    public Integer getCardHp() {
        return cardHp;
    }

    public void setCardHp(Integer cardHp) {
        this.cardHp = cardHp;
    }

    public String getCardPower() {
        return cardPower;
    }

    public void setCardPower(String cardPower) {
        this.cardPower = cardPower;
    }

    public String getCardIntro() {
        return cardIntro;
    }

    public void setCardIntro(String cardIntro) {
        this.cardIntro = cardIntro;
    }
}
