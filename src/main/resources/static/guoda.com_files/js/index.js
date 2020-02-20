$(function () {
    //maincon 

    $('.grade_intro').click(function () {
        $('.grade_box').show();
        return false;
    });

    $('.grade_box').click(function () {
        return false;
    });

    $('body').click(function () {
        $('.grade_box').hide();
    });

    var nameW = 0;
    var nameLiW = $('.contract .name li').outerWidth();
    $('.contract .name li').each(function () {
        nameW += $(this).outerWidth();
    });
    $('.contract .name ul').css('width', nameW + 'px');

    $('.contract .name li p').click(function () {
        var n = $(this).parent().index();
        $('.contract .name li').removeClass('active');
        $('.contract .name li').eq(n).addClass('active');
        $('.contract .detail').removeClass('active');
        $('.contract .detail').eq(n).addClass('active');
    });

    $('.contract .name .left_btn').click(function () {
        var old = parseInt($('.contract .name ul').css('left'));
        var left = old + nameLiW;
        if (left >= 0) {
            left = 0;
        }
        $('.contract .name ul').css('left', left + 'px');
    });

    $('.contract .name .right_btn').click(function () {
        var old = parseInt($('.contract .name ul').css('left'));
        var left = old - nameLiW;
        var min = 856 - nameW;
        if (min > 0) {
            left = 0;
        } else if (left <= min) {
            left = min;
        }
        $('.contract .name ul').css('left', left + 'px');
    });

    //日历
    var myDate = new Date();
    $('.calendar .month').html((myDate.getMonth() + 1) + '月');
    $('.calendar .date').html(myDate.getDate());


    //footer
    var oLinksList = $('#linksFooterList');
    var iLinksHeight = oLinksList.outerHeight();
    var iNum = iLinksHeight / 47;
    var iN = 0;

    setInterval(function () {
        iN++;
        iN = iN % iNum;
        var top = iN * 47;
        if (top >= iLinksHeight / 2 + 47) {
            oLinksList.css({'margin-top': '0px'});
            iN = 0;
        } else {
            oLinksList.animate({'margin-top': -iN * 47 + 'px'}, 1000);
        }
    }, 3000);


    //接口
    //2 服务管家信息接口
    guanjia($('.detail.active .house_code').val(), $('.detail.active .guanjia'));

    $('.contract .name li p').click(function () {
        var n = $(this).parent().index();
        guanjia($('.contract .detail').eq(n).find('.house_code').val(), $('.contract .detail').eq(n).find('.guanjia'));
    });

    function guanjia(houseCode, obj) {
        //自如寓合同没有房间编号，不需要调接口
        if (houseCode) {
            $.ajax({
                url: ZRCONFIG.Guanjia,
                type: 'GET',
                data: {"house_code": houseCode},
                success: function (data) {
                    var json = data;
                    var dataJson = json.data;
                    if (dataJson == '') {
                        //没有数据
                        obj.html('');
                    }
                    else {
                        //有数据，显示接口数据
                        var userJson = dataJson.user;
                        if (dataJson.pic) {
                            var _html = '<div class="gj_photo"><img src="' + dataJson.pic + '" onerror="$(\'.noImg\').show();" /><span class="noImg"></span></div>' +
                                '<p>' + userJson.cn + '<span>［' + userJson.extensionattribute2 + '］</span></p>' +
                                '<p>' + userJson.phone + '</p>';
                        }
                        else {
                            var _html = '<div class="gj_photo"><img src="" onerror="$(\'.noImg\').show();" /><span class="noImg"></span></div>' +
                                '<p>' + userJson.cn + '<span>［' + userJson.extensionattribute2 + '］</span></p>' +
                                '<p>' + userJson.phone + '</p>';
                        }


                        obj.html(_html);
                    }
                }
            });
        }
    }

    //3 账户余额接口
    $.ajax({
        url: ZRCONFIG.Account,
        type: 'GET',
        success: function (data) {
            var json = data;
            var dataJson = json.data;
            if (dataJson == '') {
                $('.wallet').html('<p class="p1">钱包余额</p>' +
                    '<p class="p2">' +
                    '<span>¥</span>' +
                    '<a href="http://passport.ziroom.com/index.php?r=account%2Fwallet">' +
                    '0.00' +
                    '</a>' +
                    '</p>'
                );
            }
            else {
                var money = dataJson.balance / 100;
                $('.wallet').html('<p class="p1">钱包余额</p>' +
                    '<p class="p2">' +
                    '<span>¥</span>' +
                    '<a href="http://passport.ziroom.com/index.php?r=account%2Fwallet">' +
                    money +
                    '</a>' +
                    '</p>'
                );
            }
        },
        error: function () {
            $('.wallet').html('<p class="p1">钱包余额</p>' +
                '<p class="p3">--</p>');
        }
    });

    //4 自如信用分接口
    $.ajax({
        url: ZRCONFIG.Credits,
        type: 'GET',
        success: function (data) {
            var json = data;
            var dataJson = json.data;

            if (dataJson.authStatus == '1') {
                var score = dataJson.ziroomScore;
                var status = '';

                //1 自如分弹框接口
                $.ajax({
                    url: ZRCONFIG.ScoreLevel,
                    type: 'GET',
                    success: function (data) {
                        var json = data;
                        var dataArr = json.data;
                        if (dataArr == '') {
                            //没有数据，显示写死的
                            $('.grade_box ul').html('<li class="clearfix">' +
                                '<p class="fl"><span class="num1">0</span>至<span class="num2">69</span></p>' +
                                '<p class="fr">信用欠佳</p>' +
                                '</li>' +
                                '<li class="clearfix">' +
                                '<p class="fl"><span class="num1">70</span>至<span class="num2">99</span></p>' +
                                '<p class="fr">信用一般</p>' +
                                '</li>' +
                                '<li class="clearfix">' +
                                '<p class="fl"><span class="num1">100</span>至<span class="num2">149</span></p>' +
                                '<p class="fr">信用良好</p>' +
                                '</li>' +
                                '<li class="clearfix">' +
                                '<p class="fl"><span class="num1">150</span>至<span class="num2">199</span></p>' +
                                '<p class="fr">信用优秀</p>' +
                                '</li>' +
                                '<li class="clearfix">' +
                                '<p class="fl">200及以上</p>' +
                                '<p class="fr">信用极好</p>' +
                                '</li>');

                            if (score >= 200) {
                                status = '信用极好';
                            }
                            else if (score >= 150) {
                                status = '信用优秀';
                            }
                            else if (score >= 100) {
                                status = '信用良好';
                            }
                            else if (score >= 70) {
                                status = '信用一般';
                            }
                            else {
                                status = '信用欠佳';
                            }
                        }
                        else {
                            //有数据，显示接口数据
                            var _html = '';
                            $.each(dataArr, function (index, value) {
                                var jsonTmp = value;
                                if (index == '4') {
                                    _html += '<li class="clearfix">' +
                                        '<p class="fl">' + jsonTmp.minScore + '及以上</p>' +
                                        '<p class="fr">' + jsonTmp.levelName + '</p>' +
                                        '</li>';
                                    if (jsonTmp.minScore <= score) {
                                        status = jsonTmp.levelName;
                                    }
                                }
                                else {
                                    _html += '<li class="clearfix">' +
                                        '<p class="fl"><span class="num1">' + jsonTmp.minScore + '</span>至<span class="num2">' + jsonTmp.maxScore + '</span></p>' +
                                        '<p class="fr">' + jsonTmp.levelName + '</p>' +
                                        '</li>';
                                    if (jsonTmp.minScore <= score && score < jsonTmp.maxScore) {
                                        status = jsonTmp.levelName;
                                    }
                                }

                            });

                            $('.grade_box ul').html(_html);
                        }

                        $('.grade .grade_detail').html('<p class="p2">' + score + '<span>' + status + '</span></p>');
                    }
                });
            }
            else if (dataJson.authStatus == '0') {
                $('.grade .grade_detail').html('<p class="p4">未授权</p><p class="p5">请到自如APP授权</p>');
            }

        },
        error: function () {
            $('.grade .grade_detail').html('<p class="p3">--</p>');
        }
    });

    //5 最近收藏房源接口
    $.ajax({
        url: ZRCONFIG.Collect,
        type: 'GET',
        success: function (data) {
            var json = data;
            var dataArr = json.data;
            if (dataArr == '') {
                //没有数据
                $('.collection ul').html('<p class="noContent">您还没有收藏的房源，快去看看吧！</p>');
            }
            else {
                //有数据，显示接口数据
                var _html = '';
                var n = 0;
                $.each(dataArr, function (index, value) {
                    if (value == '') {
                        return true;
                    }
                    else {
                        if (n >= '3') {
                            return false;
                        }

                        var jsonTmp = value[0];
                        _html += '<li>' +
                            '<a href="http://www.ziroom.com/z/vr/' + jsonTmp.id + '">' +
                            '<div class="img"><img width="285" height="190" src="http://pic.ziroom.com/house_images/' + jsonTmp.room_photos[0] + '" onerror="this.src=\'http://www.ziroom.com//static/images/slist_1207/yuanwei-up.jpg\'"></div>' +
                            '<div class="clearfix">' +
                            '<p class="name fl">' + jsonTmp.room_name + '</p>' +
                            '<p class="price fr">¥' + jsonTmp.sell_price + '/月</p>' +
                            '</div>' +
                            '</a>' +
                            '</li>';
                        n++;
                    }

                });

                if (_html == '') {
                    $('.collection ul').html('<p class="noContent">您还没有收藏的房源，快去看看吧！</p>');
                }
                else {
                    $('.collection ul').html(_html);
                }
            }
        },
        error: function () {
            $('.collection ul').html('<p class="noContent">您还没有收藏的房源，快去看看吧！</p>');
        }
    });
});