<%--
  Created by IntelliJ IDEA.
  User: a
  Date: 2020/10/19
  Time: 21:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false"%>
<html>
<head>
    <title>站点信息</title>

    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <%--<meta http-equiv="Cache-Control" content="no-siteapp" />--%>

    <link rel="icon" href="/images/favicon.ico" sizes="32x32" />
    <link rel="stylesheet" href="/css/font.css">
    <link rel="stylesheet" href="/css/xadmin.css">
    <link rel="stylesheet" href="/css/layui.css">
    <script type="text/javascript" src="/js/jquery-1.3.2.min.js"></script>
    <script src="/layui/layui.js"></script>
    <script type="text/javascript" src="/js/xadmin.js"></script>
    <script type="text/javascript" src="/layui/lay/modules/form.js"></script>
    <script type="text/javascript" src="/layui/lay/modules/jquery.js"></script>
    <script type="text/javascript" src="/layui/lay/modules/layer.js"></script>

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
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px">
    <legend>站点信息</legend>
</fieldset>

<div class="layui-container" style="padding: 30px;margin-left: 20px;background-color: #F2F2F2;">
    <div class="layui-row">
        <div class="layui-col-md6" style="margin-bottom: 20px">
            <div class="layui-card">
                <div class="layui-card-header">注意</div>
                <div class="layui-card-body">
                    此页面显示的是本站点的具体信息<br>
                    请谨慎修改
                </div>
            </div>
        </div>
    </div>
    <div class="layui-row">
        <div class="layui-col-md6">
            <div class="layui-card">
                <div class="layui-card-header">站点信息
                </div>
                <div class="layui-card-body">
                    <%--<div class="layui-form-label" style="text-align: left">你好</div>--%>
                    当前登录用户：<span style="color: red">${sessionScope.ad.username}</span>
                </div>
                <div class="layui-card-body">
                    站点名称：${si.name}
                </div>
                <div class="layui-card-body">
                    地址：${si.address}
                </div>
                <div class="layui-card-body">
                    联系人：${si.contactperson}
                </div>
                <div class="layui-card-body">
                    站点电话：${si.telephone}
                </div>
                <div class="layui-card-body">
                    移动电话：${si.mobilephone}
                </div>
                <div class="layui-card-body">
                    帮助内容：${si.helpcontent}
                </div>
                <div class="layui-card-body">
                    备注：${si.memo}
                </div>
                <div class="layui-card-body">
                    <button type="button" class="layui-btn" id="siteinfoEditBtn">修改</button>
                </div>
            </div>
        </div>
    </div>

</div>
<%--添加模态框--%>
<div class="layui-row" id="edit" style="display: none; margin-top: 20px">
    <div class="layui-col" style="margin: auto 20px">
        <form class="layui-form" id="editSiteInfo">
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px">
                <legend>修改站点信息</legend>
            </fieldset>
            <div class="layui-form-item">
                <label class="layui-form-label">站点名称：</label>
                <div class="layui-input-block">
                    <input type="text" lay-verify="required" name="name" class="layui-input" placeholder="请输入站点名称" value="${si.name}">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">地址：</label>
                <div class="layui-input-block">
                    <input type="text" lay-verify="required" name="address"  class="layui-input" placeholder="请输入地址" value="${si.address}">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">联系人：</label>
                <div class="layui-input-block">
                    <input type="text" lay-verify="required" name="contactperson" class="layui-input" placeholder="请输入联系人" value="${si.contactperson}">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">站点电话：</label>
                <div class="layui-input-block">
                    <input type="text" lay-verify="required" name="telephone" class="layui-input" placeholder="请输入站点电话" value="${si.telephone}">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">移动电话：</label>
                <div class="layui-input-block">
                    <input type="text" lay-verify="required" name="mobilephone"  class="layui-input" placeholder="请输入移动电话" value="${si.mobilephone}">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">帮助内容：</label>
                <div class="layui-input-block">
                    <input type="text" name="helpcontent" class="layui-input" placeholder="请输入帮助内容" value="${si.helpcontent}">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">备注：</label>
                <div class="layui-input-block">
                    <input type="text" name="memo" class="layui-input" placeholder="请输入备注" value="${si.memo}">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button type="button" class="layui-btn layui-btn-normal" lay-submit lay-filter="formDemo">提交</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script src="/layui/layui.js"></script>
<script>
    layui.use(['jquery','form','layer','laydate'], function(){
        var form = layui.form,
            $ = layui.jquery;
        //各种基于事件的操作，下面会有进一步介绍
    /*修改弹出框*/
    $("#siteinfoEditBtn").click(function () {
        layer.open({
            type:1,
            title:"修改站点信息",
            skin:"myclass",
            area: '540px',
            maxHeight: 600,
            anim:2,
            content:$("#edit")
        });
        $("#editSiteInfo")[0].reset();
        form.on('submit(formDemo)', function(data) {
            // layer.msg('aaa',{icon:1,time:3000});
            var param=data.field;
            console.log(param);
            // console.log(JSON.stringify(param));
            $.ajax({
                url: '/siteinfoedit',
                type: "post",
                data:JSON.stringify(param),
                contentType: "application/json; charset=utf-8",
                success:function(){
                    console.log();
                    layer.msg('修改成功', {icon: 1, time: 2000});
                    setTimeout(function () {window.location.href='/siteinfolist';},2000);

                },
                error:function(){
                    layer.msg('修改失败',{icon:0,time:2000});
                    setTimeout(function () {window.location.href='/siteinfolist';},2000);
                }
            });
            // return false;
        });
    });


    });
</script>
</body>
</html>
