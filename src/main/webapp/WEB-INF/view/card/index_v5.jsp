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

    <script>
        var i = 0;
        if (i < 1) {
            function modify(id) {
                $.ajax({
                    type: "post",
                    url: "${pageScope.request.contextPath}/cards?method=id",
                    data: {"id": id},
                    success: function (result) {
                        //alert(result);

                        var obj = JSON.parse(result);
                        // 把值放进内容框
                        $("#cardId").val(obj.card.cardId);
                        $("#cardHp").val(obj.card.cardAtk);
                        $("#cardName").val(obj.card.cardName);
                        $("#cardCost").val(obj.card.cardCost);
                        $("#cardLevel").val(obj.card.cardLevel);
                        $("#cardType").val(obj.card.cardType);
                        $("#cardFaction").val(obj.card.cardFaction);
                        $("#cardAtk").val(obj.card.cardAtk);
                        $("#cardPower").val(obj.card.cardPower);
                        $("#cardIntro").val(obj.card.cardIntro);

                    }
                }, 'json');
                i++;
            }
        }

        var infos = {};
        function sendAjax() {
            $.ajax({
                url: '${pageContext.request.contextPath}/cards?method=modify',
                type: 'post',
                data: {'infos' : infos},
                success : function (result) {
                    // 刷新页面
                    //window.location.reload();
                },
                error : function () {
                    alert("添加失败了");
                }
            });
        }

    </script>
</head>
<style>
    tr th,td{
        text-align: center;
        margin:0 auto;
    }
</style>

<body class="gray-bg">

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">修改卡牌信息</h4>
            </div>
            <div class="modal-body">
                <div class="container">
                    <div class="row">
                        <form class="form-horizontal <%--class="search-form"--%> " action="${pageContext.request.contextPath}/cards?method=modify"
                              method="post">
                            <div style="width:900px; display:none;" class="form-group">
                                <label for="cardId" class="col-md-2 control-label">卡牌Id:</label>
                                <div class="col-md-6">
                                    <input readonly style="width:300px;" type="text" class="form-control" id="cardId"
                                           name="cardId" placeholder="请输入"/>
                                </div>
                            </div>
                            <div style="width:900px;" class="form-group">
                                <label for="cardName" class="col-md-2 control-label">卡牌名字:</label>
                                <div class="col-md-6">
                                    <input style="width:300px;" type="text" class="form-control" id="cardName"
                                           name="cardName" placeholder="请输入"/>
                                </div>
                            </div>
                            <div style="width:900px;" class="form-group">
                                <label for="cardCost" class="col-md-2 control-label">卡牌费用:</label>
                                <div class="col-md-6">
                                    <input style="width:300px;" type="number" min="0" value="0" class="form-control"
                                           id="cardCost" name="cardCost" placeholder="请输入"/>
                                </div>
                            </div>
                            <div style="width:900px;" class="form-group">
                                <label for="cardLevel" class="col-md-2 control-label">卡牌等级:</label>
                                <div class="col-md-6">
                                    <input style="width:300px;" type="text" class="form-control" id="cardLevel"
                                           name="cardLevel" placeholder="请输入"/>
                                </div>
                            </div>
                            <div style="width:900px;" class="form-group">
                                <label for="cardType" class="col-md-2 control-label">卡牌类型：</label>
                                <div class="col-md-6">
                                    <input style="width:300px;" type="text" class="form-control" id="cardType"
                                           name="cardType" placeholder="请输入"/>
                                </div>
                            </div>
                            <div style="width:900px;" class="form-group">
                                <label for="cardFaction" class="col-md-2 control-label">卡牌阵营：</label>
                                <div class="col-md-6">
                                    <input style="width:300px;" type="text" class="form-control" id="cardFaction"
                                           name="cardFaction" placeholder="请输入"/>
                                </div>
                            </div>
                            <div style="width:900px;" class="form-group">
                                <label for="cardAtk" class="col-md-2 control-label">卡牌攻击力:</label>
                                <div class="col-md-6">
                                    <input style="width:300px;" type="number" min="0" value="0" class="form-control"
                                           id="cardAtk" name="cardAtk" placeholder="请输入"/>
                                </div>
                            </div>
                            <div style="width:900px;" class="form-group">
                                <label for="cardHp" class="col-md-2 control-label">卡牌生命值:</label>
                                <div class="col-md-6">
                                    <input style="width:300px;" type="number" min="0" value="0" class="form-control"
                                           id="cardHp" name="cardHp" placeholder="请输入" value=""/>
                                </div>
                            </div>
                            <div style="width:900px;" class="form-group">
                                <label for="cardPower" class="col-md-2 control-label">卡牌简介:</label>
                                <div class="col-md-6">
                                    <input style="width:300px;" type="text" class="form-control" id="cardPower"
                                           name="cardPower" placeholder="请输入" value=""/>
                                </div>
                            </div>
                            <div style="width:900px;" class="form-group">
                                <label for="cardIntro" class="col-md-2 control-label">卡牌特性:</label>
                                <div class="col-md-6">
                                    <input style="width:300px;" type="text" class="form-control" id="cardIntro"
                                           name="cardIntro" placeholder="请输入" value=""/>
                                </div>
                            </div>
                            <div style="width:560px;" class="form-group text-center">
                                <button type="submit" class="btn btn-primary"   >提交</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

