<%--
  Created by IntelliJ IDEA.
  User: 智慧
  Date: 2020/2/18
  Time: 13:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        .a:hover{
            background-color: limegreen;
            color: #fbfbfb;
            transform:scale(1.1);
        }
        .c{
            background-color: #e3e3e3;
        }
        .a{
            background-color: #F5FAFC;
        }
    </style>
</head>
<body>
<div class="c" style="border: #0C0C0C solid 1px;height: 600px;text-align: center;">
    <div class="a" style="height: 70px;border: #0C0C0C solid 1px;margin: 5px" onclick="zonghe()">
        <h3>综合答题</h3>
    </div>
    <div class="a"  style="height: 70px;border: #0C0C0C solid 1px;margin: 5px" onclick="chuagguan()">
        <h3>闯关答题</h3>
    </div>
    <div class="a"  style="height: 70px;border: #0C0C0C solid 1px;margin: 5px" onclick="zhenti()">
        <h3>真题题库</h3>
        <div style="margin: -30px 180px">
            <i class="iconfont iconsuo2"></i>
        </div>
    </div>
</div>
</body>
</html>
