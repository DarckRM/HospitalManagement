<%--
  Created by IntelliJ IDEA.
  User: hkw
  Date: 2018/11/14
  Time: 16:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<html>
<head>
    <title>修改信息</title>
    <link rel="icon" href="/images/favicon.ico" sizes="32x32" />
    <link rel="stylesheet" href="/css/font.css">
    <link rel="stylesheet" href="/css/xadmin.css">
    <link rel="stylesheet" href="/css/pg_btn.css">
    <script type="text/javascript" src="/js/jquery-1.3.2.min.js"></script>
    <script src="/layui/layui.js"></script>
    <script type="text/javascript" src="/js/xadmin.js"></script>
    <link rel="icon" href="/images/favicon.ico" sizes="32x32" />
    <link rel="stylesheet" href="/css/font.css">
    <link rel="stylesheet" href="/css/xadmin.css">
    <link rel="stylesheet" href="/css/layui.css">
    <script type="text/javascript" src="/js/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="/layui/layui.js"></script>
    <script type="text/javascript" src="/js/xadmin.js"></script>
    <script type="text/javascript" src="/layui_exts/excel.js"></script>
</head>

<body>

<div class="x-body">
    <%--把表单封装成一个Admin对象传给服务端--%>
    <form class="layui-form"  id="f_auto" action="" method="post">
        <input type="hidden" value="${sessionScope.a.id}" name="id" id="id" class="layui-input"/>
        <div class="layui-form-item">
            <label for="username" class="layui-form-label">
                <span class="">用户名</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="username" name="username"
                       autocomplete="off" value="${sessionScope.a.username}" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="password" class="layui-form-label">
                <span class="">密码</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="password" name="password"
                       autocomplete="off" value="${sessionScope.a.password}" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="relname" class="layui-form-label">
                <span class="">姓名</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="relname" name="relname"
                       autocomplete="off" value="${sessionScope.a.relname}" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="sex" class="layui-form-label">
                <span class="">电话</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="sex" name="sex"
                       autocomplete="off" value="${sessionScope.a.sex}" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="tel" class="layui-form-label">
                <span class="">电话</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="tel" name="tel"
                       autocomplete="off" value="${sessionScope.a.tel}" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="email" class="layui-form-label">
                <span class="">电子邮箱</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="email" name="email"
                       autocomplete="off" value="${sessionScope.a.email}" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="memo" class="layui-form-label">
                <span class="">个人描述</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="memo" name="memo"
                       autocomplete="off" value="${sessionScope.a.memo}" class="layui-input">
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">角色</label>
            <div class="layui-input-block">
                <select id="roleid" name="roleid" lay-filter="aihao" >
                    <option value="" selected="">${sessionScope.a.name}</option>
                    <option value="1">超级管理员</option>
                    <option value="2" >高级管理员</option>
                    <option value="3">中级管理员</option>
                </select>
            </div>
        </div>
        <!--
        <div class="layui-form-item">
            <label for="authority" class="layui-form-label">
                <span class="">角色</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="authority" name="authority"
                       autocomplete="off" value="" class="layui-input">
            </div>
        </div>-->


        <div class="layui-form-item" id="btn_xg">
            <button  class="layui-btn" id="btn_on"  lay-submit="" lay-filter="updateUse">
                修改
            </button>
        </div>
    </form>
</div>
<script>
    layui.use(['form','layer','laydate'], function(){
       var form = layui.form,
           $ = layui.jquery,
             laydate = layui.laydate;

        $("#f_auto")[0].reset();
        form.on('submit(updateUse)', function(data) {

             var param=data.field;
                console.log ("cao")
             $.ajax({
                 url: '/updateUser',
                 type: "post",
                 data: JSON.stringify(param),
                 contentType: "application/json; charset=utf-8",
                     success:function(){
                     console.log(data);
                     layer.msg('修改成功', {icon: 1, time: 2000});
                     setTimeout(function () {window.location.href='/findUser';},2000);

                 },
                 error:function(){
                     console.log(data);
                     layer.msg('修改失败',{icon:0,time:2000});
                    setTimeout(function () {window.location.href='/findUser';},2000);
                }
             });
             console.log("wocao ")
         })


     });
</script>
</body>
</html>
