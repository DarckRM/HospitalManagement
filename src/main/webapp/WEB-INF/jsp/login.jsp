<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!--
    <link rel="stylesheet" href="/css/usersLogin.css">
    <link rel="stylesheet" href="/css/style.css">
    <link rel="icon" href="/images/favicon.ico" sizes="32x32" />
    <script src="/js/jquery-1.3.2.min.js"></script>
    <script src="js/login.js"></script>-->
    <link href="https://fonts.googleapis.com/css?family=Lato:100,300,400,700,900" rel="stylesheet">

    <link rel="stylesheet" href="css/icon-font.css">
    <link rel="stylesheet" href="css/style.css">
    <script type="text/javascript" src ="/js/jquery-1.3.2.min.js"></script>
    <link rel="shortcut icon" type="image/png" href="img/favicon.png">
    <title>前台首页</title>
</head>
<body style="padding: 0">

<%
    String c="use";
    String errorInfo = (String)request.getAttribute("msg");         // 获取错误属性
    if(errorInfo != c && errorInfo != null) {
%>
<script type="text/javascript" language="javascript">
    alert("<%=errorInfo%>");                                            // 弹出错误信息
     // 跳转到登录界面
</script>
<%
    }
%>
<section class="section-book">
    <div class="row">
        <div class="book" id="nice">
            <div class="book__form">
                <form action="" class="form" method="post" id="loginform">
                    <div class="u-margin-bottom-medium">
                        <h2 class="heading-secondary" id="title">
                            医疗后台管理系统
                        </h2>
                    </div>

                    <div class="form__group">
                        <input type="text" class="form__input" placeholder="Your account number" name="username" id="name" required>
                        <label for="name" class="form__label">Full accout number</label>
                    </div>
                    <div class="form__group">
                        <input type="password" class="form__input" placeholder="Your own password" name="password"id="email" required>
                        <label for="email" class="form__label">Full password</label>
                    </div>
                    <div class="form__group">
                        <button type="button" id="confirmBtn" class="btn btn--green" onclick="confirm()" style="display: none">确认</button>
                        <button type="button" id="loginBtn" class="btn btn--green" onclick="login()">登录</button>
                        <button type="button" id="registerBtn" class="btn btn--white" style="color: green; border: 0.08em solid #189f92; margin-left: 120px" onclick="register()">注册</button>
                        <button type="button" id="backBtn" class="btn btn--white" style="color: green; border: 0.08em solid #189f92; margin-left: 120px; display: none" onclick="back()">返回</button>
                    </div>
                </form>

            </div>

        </div>

    </div>
</section>
<script>
    
    function login() {
        $.ajax({
            //几个参数需要注意一下
            type: "POST",//方法类型
            url: "/login" ,//url
            data: $('#loginform').serialize(),
            success: function (result) {
                if (result == 'homepage') {
                    window.location.href = '/homepage';
                } else {
                    alert("用户名或密码错误");
                }
            }
        });
    }
    
    function confirm() {
        $.ajax({
            //几个参数需要注意一下
            type: "POST",//方法类型
            url: "/addUser" ,//url
            data: $('#loginform').serialize(),
            success: function (result) {
                if (result == 'homepage') {
                    alert("注册成功");
                }
            }
        });
    }
    
    function register() {
        $("#nice").css("background-image", "linear-gradient(105deg, rgba(255, 255, 255, 0.9) 0%, rgba(255, 255, 255, 0.9) 50%, transparent 50%), url(../images/nat-10.jpg)");
        $("#title").css("background-image", "linear-gradient(to right, #7ed56f, #28b485)")

        $("#loginBtn").css("display", "none");
        $("#registerBtn").css("display", "none");
        $("#confirmBtn").css("display", "inline");
        $("#backBtn").css("display", "inline");
    }
    
    function back() {
        $("#nice").css("background-image", "linear-gradient(260deg, rgba(255, 255, 255, 0.9) 0%, rgba(255, 255, 255, 0.9) 50%, transparent 50%), url(../images/nat-10.jpg)");
        $("#title").css("background-image", "linear-gradient(to right, #ffffff, #ffffff)");

        $("#loginBtn").css("display", "inline");
        $("#registerBtn").css("display", "inline");
        $("#confirmBtn").css("display", "none");
        $("#backBtn").css("display", "none");
    }
</script>
</body>
</html>
