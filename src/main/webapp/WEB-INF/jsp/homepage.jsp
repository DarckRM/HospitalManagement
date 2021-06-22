<%--
  Created by IntelliJ IDEA.
  User: hkw
  Date: 2018/10/15
  Time: 21:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false"%>

<html>
<head>
    <title>后台登录</title>
    <meta http-equiv="Access-Control-Allow-Origin" content="*" />
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <%--<meta http-equiv="Cache-Control" content="no-siteapp" />--%>

    <link rel="icon" href="/images/favicon.ico" sizes="32x32" />
    <link rel="stylesheet" href="/css/font.css">
    <link rel="stylesheet" href="/css/xadmin.css">
    <link rel="stylesheet" href="/layui/css/layui.css">
    <script type="text/javascript" src="/js/jquery-1.3.2.min.js"></script>
    <script src="/layui/layui.js"></script>
    <script type="text/javascript" src="/js/xadmin.js"></script>
    <script type="text/javascript" src="/layui/lay/modules/form.js"></script>
    <script type="text/javascript" src="/layui/lay/modules/jquery.js"></script>
    <script src="/layui_exts/excel.js"></script>
    <script src="/js/md5.js"></script>

    <style>
        .o_div{
            background: url("/images/01.jpg") no-repeat;
        }
        .o_span{
            display: block;
            text-align: center;
            font-size: 20px;
            letter-spacing:8px
        }
    </style>
</head>
<body>
<!-- 顶部开始 -->
<div class="container">
    <div class="logo"><a href="#">应急健康后台管理系统</a></div>
    <div class="left_open">
        <i title="展开左侧栏" class="iconfont">&#xe699;</i>
    </div>
    <ul class="layui-nav right" lay-filter="">
        <li class="layui-nav-item">
            <a href="javascript:;"><img src="images/user.png" class="layui-nav-img">${sessionScope.ad.username}</a>
            <dl class="layui-nav-child"> <!-- 二级菜单 -->
                <dd><a onclick="x_admin_show('切换帐号','loginOut')">切换帐号</a></dd>
                <dd><a href="/loginOut">退出</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item to-index"><a href="/loginOut">前台首页</a></li>
    </ul>

</div>
<!-- 顶部结束 -->
<!-- 中部开始 -->
<!-- 左侧菜单开始 -->
<div class="left-nav">
    <div id="side-nav">
        <ul id="nav">
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe6b8;</i>
                    <cite>业务办理</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                    <a _href="/customerlist">
                        <i class="iconfont">&#xe6a7;</i>
                        <cite>门诊医生</cite>
                    </a>
                </li >
                    <li>
                        <a _href="/cstatuslist">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>药品管理</cite>
                        </a>
                    </li >
                    <li>
                        <a _href="/cstatuslist">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>挂号信息</cite>
                        </a>
                    </li >
                </ul>
            </li>
        </ul>
    </div>
</div>
<!-- <div class="x-slide_left"></div> -->
<!-- 左侧菜单结束 -->
<!-- 右侧主体开始 -->
<div class="page-content">
    <div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
        <ul class="layui-tab-title">
            <li class="home"><i class="layui-icon">&#xe68e;</i>我的桌面</li>
        </ul>
        <div class="layui-tab-content" >
            <div class="layui-tab-item layui-show o_div" >
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 0px">
                    <legend>${sessionScope.ad.username}管理员，应急后勤健康管理系统！</legend>
                </fieldset>
                <div class="layui-col-md6" style="padding: 30px;left: 60px;background-color: #F2F2F2;">
                <div class="layui-card-header">个人信息</div>
                    <div class="layui-card">
                        <div class="layui-card-body">
                            <%--<div class="layui-form-label" style="text-align: left">你好</div>--%>
                           用户名：${sessionScope.ad.username}
                        </div>
                        <div class="layui-card-body">
                            姓名：${sessionScope.ad.relname}
                        </div>
                        <div class="layui-card-body">
                            电话：${sessionScope.ad.tel}
                        </div>
                        <div class="layui-card-body">
                            级别描述：${sessionScope.ad.memo}
                        </div>
                </div>
                </div>
            </div>

        </div>
    </div>
</div>
<%--静态 修改当前用户密码框--%>
<div class="layui-row" id="epassword" style="display: none; margin-top: 20px">
    <div class="layui-col-md10">
        <form class="layui-form" id="editPassword">
            <div class="layui-form-item" style="display: none">
                <label class="layui-form-label">调试信息：</label>
                <div class="layui-input-block">
                    <input type="text" name="id" class="layui-input layui-disabled" value="${sessionScope.ad.id}">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">原密码：</label>
                <div class="layui-input-block">
                    <input type="text" lay-verify="required" id="oldpassword" class="layui-input" >
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">新密码：</label>
                <div class="layui-input-block">
                    <input type="text" lay-verify="required" id="password" name="password"  class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">确认新密码：</label>
                <div class="layui-input-block">
                    <input type="text" lay-verify="required" id="vertifypassword" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" style="margin-left: 40px">
                <div class="layui-input-block">
                    <button type="button" class="layui-btn layui-btn-normal" lay-submit lay-filter="formDemo">提交</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>
</div>
<div class="page-content-bg"></div>
<!-- 右侧主体结束 -->
<!-- 中部结束 -->
<!-- 底部开始 -->
<div class="footer">
    <div class="copyright">Copyright ©2019-2020 版权所有</div>
</div>
<!-- 底部结束 -->
<script>
    function receiveData (response) {
        console.log(response);
    }
</script>

<script>

    layui.config({
        base: 'layui_exts/',
    }).extend({
        excel: 'excel',
    });
    layui.use(['jquery','form','layer'], function(){
        var form = layui.form,
            $ = layui.jquery;
        $("#updatePassword").click(function(){
        layer.open({
            type:1,
            title:"修改当前用户密码",
            skin:"myclass",
            area: '480px',
            maxHeight: 600,
            anim:2,
            content:$("#epassword")
        });
        $("#editPassword")[0].reset();
        form.on('submit(formDemo)', function(data) {
            var oldpw = hex_md5(document.getElementById("oldpassword").value).toUpperCase();
            var newpw = hex_md5(document.getElementById("password").value).toUpperCase();
            var verpw = hex_md5(document.getElementById("vertifypassword").value).toUpperCase();
            if (oldpw != "${sessionScope.ad.password}") {
                layer.msg('原密码错误', {icon: 0, time: 2000});
                return;
            }
            if(newpw != verpw){
                layer.msg('两次密码不一致',{icon: 0, time: 2000});
                return;
            }
            var param=data.field;
            // console.log(JSON.stringify(param));
            $.ajax({
                url: '/updatePassword',
                type: "post",
                data:JSON.stringify(param),
                contentType: "application/json; charset=utf-8",
                success:function(){
                    console.log();
                    layer.closeAll();
                    layer.msg('修改成功', {icon: 1, time: 2000});
                },
                error:function(){
                    layer.msg('修改失败',{icon:0,time:2000});
                }
            });
            // return false;
        });
    });
    });
</script>
</body>
</html>
