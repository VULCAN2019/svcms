package com.rimi.cms.servlet;

import com.rimi.cms.common.ErrorConstant;
import com.rimi.cms.service.ILoginService;
import com.rimi.cms.service.impl.LoginServiceImpl;
import com.rimi.cms.util.CookieUtils;
import com.rimi.cms.util.StringUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

/**
 * ${Description}
 *
 * @author junelee
 * @date 2019/9/23 14:23
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private ILoginService loginService = new LoginServiceImpl();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // 获取账号密码和是否记住账号
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");
        String quicklogin = request.getParameter("quicklogin");

        // 判断用户是否输入了账号密码
        if (StringUtils.isNotEmpty(username) && StringUtils.isNotEmpty(password)) {
            // 判断是否存在该用户
            boolean login = loginService.login(username, password,request);
            // 存在账户
            if (login) {
                success(request, response, username, password, remember,quicklogin);
            }  else {
                // 不存在账户
                error(request, response);
            }

        } else {
            error(request, response);
        }

    }


    private void error(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 设置错误信息
        request.setAttribute("error", ErrorConstant.LOGIN_ERROR.getMsg());
        // 将信息转发到页面上去
        request.getRequestDispatcher("/login.jsp").forward(request,response);
    }


    private void success(HttpServletRequest request, HttpServletResponse response, String username, String password,
                         String remember, String quicklogin) throws IOException {
        // 判断用户是否勾选remember
        if (remember != null) {
            CookieUtils.setCookie("username",username,7*24*60*60,response);
            CookieUtils.setCookie("password",password,response);
        }
        // 判断用户 是否勾选七天免登录
        if (quicklogin != null) {
            request.getSession().setAttribute("username", username);
        }
        // 成功后跳转到另外一个页面
        response.sendRedirect(request.getContextPath()+"/cards?method=toAll");

    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 七天免登录
        HttpSession session = request.getSession();
        // 判断session中是否有用户
        if (session != null && session.getAttribute("username") != null) {
            response.sendRedirect(request.getContextPath()+"cards?method=list");
        } else {
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }
}
