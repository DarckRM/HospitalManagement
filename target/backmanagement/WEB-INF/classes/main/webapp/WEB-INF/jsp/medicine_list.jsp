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
        <a href="/medicinelist">药品信息</a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="/medicinelist" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="x-body">
    <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so" action="" >
            <div class="layui-form-item">
                <input class="layui-input" placeholder="请输入用户名" name="mname" id="mname">
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
            <th>编号</th>
            <th>名称</th>
            <th>保质期/月</th>
            <th>成本</th>
            <th>售价</th>
            <th>类型</th>
            <th>简述</th>
            <th>制造商</th>
            <th>操作</th>
        </thead>
        <tbody>
        <c:forEach items="${mi.list}" var="mi">
            <tr>
                <td class="mid">${mi.mid}</td>
                <td class="mname">${mi.mname}</td>
                <td class="qualitydate">${mi.qualitydate}</td>
                <td class="inprice">${mi.inprice}</td>
                <td class="salprice">${mi.salprice}</td>
                <td class="typename">${mi.typename}</td>
                <td class="type layui-hide">${mi.type}</td>
                <td class="descs">${mi.descs}</td>
                <td class="description layui-hide">${mi.description}</td>
                <td class="producefirm">${mi.producefirm}</td>
                <td class="readme layui-hide">${mi.readme}</td>
                <td class="remark layui-hide">${mi.remark}</td>

                <td class="td-manage">
                    <a title="编辑" class="updateEdit" href="#">
                        <i class="layui-icon">&#xe642;</i>
                    </a>
                    <a title="删除" onclick="member_del(this,'${mi.mid}')" href="javascript:;">
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
                <div class="layui-form-item">
                    <label class="layui-form-label">药品编号：</label>
                    <div class="layui-input-block">
                        <input type="text" lay-verify="required" id="e_mid" name="mid" class="layui-input" placeholder="这是ID哦">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">名称：</label>
                    <div class="layui-input-block">
                        <input type="text" lay-verify="required" id="e_mname" name="mname"  class="layui-input" placeholder="请输入姓名">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">保质期：</label>
                    <div class="layui-input-block">
                        <input type="text" id="e_qualitydate" name="qualitydate" class="layui-input" placeholder="请输入卡号">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">成本：</label>
                    <div class="layui-input-block">
                        <input type="text" id="e_inprice" name="inprice" class="layui-input" placeholder="请输入性别">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">售价：</label>
                    <div class="layui-input-block">
                        <input type="text" id="e_salprice" name="salprice" class="layui-input" placeholder="请输入电子邮箱">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">类型：</label>
                    <div class="layui-input-block">
                        <input type="text" id="e_type" name="type" class="layui-input" placeholder="请输入电话号码">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">简述：</label>
                    <div class="layui-input-block">
                        <input type="text" id="e_descs" name="descs" class="layui-input" placeholder="请输入电话号码">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">制造商：</label>
                    <div class="layui-input-block">
                        <input type="text" id="e_producefirm" name="producefirm" class="layui-input" placeholder="请输入电话号码">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">详细描述：</label>
                    <div class="layui-input-block">
                        <input type="text" id="e_description" name="description" class="layui-input" placeholder="请输入电话号码">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">说明：</label>
                    <div class="layui-input-block">
                        <input type="text" id="e_readme" name="readme" class="layui-input" placeholder="请输入电话号码">
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
                    url: '/medicineadd',
                    type: "post",
                    data:JSON.stringify(param),
                    contentType: "application/json; charset=utf-8",
                    success:function(){
                        layer.msg('添加成功', {icon: 1, time: 2000});
                        setTimeout(function () {window.location.href='/medicinelist';},2000);

                    },
                    error:function(){
                        layer.msg('添加失败',{icon:0,time:2000});
                        setTimeout(function () {window.location.href='/medicinelist';},2000);
                    }
                });
            });
        });
        /*编辑*/
        $(".updateEdit").click(function() {
            var mid = $(this).parent("td").parent("tr").children(".mid").html();
            var inprice= $(this).parent("td").parent("tr").children(".inprice").html();
            var salprice = $(this).parent("td").parent("tr").children(".salprice").html();
            var mname = $(this).parent("td").parent("tr").children(".mname").html();
            var type = $(this).parent("td").parent("tr").children(".type").html();
            var descs = $(this).parent("td").parent("tr").children(".descs").html();
            var qualitydate = $(this).parent("td").parent("tr").children(".qualitydate").html();
            var description = $(this).parent("td").parent("tr").children(".description").html();
            var produceFirm = $(this).parent("td").parent("tr").children(".producefirm").html();
            var readme = $(this).parent("td").parent("tr").children(".readme").html();
            var remark = $(this).parent("td").parent("tr").children(".remark").html();
            //var birthday = $(this).parent("td").parent("tr").children(".birthday").html();
            //判断
            layer.open({
                type: 1,
                title: "修改 "+ mname +" 的信息",
                skin: "myclass",
                area: '700px',
                maxHeight: 600,
                scrollbar: true,
                anim: 2,
                content: $("#test"),
            });
            $("#e_mid").val(mid);
            $("#e_inprice").val(inprice);
            $("#e_salprice").val(salprice);
            $("#e_mname").val(mname);
            $("#e_type").val(type);
            $("#e_descs").val(descs);
            $("#e_qualitydate").val(qualitydate);
            $("#e_description").val(description);
            $("#e_producefirm").val(produceFirm);
            $("#e_readme").val(readme);
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
                url: '/medicineupdate',
                type: "post",
                data:JSON.stringify(param),
                contentType: "application/json; charset=utf-8",
                success:function(){
                    console.log();
                    layer.msg('修改成功', {icon: 1, time: 2000});
                    setTimeout(function () {window.location.href='/medicinelist';},2000);

                },
                error:function(){
                    layer.msg('修改失败',{icon:0,time:2000});
                    setTimeout(function () {window.location.href='/medicinelist';},2000);
                }
            });
        });
    });
    /*删除*/
    function member_del(obj,id){
        layer.confirm('确认要删除吗？', function (index) {
            //发异步删除数据
            $.get("/medicinedel", {"id": id}, function (data){
                if (data = true) {
                    layer.msg('删除成功!', {icon: 1, time: 2000});
                    setTimeout(function () {
                        window.location.href = '/medicinelist';
                    }, 2000);

                } else {
                    layer.msg('删除失败!', {icon: 1, time: 2000});
                    setTimeout(function () {
                        window.location.href = '/medicinelist';
                    }, 2000);
                }
            });
        });
    }
</script>
</body>
</html>
