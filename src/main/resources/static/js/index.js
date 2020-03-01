
//页面动态样式
$(function () {
    $(".Z_video_play").click(function () { //这个视频被点击后执行
        var video = $(this).attr('data-videosrc');//获取视频路径
        $('.videos').html("<video id=\"video\"  style='height: 500px' src='" + video + "' preload=\"auto\" controls=\"controls\" autoplay=\"autoplay\"></video><img onClick=\"close1()\" class=\"vclose\" src=\"./gd_file/gb.png\"  style='width: 30px;background-color: wheat;'/>");
        $('.videos').show();
    });
    $(".Z_rent_expri_item").mousemove(function () {
        $(this).children(".Z_rent_expri_intro").addClass("Z_rent_expri_intro Z_rent_expri_introactive");
    });
    $(".Z_rent_expri_item").mouseout(function () {
        $(this).children(".Z_rent_expri_intro").removeClass();
        $(this).children("div:eq(0)").addClass("Z_rent_expri_intro");
    });
    //点击input框 让外边框变橙色
    $("#ziroomRecordHook input").focus(function () {
        //先清除
        $(this).parent().nextAll(".ziroom-record-error").text("");
        //在植入
        $(this).parent().removeClass("record-inout-error");
        //先清除
        $("#ziroomRecordHook input").parent().removeClass("record-inout-foucs");
        //在植入
        $(this).parent().addClass("ziroom-login-accont  record-inout-foucs")
    });
    //点击弹登录界面
    $("#zLogin").click(function () {
        $("#switchHook2").css("display", "none");
        $("#switchHook").css("display", "");
        $("#loginAccontHook").css("display", "");
        $("#ziroomRecordHook").css("display", "");

    });
    //点击关闭 隐藏登录页面 并把验证码设置成默认展示
    $("#recordCloseHook").click(function () {
        $("#ziroomRecordHook").css("display", "none");
        $("#loginPhoneHook").css("display", "");
        $("#loginAccontHook").css("display", "none");
    });
    //点击账号密码登录 切换成账号密码登录界面
    $("#swichAccontHook").click(function () {
        $("#loginPhoneHook").css("display", "none");
        $("#loginAccontHook").css("display", "");
    });
    //点击手机验证码登录 切换成手机验证码登录界面
    $("#switchPhoneHook").click(function () {
        $("#loginPhoneHook").css("display", "");
        $("#loginAccontHook").css("display", "none");
    });
    //点击注册  切换注册页面
    $("#swichRegisterHook").click(function () {
        $("#switchHook2").css("display", "");
        $("#switchHook input").val("");
        //清除所有错误提示
        $("#switchHook div").removeClass("record-inout-error");
        $("#switchHook div").removeClass("record-inout-foucs");
        $("#switchHook .ziroom-record-error").text("");

        //关闭登录
        $("#switchHook").css("display", "none");
    });
    //点击登录  切换登录页面
    $("#swichLoginHook").click(function () {
        $("#switchHook2").css("display", "none");
        $("#switchHook").css("display", "");
    });
    //点击注册  切换注册
    $("#zRegister").click(function () {
        $("#switchHook2").css("display", "");
        $("#switchHook").css("display", "none");
        $("#ziroomRecordHook").css("display", "");
    });
    //确认已阅读
    $("#registerConfrimHook").click(function () {
        if ($(this).children("i").hasClass("icon-unselected")) {
            $(this).children("i").removeClass();
            $(this).children("i").addClass("iconfont icon-xuanzhong");
            return;
        }
        $(this).children("i").removeClass();
        $(this).children("i").addClass("iconfont icon-unselected");

    })
});

//错误提示
function error(th, te) {
    th.parent().addClass("record-inout-error");
    th.parent().nextAll(".ziroom-record-error").text(te);
}

var time = 60;

//倒计时
function getRandomCode() {
    $('#registerSendHook').addClass("disabled");
    $('#registerSendHook').css("disabled", "disabled ");
    if (time === 0) {
        time = 60;
        $('#registerSendHook').removeClass("disabled");
        $('#registerSendHook').remove("disabled", " ");
        return;
    } else {
        time--;
        $('#registerSendHook').text("重新获取");
    }
    setTimeout(function () {
        getRandomCode();
    }, 1000);
}