<table class="table table-hover " style="text-align: center">
    <tr class="info">
        <%--        <th></th>--%>
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
        <th></th>
    </tr>
    <%--    未分页的版本      --%>
    <c:forEach items="${cards}" var="card" varStatus="s">
        <tr class="active" style="
            <%--        <c:if test="${s.count % 2 == 1}">background-color:rgba(164,255,245,0.07);</c:if>--%>
            <%--        <c:if test="${s.count % 2 == 0}">background-color:rgba(28,202,238,0.1);</c:if>--%>
                ">
            <td>${card.cardId}</td>
            <td>${card.cardName}</td>
            <td>${card.cardCost}</td>
            <td>${card.cardLevel}</td>
            <td>${card.cardType}</td>
            <td>${card.cardFaction}</td>
            <td>${card.cardAtk}</td>
            <td>${card.cardHp}</td>
            <td width="350px;">${card.cardPower}</td>
            <td width="350px;">${card.cardIntro}</td>
            <td>
                <!-- Button trigger modal -->
                <button type="button" class="btn btn-danger btn-lg"
                        data-toggle="modal" data-target="#myModal"

                        onmouseover="modify(${card.cardId})">
                    修改卡牌
                </button>
            </td>
        </tr>
    </c:forEach>


    <%--    分页了的版本    --%>
<%--    <c:forEach items="${page.pageData}" var="card">--%>
<%--        <tr class="active">--%>
<%--            <td class="td-hover">${card.cardId}</td>--%>
<%--            <td>${card.cardName}</td>--%>
<%--            <td>${card.cardCost}</td>--%>
<%--            <td>${card.cardLevel}</td>--%>
<%--            <td>${card.cardType}</td>--%>
<%--            <td>${card.cardFaction}</td>--%>
<%--            <td>${card.cardAtk}</td>--%>
<%--            <td>${card.cardHp}</td>--%>
<%--            <td width="350px;">${card.cardPower}</td>--%>
<%--            <td width="350px">${card.cardIntro}</td>--%>
<%--            <td>--%>
<%--                <!-- Button trigger modal -->--%>
<%--                <button type="button" class="btn btn-danger btn-lg"--%>
<%--                        data-toggle="modal" data-target="#myModal"--%>

<%--                        onmouseover="modify(${card.cardId})">--%>
<%--                    修改卡牌--%>
<%--                </button>--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--    </c:forEach>--%>
</table>

<%--显示总条数--%>
<%--<div style="float: left;">--%>
<%--    <span>总共 ${page.totalCount} 条数据</span>--%>
<%--</div>--%>

<%--页码栏--%>

<%--<div class="text-center">--%>
<%--    <nav aria-label="Page navigation">--%>
<%--        <ul class="pagination">--%>
<%--            <c:if test="${page.currentPage > 1}">--%>
<%--                <li>--%>
<%--                    <a href="javaScript:void(0);" data-page="${page.currentPage - 1}" class="page">--%>
<%--                        <span>&laquo;</span>--%>
<%--                    </a>--%>
<%--                </li>--%>
<%--            </c:if>--%>
<%--            <c:forEach begin="1" end="${page.pageCount}" step="1" var="p">--%>
<%--                <c:if test="${page.currentPage == p}">--%>
<%--                    <li class="active">--%>
<%--                        <a href="javaScript:void(0);" data-page="${p}" class="page">${p}</a>--%>
<%--                    </li>--%>
<%--                </c:if>--%>
<%--                <c:if test="${page.currentPage != p}">--%>
<%--                    <li>--%>
<%--                        <a href="javaScript:void(0);" data-page="${p}" class="page">${p}</a>--%>
<%--                    </li>--%>
<%--                </c:if>--%>
<%--            </c:forEach>--%>
<%--            <c:if test="${page.currentPage < page.pageCount}">--%>
<%--                <li>--%>
<%--                    <a href="javaScript:void(0);" data-page="${page.currentPage + 1}" class="page">--%>
<%--                        <span>&raquo;</span>--%>
<%--                    </a>--%>
<%--                </li>--%>
<%--            </c:if>--%>
<%--        </ul>--%>
<%--    </nav>--%>
<%--</div>--%>

<script src="js/my.js"></script>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/plugins/layer/layer.min.js"></script>
<script src="js/content.min.js"></script>
<script src="js/welcome.min.js"></script>
<%--<script>--%>
<%--    $(function(){--%>
<%--        // 监听a标签的点击事件--%>
<%--        $('.page').click(function () {--%>
<%--            //获取a标签中的页码--%>
<%--            var p = $(this).attr('data-page');--%>
<%--            $('.search-form').attr('action', "${pageScope.request.contextPath}/cards?method=modifyPage&p=" + p);--%>
<%--            $('.search-form').submit();--%>
<%--        });--%>
<%--    });--%>
<%--</script>--%>


</body>

</html>