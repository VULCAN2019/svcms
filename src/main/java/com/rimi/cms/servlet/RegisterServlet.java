package com.rimi.cms.servlet;

import com.rimi.cms.common.BaseServlet;
import com.rimi.cms.dao.IUserDao;
import com.rimi.cms.dao.impl.UserDaoImpl;
import com.rimi.cms.entity.User;
import com.rimi.cms.service.ILoginService;
import com.rimi.cms.service.impl.LoginServiceImpl;
import com.rimi.cms.util.StringUtils;

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
 * @date 2019/9/27 17:10
 */
@WebServlet("/register")
public class RegisterServlet extends BaseServlet {

    private ILoginService loginService = new LoginServiceImpl();

    public String doRegister(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {

        // 判断用户名和密码是否为空
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String password2 = request.getParameter("password2");
        String protocol = request.getParameter("protocol");
        if (StringUtils.isNotEmpty(username) || StringUtils.isNotEmpty(password) || StringUtils.isNotEmpty(password2)) {
            User user = new User();
            user.setUsername(username);
            user.setPassword(password);
            // 判断两次密码是否一致
            if (password.equals(password2)) {
                // 判断是否勾选同意协议
                if (protocol != null) {
                    // 判断是否存在该用户
                    if (loginService.checkUsername(user)) {
                        // 判断是否创建成功
                        if (loginService.register(username, password)) {
                            request.setAttribute("success", "注册成功，请登录吧！");

                            return "/card/login";
                        }
                    } else {
                        request.setAttribute("error", "该用户名已存在");

                        return "/card/register";
                    }
                } else {
                    request.setAttribute("error", "请查看协议并同意");
                    request.getRequestDispatcher("/register.jsp").forward(request, response);
                    return "/card/register";
                }
            } else {
                request.setAttribute("error", "两次输入的密码不相同");

                return "/card/register";
            }
        } else {
            request.setAttribute("error", "账号或密码不得为空");

            return "/card/register";
        }
        return "";
    }


    public String doToRegister(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {

        return "card/register";

    }



}
