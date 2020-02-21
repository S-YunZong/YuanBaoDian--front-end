<%--
  Created by IntelliJ IDEA.
  User: 智慧
  Date: 2019/11/28
  Time: 16:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="col-md-2 column">
    <div class="slideLeft">
        <div class="user">
            <div class="img">
                <img src="" width="100" height="100" id="J-m-imgFileImg2">
                <script>
                    $(function () {
                            var id ="${user_session.id}";
                            $.ajax({
                                url: "/user/Personal",
                                dataType: "json",
                                type: "post",
                                data: {
                                    id: id
                                },
                                success: function (data) {
                                    if (data) {
                                        $("#J-m-imgFileImg2").attr("src",data.pictureUrl);
                                    }
                                }
                            })
                    })
                </script>
            </div>
            <p>${user_session.userName}</p>
        </div>
        <ul>
            <li class="myUserInfo"><b></b><a id="geren">个人信息</a></li>
            <li class="myCertificate"><b></b><a id="zhengjian">证件信息</a></li>
            <li class="myIDInformation"><b></b><a id="renzheng">实名认证</a></li>
        </ul>
    </div><!--/slideLeft-->
</div>
<script>
    //个人中心
    $("#geren").click(function () {
        var id = localStorage.getItem("id");
        $("#geren").attr("href", "/jsp/personalCenter/myProfile/myProfile.jsp?userid=" + id);
    })
    $("#zhengjian").click(function () {
        var id = localStorage.getItem("id");
        $("#zhengjian").attr("href", "/jsp/personalCenter/myProfile/IDInformation.jsp?userid=" + id);
    })
    $("#renzheng").click(function () {
        var id = localStorage.getItem("id");
        $("#renzheng").attr("href", "/jsp/personalCenter/myProfile/realNameAuthentication.jsp?userid=" + id);
    })

</script>
</body>
</html>
