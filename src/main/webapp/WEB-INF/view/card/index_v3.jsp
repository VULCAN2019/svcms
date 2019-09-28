<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!--360浏览器优先以webkit内核解析-->


    <title>增加卡牌</title>

    <link rel="shortcut icon" href="favicon.ico">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">

    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/style.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/layui/css/layui.css">

    <script>


        function sendAjax() {
            $.post("/cards?method=insert", "", function (result) {
                    alert("添加成功");

                },
                function () {
                    alert("添加失败");
                }, 'json');
        }

        var cardName = null;
        var cardCost = null;
        var cardLevel = null;
        var cardType = null;
        var cardFaction = null;
        var cardAtk = null;
        var cardHp = null;
        var cardPower = null;
        var cardIntro = null;

        function getElements() {
            // //  获取表单引用(对象)
            // var form = document.getElementById(formId);
            // console.log(form);
            // var elements = [];
            // //  获取表单中指定标签名的元素引用(对象)数组
            // var tagElements = form.getElementsByTagName(label);
            // console.log(tagElements);
            //  for (var i = 0; i < tagElements.length; i++) {
            //      elements.push(tagElements[i]);
            //  }
            // 获取文本框里的值
            cardName = document.getElementById("cardName").value;
            cardCost = document.getElementById("cardCost").value;
            cardLevel = document.getElementById("cardLevel").value;
            cardType = document.getElementById("cardType").value;
            cardFaction = document.getElementById("cardFaction").value;
            cardAtk = document.getElementById("cardAtk").value;
            cardHp = document.getElementById("cardHp").value;
            cardPower = document.getElementById("cardPower").value;
            cardIntro = document.getElementById("cardIntro").value;


        }


        // 点击确认后触发该事件
        // $("#checkNull").click(function () {
        //     console.log(cardName);
        //     if (cardName == null || cardCost == null) {
        //         alert("不能为空");
        //     } else {
        //         alert("nice");
        //     }
        // });

        function checkNull() {

            if (cardName === "") {
                var value = $("#labelName").html().trim();
                alert(value + "内容不能为空");
                $.ajax({
                    url: '${pageContext.request.contextPath}/cards?method=toInsert',
                    type: 'post'
                });
            }
            if (cardCost === "") {
                var value = $("#labelCost").html().trim();
                alert(value + "内容不能为空");
            }
            if (cardLevel === "") {
                var value = $("#labelLevel").html().trim();
                alert(value + "内容不能为空");
            }
            if (cardType === "") {
                var value = $("#labelType").html().trim();
                alert(value + "内容不能为空");
            }
            if (cardFaction === "") {
                var value = $("#labelFaction").html().trim();
                alert(value + "内容不能为空");
            }
            if (cardAtk === "") {
                var value = $("#labelAtk").html().trim();
                alert(value + "内容不能为空");
            }
            if (cardHp === "") {
                var value = $("#labelHp").html().trim();
                alert(value + "内容不能为空");
            }
            if (cardPower === "") {
                var value = $("#labelPower").html().trim();
                alert(value + "内容不能为空");
            }
            if (cardIntro === "") {
                var value = $("#labelIntro").html().trim();
                alert(value + "内容不能为空");
            }
        }


    </script>
</head>
<style>

</style>

<body class="gray-bg">
<div class="container">

    <div class="row">
        <form class="form-horizontal" id="formId" action="${pageContext.request.contextPath}/cards?method=insert"
              method="post">
            <%--            <div style="width:900px; display:none;" class="form-group">--%>
            <%--                <label for="cardId" class="col-md-2 control-label">卡牌Id:</label>--%>
            <%--                <div class="col-md-6">--%>
            <%--                    <input readonly style="width:300px;" type="text" class="form-control" id="cardId"--%>
            <%--                           name="cardId" placeholder="请输入"/>--%>
            <%--                </div>--%>
            <%--            </div>--%>
            <div class="form-group">
                <label id="labelName" for="cardName" class="col-md-4 control-label">卡牌名字:</label>
                <div class="col-md-6">
                    <input type="text" class="form-control" id="cardName" name="cardName" placeholder="请输入"/>
                </div>
            </div>
            <div class="form-group">
                <label id="labelCost" for="cardCost" class="col-md-4 control-label">卡牌费用:</label>
                <div class="col-md-6">
                    <input type="number" min="0" value="0" class="form-control" id="cardCost" name="cardCost"
                           placeholder="请输入"/>
                </div>
            </div>
            <div class="form-group">
                <label id="labelLevel" for="cardLevel" class="col-md-4 control-label">卡牌等级:</label>
                <div class="col-md-6">
                    <input type="text" class="form-control" id="cardLevel" name="cardLevel" placeholder="请输入"/>
                </div>
            </div>
            <div class="form-group">
                <label id="labelType" for="cardType" class="col-md-4 control-label">卡牌类型：</label>
                <div class="col-md-6">
                    <input type="text" class="form-control" id="cardType" name="cardType" placeholder="请输入"/>
                </div>
            </div>
            <div class="form-group">
                <label id="labelFaction" for="cardFaction" class="col-md-4 control-label">卡牌阵营：</label>
                <div class="col-md-6">
                    <input type="text" class="form-control" id="cardFaction" name="cardFaction" placeholder="请输入"/>
                </div>
            </div>
            <div class="form-group">
                <label id="labelAtk" for="cardAtk" class="col-md-4 control-label">卡牌攻击力:</label>
                <div class="col-md-6">
                    <input type="number" min="0" value="0" class="form-control" id="cardAtk" name="cardAtk"
                           placeholder="请输入"/>
                </div>
            </div>
            <div class="form-group">
                <label id="labelHp" for="cardHp" class="col-md-4 control-label">卡牌生命值:</label>
                <div class="col-md-6">
                    <input type="number" min="0" value="0" class="form-control" id="cardHp" name="cardHp"
                           placeholder="请输入"/>
                </div>
            </div>
            <div class="form-group">
                <label id="labelPower" for="cardPower" class="col-md-4 control-label">卡牌简介:</label>
                <div class="col-md-6">
                    <input type="text" class="form-control" id="cardPower" name="cardPower" placeholder="请输入"/>
                </div>
            </div>
            <div class="form-group">
                <label id="labelIntro" for="cardIntro" class="col-md-4 control-label">卡牌特性:</label>
                <div class="col-md-6">
                    <input type="text" class="form-control" id="cardIntro" name="cardIntro" placeholder="请输入"/>
                </div>
            </div>
            <div class="form-group text-center">
                <span style="color:#0d8ddb;">${info}</span>
            </div>
            <div class="form-group text-center">

                <button type="submit" class="btn btn-primary" onclick="checkNull()" onmouseover="getElements()">确认添加
                </button>
                <%--         TODO 在这里写一个判断，判断内容是否有空值       --%>
