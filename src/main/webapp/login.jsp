<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>登陆注册</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">

    <style>
        .login {
            margin-top: 150px;
        }
        .form {
            border: 1px solid #b3b1b2;
            padding: 20px 0;
        }
        h2 {
            padding-bottom:15px;
        }
        p {
            margin: 0;
        }
        body {
            width: 100%;
            height: 100%;
            background: url("img/59f03208e7bce729760f4a96.jpg") no-repeat;
            background-size: 100%;
        }
        .login-bg{
            background-color:rgba(255,255,255,0.8)

        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row login">
        <div class="col-md-offset-4 col-md-4 form login-bg">
            <h2 class="text-center">卡牌管理系统</h2>
            <form class="form-horizontal" action="/login" method="post">
                <div class="form-group">
                    <label for="username" class="col-md-4 control-label">用户名:</label>
                    <div class="col-md-6">
                        <input type="text" class="form-control" id="username" name="username" value="${requestScope.username}" placeholder="请输入用户名"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="password" class="col-md-4 control-label">密码:</label>
                    <div class="col-md-6">
                        <input type="password" class="form-control" id="password" name="password" value="${requestScope.password}" placeholder="请输入密码"/>
                    </div>
                </div>
                <span style="margin-left:200px;">${success}</span>
                <div class="form-group">
                    <div class="col-md-offset-4 col-md-6">
                        <p class="text-danger">${error}</p>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-offset-4 col-md-6">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" value="1" name="remember"> 记住账号
                            </label>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-offset-4 col-md-6">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" value="1" name="quicklogin"> 7天免密登录
                            </label>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-offset-3">
                        <input type="submit" class="btn btn-primary col-md-8" value="登陆"/>
                    </div>
                </div>
                <p style="position: relative;left:40%;">没有账号？<a href="register.jsp" target="_self">点击注册</a></p>
            </form>
        </div>
    </div>
</div>

<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="/js/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="/js/bootstrap.min.js"></script>
</body>
</html>
