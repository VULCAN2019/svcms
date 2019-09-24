package com.rimi.cms.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 过滤器
 * 解决乱码问题的过滤器
 *
 * @author junelee
 * @date 2019/9/24 8:40
 */
public class EncodingFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("初始化编码过滤器");
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        // 统一编码
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse resp = (HttpServletResponse) servletResponse;
        System.out.println("过滤编码中。。。");
        // 设置编码
        req.setCharacterEncoding("UTF-8");

        // 执行后面的逻辑
        filterChain.doFilter(req,resp);
        resp.setCharacterEncoding("UTF-8");
    }

    @Override
    public void destroy() {

    }
}
