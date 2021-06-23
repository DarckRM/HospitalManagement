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
    <title>药品信息</title>
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
        <a href="/findRegisterPage">药品信息</a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="/findRegisterPage" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="x-body">
    <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so" action="" >
            <div class="layui-form-item">
                <input class="layui-input" placeholder="请输入用户名" name="name" id="name">
                <%--<input class="layui-input" placeholder="请输入医生名" name="didName" id="didName">--%>
                <div class="layui-input-block" style="float: left; margin-left: 0px; margin-right: 20px">
                    <select name="department" >
                        <option value="">科室信息</option>
                        <option value="0">内科</option>
                        <option value="1">外科</option>
                        <option value="2">儿科</option>
                        <option value="3">口腔科</option>
                        <option value="4">放射科</option>
                        <option value="5">骨科</option>
                    </select>
                </div>
                <input class="layui-input" type="hidden" name="pageIndex" value="1">
                <input class="layui-input" type="hidden" name="pageSize">
                <button class="layui-btn"  lay-submit="" lay-filter="search"><i class="layui-icon">&#xe615;</i></button>
            </div>
        </form>
    </div>

    <xblock>
        <button id="addBtn" class="layui-btn layui-btn-normal"> <i class="layui-icon">&#xe654;</i>添加</button>
        <span class="x-right" style="line-height:40px">共有数据：${mi.totalCount} 条</span>
    </xblock>

    <%--表格数据--%>
    <table class="layui-table" >
        <thead>
        <tr>
            <th>用户名</th>
            <th>用户卡号</th>
            <th>用户号</th>
            <th>缴费金额</th>
            <th>电话号码</th>
            <th>是否支付</th>
            <th>年龄</th>
            <th>性别</th>
            <th>科室</th>
            <th>医生</th>
            <th>状态</th>
            <th>注册时间</th>
            <th>备注</th>
            <th>操作</th>
        </thead>
        <tbody>
        <c:forEach items="${mi.list}" var="mi">
            <tr>
                <td class="rid layui-hide">${mi.rid}</td>
                <td class="name">${mi.name}</td>
                <td class="idCard">${mi.idCard}</td>
                <td class="siNumber">${mi.siNumber}</td>
                <td class="registerMoney">${mi.registerMoney}</td>
                <td class="phone">${mi.phone}</td>
                <td class="isPay">${mi.isPay}</td>
                <td class="sex layui-hide">${mi.sex == 1 ? '女':'男'}</td>
                <td class="age">${mi.age}</td>
                <td class="consultation ">${mi.consultation}</td>
                <td class="registerDepartment">${mi.departmentName}</td>
                <td class="didName ">${mi.didName}</td>
                <td class="department layui-hide">${mi.department}</td>
                <td class="did layui-hide">${mi.did}</td>
                <td class="status">${mi.status}</td>
                <td class="registerDate ">${mi.registerDate}</td>
                <td class="remark ">${mi.remark}</td>

                <td class="td-manage">
                    <a title="编辑" class="updateEdit" href="#">
                        <i class="layui-icon">&#xe642;</i>
                    </a>
                    <a title="删除" onclick="member_del(this,'${mi.rid}')" href="javascript:;">
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
                    <legend>注册信息</legend>
                </fieldset>
                <div class="layui-form-item "  >
                    <label class="layui-form-label">rid</label>
                    <div class="layui-input-block">
                        <input type="text"  id="rid" name="rid" class="layui-input" placeholder="请输入用户rid">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">用户姓名：</label>
                    <div class="layui-input-block">
                        <input type="text" lay-verify="required" id="ename" name="name" class="layui-input" placeholder="请输入姓名">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">卡号：</label>
                    <div class="layui-input-block">
                        <input type="text" lay-verify="required" id="idCard" name="idCard"  class="layui-input" placeholder="请输入卡号">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">用户号：</label>
                    <div class="layui-input-block">
                        <input type="text" id="siNumber" name="siNumber" class="layui-input" placeholder="请输入用户号">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">金额：</label>
                    <div class="layui-input-block">
                        <input type="text" id="registerMoney" name="registerMoney" class="layui-input" placeholder="请输入金额">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">电话号码：</label>
                    <div class="layui-input-block">
                        <input type="text" id="phone" name="phone" class="layui-input" placeholder="请输入电话号码">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">是否支付：</label>
                    <div class="layui-input-block">
                        <input type="text" id="isPay" name="isPay" class="layui-input" placeholder="请输入是否支付">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">性别：</label>
                    <div class="layui-input-block">
                        <input type="text" id="sex" name="sex" class="layui-input" placeholder="请输入性别">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">年龄：</label>
                    <div class="layui-input-block">
                        <input type="text" id="age" name="age" class="layui-input" placeholder="请输入年龄">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">咨询：</label>
                    <div class="layui-input-block">
                        <input type="text" id="consultation" name="consultation" class="layui-input" placeholder="请输入咨询信息">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">注册时间：</label>
                    <div class="layui-input-block">
                        <input type="text" id="registerDate" name="registerDate" class="layui-input" placeholder="请输入咨询信息">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">备注：</label>
                    <div class="layui-input-block">
                        <input type="text" id="remark" name="remark" class="layui-input" placeholder="请输入备注">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">状态：</label>
                    <div class="layui-input-block">
                        <input type="text" id="status" name="status" class="layui-input" placeholder="亲输入状态">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">科室</label>
                    <div class="layui-input-block">
                        <select id="department" name="department" lay-filter="aihao" >
                            <option value="" selected=""></option>
                            <option value="0">内科</option>
                            <option value="1">外科</option>
                            <option value="2">儿科</option>
                            <option value="3">口腔科</option>
                            <option value="4">放射科</option>
                            <option value="5">骨科</option>
                        </select>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">医生</label>
                    <div class="layui-input-block">
                        <select id="did" name="did" lay-filter="aihao" >
                            <option value="" selected=""></option>
                            <option value="1">华佗</option>
                            <option value="2">扁鹊</option>
                            <option value="3">喜来乐</option>
                            <option value="4">李时珍</option>
                            <option value="5">端木蓉</option>
                            <option value="6">杨永信</option>
                            <option value="7">小甜甜</option>
                        </select>
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
        <input type="hidden" id="totalPageCount" value="${mi.pageTotalCount}"/>
        <c:import url="pageBtn.jsp">
            <c:param name="totalCount" value="${mi.totalCount}"/>
            <c:param name="currentPageNo" value="${mi.pageIndex}"/>
            <c:param name="totalPageCount" value="${mi.pageTotalCount}"/>
        </c:import>
    </div>
