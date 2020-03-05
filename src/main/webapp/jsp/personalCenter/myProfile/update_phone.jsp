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
    <title>修改手机</title>
</head>
<body>
<%@include file="/jsp/personalCenter/myProfile/common/header.jsp" %>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="row clearfix">
                <div class="col-md-2 column">
                    <div class="slideLeft">
<%--                        <div class="user">--%>
<%--                            <div class="img">--%>
<%--                                <img src="/static/image/default.png" width="100" height="100">--%>
<%--                            </div>--%>
<%--                            <p>荼荼</p>--%>
<%--                        </div>--%>
                        <ul>
                            <li class="myUserInfo"><b></b><a href="/jsp/personalCenter/myProfile/myProfile.jsp">个人信息</a>
                            </li>
<%--                            <li class="myCertificate"><b></b><a href="/jsp/personalCenter/myProfile/IDInformation.jsp">证件信息</a>--%>
<%--                            </li>--%>
<%--                            <li class="myIDInformation"><b></b><a--%>
<%--                                    href="/jsp/personalCenter/myProfile/realNameAuthentication.jsp">实名认证</a></li>--%>
                        </ul>
                    </div><!--/slideLeft-->
                </div>
                <div class="col-md-10 column">
                    <%--修改手机号--%>
                    <div class="mainRight" id="update_phone_div_1">
                        <div class="title">修改手机号</div>
                        <div class="w640">
                            <div class="step clearfix">
                                <ul class="clearfix">
                                    <li class="active"><span>1</span>
                                        <p>验证身份</p><b></b></li>
                                    <li><span>2</span>
                                        <p>验证新手机号</p><b></b></li>
                                    <li><span>3</span>
                                        <p>完成</p><b></b></li>
                                </ul>
                            </div><!--/step-->
                            <div class="tableForm">
                                <table>
                                    <tbody>
                                    <tr>
                                        <td width="90">手机号</td>
                                            <td colspan="3"><span id="update_phone"></span> <span class="gray">若当前号码无效或无法接收验证码，请拨打客服电话：4001-001-111</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>手机验证码</td>
                                        <td width="185">
                                            <input type="text" class="ui_inp" placeholder="输入短信验证码" id="J-m-input">
                                        </td>
                                        <td colspan="2">
                                            <input type="button" value="获取验证码" class="ui_btn ui_org_btn"
                                                   id="tel_btn_phone">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td colspan="3">
                                            <input type="button" value="下一步" class="ui_btn abled" id="J-m-submit_phone">
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>

                        </div><!--/w640-->
                    </div>


                </div>
            </div>
        </div>
    </div>
</div>
</body>
<%--修改手机号--%>
<script>
    //查询手机号码
    function findPhoneById(){
        var uid="${user_session.id}";
        $.ajax({
            type: "POST",
            url: "/user/Personal",
            dataType: "json",
            data: {
                "id": uid
            },
            success: function (data) {
                $("#update_phone").html(data.phone);
            }
        });
    }
    //mqz 2016.5.12 校验手机验证码
    (function () {
        findPhoneById();
        var code_z;
        var oIpt = $('#J-m-input');
        var getBtn = $('#tel_btn_phone');

        var oSub = $('#J-m-submit_phone');

        var reg = /^[0-9]{2}$/;

        getBtn[0].onclick = getPhoneYzm;

        var tel=${user_session.phone};

        function getPhoneYzm() {
            stopClick();
            $.ajax({
                url: '/user/fasong',
                type: 'POST',
                data: {
                   "tel":tel
                },
                dataType: 'json',
                success: function (data) {
                    code_z = data;
                    // if (data.code != '20000') {
                    //     mLayerMsg(data.message);
                    // }
                    // console.log(data);
                }
            });
        }

        //倒计时
        function stopClick() {
            var total = 60;
            getBtn.removeClass('ui_org_btn');
            getBtn.addClass('ui_gray_btn');
            getBtn[0].onclick = null;
            getBtn.val('60');

            var t = setInterval(function () {
                total--;
                getBtn.val(total);

                if (total == 0) {
                    clearInterval(t);
                    getBtn.removeClass('ui_gray_btn');
                    getBtn.addClass('ui_org_btn');
                    getBtn[0].onclick = getPhoneYzm;
                    getBtn.val('重新发送');
                }
            }, 1000);
        }

        //下一步
        oIpt.keyup(function () {
            if (!reg.test(this.value)) {
                oSub.removeClass('ui_org_btn');
                oSub.addClass('ui_gray_btn');
                oSub[0].onclick = null;
            }else if(oIpt.val()!=code_z){
                oSub.removeClass('ui_org_btn');
                oSub.addClass('ui_gray_btn');
                oSub[0].onclick = null;
                alert("验证码不正确");
            }else if(oIpt.val().trim() == ""){
                oSub.removeClass('ui_org_btn');
                oSub.addClass('ui_gray_btn');
                oSub[0].onclick = null;
                alert("验证码不能为空");
            }else {
                oSub.removeClass('ui_gray_btn');
                oSub.addClass('ui_org_btn');
                oSub[0].onclick = next;
            }
        });

        function next() {
            window.location = '/jsp/personalCenter/myProfile/update_phone2.jsp'
            // $.ajax({
            //     url: '/user/update_phone_authCode',
            //     type: 'POST',
            //     dataType: 'json',
            //     data: {"accountType": "1", "vcode": oIpt.val(), "type": "2"},
            //     success: function (data) {
            //         if (data.code == '20000') {
            //             window.location = '/jsp/personalCenter/myProfile/update_phone2.jsp?vid=' + data.resp.vid;
            //         }
            //         else {
            //             mLayerMsg('验证失败');
            //         }
            //         // console.log(data);
            //
            //     }
            //
            // });
        }


    })();
</script>
</html>
