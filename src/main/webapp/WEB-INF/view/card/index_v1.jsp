<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <!--360浏览器优先以webkit内核解析-->


    <title>新增卡牌</title>

    <link rel="shortcut icon" href="favicon.ico">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/style.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/layui/css/layui.css" media="all">


    <script>
        var i = 0;
        if (i < 1) {
            function modify(id) {
                console.log(id);
                $.ajax({
                    type: "post",
                    url: "${pageScope.request.contextPath}/cards?method=id",
                    data: {"id": id},
                    success: function (result) {
                        // alert(result);

                        var obj = JSON.parse(result);
                        // 把值放进内容框
                        $("#cardId").val(obj.card.cardId);
                        $("#cardHp").val(obj.card.cardAtk);
                        $("#cardName").val(obj.card.cardName);
                        $("#cardCost").val(obj.card.cardCost);
                        // $("#cardLevel").val(obj.card.cardLevel);
                        // $("#cardType").val(obj.card.cardType);
                        // $("#cardFaction").val(obj.card.cardFaction);
                        $("#cardAtk").val(obj.card.cardAtk);
                        $("#cardPower").val(obj.card.cardPower);
                        $("#cardIntro").val(obj.card.cardIntro);

                    }
                }, 'json');
                i++;
            }
        }

    </script>


</head>
<style>
    tr th, td {
        text-align: center;
        margin: 0 auto;
    }
</style>

<body class="gray-bg">


<div style="margin-bottom: 5px;">

    <!-- 示例-970 -->
    <ins class="adsbygoogle" style="display:inline-block;width:970px;height:90px" data-ad-slot="3820120620"
         data-ad-client="ca-pub-6111334333458862"></ins>

</div>


<div class="layui-form">
    <div style="width:300px;display:inline-block">
        <div class="layui-form-item">
            <label class="layui-form-label">查费用</label>
            <div class="layui-input-block" style="width:150px">
                <select name="cardCost" id="search_card_cost" lay-verify="">
                    <option value=""></option>
                    <option value="0">0</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                    <option value="7">7</option>
                    <option value="8">8</option>
                    <option value="9">9</option>
                    <option value="10">10</option>
                </select>
            </div>
        </div>
    </div>
    <div style="width:300px;display:inline-block">
        <div class="layui-form-item">
            <label class="layui-form-label">查等级</label>
            <div class="layui-input-block" style="width:150px;">
                <select name="cardLevel" id="search_card_level" lay-verify="">
                    <option value=""></option>
                    <option value="铜">铜</option>
                    <option value="银">银</option>
                    <option value="金">金</option>
                    <option value="传说">传说</option>
                </select>
            </div>
        </div>
    </div>
    <div style="width:300px;display:inline-block">
        <div class="layui-form-item">
            <label class="layui-form-label">查类型</label>
            <div class="layui-input-block" style="width:150px;">
                <select name="cardType"  id="search_card_type" lay-verify="">
                    <option value=""></option>
                    <option value="随从">随从</option>
                    <option value="法术">法术</option>
                    <option value="场地">场地</option>
                </select>
            </div>
        </div>
    </div>
    <div style="width:300px;display:inline-block">
        <div class="layui-form-item">
            <label class="layui-form-label">查阵营</label>
            <div class="layui-input-block" style="width:150px;">
                <select name="cardFaction" id="search_card_faction" lay-verify="">
                    <option value=""></option>
                    <option value="中立">中立</option>
                    <option value="龙族">龙族</option>
                    <option value="精灵">精灵</option>
                    <option value="主教">主教</option>
                    <option value="女巫">女巫</option>
                    <option value="复仇者">复仇者</option>
                    <option value="吸血鬼">吸血鬼</option>
                    <option value="死灵法师">死灵法师</option>
                    <option value="皇家护卫">皇家护卫</option>
                </select>
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" id="search">立即查询</button>
<%--            <button type="reset" class="layui-btn layui-btn-primary">重置</button>--%>
        </div>
    </div>
</div>
<div class="layui-btn-group demoTable">
    <button class="layui-btn layui-btn-danger" id="delAll">删除已选数据</button>
