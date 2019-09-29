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
import javax.servlet.http.HttpSession;
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
     * 跳转到主页
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









    /**
     * 查询所有数据
     * @param request
     * @param response
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String doAll(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {
        // 响应数据
        //response.setContentType("text/html;charset=utf-8");
        // fastJson核心类 JSONObject
        //JSONObject jo = new JSONObject();



        // 获取分页的参数(当前第几页)，因为没有设置过“p”的值，所以默认为0
        String currentPage = request.getParameter("p");
        // 正因为为0，所以这里半段是否为空是返回true的
        if(StringUtils.isEmpty(currentPage)) {
            // 初始化当前页数为1
            currentPage = "1";
        }
        // 设置每页显示的条数
        // 创建一个分页对象    转换为数字对象类型  传入当前页数
        Page page = Page.of(Integer.valueOf(currentPage));

        // 获取查询的条件  若jsp那边没有form表单提交的查询条件，
        // 那么这里就啥都没有，所以执行的条件查询就不会带条件去查询，
        // 所以查询到的结果将会为所有卡牌数据
        Map<String, String[]> parms = request.getParameterMap();

        // 调用分页方法获取数据，这个数据里面放了一页里能存放的所有卡牌
        Page<Card> cardsPage = cardService.myFindPageCard(page, parms);
        // 把分页的信息发送到页面
        request.setAttribute("page",cardsPage);




        //List<Card> cards = cardService.getAll();
        //
        //request.setAttribute("cards",cards);
        //
        return "card/index_v1";
    }






    public String doToSelect(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {

        // 获取分页的参数(当前第几页)，因为没有设置过“p”的值，所以默认为0
        String currentPage = request.getParameter("p");
        // 正因为为0，所以这里半段是否为空是返回true的
        if(StringUtils.isEmpty(currentPage)) {
            // 初始化当前页数为1
            currentPage = "1";
        }
        // 设置每页显示的条数
        // 创建一个分页对象    转换为数字对象类型  传入当前页数
        Page page = Page.of(Integer.valueOf(currentPage));

        // 获取查询的条件  若jsp那边没有form表单提交的查询条件，
        // 那么这里就啥都没有，所以执行的条件查询就不会带条件去查询，
        // 所以查询到的结果将会为所有卡牌数据
        Map<String, String[]> parms = request.getParameterMap();

        // 调用分页方法获取数据，这个数据里面放了一页里能存放的所有卡牌
        Page<Card> cardsPage = cardService.myFindPageCard(page, parms);
        // 把分页的信息发送到页面
        request.setAttribute("page",cardsPage);

        return "card/index_v2";
    }

    /**
     * 获取查询条件并查询出数据后跳转到页面
     * @param request
     * @param response
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String doSelect(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {

        // 获取分页的参数(当前第几页)，因为没有设置过“p”的值，所以默认为0
        String currentPage = request.getParameter("p");
        // 正因为为0，所以这里半段是否为空是返回true的
        if(StringUtils.isEmpty(currentPage)) {
            // 初始化当前页数为1
            currentPage = "1";
        }
        // 设置每页显示的条数
        // 创建一个分页对象    转换为数字对象类型  传入当前页数
        Page page = Page.of(Integer.valueOf(currentPage));

        // 获取查询的条件  若jsp那边没有form表单提交的查询条件，
        // 那么这里就啥都没有，所以执行的条件查询就不会带条件去查询，
        // 所以查询到的结果将会为所有卡牌数据
        Map<String, String[]> parms = request.getParameterMap();

        // 调用分页方法获取数据，这个数据里面放了一页里能存放的所有卡牌
        Page<Card> cardsPage = cardService.myFindPageCard(page, parms);
        // 把分页的信息发送到页面
        request.setAttribute("page",cardsPage);



        //// 获取查询的条件
        //Map<String, String[]> params = request.getParameterMap();
        //
        //// 调用方法获取数据
        //List<Card> cards = cardService.findPageCard(params);
        //
        ////  把查询到得信息发送到页面
        //request.setAttribute("cards",cards);
        return "card/index_v2";
    }

    /**
     * 跳转页面
     * @param request
     * @param response
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String doToInsert(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {

        return "card/index_v3";
    }

    /**
     * 获取要插入的数据并插入到数据库
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public String doInsert(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {

        // 获取要插入的参数值
        Map<String, String[]> params = request.getParameterMap();

        // 遍历输入框内的内容
        for (String s : params.keySet()) {
            //System.out.println(s);
            //System.out.println(params.get(s)[0]);

            // 判断用户是否输入了内容，如果没有输入就直接进入这里面
            if (StringUtils.isEmpty(params.get(s)[0])) {
                request.setAttribute("info","卡牌添加失败！");
                return "card/index_v3";
            }
        }
        // 调用service中的保存方法
        cardService.save(params);
        request.setAttribute("info","卡牌添加成功~");

        return "card/index_v3";
    }

    /**
     * 获取所有数据并跳转页面
     * @param request
     * @param response
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String doToDel(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {

        // 获取分页的参数(当前第几页)，因为没有设置过“p”的值，所以默认为0
        String currentPage = request.getParameter("p");
        // 正因为为0，所以这里半段是否为空是返回true的
        if(StringUtils.isEmpty(currentPage)) {
            // 初始化当前页数为1
            currentPage = "1";
        }
        // 设置每页显示的条数
        // 创建一个分页对象    转换为数字对象类型  传入当前页数
        Page page = Page.of(Integer.valueOf(currentPage));

        // 获取查询的条件  若jsp那边没有form表单提交的查询条件，
        // 那么这里就啥都没有，所以执行的条件查询就不会带条件去查询，
        // 所以查询到的结果将会为所有卡牌数据
        Map<String, String[]> parms = request.getParameterMap();

        // 调用分页方法获取数据，这个数据里面放了一页里能存放的所有卡牌
        Page<Card> cardsPage = cardService.myFindPageCard(page, parms);
        // 把分页的信息发送到页面
        request.setAttribute("page",cardsPage);



        //// 先获取所有数据到表中
        //List<Card> cards = cardService.getAll();
        //request.setAttribute("cards",cards);

        return "card/index_v4";
    }

    /**
     * 执行删除的方法
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void doDel(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {

        // 获取参数
        String[] ids = request.getParameterValues("id[]");
        // 调用根据id删除数据的方法
        cardService.deleteByIds(ids);

    }

    /**
     * 执行获取一个id的方法
     * @param request   请求
     * @param response  响应
     * @throws ServletException
     * @throws IOException
     */
    public void doId(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {
        // 设置响应编码格式
        response.setContentType("text/html;charset=utf-8");
        // 获取id
        String id = request.getParameter("id");
        // 调用以id查找一条数据的方法
        Card card = cardService.findForOne(id);
        //new一个json对象
        JSONObject jsonObject = new JSONObject();
        // 将card转成json对象，名字为card
        jsonObject.put("card",card);
        // 放到req作用域中
        request.setAttribute("card",card);

        response.getWriter().print(jsonObject.toString());
        //response.getWriter().print(JSONObject.toJSONString(jsonObject));

        //System.out.println(card);

    }

    /**
     * 获取所有数据并跳转页面
     * @param request
     * @param response
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String doToModify (HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {

        // ==================分页版本=======================
        //// 获取分页的参数(当前第几页)，因为没有设置过“p”的值，所以默认为0
        //String currentPage = request.getParameter("p");
        //// 正因为为0，所以这里半段是否为空是返回true的
        //if(StringUtils.isEmpty(currentPage)) {
        //    // 初始化当前页数为1
        //    currentPage = "1";
        //}
        //// 设置每页显示的条数
        //// 创建一个分页对象    转换为数字对象类型  传入当前页数
        //Page page = Page.of(Integer.valueOf(currentPage));
        //
        //// 获取查询的条件  若jsp那边没有form表单提交的查询条件，
        //// 那么这里就啥都没有，所以执行的条件查询就不会带条件去查询，
        //// 所以查询到的结果将会为所有卡牌数据
        //Map<String, String[]> parms = request.getParameterMap();
        //
        //// 调用分页方法获取数据，这个数据里面放了一页里能存放的所有卡牌
        //Page<Card> cardsPage = cardService.myFindPageCard(page, parms);
        //// 把分页的信息发送到页面
        //request.setAttribute("page",cardsPage);

        // ================未分页版本======================
        List<Card> cards = cardService.getAll();

        request.setAttribute("cards",cards);

        return "card/index_v5";
    }

    public String doModify(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {

        // ----------------------未分页版本------------------------
        Map<String, String[]> modifyInfo = request.getParameterMap();

        cardService.update(modifyInfo);
        // 获取所有卡牌信息
        List<Card> cards = cardService.getAll();
        // 设置信息到作用域
        request.setAttribute("cards",cards);


        // -----------------------分页版本------------------------
        //// 获取分页的参数(当前第几页)，因为没有设置过“p”的值，所以默认为0
        //String currentPage = request.getParameter("p");
        //// 正因为为0，所以这里半段是否为空是返回true的
        //if(StringUtils.isEmpty(currentPage)) {
        //    // 初始化当前页数为1
        //    currentPage = "1";
        //}
        //// 设置每页显示的条数
        //// 创建一个分页对象    转换为数字对象类型  传入当前页数
        //Page page = Page.of(Integer.valueOf(currentPage));
        //
        //// 获取查询的条件  若jsp那边没有form表单提交的查询条件，
        //// 那么这里就啥都没有，所以执行的条件查询就不会带条件去查询，
        //// 所以查询到的结果将会为所有卡牌数据
        ///**
        // * 因为修改的jsp页面那边有提交修改信息的form表单，
        // * 所以这里分页条件会分出符合修改后信息条件的卡牌数据，
        // * 简而言之呢就是提交后只显示修改后的卡牌信息
        // */
        //Map<String, String[]> parms = request.getParameterMap();
        //
        //// 调用分页方法获取数据，这个数据里面放了一页里能存放的所有卡牌
        //Page<Card> cardsPage = cardService.myFindPageCard(page, parms);
        //// 把分页的信息发送到页面
        //request.setAttribute("page",cardsPage);





        return "card/index_v5";


    }

    /**
     * 未完成的功能
     * @param request
     * @param response
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String doModifyPage(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {


        // 获取分页的参数(当前第几页)，因为没有设置过“p”的值，所以默认为0
        String currentPage = request.getParameter("p");
        // 正因为为0，所以这里半段是否为空是返回true的
        if(StringUtils.isEmpty(currentPage)) {
            // 初始化当前页数为1
            currentPage = "1";
        }
        // 设置每页显示的条数
        // 创建一个分页对象    转换为数字对象类型  传入当前页数
        Page page = Page.of(Integer.valueOf(currentPage));

        // 获取查询的条件  若jsp那边没有form表单提交的查询条件，
        // 那么这里就啥都没有，所以执行的条件查询就不会带条件去查询，
        // 所以查询到的结果将会为所有卡牌数据
        /**
         * 因为修改的jsp页面那边有提交修改信息的form表单，
         * 所以这里分页条件会分出符合修改后信息条件的卡牌数据，
         * 简而言之呢就是提交后只显示修改后的卡牌信息
         */
        Map<String, String[]> parms = request.getParameterMap();

        // 调用分页方法获取数据，这个数据里面放了一页里能存放的所有卡牌
        Page<Card> cardsPage = cardService.myFindPageCard(page, parms);
        // 把分页的信息发送到页面
        request.setAttribute("page",cardsPage);



        //// 获取所有卡牌信息
        //List<Card> cards = cardService.getAll();
        //// 设置信息到作用域
        //request.setAttribute("cards",cards);

        return "card/index_v5";


    }

    /**
     * 待开发
     * @param request
     * @param response
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String doExtract(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {
        return "card/index_v6";
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 七天免登录
        HttpSession session = request.getSession();
        // 判断session中是否有用户
        if (session != null && session.getAttribute("username") != null) {
            // 有用户就执行这里
            response.sendRedirect(request.getContextPath()+"cards?method=toAll");
        } else {
            // 没有就执行这里
            response.sendRedirect(request.getContextPath()+"cards/login.jsp");
        }
    }


}
