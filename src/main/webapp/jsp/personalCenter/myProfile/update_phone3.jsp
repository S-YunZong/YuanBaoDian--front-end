<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/11/22
  Time: 9:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css">

<head>
    <title>修改手机号2</title>
</head>
<body>
<%@include file="/jsp/personalCenter/myProfile/common/header.jsp" %>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="row clearfix">
                <div class="col-md-2 column">
                    <div class="slideLeft">
                        <div class="user">
                            <div class="img">
                                <img src="/static/image/default.png" width="100" height="100">
                            </div>
                            <p>荼荼</p>
                        </div>
                        <ul>
                            <li class="myUserInfo"><b></b><a href="/jsp/personalCenter/myProfile/myProfile.jsp">个人信息</a>
                            </li>
                            <li class="myCertificate"><b></b><a href="/jsp/personalCenter/myProfile/IDInformation.jsp">证件信息</a>
                            </li>
                            <li class="myIDInformation"><b></b><a
                                    href="/jsp/personalCenter/myProfile/realNameAuthentication.jsp">实名认证</a></li>
                        </ul>
                    </div><!--/slideLeft-->
                </div>
                <div class="col-md-10 column">
                    <%--修改密码--%>
                    <div class="mainRight" id="update_password_div">
                        <div class="mainRight">
                            <div class="title">修改密码</div>
                            <div class="w740">
                                <div class="step clearfix">
                                    <ul class="clearfix">
                                        <li class="active"><span>1</span>
                                            <p>验证身份</p><b></b></li>
                                        <li class="active"><span>2</span>
                                            <p>验证新手机号</p><b></b></li>
                                        <li><span>3</span>
                                            <p>完成</p><b></b></li>
                                    </ul>
                                </div><!--/step-->

                                <div class="tableForm">
                                    <h5 style="text-align: center;font-size: 20px;font-style: italic;color: grey;line-height:60px">
                                        距离行星撞击地球还剩......<br>
                                        系统将持续为您......<br>
                                        倒计时:<span id="endtime">10</span>
                                    </h5>
                                </div>
                            </div><!--/w640-->
                        </div><!--/mainRight-->
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<%--修改密码--%>
<script>
    var CID = "endtime";
    if (window.CID != null) {
        var iTime = document.getElementById(CID).innerText;
        var Account;
        RemainTime();
    }

    function RemainTime() {
        var iDay, iHour, iMinute, iSecond;
        var sDay = "", sHour = "", sMinute = "", sSecond = "", sTime = "";
        if (iTime >= 0) {
            iDay = parseInt(iTime / 24 / 3600);
            if (iDay > 0) {
                sDay = iDay + "天";
            }
            iHour = parseInt((iTime / 3600) % 24);
            if (iHour > 0) {
                sHour = iHour + "小时";
            }
            iMinute = parseInt((iTime / 60) % 60);
            if (iMinute > 0) {
                sMinute = iMinute + "分钟";
            }
            iSecond = parseInt(iTime % 60);
            if (iSecond >= 0) {
                sSecond = iSecond + "秒";
            }
            if ((sDay == "") && (sHour == "")) {
                sTime = "<span style='color:darkorange'>" + sMinute + sSecond + "</font>";
            }
            else {
                sTime = sDay + sHour + sMinute + sSecond;
            }
            if (iTime == 0) {
                clearTimeout(Account);
                window.location.href = "/jsp/index.jsp";
            }
            else {
                Account = setTimeout("RemainTime()", 1000);
            }
            iTime = iTime - 1;
        }
        else {
            sTime = "<span style='color:red'>倒计时结束！</span>";
        }
        document.getElementById(CID).innerHTML = sTime;
    }
</script>
</html>
