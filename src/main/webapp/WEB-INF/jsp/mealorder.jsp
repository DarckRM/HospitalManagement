<%--
  Created by IntelliJ IDEA.
  User: a
  Date: 2020/11/22
  Time: 17:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<html>
<head>
    <title>订餐记录</title>
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
        <a href="/mealorderlist">客户状态</a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="/mealorderlist" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="x-body">
    <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so" action="" >
            <input class="layui-input" placeholder="请输入用户ID" name="customerid" id="customerid">
            <input class="layui-input" placeholder="请输入姓名" name="relname" id="relname">
            <input class="layui-input" placeholder="请输入用户昵称" name="nickname" id="nickname" >
            <button class="layui-btn"  lay-submit="" lay-filter="search"><i class="layui-icon">&#xe615;</i></button>
        </form>
    </div>

    <xblock>
        <button id="addBtn" class="layui-btn layui-btn-normal"> <i class="layui-icon">&#xe654;</i>添加</button>
        <span class="x-right" style="line-height:40px">共有数据：${mo.totalCount} 条</span>
    </xblock>

    <%--表格数据--%>
    <table class="layui-table" >
        <thead>
        <tr>
            <th>客户ID</th>
            <th>昵称</th>
            <th>真实姓名</th>
            <th>早餐</th>
            <th>午餐</th>
            <th>晚餐</th>
            <th>提交时间</th>
            <th>操作</th>
        </thead>
        <tbody>
        <c:forEach items="${mo.list}" var="mo">
            <tr>
                <td style="display: none" class="id">${mo.id}</td>
                <td class="customerid">${mo.customerid}</td>
                <td class="nickname">${mo.nickname}</td>
                <td class="relname">${mo.relname}</td>
                <td class="relname">${mo.breakfast}</td>
                <td class="relname">${mo.lunch}</td>
                <td class="relname">${mo.dinner}</td>
                <td class="createtime">${mo.createtime}</td>
                <td class="td-manage">
                    <a title="编辑" class="updateEdit" href="#">
                        <i class="layui-icon">&#xe642;</i>
                    </a>
                    <a title="删除" onclick="member_del(this,'${mo.id}')" href="javascript:;">
                        <i class="layui-icon">&#xe640;</i>
                    </a>
                </td>
                <td class="memo" style="display: none">${mo.memo}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <%--修改模态框--%>
    <div class="layui-row" id="test" style="display: none; padding-top: 15px;padding-bottom: 20px;overflow-y: auto">
        <div class="layui-col" style="overflow-y: auto">
            <form class="layui-form" id="editMealorder" style="margin: 0 50px;overflow-y: auto">
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px">
                    <legend id="editTitle">订餐信息</legend>
                </fieldset>
                <div class="layui-form-item" style="display: none">
                    <label class="layui-form-label">ID：</label>
                    <div class="layui-input-block">
                        <input type="text" id="e_id" name="id" class="layui-input" placeholder="这是ID哦">
                    </div>
                </div>
                <div class="layui-form-item" id="e_idinput">
                    <label class="layui-form-label">客户ID：</label>
                    <div class="layui-input-block">
                        <input type="text" id="e_customerid" name="customerid" class="layui-input" placeholder="请输入客户ID">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">早餐：</label>
                    <div class="layui-input-block">
                        <input type="text" id="e_breakfast" name="breakfast" class="layui-input" placeholder="请输入早餐">
                    </div>
                </div>                <div class="layui-form-item">
                    <label class="layui-form-label">午餐：</label>
                    <div class="layui-input-block">
                        <input type="text" id="e_lunch" name="lunch" class="layui-input" placeholder="请输入午餐">
                    </div>
                </div>                <div class="layui-form-item">
                    <label class="layui-form-label">晚餐：</label>
                    <div class="layui-input-block">
                        <input type="text" id="e_dinner" name="dinner" class="layui-input" placeholder="请输入晚餐">
                    </div>
                </div>
                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">备注：</label>
                    <div class="layui-input-block">
                        <textarea id="e_memo" name="memo" placeholder="请输入内容" class="layui-textarea"></textarea>
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
        <input type="hidden" id="totalPageCount" value="${mo.pageTotalCount}"/>
        <c:import url="pageBtn.jsp">
            <c:param name="totalCount" value="${mo.totalCount}"/>
            <c:param name="currentPageNo" value="${mo.pageIndex}"/>
            <c:param name="totalPageCount" value="${mo.pageTotalCount}"/>
        </c:import>
    </div>
