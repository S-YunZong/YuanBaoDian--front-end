<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/11/20
  Time: 9:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link rel="stylesheet" href="${pageContext.request.contextPath }/static/bootstrap-3.3.7-dist/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/layui/css/layui.css">
<script type="text/javascript" src="/static/js/jquery-3.2.1.js"></script>
<link href="/static/guoda.com_files/css/common_favorite.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="/static/guoda.com_files/css/my_zone.css">
<script type="text/javascript" src="/static/guoda.com_files/js/z-ui.js"></script>
<script type="text/javascript" src="/static/guoda.com_files/js/WdatePicker.js"></script>
<link href="/static/guoda.com_files/css/WdatePicker.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/static/guoda.com_files/js/Validform_v5.3.2_min.js"></script>
<link href="/static/guoda.com_files/css/common_space.css" rel="stylesheet" type="text/css">
<div id="topBar">
    <div class="area clearfix">
        <div class="glbLeft">
            <ul class="top_list">
                <li class="user">
                    <img src="/static/image/default.png" width="20" class="img">
                    茶茶
                    <i class="line"></i>
                    <b class="icon"></b>
                    <div class="con">
                        <a href="/jsp/personalCenter/mySpace/mySpace.jsp">个人空间</a>
                        <a href="/jsp/personalCenter/myProfile/myProfile.jsp">编辑资料</a>
                        <a href="/jsp/personalCenter/mySpace/myCovenant.jsp">我的约看</a>
                    </div>
                </li>
                <li>
                    <a href="http://passport.ziroom.com/logout.html" rel="nofollow">退出</a>
                </li>
            </ul>
        </div>
    </div>
</div>

<div id="header">
    <div class="area clearfix">
        <h1 class="logo">
            <a href="/jsp/index.jsp">
                <img src="/static/image/北工商.jpg" width="150" height="43">
            </a>
        </h1>
        <div class="nav">
            <a id="geren2" title="我的资料">我的资料</a>
            <a id="kongjian2" title="我的空间">我的空间</a>
            <a href="/jsp/404.jsp" title="我的账户">我的账户</a>
        </div>
        <div class="nav_r">
            <a href="/jsp/index.jsp" title="返回猿宝典首页">返回猿宝典首页</a>
        </div>
        <input type="hidden" id="login_flag" value="">
    </div>
</div>
<!--/sub-header-->
<script>
    $("#geren2").click(function () {
        var id = localStorage.getItem("id");
        $("#geren2").attr("href", "/jsp/personalCenter/myProfile/myProfile.jsp?userid=" + id);
    })
    $("#kongjian2").click(function () {
        var id = localStorage.getItem("id");
        $("#kongjian2").attr("href", "/jsp/personalCenter/mySpace/mySpace.jsp?userid=" + id);
    })
</script>