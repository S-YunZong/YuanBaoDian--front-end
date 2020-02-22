<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/11/20
  Time: 20:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link rel="stylesheet" href="${pageContext.request.contextPath }/static/layui/css/layui.css">

<link rel="stylesheet" type="text/css" href="/static/guoda.com_files/css/common_profile.css">
<script type="text/javascript" src="/static/guoda.com_files/js/jquery.min.js"></script>
<script type="text/javascript" src="/static/guoda.com_files/js/z-common.js"></script>
<script type="text/javascript" src="/static/guoda.com_files/js/layer.js"></script>
<link rel="stylesheet" href="/static/guoda.com_files/css/layer.css" id="layui_layer_skinlayercss" style="">
<script src="/static/guoda.com_files/js/crypto-js.js"></script>
<link rel="stylesheet" type="text/css" href="/static/guoda.com_files/css/zoneStyle.css">
<div id="topBar">
    <div class="area clearfix">
        <div class="glbLeft">
            <ul class="top_list" style="display: none">
                <li>hi，欢迎来到国大</li>
                <li id="ziroom_login"><a href="javascript:;" rel="nofollow">登录</a><i class="line"></i></li>
                <li id="ziroom_reg"><a href="javascript:;" rel="nofollow">注册</a></li>
            </ul>
            <ul class="top_list">
                <li class="user">
                    <img src="/static/image/default.png" width="20" class="img">
                    荼荼 <i class="line"></i>
                    <b class="icon"></b>
                    <div class="con">
                        <a href="http://i.ziroom.com/">个人空间</a>
                        <a href="http://passport.ziroom.com/">编辑资料</a>
                        <a href="http://i.ziroom.com/index.php?uri=look/index">我的约看</a>
                    </div>
                </li>
                <li id="logout">退出</li>
            </ul>
        </div>
    </div>
</div>


<div id="header">
    <div class="area clearfix">
        <h1 class="logo"><a href="/jsp/index.jsp"><img src="/static/image/北工商.jpg" width="150" height="43"></a>
        </h1>
        <div class="nav">
            <a id="geren2" title="我的资料" class="active">我的资料</a>
            <a id="kongjian2" title="我的空间">我的空间</a>
            <a href="/jsp/404.jsp" title="我的账户">我的账户</a>
        </div>
        <div class="nav_r">
            <a href="/jsp/index.jsp" title="返回猿宝典首页">返回猿宝典首页</a>
        </div>
        <input type="hidden" id="login_flag" value="">

        <script type="text/javascript">
            $("#i_q_keyword_1").keydown(function (a) {
                13 == a.keyCode && $("#searchListBtn").click()
            }), $("#searchListBtn").click(function () {
                var b = $("#i_q_keyword_1").val(), c = "http://www.ziroom.com/z/nl/",
                    a = c + "?qwd=" + $("#i_q_keyword_1").val();
                window.location.href = "" == b ? "http://www.ziroom.com/z/nl/" : encodeURI(a)
            });
            $("#geren2").click(function () {
                var id = localStorage.getItem("id");
                $("#geren2").attr("href", "/jsp/personalCenter/myProfile/myProfile.jsp?userid=" + id);
            })
            $("#kongjian2").click(function () {
                var id = localStorage.getItem("id");
                $("#kongjian2").attr("href", "/jsp/personalCenter/mySpace/mySpace.jsp?userid=" + id);
            })
        </script>

        <a href="http://www.ziroom.com/ditu/" class="toMap"></a>
    </div>
    <script type="text/javascript">

        $("#i_q_keyword_1").keydown(function (e) {
            if (e.keyCode == 13) {
                $('#searchMapBtn').click();
            }
        });

        $('#searchMapBtn').click(function () {
            var iq = $("#i_q_keyword_1").val();
            //if (iq=="请输入地名，地铁线路，站点名..." || iq=="")return ;
            var zr = "" + "/z/nl/";
            var query = zr + "?qwd=" + $("#i_q_keyword_1").val();
            if (iq == '') {
                window.location.href = "/z/nl/";
            } else {
                window.location.href = encodeURI(query);
            }


        });


    </script>
</div>
<!--/sub-header-->
<style>
    table tr, table td {
        font-size: 14px;
    }
</style>