var code_z;
//后台操作
$(function () {
    //发送验证码
    $("#registerSendHook").click(function () {
        var tel = $("#registerUserHook");
        if (tel.val() == "" || tel.val() == null) {
            error(tel, "请先输入手机号");
            return false;
        }
        var mobReg = /^1[34578]\d{9}$/;  //手机号
        if (!mobReg.test(tel.val())) {
            error(tel, "请输入正确的格式的账号");
            return false;
        }
        $.ajax({
            type: "POST",//方法类型
            url: "/user/fasong",
            data: {
                "tel": tel.val()
            },
            success: function (result) {
                if (result != null && result != "") {
                    code_z = result;
                    getRandomCode();
                }
            },
            error: function () {
                alert("异常！");
            }
        });
    });

    //校验是否登录
    var cc = localStorage.getItem("accessToken");
    if (cc != null) {
        var s = localStorage.getItem("name");
        $("#ok_login").css("display", "");
        $("#loginEntyWrapper").css("display", "none");
        if (s == null || s == "") {
            $("#ok_login a:eq(0)").text("国大用户");
            return;
        }
        $("#ok_login a:eq(0)").text(s);
    }

    //登录
    $("#loginAccontSubmitHook").click(function () {
        //账号
        var phone = $("#accontUserHook");
        //密码
        var password = $("#accontPsdHook");
        var non_empty = true;
        if (phone.val().trim() == "") {
            error(phone, "请输入账号");
            non_empty = false;
        }
        if (password.val().trim() == "") {
            error(password, "请输入密码");
            non_empty = false;
        }
        //如果等于true 说明不是空
        if (non_empty) {
            var zz = true;
            //在进行校验正则
            var mobReg = /^1[34578]\d{9}$/;  //手机号
            if (!mobReg.test(phone.val())) {
                error(phone, "请输入正确的格式的账号");
                zz = false;
            }
            var mobReg2 = /^[0-9a-zA-Z_]{6,15}$/;
            if (!(mobReg2).test(password.val())) {
                error(password, "请输入6-16位的密码");
                zz = false;
            }
            //如果格式正确
            if (zz) {
                $.ajax({
                    type: "POST",//方法类型
                    url: "/user/login",
                    data: {"phone": phone.val(), "password": password.val()},
                    success: function (result) {
                        if (result!=null){
                            alert("登陆成功")
                            $("#ok_login").css("display", "");
                            $("#loginEntyWrapper").css("display", "none");
                            $("#ziroomRecordHook").css("display", "none");
                            $("#ok_login a:eq(0)").text(result.userName);
                            window.location.reload();
                        }
                        else {
                            $("#asnycErrorWrapperHook").css("display", "");
                            $("#asnycErrorWrapperHook i").text("&nbsp;账号或密码错误！");
                        }
                    },
                    error: function () {
                        alert("登录异常！");
                    }
                });
            }
        }
        return false;

    });
    //退出
    $("#zRegister2").click(function () {
       // cc = localStorage.getItem("accessToken");
       // var id = localStorage.getItem("id");
        $.ajax({
            type: "POST",//方法类型
            url: "/user/LoginOut",
            data: {
               // "accessToken": cc,
               // userid: id
            },
            success: function (result) {
               /* if (result.code == 0) {
                    localStorage.removeItem("accessToken");
                    window.location.reload();
                }
                console.log(result);*/
               if (result){
                   alert("退出成功！");
                   location.href="/jsp/index.jsp";
                   document.execCommand('Refresh')
               }
            },
            error: function () {
                alert("退出异常！");
            }
        });
    });
    //注册
    $("#registerSubmitHook").click(function () {
        //手机号
        var tel = $("#registerUserHook");
        //验证码
        var yzm = $("#registerSendCodeHook");
        //密码
        var password = $("#registerPsdHook");
        var non_empty = true;
        if (tel.val().trim() == "") {
            error(tel, "请输入手机号");
            return false;
        }
        //如果全部不为空
        var mobReg = /^1[34578]\d{9}$/;  //手机号
        if (!mobReg.test(tel.val())) {
            error(tel, "请输入正确的格式的账号");
            return false;
        }
        //校验验证码
        /*if (yzm.val().trim() == "") {
            error(yzm, "请输入短信验证码");
            return false;
        }
        if (yzm.val() != code_z) {
            error(yzm, "验证码有误");
            return false;
        }*/
        //校验密码
        if (password.val().trim() == "") {
            error(password, "请输入密码");
            return false;
        }
        var mobReg2 = /^[0-9a-zA-Z_]{6,15}$/;
        if (!(mobReg2).test(password.val())) {
            error(password, "请输入6-16位的密码");
            return false;
        }
        //校验是否勾选协议
        if (!$("#registerConfrimHook i").hasClass("iconfont icon-xuanzhong")) {
            $("#asnycErrorWrapperHook2").css("display", "");
            $("#zhuce_error").text("请阅读协议并确认");
            return false;
        }
        $.ajax({
            type: "POST",//方法类型
            url: "/user/zhuce",
            data: {"username": $("#registerUserHook").val()},
            success: function (result) {
                alert(result)
                if (result) {
                    register_user();
                    return false;
                }
                $("#asnycErrorWrapperHook2").css("display", "");
                $("#zhuce_error").text("用户名已存在");
            },
            error: function () {
                alert("注册异常！");
            }
        });

    })


});

//注册实际操作方法
function register_user() {
    //手机号
    var tel = $("#registerUserHook").val();
    //密码
    var password = $("#registerPsdHook");
    $.ajax({
        type: "POST",//方法类型
        url: "/user/zhuce",
        data: {
            "userName": "用户_" + tel,
            "tel": tel,
            "password": password.val()
        },
        success: function (result) {
            if (result == 1) {
                alert("注册成功");
                $("#switchHook2").css("display", "none");
                $("#switchHook").css("display", "");
                $("#loginAccontHook").css("display", "");
                $("#ziroomRecordHook").css("display", "");
                return;
            }
            alert("注册失败");
        },
        error: function () {
            alert("异常！");
        }
    });
}