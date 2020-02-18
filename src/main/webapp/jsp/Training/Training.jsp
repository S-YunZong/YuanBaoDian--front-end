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

    <%@include file="/jsp/commet/header.jsp" %>
    <script src="${pageContext.request.contextPath}/static/js/Training/Training.js"></script>
</head>
<body>

<!-- Header  头部 -->
<%@include file="/jsp/commet/top.jsp" %>

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
