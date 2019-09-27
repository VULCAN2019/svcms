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
    <link rel="stylesheet" href="/layui/css/layui.css">
    <%--    <base target="_blank">--%>
    <%--    <script>--%>
    <%--        function sendAjax() {--%>
    <%--            $.post("/cards", "?method=del", function (result) {--%>
    <%--                console.log(result);--%>
    <%--                alert(result);--%>
    <%--            }, 'json');--%>
    <%--        }--%>
    <%--    </script>--%>
    <script>
        var i = 0;
        if (i < 1) {
            function modify(id) {
                $.ajax({
                    type: "post",
                    url: "${pageScope.request.contextPath}/cards?method=id",
                    data: {"id": id},
                    success: function (result) {
                        // alert(result);
                        // var employees =result[0];
                        // alert(employees[0].cardAtk);
                        debugger
                        var obj =JSON.parse(result);
                        //
                        $("#cardHp").val(obj.card.cardAtk);
                        $("#cardName").val(obj.card.cardName);
                        $("#card")

                    }
                }, 'json');
                i++;


            }
        }
    </script>
</head>
<style>

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
                        <form class="form-horizontal" action="${pageContext.request.contextPath}/cards?method=insert"
                              method="post">
                            <div style="width:900px;" class="form-group">
                                <label for="cardName" class="col-md-2 control-label">卡牌名字:</label>
                                <div class="col-md-6">
                                    <input style="width:300px;" type="text" class="form-control" id="cardName"
                                           name="cardName" placeholder="请输入" />
                                </div>
                            </div>
                            <div style="width:900px;" class="form-group">
                                <label for="cardCost" class="col-md-2 control-label">卡牌费用:</label>
                                <div class="col-md-6">
                                    <input style="width:300px;" type="number" min="0" value="0" class="form-control"
                                           id="cardCost" name="cardCost" placeholder="请输入" />
                                </div>
                            </div>
                            <div style="width:900px;" class="form-group">
                                <label for="cardLevel" class="col-md-2 control-label">卡牌等级:</label>
                                <div class="col-md-6">
                                    <input style="width:300px;" type="text" class="form-control" id="cardLevel"
                                           name="cardLevel" placeholder="请输入" />
                                </div>
                            </div>
                            <div style="width:900px;" class="form-group">
                                <label for="cardType" class="col-md-2 control-label">卡牌类型：</label>
                                <div class="col-md-6">
                                    <input style="width:300px;" type="text" class="form-control" id="cardType"
                                           name="cardType" placeholder="请输入" />
                                </div>
                            </div>
                            <div style="width:900px;" class="form-group">
                                <label for="cardFaction" class="col-md-2 control-label">卡牌阵营：</label>
                                <div class="col-md-6">
                                    <input style="width:300px;" type="text" class="form-control" id="cardFaction"
                                           name="cardFaction" placeholder="请输入" "/>
                                </div>
                            </div>
                            <div style="width:900px;" class="form-group">
                                <label for="cardAtk" class="col-md-2 control-label">卡牌攻击力:</label>
                                <div class="col-md-6">
                                    <input style="width:300px;" type="number" min="0" value="0" class="form-control"
                                           id="cardAtk" name="cardAtk" placeholder="请输入" />
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
                                <input type="submit" class="btn btn-primary" value="提交"/>
                                <a class="btn btn-primary" href="/book/list">取消</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

<table class="table table-hover table-bordered" style="text-align: center">
    <tr class="success">
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

    <c:forEach items="${cards}" var="card" varStatus="s">
        <tr style="
        <c:if test="${s.count % 2 == 1}">background-color:rgba(164,255,245,0.07);</c:if>
        <c:if test="${s.count % 2 == 0}">background-color:rgba(28,202,238,0.1);</c:if>
                ">
                <%--            <td><input name="c" type="radio" class="checkedInfo" value="${card.cardId}"></td>--%>
            <td>${card.cardId}</td>
            <td>${card.cardName}</td>
            <td>${card.cardCost}</td>
            <td>${card.cardLevel}</td>
            <td>${card.cardType}</td>
            <td>${card.cardFaction}</td>
            <td>${card.cardAtk}</td>
            <td>${card.cardHp}</td>
            <td>${card.cardPower}</td>
            <td>${card.cardIntro}</td>
            <td>
                <!-- Button trigger modal -->
                <button type="button" class="btn btn-danger btn-lg"
                        data-toggle="modal" data-target="#myModal"

                        onmouseover="modify(${card.cardId})">
                    修改卡牌
                </button>
                    <%--                <a  onmouseover="modify(${card.cardId})">喜喜</a>--%>
            </td>
        </tr>
    </c:forEach>
</table>

<script src="js/my.js"></script>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/plugins/layer/layer.min.js"></script>
<script src="js/content.min.js"></script>
<script src="js/welcome.min.js"></script>
<script>

    // 单选框监听
    $(function () {
        var $info = $('.checkedInfo');
        var ids = [];
        // 获取选择的个数
        var num = function () {
            var num = 0;
            $info.each(function () {
                if (this.checked === true) {
                    // this.value获取到的为勾选到的数据的id号
                    ids[num] = this.value;
                    var id = this.value;
                    num++;
                    console.log(this.value);
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
    });


</script>

</body>

</html>