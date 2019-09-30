<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

    <title>登录</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/style.min.css" rel="stylesheet">
    <link href="css/login.min.css" rel="stylesheet">
    <!--[if lt IE 8]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->
    <script>
        if(window.top!==window.self){window.top.location=window.location};
    </script>

</head>

<body class="signin">
    <div class="signinpanel">
        <div class="row">
            <div class="col-sm-7">
                <div class="signin-info">
                    <div class="logopanel m-b">
                        <h1>后台管理系统</h1>
                    </div>
                    <div class="m-b"></div>
                    <h4>欢迎使用 <strong>卡牌后台管理系统</strong></h4>

<%--                    <strong>还没有账号？ <a href="#">立即注册&raquo;</a></strong>--%>
                </div>
            </div>
            <div class="col-sm-5">
                <form method="post" action="${pageScope.request.contextPath}/login?method=login" >
                    <h4 class="no-margins">登录：</h4>
                    <p class="m-t-md">登录到后台管理系统</p>
                    <input name="username" type="text" class="form-control uname" value="${cookie.username.value}" placeholder="用户名" />
                    <input name="password" type="password" class="form-control pword m-b" value="${cookie.password.value}" placeholder="密码" />
<!--                    <a href="">忘记密码了？</a>-->
                    <input type="checkbox" name="remember">七天免密
<%--                    <input style="margin-left:95px;" type="checkbox" name="quicklogin">快速登陆--%>
                    <br>
                    <br>
                    <strong>还没有账号？ <a href="${pageScope.request.contextPath}/register?method=toRegister">立即注册&raquo;</a></strong>
                    <button class="btn btn-success btn-block">登录</button>
                    <strong>
                        <span style="color:#3c8aff;font-weight:bold;">${success}</span>
                        <p style="color:#3c8aff;font-weight:bold;" class="text-danger">${error}</p>
                    </strong>
                </form>
            </div>
        </div>
        <div class="signup-footer">
            <div class="pull-left">
                &copy; 2019 All Rights Reserved
            </div>
        </div>
    </div>
</body>

</html>