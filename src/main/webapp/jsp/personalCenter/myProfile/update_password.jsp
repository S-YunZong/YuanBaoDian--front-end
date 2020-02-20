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
                                    <li><span>2</span>
                                        <p>重置密码</p><b></b></li>
                                    <li><span>3</span>
                                        <p>完成</p><b></b></li>
                                </ul>
                            </div><!--/step-->
                            <div class="tableForm">
                                <table>
                                    <tbody>
                                    <tr>
                                        <td>验证方式</td>
                                        <td>
                                            <div class="form-select">
                                                <div class="form-sltitle">
                                                    <span>请选择</span>
                                                    <i class="layui-edge icon"></i>
                                                </div>
                                                <ul class="form-option" id="MS_yanzheng">
                                                    <li value="已验证手机" class="J-m-selectItem"><a href="javascript:;">已验证手机</a>
                                                    </li>
                                                    <li value="已验证邮箱" element="" hidden="hidden" class="J-m-selectItem">
                                                        <a href="javascript:;">已验证邮箱</a></li>
                                                </ul>
                                                <input type="hidden">
                                            </div><!--/form-select-->
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="90">手机号</td>
                                        <td colspan="3" width="600">
                                            <div class="m-pos_parent">
                                                <input type="text" class="ui_inp" placeholder="请输入手机号" id="J-m-user"
                                                       name="phone">
                                                <p class="m-pos_son" id="j-m-ckphone1">请输入正确格式的手机号码</p>
                                            </div>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>图片验证码</td>
                                        <td>
                                            <input type="text" class="ui_inp" placeholder="输入图片中验证码" id="J-m-imgIpt">
                                        </td>
                                        <td width="140">
                                            <img src="https://passport.ziroom.com/img/verify/code/v1?imgId=6e6c8534ecc2bd2a8e2baab624ac9e6b"
                                                 height="40" width="130" id="J-m-img"
                                                 data-imgid="6e6c8534ecc2bd2a8e2baab624ac9e6b">
                                        </td>
                                        <td>看不清？ <a href="javascript:;" class="org" id="J-m-picChange">换一张</a></td>
                                    </tr>

                                    <tr>
                                        <td>手机验证码</td>
                                        <td width="185">
                                            <input type="text" class="ui_inp" placeholder="输入验证码" id="J-m-dxYzm">
                                        </td>
                                        <td colspan="2">
                                            <input type="button" value="获取验证码" class="ui_btn ui_org_btn" id="tel_btn">
                                        </td>
                                    </tr>

                                    <tr>
                                        <td></td>
                                        <td colspan="3">
                                            <input type="button" value="下一步" class="ui_btn disabled ui_org_btn"
                                                   id="J-m-submit">
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
<script type="text/javascript">
    function update_password() {
        $('#profile_div').hide();
        $('#update_phone_div').hide();
        $('#update_password_div').show();
    }

    (function () {

        var aSelect = $('.J-m-selectItem');

        var picYzmInp = $('#J-m-imgIpt');
        var picYzm = $('#J-m-img');
        var picBtn = $('#J-m-picChange');


        //手机号
        var username = $('#J-m-user');
        //验证码
        var userYzm = $('#J-m-dxYzm');
        //获取验证码
        var phoneYzmBtn = $('#tel_btn');

        var oSub = $('#J-m-submit');

        var tishi = $('#j-m-ckphone1');
        var reg = /^1[0-9]{10}$/;
        var userFlag = false;

        //根据下拉框
        aSelect.eq(0).click(function () {
            username.attr('name', 'phone').attr('placeholder', '请输入手机号').val('').parent().parent().prev().html('手机号');
            userYzm.val('').parent().prev().html('手机验证码');
            tishi.html('请输入正确格式的手机号码');
            reg = /^1[0-9]{10}$/;
        });

        aSelect.eq(1).click(function () {
            username.attr('name', 'email').attr('placeholder', '请输入邮箱').val('').parent().parent().prev().html('邮箱');
            userYzm.val('').parent().prev().html('邮箱验证码');
            tishi.html('请输入正确格式的邮箱');
            reg = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        });


        picBtn.click(function () {
            addImgRequest('#J-m-img');
        });
        addImgRequest('#J-m-img');

        phoneYzmBtn[0].onclick = getPhoneYzm;


        //校验手机号或邮箱格式
        username.blur(function () {
            if (reg.test(this.value)) {
                userFlag = true;
                $(this).next().css({
                    display: 'none'
                });
            }
            else {
                userFlag = false;
                $(this).next().css({
                    display: 'block'
                });
            }
        });


        userYzm.keyup(function () {
            if (($(this).val() != '') && userFlag) {
                oSub.removeClass('disabled');
                oSub[0].onclick = next;
            }
            else {
                oSub.addClass('disabled');
                oSub[0].onclick = null;
            }
        });

        function getPhoneYzm() {
            if (!userFlag) {
                return;
            }

            stopClick();
            if (username.attr('name') == 'phone') {
                $.ajax({
                    url: 'https://passport.ziroom.com/verify/code/v2',
                    dataType: 'jsonp',
                    data: {
                        "phone": username.val(),
                        "type": "3",
                        "imgId": picYzm.attr('data-imgId'),
                        "imgVValue": picYzmInp.val()
                    },
                    jsonp: "callback",
                    success: function (data) {
                        // console.log(data);
                        //重置图片验证码
                        if (data.code != '20000') {
                            mLayerMsg(str.message);
                            addImgRequest('#J-m-img');
                        }
                    },
                    error: function (str) {
                        //请求失败
                        // console.log(str);
                    }
                })
            } else {
                $.ajax({
                    url: 'https://passport.ziroom.com/verify/code/v2',
                    dataType: 'jsonp',
                    data: {
                        "email": username.val(),
                        "type": "3",
                        "imgId": picYzm.attr('data-imgId'),
                        "imgVValue": picYzmInp.val()
                    },
                    jsonp: "callback",
                    success: function (data) {
                        // console.log(data);
                        //重置图片验证码
                        if (data.code != '20000') {
                            mLayerMsg(str.message);
                            addImgRequest('#J-m-img');
                        }
                    },
                    error: function (str) {
                        //请求失败
                        // console.log(str);
                    }
                })
            }

        }

        //下一步
        function next() {
            var json = null;
            var accountType = '';
            if (username.attr('name') == 'phone') {
                json = {'phone': username.val(), 'type': '3', 'vcode': userYzm.val()};
                accountType = '1';
            }
            else {
                json = {'email': username.val(), 'type': '3', 'vcode': userYzm.val()};
                accountType = '2';
            }

            $.ajax({
                url: '/api/index.php?r=user/verify-code',
                type: 'POST',
                dataType: 'json',
                data: json,
                success: function (data) {
                    if (data.code == '20000') {
                        //alert(accountType);
                        window.location.href = '/jsps/personalCenter/myProfile/update_password2.jsp?vid=' + data.resp.vid + '&accountType=' + accountType;
                    }
                    else {
                        mLayerMsg('验证失败');
                    }
                    // console.log(data);

                }

            });
        }

        //倒计时60S函数
        function stopClick() {

            var total = 60;

            phoneYzmBtn.addClass('disabled');
            phoneYzmBtn[0].onclick = null;
            phoneYzmBtn.val('60');

            var t = setInterval(function () {
                total--;
                phoneYzmBtn.val(total);

                if (total == 0) {
                    clearInterval(t);
                    phoneYzmBtn.removeClass('disabled');
                    phoneYzmBtn[0].onclick = getPhoneYzm;
                    phoneYzmBtn.val('重新发送');
                }
            }, 1000);
        }

        //获取图片验证码
        function addImgRequest(imgId) {

            var oImg = $(imgId);

            var u = uuid();
            oImg.attr('data-imgId', u);
            oImg.attr('src', 'https://passport.ziroom.com/img/verify/code/v1?imgId=' + u);
        }

        //uuid
        function uuid() {
            var str = '0123456789abcdef';
            var res = '';
            for (var i = 0; i < 32; i++) {
                res += str.charAt(Math.floor(Math.random() * 16));
            }
            return res;
        }
    })();
</script>
</html>
