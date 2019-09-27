<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!--360浏览器优先以webkit内核解析-->


    <title>查询卡牌</title>

    <link rel="shortcut icon" href="favicon.ico"> <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">

    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/style.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/layui/css/layui.css">
    <base target="_blank">
    <script>
        function sendAjax() {
            $.post("/cards","?method=insert",function(result){
                console.log(result);

            },'json');
        }
    </script>
</head>
<style>

</style>

<body class="gray-bg" >
<div class="container">

    <div class="row">
        <form class="form-horizontal" action="${pageContext.request.contextPath}/cards?method=insert" method="post">
            <div class="form-group">
                <label for="cardName" class="col-md-4 control-label">卡牌名字:</label>
                <div class="col-md-6">
                    <input type="text" class="form-control" id="cardName" name="cardName" placeholder="请输入"/>
                </div>
            </div>
            <div class="form-group">
                <label for="cardCost" class="col-md-4 control-label">卡牌费用:</label>
                <div class="col-md-6">
                    <input type="number" min="0" value="0" class="form-control" id="cardCost" name="cardCost" placeholder="请输入"/>
                </div>
            </div>
            <div class="form-group">
                <label for="cardLevel" class="col-md-4 control-label">卡牌等级:</label>
                <div class="col-md-6">
                    <input type="text" class="form-control" id="cardLevel" name="cardLevel" placeholder="请输入"/>
                </div>
            </div>
            <div class="form-group">
                <label for="cardType" class="col-md-4 control-label">卡牌类型：</label>
                <div class="col-md-6">
                    <input type="text" class="form-control" id="cardType" name="cardType" placeholder="请输入"/>
                </div>
            </div>
            <div class="form-group">
                <label for="cardFaction" class="col-md-4 control-label">卡牌阵营：</label>
                <div class="col-md-6">
                    <input type="text" class="form-control" id="cardFaction" name="cardFaction" placeholder="请输入"/>
                </div>
            </div>
            <div class="form-group">
                <label for="cardAtk" class="col-md-4 control-label">卡牌攻击力:</label>
                <div class="col-md-6">
                    <input type="number" min="0" value="0" class="form-control" id="cardAtk" name="cardAtk" placeholder="请输入"/>
                </div>
            </div>
            <div class="form-group">
                <label for="cardHp" class="col-md-4 control-label">卡牌生命值:</label>
                <div class="col-md-6">
                    <input type="number" min="0" value="0" class="form-control" id="cardHp" name="cardHp" placeholder="请输入"/>
                </div>
            </div>
            <div class="form-group">
                <label for="cardPower" class="col-md-4 control-label">卡牌简介:</label>
                <div class="col-md-6">
                    <input type="text" class="form-control" id="cardPower" name="cardPower" placeholder="请输入"/>
                </div>
            </div>
            <div class="form-group">
                <label for="cardIntro" class="col-md-4 control-label">卡牌特性:</label>
                <div class="col-md-6">
                    <input type="text" class="form-control" id="cardIntro" name="cardIntro" placeholder="请输入"/>
                </div>
            </div>
            <div class="form-group text-center">
                <input type="submit" class="btn btn-primary" value="提交"/>
                <a class="btn btn-primary" href="/book/list">取消</a>
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