<%--                <button type="button" class="btn btn-primary " onclick="checkNull()" onmouseover="getElements()"--%>
<%--                        data-toggle="modal" data-target=".modal">--%>
<%--                    确认--%>
<%--                </button>--%>


                <div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document" aria-hidden="true">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                        aria-hidden="true">&times;</span>
                                </button>
                                <h4 class="modal-title" id="gridSystemModalLabel">添加卡牌</h4>
                            </div>
                            <div class="modal-body">
                                你正在添加一张卡牌，确认要添加🐎？
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                <button type="submit" class="btn btn-primary">确认添加</button>
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal-dialog -->
                </div><!-- /.modal -->
                <button type="reset" class="btn btn-default" data-dismiss="modal">重置</button>
            </div>
        </form>
    </div>
</div>


<%--    <table class="layui-table" lay-data="{height:305, url:'/cards?method=all', page:false, id:'test2', skin: 'row', even: true}">--%>
<%--        <thead>--%>
<%--        <tr>--%>
<%--            <th lay-data="{field:'id', width:80, sort: true}">ID</th>--%>
<%--            <th lay-data="{field:'username', width:120, templet: '#usernameTpl'}">卡牌名字</th>--%>
<%--            <th lay-data="{field:'sex', width:120, sort: true, templet: '#sexTpl'}">卡牌费用</th>--%>
<%--            <th lay-data="{field:'city', width:120}">卡牌等级</th>--%>
<%--            <th lay-data="{field:'sign', width:120}">卡牌类型</th>--%>
<%--            <th lay-data="{field:'experience', width:120, sort: true, style:'background-color: #eee;'}">卡牌阵营</th>--%>
<%--            <th lay-data="{field:'classify', width:120, style:'background-color: #009688; color: #fff;'}">卡牌攻击力</th>--%>
<%--            <th lay-data="{field:'wealth', width:135, sort: true}">卡牌生命值</th>--%>
<%--            <th lay-data="{field:'sign'}">卡牌特性</th>--%>
<%--            <th lay-data="{field:'sign'}">卡牌简介</th>--%>
<%--        </tr>--%>
<%--        </thead>--%>
<%--    </table>--%>

<%--    <script type="text/html" id="usernameTpl">--%>
<%--        <a href="/?table-demo-id={{d.id}}" class="layui-table-link" target="_blank">{{ d.username }}</a>--%>
<%--    </script>--%>
<%--    <script type="text/html" id="sexTpl">--%>
<%--        {{#  if(d.sex === '女'){ }}--%>
<%--        <span style="color: #F581B1;">{{ d.sex }}</span>--%>
<%--        {{#  } else { }}--%>
<%--        {{ d.sex }}--%>
<%--        {{#  } }}--%>
<%--    </script>--%>

<%--    <script type="text/html" id="barDemo1">--%>
<%--        <a class="layui-btn layui-btn-xs" lay-event="edit">工具性按钮</a>--%>
<%--    </script>--%>


<%--    <script src="layui/layui.js" charset="utf-8"></script>--%>
<%--    <!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->--%>
<%--    <script>--%>
<%--        layui.use('table', function(){--%>
<%--            var table = layui.table;--%>
<%--        });--%>
<%--    </script>--%>


<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/plugins/layer/layer.min.js"></script>
<script src="js/content.min.js"></script>
<script src="js/welcome.min.js"></script>

</body>

</html>