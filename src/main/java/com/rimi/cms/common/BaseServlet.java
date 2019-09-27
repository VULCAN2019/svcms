package com.rimi.cms.common;

import com.rimi.cms.util.StringUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/**
 * 公共的servlet
 *
 * @author shangzf
 * @date 2019/9/17 14:46
 */
public abstract class BaseServlet extends HttpServlet {

    private static final String METHOD_KEY = "method";
    private static final String METHOD_PREFIX = "do";
    private static final String PATH_PREFIX = "redirect:";
    private static final String METHOD_END = "?v=4.0";

    /**
     * 视图的前缀
     */
    private static final String VIEW_PREFIX = "/WEB-INF/view/";
    /**
     * 视图的后缀
     */
    private static final String VIEW_SUFFIX = ".jsp";

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("执行具体的操作");
        // 1.获取请求的参数
        String method = req.getParameter(METHOD_KEY);
        // 1.1判断结尾是否有奇怪的字符串，有就截掉
        String path2 = method;
        if (method.contains(METHOD_END)) {
            path2 = method.substring(0, method.indexOf("?"));
        }
        // 2.判断方法是否在
        if (StringUtils.isNotEmpty(method)) {
            // 3.使用工具类把add转换成doAdd
            String doMethod = StringUtils.appendDoMethod(METHOD_PREFIX, path2);
            // 4.获取当前类的类类型
            Class<?> aClass = this.getClass();
            try {
                // 5.通过反射获取方法
                Method method1 = aClass.getMethod(doMethod, HttpServletRequest.class, HttpServletResponse.class);
                // 6.调用方法
                Object result = method1.invoke(this, req, resp);
                // 7.判断返回值的类型是否是String
                if (result instanceof String) {
                    String path = (String) result;
                    if (StringUtils.isNotEmpty(path)) {

                        // 判断路径是否以 redirect:开头,如果是,则调用重定向方法
                        if (path2.startsWith(PATH_PREFIX)) {
                            // 截取
                            String substring = path2.substring(PATH_PREFIX.length());
                            // 重定向
                            resp.sendRedirect(req.getContextPath() + substring);
                        } else {
                            // 请求转发  /book/list  --> /WEB-INF/view/book/list.jsp
                            req.getRequestDispatcher(VIEW_PREFIX + path + VIEW_SUFFIX).forward(req, resp);
                        }

                    }
                }
            } catch (NoSuchMethodException e) {
                e.printStackTrace();
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            } catch (InvocationTargetException e) {
                e.printStackTrace();
            }

        }
    }
}
