<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020-02-17 0017
  Time: 18:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.2.1.js"></script>

    <link href="/static/css/index.css" rel="stylesheet">
    <script src="/static/js/index.js"></script>
    <script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet">

    <script src="${pageContext.request.contextPath}/static/js/Training/Training.js"></script>
</head>
<body>

<header class="Z_layout_head Z_layout_head_active" id="Z_layout_head">
    <div class="Z_layout_main">
        <div class="Z_container Z_header_main">
            <!-- 国大Logo -->
            <h1 class="Z_logo_box">
                <a href="#">
                    <!-- 首页logo 区别于其他页面logo -->
                    <img class="Z_logo" style="margin-top: -5px;margin-left: -10px;height: 50px" id="Z_logo"
                         src="/static/image/timg.gif" alt="">
                </a>
            </h1>

            <!-- 顶部导航 -->
            <ul class="Z_nav_box" onclick="daohang()">
                <li><a href="/jsp/index.jsp" class="ani ">首页</a></li>
                <li><a href="/jsp/zuFang/chuzufang.jsp" class="ani ">模拟考试</a></li>
                <li><a href="/jsp/Training/Training.jsp" class="ani active">培训机构</a></li>
                <li><a href="/jsp/PointsGift/PointsGift.jsp" class="ani ">积分礼物</a></li>
                <li><a href="/jsp/404.jsp" class="ani ">学术分享</a></li>
                <li><a href="/jsp/404.jsp" class="ani ">视频教学</a></li>
            </ul>
            <div class="Z_login_top" id="loginEntyWrapper" style="">
                <a href="javascript:;" class="Z_exit" rel="nofollow" id="zLogin">登录</a>
                <a href="javascript:;" class="Z_exit_line">|</a>
                <a href="javascript:;" class=" Z_exit" rel="nofollow" id="zRegister">注册</a>
            </div>
            <div class="Z_login_top" id="ok_login" style="display: none">
                <a id="urlgeren" class=" Z_headtop_tel" rel="nofollow"></a>
                <a class=" Z_exit" rel="nofollow" id="zRegister2" style="color: #0C0C0C;">退出</a>
            </div>
        </div>
    </div>
</header>
    <br><br><br><br><br>

    <div style="width: 900px;margin-left: 400px;">
        <ul id="myTab" class="nav nav-tabs">
            <li class="active">
                <a href="#home" data-toggle="tab">
                    简历
                </a>
            </li>
            <li>
                <a href="#ios" data-toggle="tab">
                    成就
                </a>
            </li>
            <li>
                <a href="#ios" data-toggle="tab">
                    学生喜报
                </a>
            </li>
            <li>
                <a href="#ios" data-toggle="tab">
                    发展方向
                </a>
            </li>
        </ul>
        <div id="myTabContent" class="tab-content">
            <div class="tab-pane fade in active" id="home">
                <p>菜鸟教程是一个提供最新的web技术站点，本站免费提供了建站相关的技术文档，帮助广大web技术爱好者快速入门并建立自己的网站。菜鸟先飞早入行——学的不仅是技术，更是梦想。</p>
            </div>
            <div class="tab-pane fade" id="ios">
                <p>iOS 是一个由苹果公司开发和发布的手机操作系统。最初是于 2007 年首次发布 iPhone、iPod Touch 和 Apple
                    TV。iOS 派生自 OS X，它们共享 Darwin 基础。OS X 操作系统是用在苹果电脑上，iOS 是苹果的移动版本。</p>
            </div>

        </div>
    </div>
<%--<div class="container">
    <div class="expandDiv">
        一些文字一些文字一些文字一些文字一些文字一些文字一些文字一些文字一些文字一些文字一些文字一些文字一些文字一些文字一些文字一些文字一些文字一些文字一些文字一些文字一些文字一些文字一些文字
        一些文字一些文字一些文字一些文字一些文字一些文字一些文字一些文字一些文字一些文字一些文字一些文字一些文字一些文字一些文字一些文字一些文字一些文字一些文字一些文字一些文字一些文字一些文字
        一些文字一些文字一些文字一些文字一些文字一些文字一些文字一些文字一些文字一些文字一些文字一些文字一些文字一些文字一些文字一些文字一些文字一些文字一些文字一些文字一些文字一些文字一些文字
    </div>
</div>--%>
    <%--<script>
        $.fn.expandable = function(config) {
            var that = $(this);
            var isExpand = false;
            var btnStr = '<button type="button" class="btn btn-default">加载更多</button>';
            var btnStr2 = '<button type="button" class="btn btn-default">关闭</button>';
            var summaryCharLen = 100;
            var content = that.text();
            var summary = content.substr(0, summaryCharLen);
            that.text(summary + '...');
            var btn = $('<div style="text-align: center">' + btnStr + '</div>').click(function(e) {
                var target = $(this).prev();
                if (isExpand) {
                    target.text(summary + '...');
                    $(this).html('<div>' + btnStr + '</div>');
                } else {
                    target.text(content);
                    $(this).html('<div>' + btnStr2 + '</div>');
                }
                isExpand = !isExpand;
            }).insertAfter(that).addClass('toggle-btn');
        };

        $('.expandDiv').expandable();
    </script>
    <style>
        .container {
            float: left;
            width: 300px;
            margin: 0 20px;
        }
        .toggle-btn {
            margin-top: 10px;
            border-top: 1px solid red;
            text-align: right;
        }
    </style>--%>
</body>
</html>
