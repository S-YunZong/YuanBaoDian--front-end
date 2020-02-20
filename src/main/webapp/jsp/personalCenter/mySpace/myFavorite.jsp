<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/11/20
  Time: 9:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<head>
    <title>我的收藏</title>
</head>
<%@include file="/jsp/personalCenter/mySpace/common/header.jsp" %>
<link rel="stylesheet" type="text/css" href="/static/css/zxf_page.css"/>
<link rel="stylesheet" type="text/css" href="/static/fenye/jquery.sPage.css">
<script type="text/javascript" src="/static/js/zxf_page.js"></script>
<script src="/static/fenye/jquery.sPage.js"></script>
<script>
    $(function () {
        fangyuanid()
    })

    //查询redis里收藏id
    function fangyuanid(page) {
        var userid =${param.userid};
        $.ajax({
            url: "/redis/listredis",
            dataType: "json",
            type: "post",
            data: {
                userid: userid
            },
            success: function (data) {
                if (data) {
                    ajaxPage(page, data);
                } else {

                }
            }
        })
    }

    //查询收藏房源
    function ajaxPage(page, hid) {
        var ids = [];
        ids.push(hid);
        var p = page || 1;
        $.ajax({
            type: "POST",
            url: "/user/Listredis",
            dataType: "json",
            data: {
                "pageNum": p,
                "pageSize": 5,
                "hid": ids
            },
            traditional: true,
            success: function (data) {
                //调用拼接以及展示
                da_pj(data, page);

            }
        });
    }

    //分页展示核心
    function da_pj(data, page) {
        var da = data.list;
        var p = page || 1;
        var str = "";
        if (da == "") {
            str += "<div class=\"Z_list-stat Z_list-empty\">\n" +
                "        <img src=\"https://webimg.ziroom.com/5df144d1-4513-44e2-a885-715b149765a6.png\" alt=\"\">\n" +
                "        <p>您还没有收藏房源，快去收藏您喜欢的房源吧！</p>\n" +
                "      </div>";
            $("#chuzulist").html("");
            $("#ccc").html(str);
            $("#myPage").html("");
            return false;
        }
        $("#ccc").html("");
        str += "<tbody id=\"tbody\">\n" +
            "                            <tr class=\"ttl_cs\">\n" +
            "                                <td class=\"td_firsr\">房源信息</td>\n" +
            "                                <td class=\"td_second\">价格</td>\n" +
            "                                <td class=\"td_second\">操作</td>\n" +
            "                            </tr>";
        for (var i = 0; i < da.length; i++) {
            str += "<tr class=\"content_cs\">\n" +
                "                                <td>\n" +
                "                                    <div class=\"left_imgs clearfix\">\n" +
                "                                        <div class=\"imgs\">\n" +
                "                                            <a href=\"/jsp/zuFang/xiangqing2.jsp?id='" + da[i].id + "'\" target=\"_blank\">\n" +
                "                                                <img src=\"" + da[i].pictureName + "\" width=\"137\" height=\"91\">\n" +
                "                                            </a>\n" +
                "                                        </div>\n" +
                "                                        <div class=\"txt_li\">\n" +
                "                                            <p class=\"p1\">\n" +
                "                                                <a href=\"/jsp/zuFang/xiangqing2.jsp?id='" + da[i].id + "'\" target=\"_blank\">" + da[i].housingName + "·" + da[i].houseType + "·" + da[i].orientation + "</a>\n" +
                "                                            </p>\n" +
                "                                            <p class=\"p1\">\n" +
                "                                                <a href=\"/jsp/zuFang/xiangqing2.jsp?id='" + da[i].id + "'\" target=\"_blank\">" + da[i].sheng + " " + da[i].shi + " " + da[i].areaName + " " + da[i].address + "</a>\n" +
                "                                            </p>\n" +
                "                                            <p class=\"p2\">" + da[i].floor + "层 | " + da[i].area + " 平方米 |整租</p>\n" +
                "                                        </div>\n" +
                "                                    </div>\n" +
                "                                </td>\n" +
                "                                <td class=\"price_c\">" + da[i].rental + "/月</td>\n" +
                "                                <td>\n" +
                "                                    <div class=\"de_v_box\" style=\"position:relative\">\n" +
                "                                        <!--<a target=\"_blank\" href=\"\" class=\"ljyd_btn\">立即预定</a>-->\n" +
                "                                        <a href=\"javascript:;\" class=\"delete\" onclick='delredis(" + da[i].id + ")'>删除</a>\n" +
                "                                    </div>\n" +
                "                                </td>\n" +
                "                            </tr>";
        }
        str += "</tbody>";
        $("#chuzulist").html(str);
        $("#myPage").sPage({
            page: p,//当前页码，必填
            total: data.total,//数据总条数，必填
            pageSize: 5,//每页显示多少条数据，默认10条
            showTotal: false,//是否显示总条数，默认关闭：false
            totalTxt: "共{total}条",//数据总条数文字描述，{total}为占位符，默认"共{total}条"
            noData: false,//没有数据时是否显示分页，默认false不显示，true显示第一页
            showSkip: true,//是否显示跳页，默认关闭：false
            showPN: true,//是否显示上下翻页，默认开启：true
            prevPage: "上一页",//上翻页文字描述，默认“上一页”
            nextPage: "下一页",//下翻页文字描述，默认“下一页”
            backFun: function (page) {
                fangyuanid(page);
                //点击分页按钮回调函数，返回当前页码
                $("#pNum").text(page);
            }
        });
    }

    //删除收藏
    function delredis(id) {
        var userid =${param.userid};
        $.ajax({
            url: "/redis/dellist",
            dataType: "json",
            type: "post",
            data: {
                id: id,
                userid: userid
            },
            success: function (data) {
                if (data) {
                    fangyuanid()
                }
            }
        })
    }
