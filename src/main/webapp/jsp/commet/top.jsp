<%--
  Created by IntelliJ IDEA.
  User: 智慧
  Date: 2019/11/26
  Time: 17:16
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<link href="/static/css/index.css" rel="stylesheet">
<script src="/static/js/index.js"></script>
<body>
<!--登录/注册-->
<div class="ziroom-record" id="ziroomRecordHook" style="display:none;">
    <div class="ziroom-record-mask"></div>
    <div class="ziroom-record-wrapper">
        <div class="ziroom-record-container">
            <div class="ziroom-record-close" id="recordCloseHook">
                <i class="iconfont icon-close1line"></i>
            </div>
            <div id="switchHook">
                <div class="ziroom-login-wrapper" id="loginWrapperHook">
                    <div class="ziroom-record-header">
                        <div class="ziroom-record-title">登录</div>
                        <div class="ziroom-record-text">
                            <span>没有账号？可以去</span><a href="javascript:" id="swichRegisterHook">注册</a></div>
                    </div>
                    <div id="asnycErrorWrapperHook" class="asnyc-error-wrapper" style="display: none">
                        <div class="ziroom-asnyc-error">
                            <div>
                                <i class="iconfont icon-jinggao4">&nbsp;</i>
                            </div>
                            <div class="asnyc-error-text"></div>
                        </div>
                    </div>
                    <!--登录-->
                    <div class="ziroom-record-form">
                        <div class="ziroom-login-accont" style="display:none" id="loginAccontHook">
                            <div>
                                <div class="ziroom-record-input"><input type="text" placeholder="请输入手机号"
                                                                        maxlength="11" id="accontUserHook"></div>
                                <div class="ziroom-record-error"></div>
                            </div>
                            <div>
                                <div class="ziroom-record-input mb0"><input type="password" placeholder="请输入6-16位密码"
                                                                            id="accontPsdHook" verify="accontPsd"
                                                                            maxlength="16"></div>
                                <div class="ziroom-record-error"></div>
                            </div>
                            <div class="ziroom-login-accont-confrim">
                                <div class="accont-confrim-free" id="accontConfrimHook">
                                    <path d="M512 512m-73.85982137 0a73.85982137 73.85982137 0 1 0 147.71964274 0 73.85982137 73.85982137 0 1 0-147.71964275 0Z"
                                          fill="#FFA400" p-id="689"></path>
                                    <path d="M500.16132573 527.40504843l44.89621996-46.65830431a10.55140305 10.55140305 0 1 1 15.20457193 14.63479606L508.12763502 549.56299482a10.55140305 10.55140305 0 0 1-14.8458241 0.36929906L462.55612523 520.96869267a10.55140305 10.55140305 0 1 1 14.47652496-15.35229157L500.16132573 527.40504843z"
                                          fill="#F9F9F9" p-id="690"></path>
                                    <span></span></div>
                                <a href="" target="_blank">忘记密码</a></div>
                            <div class="ziroom-record-btn" id="loginAccontSubmitHook">登录</div>
                        </div>
                        <div class="ziroom-login-confrim"><span>登录即代表同意</span><a
                                href="/jsp/gd_fw.jsp" target="_blank">《猿宝典用户协议》</a><span>及</span><a
                                href="/jsp/gd_ys.jsp" target="_blank">《猿宝典隐私政策》</a>
                        </div>
                    </div>
                </div>
            </div>
            <div id="switchHook2" style="display: none">
                <div class="ziroom-register-wrapper" id="registerWrapperHook">
                    <div class="ziroom-record-header">
                        <div class="ziroom-record-title">注册</div>
                        <div class="ziroom-record-text">
                            <span>已有账号？</span><a href="javascript:;" id="swichLoginHook">登录</a></div>
                    </div>
                    <div id="asnycErrorWrapperHook2" class="asnyc-error-wrapper" style="display:none">
                        <div class="ziroom-asnyc-error">
                            <div><i class="iconfont icon-jinggao4"></i></div>
                            <div id="zhuce_error" class="asnyc-error-text"></div>
                        </div>
                    </div>
                    <div class="ziroom-record-form">
                        <div>
                            <div class="ziroom-record-input">
                                <input type="text" placeholder="建议使用常用手机号" verify="phone" id="registerUserHook"
                                       maxlength="11"></div>
                            <div class="ziroom-record-error"></div>
                        </div>
                        <div id="captcha2"></div>
                        <div class="ziroom-record-code">
                            <div class="ziroom-record-input">
                                <input type="text" placeholder="请输入验证码" id="registerSendCodeHook"/>
                            </div>
                            <button id="registerSendHook" class="record-send">获取验证码</button>
                            <div class="ziroom-record-error"></div>
                        </div>
                        <div>
                            <div class="ziroom-record-input mb0 ziroom-eye-input"><input type="password"
                                                                                         placeholder="请输入6-16位密码"
                                                                                         verify="phonePsd"
                                                                                         id="registerPsdHook"
                                                                                         maxlength="16">
                                <div id="eyeWrapperHook"><i class="iconfont iconicon_see"></i></div>
                            </div>
                            <div class="ziroom-record-error"></div>
                        </div>
                        <div class="ziroom-register-confrim">
                            <div class="accont-confrim-free" id="registerConfrimHook"><i
                                    class="iconfont icon-unselected"></i><span>我已阅读并同意</span><a
                                    href="/jsp/gd_fw.jsp" target="_blank">《猿宝典户协议》</a><span>及</span><a
                                    href="/jsp/gd_ys.jsp" target="_blank">《猿宝典隐私政策》</a>
                            </div>
                        </div>
                        <div class="ziroom-record-btn" id="registerSubmitHook">注册</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<header class="Z_layout_head Z_layout_head_active" id="Z_layout_head">
    <div class="Z_layout_main">
        <div class="Z_container Z_header_main">
            <!-- 国大Logo -->
            <h1 class="Z_logo_box">
                <a href="#">
                    <!-- 首页logo 区别于其他页面logo -->
                    <img class="Z_logo" style="margin-top: -8px;height: 50px;width: 300px" id="Z_logo"
                         src="/static/image/北工商.jpg" alt="">
                </a>
            </h1>

            <!-- 顶部导航 -->
            <ul class="Z_nav_box" onclick="daohang()">
                <li><a href="/jsp/index.jsp" class="ani active">首页</a></li>
                <li><a href="/jsp/exam/practiceTest.jsp" class="ani ">模拟考试</a></li>
                <li><a href="/jsp/Training/Training.jsp" class="ani ">培训机构</a></li>
                <li><a href="/jsp/PointsGift/PointsGift.jsp" class="ani ">积分礼物</a></li>
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
<script>
    $(function () {
        var userName="${user_session.userName}";
        if(userName!=null && userName!=""){
            $("#ok_login").css("display", "");
            $("#loginEntyWrapper").css("display", "none");
            $("#ziroomRecordHook").css("display", "none");
            $("#ok_login a:eq(0)").text(userName);
        }
    })
    //个人中心
    $("#urlgeren").click(function () {
        $("#urlgeren").attr("href", "/jsp/personalCenter/mySpace/mySpace.jsp");
    })
</script>
</body>
</html>
