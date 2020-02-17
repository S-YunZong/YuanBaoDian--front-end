
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.2.1.js"></script>

    <link href="/static/css/index.css" rel="stylesheet">
    <script src="/static/js/index.js"></script>
    <script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/PointsGift/PointsGift.js"></script>
    <link href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet">
    <style>
        #biankuang{
            width: 900px;
            height: 500px;
            border: 1px solid #000000;
            margin: auto;
        }
        #biankuang2{
            width: 800px;
            height: 200px;
            border: 1px solid #000000;
            margin: auto;

        }
        #biankuang3{
             width: 800px;
             height: 200px;
             border: 1px solid #000000;
             margin: auto;
         }
    </style>
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
                <li><a href="/jsp/Training/Training.jsp" class="ani ">培训机构</a></li>
                <li><a href="/jsp/PointsGift/PointsGift.jsp" class="ani active">积分礼物</a></li>
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

        <br> <br> <br> <br> <br>
         <div id="biankuang">
             <br>
             <span style="margin-left: 50px"><strong>分类1</strong></span>
              <span style="margin-left: 700px"><strong>更多>></strong></span>
             <div id="biankuang2" style="">
                 <div style="padding-left: 30px;padding-top: 20px;float: left" >
                     <img src="/static/images/4.jpeg" style="width: 100px;height: 100px;">
                     <p style="font-size: 10px;margin: auto;" id="Computer"> 电脑</p>
                     <p style="font-size: 15px;margin: auto;"> 所需积分10</p>
                     <button type="button" class="btn btn-default" onclick="Exchange()" >兑换</button>
                 </div>
                 <div style="padding-left: 30px;padding-top: 20px;float: left" >
                     <img src="/static/images/4.jpeg" style="width: 100px;height: 100px;">
                     <p style="font-size: 10px;margin: auto;"> 手机</p>
                     <p style="font-size: 15px;margin: auto;"> 所需积分10</p>
                     <button type="button" class="btn btn-default" >兑换</button>
                 </div>
                 <div style="padding-left: 30px;padding-top: 20px;float: left" >
                     <img src="/static/images/4.jpeg" style="width: 100px;height: 100px;">
                     <p style="font-size: 15px;margin: auto;"> 所需积分10</p>
                     <button type="button" class="btn btn-default" >兑换</button>
                 </div>
                 <div style="padding-left: 30px;padding-top: 20px;float: left" >
                     <img src="/static/images/4.jpeg" style="width: 100px;height: 100px;">
                     <p style="font-size: 15px;margin: auto;"> 所需积分10</p>
                     <button type="button" class="btn btn-default" >兑换</button>
                 </div>
                 <div style="padding-left: 30px;padding-top: 20px;float: left" >
                     <img src="/static/images/4.jpeg" style="width: 100px;height: 100px;">
                     <p style="font-size: 15px;margin: auto;"> 所需积分10</p>
                     <button type="button" class="btn btn-default" >兑换</button>
                 </div>
                 <div style="padding-left: 30px;padding-top: 20px;float: left" >
                     <img src="/static/images/4.jpeg" style="width: 100px;height: 100px;">
                     <p style="font-size: 15px;margin: auto;"> 所需积分10</p>
                     <button type="button" class="btn btn-default" >兑换</button>
                 </div>
             </div>
             <br>
             <span style="margin-left: 50px"><strong>分类2</strong></span>
             <span style="margin-left: 700px"><strong>更多>></strong></span>
             <div id="biankuang3">
                 <div style="padding-left: 30px;padding-top: 20px;float: left" >
                     <img src="/static/images/4.jpeg" style="width: 100px;height: 100px;">
                     <p style="font-size: 15px;margin: auto;"> 所需积分10</p>
                     <button type="button" class="btn btn-default" >兑换</button>
                 </div>
                 <div style="padding-left: 30px;padding-top: 20px;float: left" >
                     <img src="/static/images/4.jpeg" style="width: 100px;height: 100px;">
                     <p style="font-size: 15px;margin: auto;"> 所需积分10</p>
                     <button type="button" class="btn btn-default" >兑换</button>
                 </div>
                 <div style="padding-left: 30px;padding-top: 20px;float: left" >
                     <img src="/static/images/4.jpeg" style="width: 100px;height: 100px;">
                     <p style="font-size: 15px;margin: auto;"> 所需积分10</p>
                     <button type="button" class="btn btn-default" >兑换</button>
                 </div>
                 <div style="padding-left: 30px;padding-top: 20px;float: left" >
                     <img src="/static/images/4.jpeg" style="width: 100px;height: 100px;">
                     <p style="font-size: 15px;margin: auto;"> 所需积分10</p>
                     <button type="button" class="btn btn-default" >兑换</button>
                 </div>
                 <div style="padding-left: 30px;padding-top: 20px;float: left" >
                     <img src="/static/images/4.jpeg" style="width: 100px;height: 100px;">
                     <p style="font-size: 15px;margin: auto;"> 所需积分10</p>
                     <button type="button" class="btn btn-default" >兑换</button>
                 </div>
                 <div style="padding-left: 30px;padding-top: 20px;float: left" >
                     <img src="/static/images/4.jpeg" style="width: 100px;height: 100px;">
                     <p style="font-size: 15px;margin: auto;"> 所需积分10</p>
                     <button type="button" class="btn btn-default" >兑换</button>
                 </div>
             </div>
         </div>
</body>

</html>