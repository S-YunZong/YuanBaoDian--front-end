$(function () {

    if ($('#business').size() > 0) {
        $('#business').tabBuss();
    }
    if ($(".menu_list").size() > 0) {
        $(".menu_list").hoverShow({hoverObj: ".menu_list", hoverObjClass: "menuhover"});
    }
    if ($('.inp-bor').size() > 0) {
        $('.inp-bor').placeholder();
    }


    //左侧导航
    var oMenuCon = $('#menu-nav-container');
    if (!oMenuCon.is(':visible')) {//判断这个页菜单首次进来的时候是不是可见的
        $('#category-nav-container').hover(function () {
            oMenuCon.show();
        }, function () {
            oMenuCon.hide();
        });
    }

    var mIndex = 0;
    var mMenu = $('#category-nav-container');
    var mContent = $('#category-menu-content');
    var mContentDiv = mContent.find('.sub-pannel');
    var mNav = $('#menu-nav-container');
    var mNavLi = mNav.find('li');
    var mTimer = null;


    mNavLi.mouseover(function () {
        clearTimeout(mTimer);
        mIndex = $(this).index();
        mContentDiv.hide();
        mContentDiv.eq(mIndex).show();


    });


    mContent.mouseover(function () {
        clearTimeout(mTimer);
    })

    mMenu.mouseout(function () {
        mTimer = setTimeout(function () {
            mContentDiv.hide();
        }, 200);

    });


    var bIndex = 0;
    var bMenu = $('#slideBar');
    var bContent = bMenu.find('.bar');
    var bContentDiv = bContent.find('li');
    var bNav = bMenu.find('.nav');
    var bNavLi = bNav.find('li');
    var bTimer = null;
    var oLoginFlag = $('#login_flag').val();
    var oLoginSlide = $('#loginSlide');

    bContent.show();
    bContentDiv.hide();
    bNavLi.mouseover(function () {
        clearTimeout(bTimer);
        bIndex = $(this).index();
        var top = $(this).offset().top - $(this).parent().offset().top;

        oLoginSlide.hide();
        var oCommonLogin = oLoginSlide.find('.commonLogin');
        if (bIndex == 0 && oLoginFlag == '') {
            oLoginSlide.siblings().hide();
            oLoginSlide.css({'top': top + 'px', 'right': '20px'}).show().stop().animate({
                'right': '0px',
                'opacity': '1'
            }, 200);
            if (oCommonLogin.size() == 0) {
                oLoginSlide.prepend($('#commonLogin'));
                $('#commonLogin').css({"padding": "0"});
            }

        } else {
            if (bIndex != 6) {
                bContentDiv.eq(bIndex).siblings().stop().animate({'right': '20px', 'opacity': '0'}, 100, function () {
                    bContentDiv.eq(bIndex).siblings().hide();
                });

                if (bIndex == 5) {
                    top = 0;
                }
                bContentDiv.eq(bIndex).css({'top': top + 'px'}).show().stop().animate({
                    'right': '0px',
                    'opacity': '1'
                }, 200);
            }
        }

    }).click(function () {
        var top = $(this).offset().top - $(this).parent().offset().top;
        var index = $(this).index();

        if (index >= 4) {
            return;
        }
        var oCommonLogin = oLoginSlide.find('.commonLogin');


        if (oLoginFlag == '') {
            oLoginSlide.siblings().hide();
            oLoginSlide.css({'top': top + 'px'}).show().stop().animate({'right': '0px', 'opacity': '1'}, 200);
            if (oCommonLogin.size() == 0) {
                oLoginSlide.prepend($('#commonLogin'));
                $('#commonLogin').css({"padding": "0"});
            }
        }
    });


    bContent.mouseover(function () {
        clearTimeout(bTimer);
    })

    bMenu.mouseout(function () {


        bTimer = setTimeout(function () {
            bContentDiv.hide();
        }, 10);

    })


    //登录帮助
    $('#loginHelp').click(function () {
        new Boxy('#loginHelpBox', {"title": "登录帮助"});
    })


    $(".tabsview").tab({tabNavObj: ".tabs", tabContentObj: ".tabscontnet", tabContent: ".info", eventType: "click"});


    $('#send_mail').click(function () {
        var mail_val = $.trim($("#mail_val").val());
        var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
        if (!myreg.test(mail_val)) {
            $("#mail_tishi").text('邮箱格式不正确');
            return false;
        }
        $("#send_mail").hide();
        $.post('/?_p=sign&_a=get_password', {email: mail_val}, function (z) {
            if (z == 'email_format_error') {
                $("#mail_tishi").text('邮箱格式不正确');
                return false;
            }
            if (z == 'no') {
                $("#mail_tishi").text('邮箱不存在，请输入您注册自如的邮箱');
                return false;
            }
            if (z == 'ok') {
                $("#mail_tishi").text('邮件已发送，10分钟内有效，请注意查收');
                self.setInterval(function () {
                    window.location = 'http://www.ziroom.com/g/login.html';
                }, 2000);
            }

        });

    });


})