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
    .panel-group img{
        width:100px;
        height:83.5px
    }
</style>
<head>
    <title>我的礼物</title>
</head>
<%@include file="/jsp/personalCenter/mySpace/common/header.jsp" %>
<link rel="stylesheet" type="text/css" href="/static/css/zxf_page.css"/>
<link rel="stylesheet" type="text/css" href="/static/fenye/jquery.sPage.css">
<link rel="stylesheet" type="text/css" href="/static/fenye/jquery.sPage.green.css">
<link rel="stylesheet" type="text/css" href="/static/fenye/jquery.sPage.red.css">
<script type="text/javascript" src="/static/js/zxf_page.js"></script>
<script src="/static/fenye/jquery.sPage.js"></script>
<script>
    $(function () {
        ajaxPage()
    })

    //查询我的礼物
    function ajaxPage(page) {
        var uid="${user_session.id}";
        var p = page || 1;
        $.ajax({
            type: "POST",
            url: "/QuestionBack/queryConvertRecord",
            dataType: "json",
            data: {
                "pageNum": p,
                "pageSize": 5,
                "id": uid
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
        if (da == null || da == "") {
            str += "<div class=\"Z_list-stat Z_list-empty\">\n" +
                "        <img src=\"https://webimg.ziroom.com/5df144d1-4513-44e2-a885-715b149765a6.png\" alt=\"\">\n" +
                "        <p>您还没有兑换记录，快去兑换您喜欢的礼物吧！</p>\n" +
                "      </div>";
            $("#myExchange").html("");
            $("#ccc").html(str);
            $("#myPage").html("");
            return false;
        }
        $("#ccc").html("");
        var seeTime;
        str += "<tbody id=\"tbody\">\n" +
            "                                    <tr class=\"ttl_cs\">\n" +
            "                                        <td class=\"td_firsr\">礼物信息</td>\n" +
            "                                        <td class=\"td_second\" align=\"center\">所需积分</td>\n" +
            "                                        <td class=\"td_second\" align=\"center\">兑换时间</td>\n" +
            "                                    </tr>";
        for (var i = 0; i < da.length; i++) {
            str += "<tr class=\"content_cs\">\n" +
                "                                        <td>\n" +
                "                                            <div class=\"left_imgs clearfix\">\n" +
                "                                                <div class=\"imgs\">\n" +
                "                                                    <img src=\""+da[i].itemPic+"\" width=\"137\" height=\"91\">\n" +
                "                                                </div>\n" +
                "                                                <div class=\"txt_li\">\n" +
                "                                                    <p style=\"margin-bottom: 12px\">&nbsp;</p>\n" +
                "                                                    <p class=\"p1\">\n" +
                "                                                        量化积分："+da[i].itemDescription+"\n" +
                "                                                    </p>\n" +
                "                                                </div>\n" +
                "                                            </div>\n" +
                "                                        </td>\n" +
                "                                        <td class=\"price_c\" align=\"center\">"+da[i].price+"</td>\n" +
                "                                        <td class=\"price_c\" align=\"center\">"+da[i].convertTime+"</td>\n" +
                "                                    </tr>";
        }
        str += "</tbody>";
        $("#myExchange").html(str);
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
                                <h3>我的礼物</h3>
                            </div>
                            <div class="ziroom_box_right_c">

<%--                                <table width="100%" cellpadding="0" cellspacing="0" class="collect_sheet">--%>
<%--                                    <tbody id="tbody">--%>
<%--                                    <tr class="ttl_cs">--%>
<%--                                        <td class="td_firsr">礼物信息</td>--%>
<%--                                        <td class="td_second" align="center">所需积分</td>--%>
<%--                                        <td class="td_second" align="center">兑换时间</td>--%>
<%--                                    </tr>--%>
<%--                                    <tr class="content_cs">--%>
<%--                                        <td>--%>
<%--                                            <div class="left_imgs clearfix">--%>
<%--                                                <div class="imgs">--%>
<%--                                                    <img src="https://kidding.oss-cn-beijing.aliyuncs.com/WeChat/know.jpg" width="137" height="91">--%>
<%--                                                </div>--%>
<%--                                                <div class="txt_li">--%>
<%--                                                    <p style="margin-bottom: 12px">&nbsp;</p>--%>
<%--                                                    <p class="p1">--%>
<%--                                                        量化积分：10--%>
<%--                                                    </p>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </td>--%>
<%--                                        <td class="price_c" align="center">100</td>--%>
<%--                                        <td class="price_c" align="center">2020-02-24 16:09:30</td>--%>
<%--                                    </tr>--%>
<%--                                    </tbody>--%>
<%--                                </table>--%>
                                <div id="ccc">

                                </div>
                                <div class="Z_list-box">
                                    <table id="myExchange" width="100%" cellpadding="0" cellspacing="0"
                                           class="collect_sheet">
                                    </table>
                                </div>
                                <div class="zxf_pagediv">
                                    <div id="myPage" class="demo"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="/jsp/personalCenter/mySpace/common/footer.jsp" %>

