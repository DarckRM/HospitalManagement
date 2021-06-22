<%--
  Created by IntelliJ IDEA.
  User: a
  Date: 2020/11/8
  Time: 17:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false"%>
<html>
<head>
    <title>系统参数x</title>

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
    <legend>系统参数</legend>
</fieldset>

<div class="layui-container" style="padding: 30px;margin-left: 20px;background-color: #F2F2F2;">
    <div class="layui-row">
        <div class="layui-col-md6" style="margin-bottom: 20px">
            <div class="layui-card">
                <div class="layui-card-header">注意</div>
                <div class="layui-card-body">
                    此页面显示的是系统的默认参数<br>
                    请谨慎修改
                </div>
            </div>
        </div>
    </div>
    <div class="layui-row">
        <div class="layui-col-md6">
            <div class="layui-card">
                <div class="layui-card-header">系统参数
                </div>
                <div class="layui-card-body">
                    <%--<div class="layui-form-label" style="text-align: left">你好</div>--%>
                    当前登录用户：<span style="color: red">${sessionScope.ad.username}</span>
                </div>
                <div class="layui-card-body">
                    默认车牌前缀：${ps.carnumber}
                </div>
                <div class="layui-card-body">
                    预收金额（元）：${ps.premoney}
                </div>
                <div class="layui-card-body">
                    微信当前接口Token：${ps.access_token}
                </div>
                <div class="layui-card-body">
                    Token有效期：${ps.access_youxrq}
                </div>
                <div class="layui-card-body">
                    每日短信条数限制：${ps.shortmsgcount}
                </div>
                <div class="layui-card-body">
                    短信验证码有效秒：${ps.shortmsgvalidsecond}
                </div>
                <div class="layui-card-body">
                    提交订餐结束时间：${ps.submitendhour}
                </div>
                <div class="layui-card-body">
                    <button type="button" class="layui-btn" id="parameterEditBtn">修改</button>
                </div>
            </div>
        </div>
    </div>

</div>
<%--添加模态框--%>
<div class="layui-row" id="edit" style="display: none; margin-top: 20px">
    <div class="layui-col-md10">
        <form class="layui-form" id="editParameter">
            <div class="layui-form-item">
                <label class="layui-form-label">默认车牌前缀：</label>
                <div class="layui-input-block">
                    <input type="text" lay-verify="required" name="carnumber" class="layui-input" value="${ps.carnumber}">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">预收金额（元）：</label>
                <div class="layui-input-block">
                    <input type="text" lay-verify="required" name="premoney"  class="layui-input" value="${ps.premoney}">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">微信当前接口Token：</label>
                <div class="layui-input-block">
                    <input type="text" lay-verify="required" name="access_token" class="layui-input" value="${ps.access_token}">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">Token有效期：</label>
                <div class="layui-inline">
                    <div class="layui-input-inline">
                        <input type="text" class="layui-input" name="access_youxrq" id="date" value="${ps.access_youxrq}">
                    </div>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">每日短信条数限制：</label>
                <div class="layui-input-block">
                    <input type="text" lay-verify="required" name="shortmsgcount"  class="layui-input" value="${ps.shortmsgcount}">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">短信验证码有效秒：</label>
                <div class="layui-input-block">
                    <input type="text" name="shortmsgvalidsecond" class="layui-input" value="${ps.shortmsgvalidsecond}">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">提交订餐结束时间：</label>
                <div class="layui-input-block">
                    <input type="text" name="submitendhour" class="layui-input" value="${ps.submitendhour}">
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
        var laydate = layui.laydate;
        laydate.render({
            elem: '#date',
            type: 'datetime'
        });
        //各种基于事件的操作，下面会有进一步介绍
        /*修改弹出框*/
        $("#parameterEditBtn").click(function () {
            layer.open({
                type:1,
                title:"修改站点信息",
                skin:"myclass",
                area:["50%"],
                anim:2,
                content:$("#edit")
            });
            $("#editParameter")[0].reset();
            form.on('submit(formDemo)', function(data) {
                // layer.msg('aaa',{icon:1,time:3000});
                var param=data.field;
                console.log(param);
                // console.log(JSON.stringify(param));
                $.ajax({
                    url: '/parameteredit',
                    type: "post",
                    data:JSON.stringify(param),
                    contentType: "application/json; charset=utf-8",
                    success:function(){
                        console.log();
                        layer.msg('修改成功', {icon: 1, time: 2000});
                        setTimeout(function () {window.location.href='/parameterlist';},2000);

                    },
                    error:function(){
                        layer.msg('修改失败',{icon:0,time:2000});
                        setTimeout(function () {window.location.href='/parameterlist';},2000);
                    }
                });
                // return false;
            });
        });


    });
</script>
</body>
</html>
