<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!--360浏览器优先以webkit内核解析-->


    <title>新增卡牌</title>

    <link rel="shortcut icon" href="favicon.ico"> <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">

    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/style.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/layui/css/layui.css">
    <base target="_blank">
    <script>
        function sendAjax() {
            $.post("/cards","?method=all",function(result){
                console.log(result);
                alert(result);
            },'json');
        }
    </script>
</head>
<style>

</style>

<body class="gray-bg" >
    <table class="table table-hover table-bordered" style="text-align: center">
        <tr class="success">
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

        <c:forEach items="${cards}" var="card" varStatus="s">

            <tr style="
                        <c:if test="${s.count % 2 == 1}">background-color:rgba(164,255,245,0.07);</c:if>
                        <c:if test="${s.count % 2 == 0}">background-color:rgba(28,202,238,0.1);</c:if>
                    ">
                <td class="td-hover">${card.cardId}</td>
                <td>${card.cardName}</td>
                <td>${card.cardCost}</td>
                <td>${card.cardLevel}</td>
                <td>${card.cardType}</td>
                <td>${card.cardFaction}</td>
                <td>${card.cardAtk}</td>
                <td>${card.cardHp}</td>
                <td>${card.cardPower}</td>
                <td>${card.cardIntro}</td>
            </tr>

        </c:forEach>
    </table>


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