<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/11/20
  Time: 9:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<head>
    <title>积分记录</title>
</head>
<%@include file="/jsp/personalCenter/mySpace/common/header.jsp" %>
<link href="/static/guoda.com_files/css/index.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="/static/css/zxf_page.css"/>
<link rel="stylesheet" type="text/css" href="/static/fenye/jquery.sPage.css">
<script type="text/javascript" src="/static/js/zxf_page.js"></script>
<script src="/static/fenye/jquery.sPage.js"></script>
<script>
    $(function () {
        ajaxPage();
    })

    //查询积分记录
    function ajaxPage(page) {
        var uid="${user_session.id}";
        var p = page || 1;
        $.ajax({
            type: "POST",
            url: "/QuestionBack/myContract",
            dataType: "json",
            data: {
                "pageNum": p,
                "pageSize": 5,
                "id":uid
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
                "        <p>您还没有积分记录，快去获取积分吧！</p>\n" +
                "      </div>";
            $("#myContract").html("");
            $("#ccc").html(str);
            $("#myPage").html("");
            return false;
        }
        $("#ccc").html("");
        str += "<tbody id=\"tbody\">\n" +
            "                                    <tr class=\"ttl_cs\">\n" +
            "                                        <td class=\"td_firsr\" width=\"70%\">积分记录</td>\n" +
            "                                        <td class=\"td_second\" align=\"center\" width=\"15%\">物品名称</td>\n" +
            "                                        <td class=\"td_second\" align=\"center\" width=\"15%\">操作时间</td>\n" +
            "                                    </tr>";
        for (var i = 0; i < da.length; i++) {
            str += "<tr class=\"content_cs\">\n" +
                "                                        <td>\n" +
                "                                            <div class=\"left_imgs clearfix\">\n" +
                "                                                <div class=\"txt_li\">\n" +
                "                                                    <p class=\"p1\">\n" +
                "                                                        -"+da[i].price+"\n" +
                "                                                    </p>\n" +
                "                                                </div>\n" +
                "                                            </div>\n" +
                "                                        </td>\n" +
                "                                        <td class=\"price_c\" align=\"center\">"+da[i].itemDescription+"</td>\n" +
                "                                        <td class=\"price_c\" align=\"center\">"+da[i].convertTime+"</td>\n" +
                "                                    </tr>";
        }
        str += "</tbody>";
        $("#myContract").html(str);
        $("#myPage").sPage({
            page: p,//当前页码，必填
            total: data.total,//数据总条数，必填
            pageSize: 6,//每页显示多少条数据，默认10条
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
        <%@include file="/jsp/personalCenter/mySpace/common/left.jsp" %>
        <div class="col-md-10 column">
            <div class="t_spacemainboxright">
                <div class="ziroom_box_right">
                    <div class="ziroom_box_right_h  lh30">
                        <h3>积分记录</h3>
                    </div><!--ziroom_box_right_h -->
                    <div class="ziroom_box_right_c">
                        <div id="ccc"></div>
                        <div class="collection"><%--contract--%>
                            <ul class="clearfix" id="myContract">
<%--                                <table width="100%" cellpadding="0" cellspacing="0" class="collect_sheet">--%>
<%--                                    <tbody id="tbody">--%>
<%--                                    <tr class="ttl_cs">--%>
<%--                                        <td class="td_firsr">积分记录</td>--%>
<%--                                        <td class="td_second" align="center">物品名称</td>--%>
<%--                                        <td class="td_second" align="center">操作时间</td>--%>
<%--                                    </tr>--%>
<%--                                    <tr class="content_cs">--%>
<%--                                        <td>--%>
<%--                                            <div class="left_imgs clearfix">--%>
<%--                                                <div class="txt_li">--%>
<%--                                                    <p class="p1">--%>
<%--                                                        +10--%>
<%--                                                    </p>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </td>--%>
<%--                                        <td class="price_c" align="center">2020-02-24 16:09:30</td>--%>
<%--                                        <td class="price_c" align="center">2020-02-24 16:09:30</td>--%>
<%--                                    </tr>--%>
<%--                                    </tbody>--%>
<%--                                </table>--%>
                            </ul>
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