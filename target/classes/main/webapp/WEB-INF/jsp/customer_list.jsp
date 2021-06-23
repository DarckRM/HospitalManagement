<%--
  Created by IntelliJ IDEA.
  User: hkw
  Date: 2018/10/31
  Time: 14:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  import="com.corepower.domain.User" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>

<html>
<head>
    <title>医生列表</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <%--<meta http-equiv="Cache-Control" content="no-siteapp" />--%>

    <link rel="icon" href="/images/favicon.ico" sizes="32x32" />
    <link rel="stylesheet" href="/css/font.css">
    <link rel="stylesheet" href="/css/xadmin.css">
    <link rel="stylesheet" href="/css/layui.css">
    <script type="text/javascript" src ="/js/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="/layui/layui.js"></script>
    <script type="text/javascript" src="/js/xadmin.js"></script>
    <script type="text/javascript" src="/layui_exts/excel.js"></script>

    <style type="text/css">
        .layui-table{
            text-align: center;
        }
        .layui-table th{
            text-align: center;
        }
    </style>
</head>

<body>
<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="/customerlist">医生信息</a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="/customerlist" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="x-body">
    <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so" action="" >
            <div class="layui-form-item">
                <input class="layui-input" placeholder="请输入用户名" name="dname" id="username">
                <div class="layui-input-block" style="float: left; margin-left: 0px; margin-right: 20px">
                    <select name="department" lay-verify="required">
                        <option value="">科室信息</option>
                        <option value="0">内科</option>
                        <option value="1">外科</option>
                        <option value="2">儿科</option>
                        <option value="3">口腔科</option>
                        <option value="4">放射科</option>
                        <option value="5">骨科</option>
                    </select>
                </div>
                <button class="layui-btn"  lay-submit="" lay-filter="search"><i class="layui-icon">&#xe615;</i></button>
            </div>
        </form>
    </div>

    <xblock>
        <button id="addBtn" class="layui-btn layui-btn-normal"> <i class="layui-icon">&#xe654;</i>添加</button>
        <span class="x-right" style="line-height:40px">共有数据：${ci.totalCount} 条</span>
    </xblock>

    <%--表格数据--%>
    <table class="layui-table" >
        <thead>
        <tr>
            <th>ID</th>
            <th>姓名</th>
            <th>员工卡号</th>
            <th>部门</th>
            <th>性别</th>
            <th>学历</th>
            <th>邮箱</th>
            <th>电话</th>
            <th>年龄</th>
            <th>操作</th>
        </thead>
        <tbody>
        <c:forEach items="${ci.list}" var="ci">
            <tr>
                <td class="did">${ci.did}</td>
                <td class="dname">${ci.dname}</td>
                <td class="cardno">${ci.cardno}</td>
                <td class="departmentname">${ci.departmentname}</td>
                <td class="sex">${ci.sex == 0 ? '男':'女'}</td>
                <td class="educated">${ci.educated}</td>
                <td class="email">${ci.email}</td>
                <td class="phone">${ci.phone}</td>
                <td class="age">${ci.age}</td>
                <td class="td-manage">
                    <a title="编辑" class="updateEdit" href="#">
                        <i class="layui-icon">&#xe642;</i>
                    </a>
                    <a title="删除" onclick="member_del(this,'${ci.did}')" href="javascript:;">
                        <i class="layui-icon">&#xe640;</i>
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <%--修改模态框--%>
    <div class="layui-row" id="test" style="display: none; padding-top: 20px;overflow-y: auto">
        <div class="layui-col" style="overflow-y: auto">
            <form class="layui-form" id="editCustomer" style="margin: 0 50px;overflow-y: auto">
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px">
                    <legend>基础信息</legend>
                </fieldset>
                <div class="layui-form-item" style="display: none">
                    <label class="layui-form-label">ID：</label>
                    <div class="layui-input-block">
                        <input type="text" id="e_did" name="did" class="layui-input" placeholder="这是ID哦">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">真实姓名：</label>
                    <div class="layui-input-block">
                        <input type="text" lay-verify="required" id="e_dname" name="dname"  class="layui-input" placeholder="请输入姓名">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">员工卡号：</label>
                    <div class="layui-input-block">
                        <input type="text" id="e_cardno" name="cardno" class="layui-input" placeholder="请输入卡号">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">性别：</label>
                    <div class="layui-input-block">
                        <input type="text" id="e_sex" name="sex" class="layui-input" placeholder="请输入性别">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">电子邮箱：</label>
                    <div class="layui-input-block">
                        <input type="text" id="e_email" name="email" class="layui-input" placeholder="请输入电子邮箱">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">电话号码：</label>
                    <div class="layui-input-block">
                        <input type="text" id="e_phone" name="phone" class="layui-input" placeholder="请输入电话号码">
                    </div>
                </div>
                <div class="layui-form-item" style="margin: 20px auto">
                    <div class="layui-input-block">
                        <button type="button" class="layui-btn layui-btn-normal" lay-submit lay-filter="formDemo">提交</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <div class="" >
        <input type="hidden" id="totalPageCount" value="${ci.pageTotalCount}"/>
        <c:import url="pageBtn.jsp">
            <c:param name="totalCount" value="${ci.totalCount}"/>
            <c:param name="currentPageNo" value="${ci.pageIndex}"/>
            <c:param name="totalPageCount" value="${ci.pageTotalCount}"/>
        </c:import>
    </div>