</div>


<table class="layui-table" lay-filter="demo" lay-data="{
 limit:10,
  toolbar: true,
   width: 1600,
    height:660,
     url:'/cards?method=all',
      page:true,
       id:'idTest'}">
    <thead>
    <tr>
        <th lay-data="{type:'checkbox', fixed: 'left'}"></th>
        <th lay-data="{field:'cardId', width:160, sort: true, fixed: true}">ID</th>
        <th lay-data="{field:'cardName', width:160}">卡牌名字</th>
        <th lay-data="{field:'cardCost', width:160, sort: true}">卡牌费用</th>
        <th lay-data="{field:'cardLevel', width:160}">卡牌等级</th>
        <th lay-data="{field:'cardType', width:160}">卡牌类型</th>
        <th lay-data="{field:'cardFaction', width:160}">卡牌阵营</th>
        <th lay-data="{field:'cardAtk', width:160, sort: true}">卡牌攻击力</th>
        <th lay-data="{field:'cardHp', width:160, sort: true}">卡牌生命值</th>
        <th lay-data="{fixed: 'right', width:250, align:'center', toolbar: '#barDemo'}"></th>
    </tr>
    </thead>
</table>


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
                        <form class="layui-form form-horizontal" action="">
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
                                    <input style="width:300px;" type="number" min="0" max="10" value="0"
                                           class="form-control"
                                           id="cardCost" name="cardCost" placeholder="请输入"/>

                                </div>
                            </div>
                            <div style="width:900px;" class="form-group">
                                <label for="cardLevel" class="col-md-2 control-label">卡牌等级:</label>
                                <div class="col-md-6">
                                    <input style="width:300px;" type="text" class="form-control" id="cardLevel"
                                           name="cardLevel" placeholder="请输入" list="level-list"/>
                                    <datalist id="level-list">
                                        <option>铜</option>
                                        <option>银</option>
                                        <option>金</option>
                                        <option>传说</option>
                                    </datalist>
                                </div>
                            </div>
                            <div style="width:900px;" class="form-group">
                                <label for="cardType" class="col-md-2 control-label">卡牌类型：</label>
                                <div class="col-md-6">
                                    <input style="width:300px;" type="text" class="form-control" id="cardType"
                                           name="cardType" placeholder="请输入" list="type-list"/>
                                    <datalist id="type-list">
                                        <option>随从</option>
                                        <option>法术</option>
                                        <option>护符</option>
                                        <option>场地</option>
                                    </datalist>
                                </div>
                            </div>
                            <div style="width:900px;" class="form-group">
                                <label for="cardFaction" class="col-md-2 control-label">卡牌阵营：</label>
                                <div class="col-md-6">
                                    <input style="width:300px;" type="text" class="form-control" id="cardFaction"
                                           name="cardFaction" placeholder="请输入" list="faction-list"/>
                                </div>
                                <datalist id="faction-list">
                                    <option>中立</option>
                                    <option>精灵</option>
                                    <option>女巫</option>
                                    <option>龙族</option>
                                    <option>主教</option>
                                    <option>吸血鬼</option>
                                    <option>复仇者</option>
                                    <option>皇家护卫</option>
                                    <option>死灵法师</option>
                                </datalist>
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
                                <button class="layui-btn" lay-submit lay-filter="formDemo1">提交</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>


<script id="barDemo" type="text/html">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看特性</a>
    <%--    <a class="layui-btn layui-btn-xs" lay-event="edit"  data-target="#myModal" data-toggle="modal">编辑</a>--%>
    <button class="layui-btn layui-btn-xs" lay-event='edit' data-toggle="modal" data-target="#myModal">修改卡牌</button>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>


<script src="/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->