</script>
<div class="container">
    <div class="row clearfix">
        <%@include file="/jsp/personalCenter/mySpace/common/left.jsp" %>
        <div class="col-md-10 column">
            <div class="t_spacemainboxright">
                <div class="ziroom_box_right">
                    <div class="ziroom_box_right_h  lh30">
                        <h3>房源收藏</h3>
                    </div><!--ziroom_box_right_h -->
                    <div class="ziroom_box_right_c">
                        <div style="margin-bottom:8px;background:#eee;height:40px;line-height:40px;padding-left:10px;"
                             class="clearfix">

                            <div class="fl">
                                <p class="fb color_333">
                                    <a href="/jsp/personalCenter/mySpace/myFavorite.jsp" class="org" onclick="del()">我的收藏</a>
                                    <%--&nbsp;&nbsp;
                                    <a href="http://i.ziroom.com/index.php?uri=collect/sublet">转租收藏</a>--%>
                                </p>
                            </div>
                            <div class="fr page_c" id="page_show"></div>
                        </div>
                        <%--<table width="100%" cellpadding="0" cellspacing="0" class="collect_sheet">
                            <tbody id="tbody">
                            <tr class="ttl_cs">
                                <td class="td_firsr">房源信息</td>
                                <td class="td_second">价格</td>
                                <td class="td_second">操作</td>
                            </tr>
                            <tr class="content_cs">
                                <td>
                                    <div class="left_imgs clearfix">
                                        <div class="imgs">
                                            <a href="http://www.ziroom.com/z/vh/60411515.html" target="_blank">
                                                <img src="/static/image/CtgFCF3JIwiAGsloADDvzA054os031.jpg" width="137" height="91">
                                            </a>
                                        </div>
                                        <div class="txt_li">
                                            <p class="p1">
                                                <a href="http://www.ziroom.com/z/vh/60411515.html" target="_blank">丰台角门10号线角门东司达小区2居室</a>
                                            </p>
                                            <p class="p2">3/6层 | 15 平方米 |整租</p>
                                        </div>
                                    </div>
                                </td>
                                <td class="price_c">6030元/月</td>
                                <td>
                                    <div class="de_v_box" style="position:relative">
                                        <!--<a target="_blank" href="" class="ljyd_btn">立即预定</a>-->
                                        <a href="javascript:;" class="delete">删除</a>
                                        <div class="delete_box" style="display:none;">
                                            <p class="con_de">确认要删除该收藏吗？</p>
                                            <div class="d_btn">
                                                <a href="javascript:;"  class="confirm">确认</a>
                                                <a href="javascript:;" class="cancel">取消</a>
                                            </div>
                                            <div class="cl_close"></div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>--%>

                        <div id="ccc">

                        </div>
                        <div class="Z_list-box">
                            <table id="chuzulist" width="100%" cellpadding="0" cellspacing="0" class="collect_sheet">
                            </table>
                        </div>
                        <div class="zxf_pagediv">
                            <div id="myPage" class="demo"></div>
                        </div>
                        <div class="page_collect"></div>
                    </div><!--ziroom_box_right_c -->
                </div>
            </div>

        </div>
    </div>
