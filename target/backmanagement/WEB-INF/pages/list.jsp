<%--
  Created by IntelliJ IDEA.
  User: 未来影像
  Date: 2020/10/13
  Time: 16:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <a>测试成功</a>
    <c:forEach items="${list}" var="account">
        ${account.name}
    </c:forEach>
</body>
</html>
