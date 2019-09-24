package com.rimi.cms.servlet;

import com.rimi.cms.common.BaseServlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * ${Description}
 *
 * @author junelee
 * @date 2019/9/23 16:38
 */
@WebServlet("/cards")
public class CardServlet extends BaseServlet {


    public String doList(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {
        return "card/index";
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
