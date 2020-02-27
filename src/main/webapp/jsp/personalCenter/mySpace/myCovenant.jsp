<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/11/20
  Time: 9:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .yuekan td {
        text-align: center;
    }

    .yk-btn {
        padding: 10px;
        text-align: right;
    }

    .yk-btn input {
        margin-left: 5px;
        padding: 5px 25px;
        background: #f60;
        color: #fff;
    }
</style>
<head>
    <title>我的约看</title>
</head>
<%@include file="/jsp/personalCenter/mySpace/common/header.jsp" %>
<link rel="stylesheet" type="text/css" href="/static/css/zxf_page.css"/>
<link rel="stylesheet" type="text/css" href="/static/fenye/jquery.sPage.css">
<script type="text/javascript" src="/static/js/zxf_page.js"></script>
<script src="/static/fenye/jquery.sPage.js"></script>
<script>
    $(function () {
        ajaxPage()
    })

    //查询预约房源
    function ajaxPage(page) {
        var id = localStorage.getItem("id");
        var p = page || 1;
        $.ajax({
            type: "POST",
            url: "/user/limAppointment",
            dataType: "json",
            data: {
                "pageNum": p,
                "pageSize": 5,
                "hid": id
            },
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
                "        <p>您还没有预约房源，快去预约您喜欢的房源吧！</p>\n" +
                "      </div>";
            $("#chuzulist").html("");
            $("#ccc").html(str);
            $("#myPage").html("");
            return false;
        }
        $("#ccc").html("");
        var seeTime;
        str += "<tbody id=\"tbody\">\n" +
            "                                    <tr class=\"ttl_cs\">\n" +
            "                                        <td class=\"td_firsr\">房源信息</td>\n" +
            "                                        <td class=\"td_second\">经纪人</td>\n" +
            "                                        <td class=\"td_second\">电话</td>\n" +
            "                                        <td class=\"td_second\">约看时间</td>\n" +
            "                                        <td class=\"td_second\">价格</td>\n" +
            "                                        <td class=\"td_second\">操作</td>\n" +
            "                                    </tr>";
        for (var i = 0; i < da.length; i++) {
            seeTime = da[i].seeTime2;
            if (seeTime == null) {
                seeTime = "未定";
            }
            str += "<tr class=\"content_cs\">\n" +
                "                                <td>\n" +
                "                                    <div class=\"left_imgs clearfix\">\n" +
                "                                        <div class=\"imgs\">\n" +
                "                                            <a href=\"/jsp/zuFang/xiangqing2.jsp?id='" + da[i].id + "'\" target=\"_blank\">\n" +
                "                                                <img src=\"" + da[i].url + "\" width=\"137\" height=\"91\">\n" +
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
                "<td class=\"price_c\">" + da[i].realname + "</td>\n" +
                "<td class=\"price_c\">" + da[i].tell + "</td>\n" +
                "<td class=\"price_c\">" + seeTime + "</td>\n" +
                "                                <td class=\"price_c\">" + da[i].rental + "/月</td>\n" +
                "                                <td>\n" +
                "<div class=\"yk-btn\">\n" +
                "<input type=\"button\" value=\"取消约看\" onclick=\"ykDelete2(" + da[i].aid + ")\">\n" +
                "</div>\n" +
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
                ajaxPage(page);
                //点击分页按钮回调函数，返回当前页码
                $("#pNum").text(page);
            }
        });
    }

    //取消预约
    function ykDelete2(id) {
        $.ajax({
            type: "POST",
            url: "/user/delAppointment",
            dataType: "json",
            data: {
                "id": id
            },
            success: function (data) {
                if (data) {
                    alert("取消成功！")
                    ajaxPage();
                } else {

                }
            }
        })
    }
</script>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="row clearfix">
                <%--佐兰--%>
                <%@include file="/jsp/personalCenter/mySpace/common/left.jsp" %>
                <div class="col-md-10 column">
                    <div class="t_spacemainboxright" style="width: 1055px;">
                        <div class="ziroom_box_right">
                            <div class="ziroom_box_right_h  lh30">
                                <h3>约看订单</h3>
                            </div><!--ziroom_box_right_h -->
                            <div class="ziroom_box_right_c">

                                <table width="100%" cellpadding="0" cellspacing="0" class="collect_sheet">
                                    <tbody id="tbody">
                                    <tr class="ttl_cs">
                                        <td class="td_firsr">房源信息</td>
                                        <td class="td_second">经纪人</td>
                                        <td class="td_second">电话</td>
                                        <td class="td_second">约看时间</td>
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
                                        <td class="price_c">秀明</td>
                                        <td class="price_c">6032432421</td>
                                        <td class="price_c">2019-10-10 10:45</td>
                                        <td class="price_c">6030元/月</td>
                                        <td>
                                            <div class="yk-btn">
                                                <input type="button" value="取消约看" onclick="ykDelete2()">
                                            </div>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                                <div id="ccc">

                                </div>
                                <div class="Z_list-box">
                                    <table id="chuzulist" width="100%" cellpadding="0" cellspacing="0"
                                           class="collect_sheet">
                                    </table>
                                </div>
                                <div class="zxf_pagediv">
                                    <div id="myPage" class="demo"></div>
                                </div>
                                <!-- E 约看管理 -->
                            </div><!--ziroom_box_right_c -->
                        </div>
                    </div>
                    <!--t_spacemainbox -->
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="/jsp/personalCenter/mySpace/common/footer.jsp" %>

