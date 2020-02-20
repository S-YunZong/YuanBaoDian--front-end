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
                            <div class="w640">

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
                                    <table>
                                        <tbody>
                                        <tr>
                                            <td width="100">新手机号</td>
                                            <td colspan="3">
                                                <div class="m-pos_parent">
                                                    <input type="text" class="ui_inp j-m-jsCheck" placeholder="您的新手机号"
                                                           id="J-m-new">
                                                    <p class="m-pos_son" id="j-m-ckphone1">请输入正确格式的手机号码</p>
                                                </div>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>验证码</td>
                                            <td>
                                                <input type="text" class="ui_inp j-m-jsCheck" placeholder="输入图片中验证码"
                                                       id="J-m-imgIpt">
                                            </td>
                                            <td width="150">
                                                <img src="https://passport.ziroom.com/img/verify/code/v1?imgId=68fc3225f4b0de316f080ded88cf097e"
                                                     height="40" id="J-m-Img"
                                                     data-imgid="68fc3225f4b0de316f080ded88cf097e">
                                            </td>
                                            <td>看不清？ <a href="javascript:;" class="org" id="J-m-change">换一张</a></td>
                                        </tr>
                                        <tr>
                                            <td>手机验证码</td>
                                            <td width="185">
                                                <input type="text" class="ui_inp j-m-jsCheck" placeholder="输入短信验证码"
                                                       id="J-m-yzmIpt">
                                            </td>
                                            <td colspan="2">
                                                <input type="button" value="获取验证码" class="ui_btn ui_org_btn"
                                                       id="tel_btn">
                                            </td>
                                        </tr>

                                        <tr>
                                            <td></td>
                                            <td colspan="3">
                                                <input type="button" value="确定"
                                                       class="ui_btn ui_org_btn disabled j-m-button" id="J-m-Sub">
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
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
    //mqz 2016.5.12校验新手机
    (function () {
        //截取vid
        var str = window.location.href;
        var sTmp = str.split('&')[1];
        var vid = sTmp.split('=')[1];


        var oNewIpt = $('#J-m-new');

        var oGet = $('#tel_btn');
        var oYzm = $('#J-m-yzmIpt');

        var picYzmIpt = $('#J-m-imgIpt');
        var picYzmImg = $('#J-m-Img');
        var getPic = $('#J-m-change');

        var oSub = $('#J-m-Sub');

        var reg = /^[0-9]{6}$/;

        var phoneReg = /^1[0-9]{10}$/;
        var phoneFlag = false;

        //获取图片验证码
        addImgRequest('#J-m-Img');
        getPic.click(function () {
            addImgRequest('#J-m-Img');
        });

        //获取手机验证码
        oGet[0].onclick = getPhoneYzm;


        //校验手机号格式
        oNewIpt.blur(function () {
            if (phoneReg.test(this.value)) {
                phoneFlag = true;
                $(this).next().css({
                    display: 'none'
                });
            }
            else {
                phoneFlag = false;
                $(this).next().css({
                    display: 'block'
                });
            }
        });

        //确定
        oYzm.keyup(function () {
            if ((!reg.test(this.value)) || (!phoneFlag)) {
                oSub.addClass('disabled');

                oSub[0].onclick = null;
            }
            else {
                oSub.removeClass('disabled');

                oSub[0].onclick = next;
            }
        });

        //校验提交表单
        function next() {

            $.ajax({
                url: '/api/index.php?r=user/change-phone',
                type: 'POST',
                dataType: 'json',
                data: {"newPhone": oNewIpt.val(), "newVCode": oYzm.val(), "oldVid": vid},
                success: function (data) {
                    if (data.code == '20000') {
                        window.location = '/jsp/personalCenter/myProfile/update_phone3.jsp';
                    } else {
                        mLayerMsg('验证失败');
                    }
                    // console.log(data);

                }

            });
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

        //通过传入图片id和用户输入图片验证码的值来获取短信验证码
        function getPhoneYzm() {

            if (!phoneFlag) {
                return;
            }

            stopClick();
            $.ajax({
                url: 'https://passport.ziroom.com/verify/code/v2',
                dataType: 'jsonp',
                data: {
                    "phone": oNewIpt.val(),
                    "type": "1",
                    "imgId": picYzmImg.attr('data-imgId'),
                    "imgVValue": picYzmIpt.val()
                },
                jsonp: "callback",
                success: function (data) {
                    // console.log(data);

                    if (data.message != 'success') {
                        //失败重置图片验证码
                        addImgRequest('#J-m-Img');
                    }

                },
                error: function (str) {
                    //请求失败
                    // console.log(str);
                }
            })
        }

        //倒计时60S函数
        function stopClick() {

            var total = 60;

            oGet.removeClass('ui_org_btn');
            oGet.addClass('ui_gray_btn');
            oGet[0].onclick = null;
            oGet.val('60');

            var t = setInterval(function () {
                total--;
                oGet.val(total);

                if (total == 0) {
                    clearInterval(t);
                    oGet.removeClass('ui_gray_btn');
                    oGet.addClass('ui_org_btn');
                    oGet[0].onclick = getPhoneYzm;
                    oGet.val('重新发送');
                }
            }, 1000);
        }
    })();
</script>
</html>
