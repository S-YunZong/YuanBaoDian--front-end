
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="/jsp/commet/header.jsp" %>
    <script src="${pageContext.request.contextPath}/static/js/PointsGift/PointsGift.js"></script>
    <style>
        #biankuang{
            width: 900px;
            height: 500px;
            border: 3px solid #1aa094;
            margin: auto;
            border-radius: 30px;
        }
        #biankuang2{
            width: 800px;
            height: 200px;
            border: 2px solid #1E9FFF;
            margin: auto;
            border-radius: 20px;
        }
        #biankuang3{
             width: 800px;
             height: 200px;
             border: 2px solid #8a6d3b;
             margin: auto;
            border-radius: 10px;
         }
    </style>
</head>
<body>
<!-- Header  头部 -->
<%@include file="/jsp/commet/top.jsp" %>

        <br> <br> <br> <br> <br>
         <div id="biankuang">
             <br>
             <span style="margin-left: 50px"><strong>分类1</strong></span>
              <span style="margin-left: 700px"><strong>更多>></strong></span>
             <div id="biankuang2" style="">
                 <div style="padding-left: 30px;padding-top: 20px;float: left"  class="a">

                     <style>
                         .a:hover{
                             color: #0000FF;
                             transform: scale(1.1);
                         }
                     </style>

                     <img src="/static/images/4.jpeg" style="width: 100px;height: 100px;" >
                     <p style="font-size: 10px;margin: auto;" id="Computer"> 电脑</p>
                     <p style="font-size: 15px;margin: auto;"> 所需积分10</p>
                     <button type="button" class="btn btn-default" onclick="Exchange()" >兑换</button>

                 </div>
                 <div style="padding-left: 30px;padding-top: 20px;float: left"  class="a">
                     <img src="/static/images/4.jpeg" style="width: 100px;height: 100px;" >
                     <p style="font-size: 10px;margin: auto;"> 手机</p>
                     <p style="font-size: 15px;margin: auto;"> 所需积分10</p>
                     <button type="button" class="btn btn-default" >兑换</button>
                 </div>
                 <div style="padding-left: 30px;padding-top: 20px;float: left"  class="a">
                     <img src="/static/images/4.jpeg" style="width: 100px;height: 100px;">
                     <p style="font-size: 15px;margin: auto;"> 所需积分10</p>
                     <button type="button" class="btn btn-default" >兑换</button>
                 </div>
                 <div style="padding-left: 30px;padding-top: 20px;float: left" class="a">
                     <img src="/static/images/4.jpeg" style="width: 100px;height: 100px;">
                     <p style="font-size: 15px;margin: auto;"> 所需积分10</p>
                     <button type="button" class="btn btn-default" >兑换</button>
                 </div>
                 <div style="padding-left: 30px;padding-top: 20px;float: left" class="a">
                     <img src="/static/images/4.jpeg" style="width: 100px;height: 100px;">
                     <p style="font-size: 15px;margin: auto;"> 所需积分10</p>
                     <button type="button" class="btn btn-default" >兑换</button>
                 </div>
                 <div style="padding-left: 30px;padding-top: 20px;float: left" class="a">
                     <img src="/static/images/4.jpeg" style="width: 100px;height: 100px;">
                     <p style="font-size: 15px;margin: auto;"> 所需积分10</p>
                     <button type="button" class="btn btn-default" >兑换</button>
                 </div>
             </div>
             <br>
             <span style="margin-left: 50px"><strong>分类2</strong></span>
             <span style="margin-left: 700px"><strong>更多>></strong></span>
             <div id="biankuang3">
                 <div style="padding-left: 30px;padding-top: 20px;float: left" class="a">
                     <img src="/static/images/4.jpeg" style="width: 100px;height: 100px;">
                     <p style="font-size: 15px;margin: auto;"> 所需积分10</p>
                     <button type="button" class="btn btn-default" >兑换</button>
                 </div>
                 <div style="padding-left: 30px;padding-top: 20px;float: left" class="a">
                     <img src="/static/images/4.jpeg" style="width: 100px;height: 100px;">
                     <p style="font-size: 15px;margin: auto;"> 所需积分10</p>
                     <button type="button" class="btn btn-default" >兑换</button>
                 </div>
                 <div style="padding-left: 30px;padding-top: 20px;float: left" class="a">
                     <img src="/static/images/4.jpeg" style="width: 100px;height: 100px;">
                     <p style="font-size: 15px;margin: auto;"> 所需积分10</p>
                     <button type="button" class="btn btn-default" >兑换</button>
                 </div>
                 <div style="padding-left: 30px;padding-top: 20px;float: left" class="a">
                     <img src="/static/images/4.jpeg" style="width: 100px;height: 100px;">
                     <p style="font-size: 15px;margin: auto;"> 所需积分10</p>
                     <button type="button" class="btn btn-default" >兑换</button>
                 </div>
                 <div style="padding-left: 30px;padding-top: 20px;float: left" class="a">
                     <img src="/static/images/4.jpeg" style="width: 100px;height: 100px;">
                     <p style="font-size: 15px;margin: auto;"> 所需积分10</p>
                     <button type="button" class="btn btn-default" >兑换</button>
                 </div>
                 <div style="padding-left: 30px;padding-top: 20px;float: left" class="a">
                     <img src="/static/images/4.jpeg" style="width: 100px;height: 100px;">
                     <p style="font-size: 15px;margin: auto;"> 所需积分10</p>
                     <button type="button" class="btn btn-default" >兑换</button>
                 </div>
             </div>
         </div>
</body>

</html>