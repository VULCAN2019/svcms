package com.rimi.cms.filter;


import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * 登陆过滤器
 *
 * @author junelee
 * @date 2019/9/23 20:24
 */
public class LoginFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("登陆的过滤器正在初始化。。。");
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        System.out.println("有人正在登陆....");
        // 获取当前得请求路径
        String uri = request.getRequestURI();
        // 判断请求得路径中是否包含需要放行得地址
        if (uri.contains("/css/") || uri.contains("/js/") || uri.contains("/fonts/") || uri.contains("/error/") || uri.contains("/login.jsp/") || uri.contains("/login") || uri.contains("/index.jsp") || uri.contains("/img") || uri.contains("/cards")  || uri.contains("/")  ) {
            filterChain.doFilter(servletRequest,servletResponse);
        } else {
            // 1.获取session得用户
            HttpSession session = request.getSession();
            Object username = session.getAttribute("username");
            String s = (String)username;
            System.out.println("对象"+s);
            if (username == null) {
                // 2.1如果没有获取到，则重定向到登陆页面
                response.sendRedirect(request.getContextPath() + "/login.jsp");
            } else {
                // 2.2如果获取到了，则放行
                filterChain.doFilter(servletRequest,servletResponse);
            }
        }

    }

    @Override
    public void destroy() {
        System.out.println("登陆的过滤器正在关闭。。。");
    }
}
