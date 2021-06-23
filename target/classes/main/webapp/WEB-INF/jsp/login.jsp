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
        <div class="book">
            <div class="book__form">
                <form action="/login" class="form" method="post">
                    <div class="u-margin-bottom-medium">
                        <h2 class="heading-secondary">
                            Start Login Now
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
                        <button  type="submit" class="btn btn--green">Login</button>
                    </div>
                    <div class="form__group">
                        <button  type="submit" class="btn btn--green">Register</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>
</body>
</html>