</div>
<script>
    layui.config({
        base: 'layui_exts/',
    }).extend({
        excel: 'excel',
    });

    layui.use(['jquery', 'form','layer','laydate','element'], function(){
        var form = layui.form,
            $ = layui.jquery,
            laydate = layui.laydate;

        //执行一个laydate实例
        laydate.render({
            elem: '#start' //指定元素
        });
        form.render();
        /*添加弹出框*/
        $("#addBtn").click(function () {
            document.getElementById("editCustomer").reset();
            layer.open({
                type: 1,
                title: "添加医生信息",
                skin: "myclass",
                area: '700px',
                maxHeight: 600,
                scrollbar: true,
                anim: 2,
                content: $("#test"),
            });
            $("#editCustomer")[0].reset();
            form.on('submit(formDemo)', function(data) {
                var param=data.field;
                $.ajax({
                    url: '/addcustomer',
                    type: "post",
                    data:JSON.stringify(param),
                    contentType: "application/json; charset=utf-8",
                    success:function(){
                        layer.msg('添加成功', {icon: 1, time: 2000});
                        setTimeout(function () {window.location.href='/customerlist';},2000);

                    },
                    error:function(){
                        layer.msg('添加失败',{icon:0,time:2000});
                        setTimeout(function () {window.location.href='/customerlist';},2000);
                    }
                });
            });
        });
        /*编辑*/
        $(".updateEdit").click(function() {
            var did = $(this).parent("td").parent("tr").children(".did").html();
            var dname = $(this).parent("td").parent("tr").children(".dname").html();
            var cardno = $(this).parent("td").parent("tr").children(".cardno").html();
            var department = $(this).parent("td").parent("tr").children(".department").html();
            var sex = $(this).parent("td").parent("tr").children(".sex").html();
            var age = $(this).parent("td").parent("tr").children(".age").html();
            var phone = $(this).parent("td").parent("tr").children(".phone").html();
            var email = $(this).parent("td").parent("tr").children(".email").html();
            //var birthday = $(this).parent("td").parent("tr").children(".birthday").html();
            //判断
            layer.open({
                type: 1,
                title: "修改 "+ dname +" 的信息",
                skin: "myclass",
                area: '700px',
                maxHeight: 600,
                scrollbar: true,
                anim: 2,
                content: $("#test"),
            });
            $("#e_did").val(did);
            $("#e_dname").val(dname);
            $("#e_cardno").val(cardno);
            $("#e_sex").val(sex);
            $("#e_email").val(email);
            $("#e_department").val(department);
            $("#e_phone").val(phone);
            $("#e_age").val(age);
            //document.getElementById("e_birthday").value = birthday;
            });
        $("#editCustomer")[0].reset();
        form.on('submit(formDemo)', function(data) {
            var param=data.field;
            if (param.sex == '女') {
                param.sex = 1;
            } else if (param.sex == '男'){
                param.sex = 0;
            }
            $.ajax({
                url: '/customerupdate',
                type: "post",
                data:JSON.stringify(param),
                contentType: "application/json; charset=utf-8",
                success:function(){
                    console.log();
                    layer.msg('修改成功', {icon: 1, time: 2000});
                    setTimeout(function () {window.location.href='/customerlist';},2000);

                },
                error:function(){
                    layer.msg('修改失败',{icon:0,time:2000});
                    setTimeout(function () {window.location.href='/customerlist';},2000);
                }
            });
        });
    });
    /*删除*/
    function member_del(obj,id){
        layer.confirm('确认要删除吗？', function (index) {
            //发异步删除数据
            $.get("/deletecustomer", {"id": id}, function (data){
                if (data = true) {
                    layer.msg('删除成功!', {icon: 1, time: 2000});
                    setTimeout(function () {
                        window.location.href = '/customerlist';
                    }, 2000);

                } else {
                    layer.msg('删除失败!', {icon: 1, time: 2000});
                    setTimeout(function () {
                        window.location.href = '/customerlist';
                    }, 2000);
                }
            });
        });
    }
</script>
</body>
</html>