<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/plugins/layer/layer.min.js"></script>
<script src="js/content.min.js"></script>
<script src="js/welcome.min.js"></script>
<script>
    var ids = [];
    layui.use(['table','form'], function () {
        var $ = layui.$,
        table = layui.table,
        form = layui.form;

        var active = {
            reload: function () {
                var demoReload = $('#demoReload');

                //执行重载
                table.reload('idTest', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    , where: {
                        key: {
                            id: demoReload.val()
                        }
                    }
                }, 'data');
            }
        };
        $('.demoTable .layui-btn').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

        table.render({ //其它参数在此省略
            done: function (res, curr, count) {
                //如果是异步请求数据方式，res即为你接口返回的信息。
                //如果是直接赋值的方式，res即为：{data: [], count: 99} data为当前页数据、count为数据总长度
                console.log(res);

                //得到当前页码
                console.log(curr);

                //得到数据总量
                console.log(count);
            }
        });


        //监听表格复选框选择
        table.on('checkbox(demo)', function (obj) {
            ids = [];
            //console.log(obj.data.cardId);
            var checkStatus = table.checkStatus('idTest')
                , data = checkStatus.data;
            for (var i = 0; i < data.length; i++) {
                ids[i] = data[i].cardId;
            }
            console.log(ids);

        });

        //监听工具条
        table.on('tool(demo)', function (obj) {
            var data = obj.data;
            if (obj.event === 'detail') {

                layer.msg('特性：' + JSON.stringify(data.cardPower), {time: 10000});

            } else if (obj.event === 'del') {

                layer.confirm('真的删除行么', function (index) {
                    obj.del();
                    layer.close(index);
                    // 获取对象的id，cardId为自己命名的名称
                    console.log(data.cardId);
                    table.reload('idTest', {
                        url: '${pageContext.request.contextPath}/cards?method=del',
                        where: {
                            'id[]': data.cardId
                        }
                    });
                    layer.msg("删除成功", {time: 1000});
                });
            } else if (obj.event === 'edit') {
                // layer.alert('编辑行：<br>' + JSON.stringify(data.cardId))
                modify(JSON.stringify(data.cardId));
            }
        });

        //监听提交,模糊查询表单
        form.on('submit(formDemo2)', function (data) {
            console.log(JSON.stringify(data.field));
            $.ajax({
                type: 'post',
                dataType: 'json',
                data: data.field,
                url: '${pageContext.request.contextPath}/cards?method=select',
                success: function (data) {
                    console.log(":"+data);
                    // 无感刷新，体验超棒
                    $(".layui-laypage-btn")[0].click();
                    layer.msg("查询成功",{time:  1000});

                },
                error: function (data) {
                    layer.alert("查询失败");
                }
            });
            return false;
        });

        //监听提交，修改信息提交的表单
        form.on('submit(formDemo1)', function (data) {
            // layer.msg(JSON.stringify(data.field));
            $.ajax({
                type: 'post',
                dataType: 'json',
                data: data.field,
                url: '${pageContext.request.contextPath}/cards?method=modify',
                success: function (data) {
                    layer.msg("修改成功", {time: 1000});
                    // 无感刷新，体验超棒
                    $("button.layui-laypage-btn").click();
                },
                error: function (data) {
                    layer.alert("修改失败");

                }
            });
            return false;
        });

        $("#search").on('click',function(){
            var cardCost = $("#search_card_cost");
            var cardLevel = $("#search_card_level");
            var cardType = $("#search_card_type");
            var cardFaction = $("#search_card_faction");
            table.reload('idTest',{
                where:{
                    cardCost:cardCost.val(),
                    cardLevel:cardLevel.val(),
                    cardType:cardType.val(),
                    cardFaction:cardFaction.val()
                }

            });
            layer.msg("查询成功", {time: 1000});
        })
    });

    // 删除选中的数据
    $(function () {
        $('#delAll').click(function () {
            // 通过ajax删除数据,然后同步刷新页面
            // jq ajax
            $.ajax({
                url: '${pageContext.request.contextPath}/cards?method=del',
                type: 'post',
                data: {'id[]': ids},
                success: function (result) {
                    // 无感刷新，体验超棒
                    $("button.layui-laypage-btn").click();
                    layer.msg("删除成功", {time: 1000});
                },
                error: function () {
                    layer.msg("删除失败", {time: 1000});
                }
            });

        });
    });



</script>




</body>

</html>