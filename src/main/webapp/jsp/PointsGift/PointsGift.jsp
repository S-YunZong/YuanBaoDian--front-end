
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="/jsp/commet/header.jsp" %>
    <script src="${pageContext.request.contextPath}/static/js/PointsGift/PointsGift.js"></script>
    <style>
        #biankuang{
            width: 1000px;
            height: 600px;
            margin: auto;
            background-color: #F5F5F5
        }
        #biankuang2{
            width: 900px;
            height: 500px;
            margin: auto;
            border-radius: 20px;
        }

    </style>
    <style>
        .a:hover{
            border: #ff3737 solid 1px;
        }
    </style>

</head>
<body>
<!-- Header  头部 -->
<%@include file="/jsp/commet/top.jsp" %>

        <br> <br> <br> <br> <br>
         <div id="biankuang">
             <br>
             <span style="margin-left: 50px"><strong>>>量化积分</strong></span>
             <div id="biankuang2" style="">
                 <input hidden value="${user_session.integral}" id="user_1">
                 <%--<div align="center" style="width: 200px;height: 310px;margin: 15px;background-color: #fbfbfb;float: left" class="a">
                 &nbsp;<br>
                 <img src="/static/images/4.jpeg" style="width: 150px;height: 200px;" >
                 <p style="font-size: 15px;margin: auto;" id="Computer"> 电脑</p>
                 <p style="font-size: 15px;color: #ff3737;margin: auto;">积分:10</p>
                 <button type="button" class="btn btn-default" onclick="Exchange()" >兑换</button>
             </div>
                 <div align="center" style="width: 200px;height: 310px;margin: 15px;background-color: #fbfbfb;float: left" class="a">
                     &nbsp;<br>
                     <img src="/static/images/4.jpeg" style="width: 150px;height: 200px;" >
                     <p style="font-size: 15px;margin: auto;" id=""> 电脑</p>
                     <p style="font-size: 15px;color: #ff3737;margin: auto;">积分:10</p>
                     <button type="button" class="btn btn-default" onclick="Exchange()" >兑换</button>
                 </div>--%>
             </div>
         </div>
</body>

</html>