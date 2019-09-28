<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!--360浏览器优先以webkit内核解析-->


    <title>查询卡牌</title>

    <link rel="shortcut icon" href="favicon.ico">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">

    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/style.min.css" rel="stylesheet">

</head>
<style>
    tr th,td{
        text-align: center;
        margin:0 auto;
    }
</style>

<body class="gray-bg">

<!-- Button trigger modal -->
<button type="button" class="btn btn-lg btn-danger  " data-toggle="modal" data-target=".modal">
    删除卡牌
</button>
<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
    <div class="modal-dialog" role="document" aria-hidden="true">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="gridSystemModalLabel">删除卡牌</h4>
            </div>
            <div class="modal-body">
                删除卡片后可能会引发一些不可预料的事情，确认要删除🐎？
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary deleteAll">确认删除</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<table class="table table-hover ">

        <tr class="info" >
            <th><input type="checkbox" id="checkedAll"></th>
            <th>ID</th>
            <th>卡牌名字</th>
            <th>卡牌费用</th>
            <th>卡牌等级</th>
            <th>卡牌类型</th>
            <th>卡牌阵营</th>
            <th>卡牌攻击力</th>
            <th>卡牌生命值</th>
            <th>卡牌特性</th>
            <th>卡牌简介</th>
        </tr>

    <%--    未分页的版本呢     --%>
<%--    <c:forEach items="${cards}" var="card" varStatus="s">--%>
<%--        <tr class="active" style="--%>
<%--&lt;%&ndash;        <c:if test="${s.count % 2 == 1}">background-color:rgba(164,255,245,0.07);</c:if>&ndash;%&gt;--%>
<%--&lt;%&ndash;        <c:if test="${s.count % 2 == 0}">background-color:rgba(28,202,238,0.1);</c:if>&ndash;%&gt;--%>
<%--                ">--%>
<%--            <td><input id="checkbox" type="checkbox" class="checkedInfo" value="${card.cardId}"></td>--%>
<%--            <td class="td-hover">${card.cardId}</td>--%>
<%--            <td>${card.cardName}</td>--%>
<%--            <td>${card.cardCost}</td>--%>
<%--            <td>${card.cardLevel}</td>--%>
<%--            <td>${card.cardType}</td>--%>
<%--            <td>${card.cardFaction}</td>--%>
<%--            <td>${card.cardAtk}</td>--%>
<%--            <td>${card.cardHp}</td>--%>
<%--            <td width="350px;">${card.cardPower}</td>--%>
<%--            <td width="350px;">${card.cardIntro}</td>--%>
<%--        </tr>--%>
<%--    </c:forEach>--%>



    <%--    分页了的版本    --%>
    <c:forEach items="${page.pageData}" var="card">
        <tr class="active">
            <td><input name="checkbox" id="checkbox" type="checkbox" class="checkedInfo" value="${card.cardId}"></td>
            <td class="td-hover">${card.cardId}</td>
            <td>${card.cardName}</td>
            <td>${card.cardCost}</td>
            <td>${card.cardLevel}</td>
            <td>${card.cardType}</td>
            <td>${card.cardFaction}</td>
            <td>${card.cardAtk}</td>
            <td>${card.cardHp}</td>
            <td width="350px;">${card.cardPower}</td>
            <td width="350px">${card.cardIntro}</td>
        </tr>
    </c:forEach>
</table>


<%--显示总条数--%>
<div style="float: left;">
    <span>总共 ${page.totalCount} 条数据</span>
</div>

<%--页码栏--%>
<form class="search-form" action="${pageContext.request.contextPath}/cards?method=all" method="post" ></form>

<div class="text-center">
    <nav aria-label="Page navigation">
        <ul class="pagination">
            <c:if test="${page.currentPage > 1}">
                <li>
                    <a href="javaScript:void(0);" data-page="${page.currentPage - 1}" class="page">
                        <span>&laquo;</span>
                    </a>
                </li>
            </c:if>
            <c:forEach begin="1" end="${page.pageCount}" step="1" var="p">
                <c:if test="${page.currentPage == p}">
                    <li class="active">
                        <a href="javaScript:void(0);" data-page="${p}" class="page">${p}</a>
                    </li>
                </c:if>
                <c:if test="${page.currentPage != p}">
                    <li>
                        <a href="javaScript:void(0);" data-page="${p}" class="page">${p}</a>
                    </li>
                </c:if>
            </c:forEach>
            <c:if test="${page.currentPage < page.pageCount}">
                <li>
                    <a href="javaScript:void(0);" data-page="${page.currentPage + 1}" class="page">
                        <span>&raquo;</span>
                    </a>
                </li>
            </c:if>
        </ul>
    </nav>
</div>



<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/plugins/layer/layer.min.js"></script>
<script src="js/content.min.js"></script>
<script src="js/welcome.min.js"></script>
<script>
    $(function(){
        // 监听a标签的点击事件
        $('.page').click(function () {
            //获取a标签中的页码
            var p = $(this).attr('data-page');
            $('.search-form').attr('action', "${pageScope.request.contextPath}/cards?method=toDel&p=" + p);
            $('.search-form').submit();
        });
    });
</script>
<script>
    $(function () {

        var $info = $('.checkedInfo');
        var ids = [];


        // 获取选择的个数
        var num = function () {
            var num = 0;
            $info.each(function () {
                if (this.checked === true) {
                    ids[num] = this.value;
                    num++;
                }
            });
            return num;
        };


        // 监听点击
        $info.click(function () {
            if ($info.length === num()) {
                $("#checkedAll").prop("checked", true);
            } else {
                $("#checkedAll").prop("checked", false);
            }
        });


        // 全选
        $("#checkedAll").click(function () {
            // 获取当前是否选择
            var checked = this.checked;
            // = 赋值
            // == 等于   '1' == 1  true
            // === 等于   '1' === 1  false
            if (checked === true) {
                $info.prop('checked', true);
            } else {
                $info.prop('checked', false);
            }
            $("input[name='checkbox']:checked").each(function(i){//把所有被选中的复选框的值存入数组
                ids[i] =$(this).val();
            });
            console.log(ids);
        });


        $('.deleteAll').click(function () {

            // 判断是否选择了要删除的数据
            if (ids.length === 0) {
                alert("请选择需要删除的数据");
                return;
            }

            // 通过ajax删除数据,然后同步刷新页面
            // jq ajax
            $.ajax({
                url: '${pageContext.request.contextPath}/cards?method=del',
                type: 'post',
                data: {'id': ids},
                success: function (result) {
                    // 刷新页面
                    window.location.reload();
                },
                error: function () {
                    alert("删除失败了");
                }
            });

        })
    })
</script>

</body>

</html>