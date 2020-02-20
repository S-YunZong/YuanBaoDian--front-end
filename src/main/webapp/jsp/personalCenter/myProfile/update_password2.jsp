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
    <title>Title</title>
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
                    <div class="mainRight">
                        <div class="title">修改密码</div>
                        <div class="w740">
                            <div class="step step4 clearfix">
                                <ul class="clearfix">
                                    <li class="active"><span>1</span>
                                        <p>验证身份</p><b></b></li>
                                    <li class="active"><span>2</span>
                                        <p>重置密码</p><b></b></li>
                                    <li><span>3</span>
                                        <p>完成</p><b></b></li>
                                </ul>
                            </div><!--/step-->

                            <div class="tableForm">
                                <table>
                                    <tbody>
                                    <tr>
                                        <td width="90"><font style="vertical-align: inherit;"><font
                                                style="vertical-align: inherit;">设置密码</font></font></td>
                                        <td width="500">
                                            <input type="password" class="ui_inp ui_inp_big" placeholder="设置您的登录密码"
                                                   id="J-m-pass">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><font style="vertical-align: inherit;"><font
                                                style="vertical-align: inherit;">验证密码</font></font></td>
                                        <td width="185">
                                            <input type="password" class="ui_inp ui_inp_big" placeholder="再次输入您的登录密码"
                                                   id="J-m-pass2">
                                        </td>

                                    </tr>

                                    <tr>
                                        <td></td>
                                        <td>
                                            <font style="vertical-align: inherit;"><font
                                                    style="vertical-align: inherit;"><input type="button" value="确定"
                                                                                            class="ui_btn disabled ui_org_btn"
                                                                                            id="J-m-submit"></font></font>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div><!--/w640-->
                    </div><!--/mainRight-->
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<%--修改密码--%>
<script>
    (function () {
        var t =
        ${param.tel}
        var pass1 = $('#J-m-pass');
        var pass2 = $('#J-m-pass2');
        var oSub = $('#J-m-submit');
        pass2.keyup(function () {

            if (this.value.length >= 6 && this.value.length <= 16 && this.value == pass1.val()) {
                oSub.removeClass('disabled');
                oSub[0].onclick = function () {
                    $.ajax({
                        url: '/updPwd',
                        type: 'POST',
                        data: {
                            pwd: pass2.val(),
                            tel: t
                        },
                        dataType: 'json',
                        success: function (data) {
                            if (data) {
                                // console.log(data);
                                alert("修改成功")
                                window.location.href = '/jsps/personalCenter/myProfile/update_password3.jsp';
                            } else {
                                mLayerMsg(data.message);
                            }
                        }
                    });
                }
            }
            else {
                oSub.addClass('disabled');
                oSub[0].onclick = null;
            }
        });
    })();
</script>
</html>
