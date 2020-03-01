<%--
  Created by IntelliJ IDEA.
  User: 智慧
  Date: 2019/11/29
  Time: 13:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="col-md-2 column">
    <!-- 左侧栏 -->
    <div class="slideLeft">
        <ul>
            <li class="myStore"><b></b><a id="shoucang">我的收藏</a></li>
            <li class="myLook"><b></b><a id="yuekan">我的错题</a></li>
            <li class="myContract"><b></b><a id="hetong">积分记录</a></li>
            <li class="myContract"><b></b><a id="duihuan">我的礼物</a></li>
        </ul>
    </div>
</div>
<script>
    $("#shoucang").click(function () {
        var id = localStorage.getItem("id");
        $("#shoucang").attr("href", "/jsp/personalCenter/mySpace/myFavorite.jsp?userid=" + id);
    })
    $("#yuekan").click(function () {
        var id = localStorage.getItem("id");
        $("#yuekan").attr("href", "/jsp/personalCenter/mySpace/myCovenant.jsp?userid=" + id);
    })
    $("#hetong").click(function () {
        var id = localStorage.getItem("id");
        $("#hetong").attr("href", "/jsp/personalCenter/mySpace/myContract.jsp?userid=" + id);
    })
    $("#duihuan").click(function () {
        var id = localStorage.getItem("id");
        $("#duihuan").attr("href", "/jsp/personalCenter/mySpace/myExchange.jsp?userid=" + id);
    })
</script>
</body>
</html>
