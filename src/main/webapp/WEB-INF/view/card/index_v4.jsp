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
</head>
<style>

</style>

<body class="gray-bg">
<div style="margin-bottom: 10px;">
    <a href="javaScript:void(0);" class="btn btn-danger deleteAll">删除卡牌</a>
</div>

<table class="table table-hover table-bordered" style="text-align: center">
    <tr class="success">
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

    <c:forEach items="${cards}" var="card" varStatus="s">
        <tr style="
        <c:if test="${s.count % 2 == 1}">background-color:rgba(164,255,245,0.07);</c:if>
        <c:if test="${s.count % 2 == 0}">background-color:rgba(28,202,238,0.1);</c:if>
                ">
            <td><input id="checkbox" type="checkbox" class="checkedInfo" value="${card.cardId}"></td>
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
        });

        // 删除当前选中的信息
        $('.deleteAll').click(function () {
            // 使用ajax
            if (ids.length === 0) {
                my.alert("请选择需要删除的数据");
                return;
            }
            my.confirm({message: '是否要删除数据?'}).on(function (e) {
                if (!e) {
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
                        // toastr.success("数据删除成功");
                        window.location.reload();
                    },
                    error: function () {

                    }
                });
            });
        });
    });

    // 删除数据
    function del(id) {
        var ids = [];
        ids[0] = id;
        my.confirm({message: '是否要删除数据?'}).on(function (e) {
            if (!e) {
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
                    // toastr.success("数据删除成功");
                    window.location.reload();
                },
                error: function () {

                }
            });
        });
    }

</script>

</body>

</html>