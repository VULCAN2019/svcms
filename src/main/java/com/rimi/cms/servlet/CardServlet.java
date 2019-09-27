package com.rimi.cms.servlet;

import com.alibaba.fastjson.JSONObject;
import com.rimi.cms.common.BaseServlet;

import com.rimi.cms.common.Page;
import com.rimi.cms.entity.Card;
import com.rimi.cms.service.ICardService;
import com.rimi.cms.service.impl.CardServiceImpl;
import com.rimi.cms.util.StringUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * ${Description}
 *
 * @author junelee
 * @date 2019/9/23 16:38
 */
@WebServlet("/cards")
public class CardServlet extends BaseServlet {

    private ICardService cardService = new CardServiceImpl();

    /**
     * 分页方法
     * @param request
     * @param response
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String doToAll(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {

        return "card/index";
    }

    public String doAll(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {
        // 响应数据
        response.setContentType("text/html;charset=utf-8");
        // fastJson核心类 JSONObject
        //JSONObject jo = new JSONObject();
        List<Card> cards = cardService.getAll();

        request.setAttribute("cards",cards);

        return "card/index_v1";
    }

    public String doSelect(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {

        // 获取查询的条件
        Map<String, String[]> params = request.getParameterMap();

        // 调用方法获取数据
        List<Card> cards = cardService.findPageCard(params);

        //  把查询到得信息发送到页面
        request.setAttribute("cards",cards);
        return "card/index_v2";
    }

    public String doToInsert(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {

        return "card/index_v3";
    }

    public void doInsert(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {

        // 获取要插入的参数值
        Map<String, String[]> params = request.getParameterMap();

        // 调用service中的保存方法
        cardService.save(params);

    }

    public String doToModify (HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {

        List<Card> cards = cardService.getAll();

        request.setAttribute("cards",cards);

        return "card/index_v5";
    }

    public String doModify(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {
        // 1.获取提交的参数
        String id = request.getParameter("id");
        // 2.根据ID获取图到要修改的卡牌信息
        Card card = cardService.findById(id);


        return "card/index_v1";
    }

    public String doExtract(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {
        return "card/index_v1";
    }

    public String doToDel(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {

        List<Card> cards = cardService.getAll();

        request.setAttribute("cards",cards);

        return "card/index_v4";
    }
    public void doDel(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {

        // 获取参数
        String[] ids = request.getParameterValues("id[]");
        // 调用service，处理请求
        cardService.deleteByIds(ids);


    }
    public void doId(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {
        response.setContentType("text/html;charset=utf-8");

        String id = request.getParameter("id");

        Card card = cardService.findForOne(id);

        JSONObject jsonObject = new JSONObject();

        jsonObject.put("card",card);

        request.setAttribute("card",card);


        //response.getWriter().print(JSONObject.toJSONString(jsonObject));

        response.getWriter().print(jsonObject.toString());
        System.out.println(card);

    }


}