</div>
<%@include file="/jsp/personalCenter/mySpace/common/footer.jsp" %>

<script type="text/javascript">
    $(function () {
        getMyCollect(1);
        $(".delete").live('click', function () {
            $('.delete_box').hide();
            $(this).parent('.de_v_box').find('.delete_box').show();
        });
        $(".cl_close").live('click', function () {
            $(".delete_box").hide();
        });
        $(".cancel").live('click', function () {
            $(".delete_box").hide();
        });
    });
    $(document).ready(function () {
        $(".leftMenuList").each(function () {
            var This = $(this);
            var aA = This.find("a").eq(0);

            aA.click(function () {
                if (This.hasClass('myservice')) {
                    $(this).next().show();
                    This.addClass("myservicehover");
                    This.removeClass("myservice");
                }
                else {
                    $(this).next().hide();
                    This.addClass("myservice");
                    This.removeClass("myservicehover");
                }
            });
        });
    });

    function getMyCollect(pg) {
        $.ajax({
            type: 'POST',
            url: "index.php?uri=collect/myCollect",
            data: 'pg=' + pg,
            success: function (msg) {
                //alert(msg);
                $("#tbody").html('');
                $(".page_collect").html('');
                $("#page_show").html('');
                var table = '';
                table += '<tr class="ttl_cs">';
                table += '<td class="td_firsr">房源信息</td>';
                table += '<td class="td_second">价格</td>';
                table += '<td class="td_second">状态</td>';
                table += '<td class="td_second">收藏时间</td>';
                table += '<td class="td_second">收藏人气</td>';
                table += '<td class="td_second">操作</td>';
                table += '</tr>';
                if (msg == 'no_login') {
                    window.location = "{DOMAIN_NAME}/g/login.html";
                }
                else {
                    var json = eval("(" + msg + ")");

                    if (json.data) {
                        var collect = json.data;
                        for (var k in collect) {
                            table += '<tr class="content_cs">';
                            table += '<td>';
                            table += '<div class="left_imgs clearfix">';
                            if (collect[k]['is_whole'] == 0) {
                                if (collect[k]['room_status'] == 'zxpzz' || collect[k]['room_status'] == 'tzpzz')
                                    table += '<div class="imgs"><a href="' + collect[k]['domain'] + '/z/vr/' + collect[k]['id'] + '.html" target="_blank"><img src="http://pic.ziroom.com/static/images/slist_1207/peizhizhong.jpg" width="137" height="91"/></a></div>';
                                else
                                    table += '<div class="imgs"><a href="' + collect[k]['domain'] + '/z/vr/' + collect[k]['id'] + '.html" target="_blank"><img src="' + collect[k]['room_photo'] + '" width="137" height="91"  onerror="this.src=\'http://pic.ziroom.com/static/images/slist_1207/small_pzz.jpg\'" /></a></div>';
                            }
                            else {
                                if (collect[k]['room_status'] == 'zxpzz' || collect[k]['room_status'] == 'tzpzz')
                                    table += '<div class="imgs"><a href="' + collect[k]['domain'] + '/z/vr/' + collect[k]['house_id'] + '.html" target="_blank"><img src="http://pic.ziroom.com/static/images/slist_1207/peizhizhong.jpg" width="137" height="91"/></a></div>';
                                else
                                    table += '<div class="imgs"><a href="' + collect[k]['domain'] + '/z/vh/' + collect[k]['house_id'] + '.html" target="_blank"><img src="' + collect[k]['room_photo'] + '" width="137" height="91" onerror="this.src=\'http://pic.ziroom.com/static/images/slist_1207/small_pzz.jpg\'"/></a></div>';

                            }
                            table += '<div class="txt_li">';

                            if (collect[k]['is_whole'] == 0)
                                table += '<p class="p1"><a href="' + collect[k]['domain'] + '/z/vr/' + collect[k]['id'] + '.html" target="_blank">' + collect[k]['title'] + '</a></p>';
                            else
                                table += '<p class="p1"><a href="' + collect[k]['domain'] + '/z/vh/' + collect[k]['house_id'] + '.html" target="_blank">' + collect[k]['title'] + '</a></p>';
                            table += '<p class="p2">' + collect[k]['floor'] + '/' + collect[k]['floor_total'] + '层 | ' + collect[k]['usage_area'] + ' 平方米 |';
                            if (collect[k]['is_whole'] == 0)
                                table += '合租</p>';
                            else
                                table += '整租</p>';
                            //table += '<p class="p3">3天内预约带看：5 人</p>';
                            table += '</div>';
                            table += '</div>';
                            table += '</td>';

                            table += '<td class="price_c">' + collect[k]['sell_price_final'] + '</td>';

                            table += '<td>';
                            if (collect[k]['room_status'] == 'dzz') table += '可入住';
                            else if (collect[k]['room_status'] == 'ycz') table += '已入住';
                            else if (collect[k]['room_status'] == 'yxd') table += '已预定';
                            else if (collect[k]['room_status'] == 'zxpzz') table += '配置中';
                            else if (collect[k]['room_status'] == 'tzpzz') table += '配置中';
                            table += '</td>';
                            table += '<td>' + collect[k]['add_time'] + '</td>';
                            table += '<td>' + collect[k]['attention'] + '</td>';
                            table += '<td>';
                            table += ' <div class="de_v_box" style="position:relative">';
                            if (collect[k]['is_whole'] == 0) {
                                if (collect[k]['room_status'] == 'dzz') {
                                    table += '<!--<a target="_blank" href="" class="ljyd_btn">立即预定</a>-->';
                                } else {
                                    table += '<!--<a href="javascript:;" class="ljyd_btn ljyd_btn_gray">立即预定</a>-->';
                                }
                                table += '<a href="javascript:;" class="delete">删除</a>';
                                table += '<div class="delete_box" style="display:none;">';
                                table += '<p class="con_de">确认要删除该收藏吗？</p>';
                                table += '<div class="d_btn">';
                                table += '<a href="javascript:;" onclick="delCollect(\'' + collect[k]['id'] + '\',' + json.pg + ')" class="confirm">确认</a>';
                                table += '<a href="javascript:;" class="cancel">取消</a>';
                                table += '</div>';
                                table += '<div class="cl_close"></div>';
                                table += '</div>';
                            }
                            else {
                                if (collect[k]['room_status'] == 'dzz')
                                    table += '<!--<a target="_blank" href="" class="ljyd_btn">立即预定</a>-->';
                                else
                                    table += '<!--<a href="javascript:;" class="ljyd_btn ljyd_btn_gray">立即预定</a>-->';
                                table += '<a href="javascript:;" class="delete">删除</a>';
                                table += '<div class="delete_box" style="display:none;">';
                                table += '<p class="con_de">确认要删除该收藏吗？</p>';
                                table += '<div class="d_btn">';
                                table += '<a href="javascript:;" onclick="delCollect(\'' + collect[k]['id'] + '\',' + json.pg + ')" class="confirm">确认</a>';
                                table += '<a href="javascript:;" class="cancel">取消</a>';
                                table += '</div>';
                                table += '<div class="cl_close"></div>';
                                table += '</div>';
                            }

                            table += '</div>';
                            table += '</td>';
                            table += '</tr>';
                        }

                        $("#tbody").html(table);
                        $(".page_collect").html(json.pager);
                        $("#page_show").html(json.topPager);
                        $('.prev_a').live("click", function () {
                            getMyCollect(json.pre);
                        });
                        $('.next_a').live("click", function () {
                            getMyCollect(json.nex);
                        });
                        $('.page_num').each(function () {
                            $(this).click(function () {
                                var pg = $.trim($(this).html());
                                getMyCollect(pg);
                            });
                        });
                    }
                }
            }
        });
    }

    function delCollect(id, pg) {
        $.ajax({
            type: 'POST',
            url: "index.php?uri=collect/delete",
            data: 'id=' + id + '&pg=' + pg,
            success: function (msg) {
                if (msg == 'no_login') {
                    window.location = "{DOMAIN_NAME}/g/login.html";
                }
                if (msg == 'error_handle') {
                    alert('非法操作!');
                    return false;
                }
                if (msg.indexOf('success') == 0) {
                    var len = 'success';
                    var pg = msg.substr(len.length + 1);
                    getMyCollect(pg);
                }
            }
        });
    }

    function del() {
        //alert(121231);
    }
</script>