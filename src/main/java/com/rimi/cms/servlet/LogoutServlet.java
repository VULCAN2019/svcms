package com.rimi.cms.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * 登出操作
 *
 * @author junelee
 * @date 2019/9/28 19:24
 */
@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 退出,请求session,返回登陆页面
        HttpSession session = request.getSession();
        // 移除某个值
        session.removeAttribute("username");
        // 销毁session
        session.invalidate();
        // 重定向
        //response.sendRedirect(request.getContextPath() + "/login");
        request.getRequestDispatcher("/WEB-INF/view/card/login.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