</div>
<script>
    layui.use(['jquery', 'form','layer','laydate','element'], function(){
        var form = layui.form,
            $ = layui.jquery,
            laydate = layui.laydate;
        laydate.render({
            elem: '#registerDate'
            ,type: 'date'
        });
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
                title: "添加药品信息",
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
                    url: '/add',
                    type: "post",
                    data:JSON.stringify(param),
                    contentType: "application/json; charset=utf-8",
                    success:function(){
                        layer.msg('添加成功', {icon: 1, time: 2000});


                    },
                    error:function(){
                        layer.msg('添加失败',{icon:0,time:2000});

                    }
                });
            });
        });
        /*编辑*/
        $(".updateEdit").click(function() {
            var rid = $(this).parent("td").parent("tr").children(".rid").html();
            var name= $(this).parent("td").parent("tr").children(".name").html();
            var idCard = $(this).parent("td").parent("tr").children(".idCard").html();
            var siNumber = $(this).parent("td").parent("tr").children(".siNumber").html();
            var registerMoney = $(this).parent("td").parent("tr").children(".registerMoney").html();
            var phone = $(this).parent("td").parent("tr").children(".phone").html();
            var isPay = $(this).parent("td").parent("tr").children(".isPay").html();
            var sex = $(this).parent("td").parent("tr").children(".sex").html();
            var age = $(this).parent("td").parent("tr").children(".age").html();
            var consultation = $(this).parent("td").parent("tr").children(".consultation").html();
            var department = $(this).parent("td").parent("tr").children(".department").html();
            var did = $(this).parent("td").parent("tr").children(".did").html();
            var status = $(this).parent("td").parent("tr").children(".status").html();
            var registerDate = $(this).parent("td").parent("tr").children(".registerDate").html();
            var remark = $(this).parent("td").parent("tr").children(".remark").html();

            //var birthday = $(this).parent("td").parent("tr").children(".birthday").html();
            //判断
            layer.open({
                type: 1,
                title: "修改 "+ name +" 的信息",
                skin: "myclass",
                area: '700px',
                maxHeight: 600,
                scrollbar: true,
                anim: 2,
                content: $("#test"),
            });
            $("#rid").val(rid);
            $("#ename").val(name);
            $("#idCard").val(idCard);
            $("#siNumber").val(siNumber);
            $("#registerMoney").val(registerMoney);
            $("#phone").val(phone);
            $("#isPay").val(isPay);
            $("#sex").val(sex);
            $("#age").val(age);
            $("#consultation").val(consultation);
            $("#department").val(department);
            $("#did").val(did);
            $("#status").val(status);
            $("#registerDate").val(registerDate);
            $("#remark").val(remark);
            //document.getElementById("e_birthday").value = birthday;
        });
        $("#editCustomer")[0].reset();
        form.on('submit(formDemo)', function(data) {
            var param=data.field;
            $.ajax({
                url: '/updateRegister',
                type: "post",
                data:JSON.stringify(param),
                contentType: "application/json; charset=utf-8",
                success:function(){
                    console.log();
                    layer.msg('修改成功', {icon: 1, time: 2000});


                },
                error:function(){
                    layer.msg('修改失败',{icon:0,time:2000});

                }
            });
        });
    });
    /*删除*/
    function member_del(obj,rid){
        console.log(rid);
        layer.confirm('确认要删除吗？', function (index) {
            //发异步删除数据
            $.get("/delete", {"rid": rid}, function (data){
                if (data = true) {
                    layer.msg('删除成功!', {icon: 1, time: 2000});


                } else {
                    layer.msg('删除失败!', {icon: 1, time: 2000});

                }
            });
        });
    }
</script>
</body>
</html>