</div>
<script>
    layui.config({
        base: 'layui_exts/',
    }).extend({
        excel: 'excel',
    });

    layui.use(['jquery', 'excel', 'form','layer','laydate','element'], function(){
        var form = layui.form,
            $ = layui.jquery,
            laydate = layui.laydate,
            element = layui.element;
        var excel = parent.layui.excel;

        //执行一个laydate实例
        laydate.render({
            elem: '#start' //指定元素
        });
        form.render();
        form.on('submit(toolbarDemo)', function(){
            $.ajax({
                url: '/exportadminlist',
                type: 'post',
                dataType: 'json',
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    console.log(data);
                    // 1. 如果需要调整顺序，请执行梳理函数
                    var dt = excel.filterExportData(data, [
                        'id'
                        ,'username'
                        ,'name'
                        ,'phone'
                        ,'email'
                    ]);
                    // 2. 数组头部新增表头
                    dt.unshift({id: 'ID', username: '用户名', name: '姓名', phone: '电话', email: '级别描述'});

                    // 意思是：A列40px，B列60px(默认)，C列120px，D、E、F等均未定义
                    var colConf = excel.makeColConfig({
                        'A': 40,
                        'D': 90
                    }, 60);

                    var timestart = Date.now();
                    // 3. 执行导出函数，系统会弹出弹框
                    excel.exportExcel({
                        sheet1: dt
                    }, '管理员数据.xlsx', 'xlsx', {
                        extend: {
                            '!cols': colConf
                        }
                    });
                    var timeend = Date.now();

                    var spent = (timeend - timestart) / 1000;
                    layer.alert('导出耗时 '+spent+' s');
                    //setTimeout(function () {window.location.href='/findAdmin';},2000);
                },
                error: function () {
                    //console.log(data);
                    setTimeout(function () {window.location.href='/findAdmin';},2000);
                }
            });
        });
        /*添加弹出框*/
        $("#addBtn").click(function () {
            document.getElementById("editMealorder").reset();
            document.getElementById("e_idinput").style.display="block";
            document.getElementById("editTitle").innerText = "订餐信息";
            layer.open({
                type: 1,
                title: "添加客户订餐信息",
                skin: "myclass",
                area: '700px',
                maxHeight: 600,
                scrollbar: true,
                anim: 2,
                content: $("#test"),
            });
            $("#editMealorder")[0].reset();
            form.on('submit(formDemo)', function(data) {
                var param=data.field;
                console.log(param);
                $.ajax({
                    url: '/addmealorder',
                    type: "post",
                    data:JSON.stringify(param),
                    contentType: "application/json; charset=utf-8",
                    success:function(){
                        console.log();
                        layer.msg('添加成功', {icon: 1, time: 2000});
                        setTimeout(function () {window.location.href='/mealorderlist';},2000);

                    },
                    error:function(){
                        layer.msg('添加失败',{icon:0,time:2000});
                        setTimeout(function () {window.location.href='/mealorderlist';},2000);
                    }
                });
            });
        });
        /*编辑*/
        $(".updateEdit").click(function() {
            var myid = $(this).parent("td").parent("tr").children(".id").html();
            var nickname = $(this).parent("td").parent("tr").children(".nickname").html();
            var createtime = $(this).parent("td").parent("tr").children(".createtime").html();
            var temperature = $(this).parent("td").parent("tr").children(".temperature").html();
            var memo = $(this).parent("td").parent("tr").children(".memo").html();
            createtime = createtime.substring(0,createtime.length-9);
            document.getElementById("e_id").value=myid;
            document.getElementById("e_idinput").style.display="none";
            document.getElementById("e_temperature").value=temperature;
            document.getElementById("e_memo").value=memo;
            document.getElementById("editTitle").innerText = "客户 "+nickname+" 在 "+createtime+" 的状态";
            //判断
            layer.open({
                type: 1,
                title: "修改 "+ nickname +" 的状态",
                skin: "myclass",
                area: '700px',
                maxHeight: 600,
                scrollbar: true,
                anim: 2,
                content: $("#test"),
            });
        });
        $("#editCstatus")[0].reset();
        form.on('submit(formDemo)', function(data) {
            var param=data.field;
            console.log(param);
            $.ajax({
                url: '/cstatusupdate',
                type: "post",
                data:JSON.stringify(param),
                contentType: "application/json; charset=utf-8",
                success:function(){
                    console.log();
                    layer.msg('修改成功', {icon: 1, time: 2000});
                    setTimeout(function () {window.location.href='/cstatuslist';},2000);

                },
                error:function(){
                    layer.msg('修改失败',{icon:0,time:2000});
                    setTimeout(function () {window.location.href='/cstatuslist';},2000);
                }
            });
        });
    });
    /*删除*/
    function member_del(obj,id){
        layer.confirm('确认要删除吗？', function (index) {
            //发异步删除数据
            $.get("/deletecstatus", {"id": id}, function (data){
                if (data = true) {
                    layer.msg('删除成功!', {icon: 1, time: 2000});
                    setTimeout(function () {
                        window.location.href = '/cstatuslist';
                    }, 2000);

                } else {
                    layer.msg('删除失败!', {icon: 1, time: 2000});
                    setTimeout(function () {
                        window.location.href = '/cstatuslist';
                    }, 2000);
                }
            });
        });
    }
</script>

</body>
</html>
