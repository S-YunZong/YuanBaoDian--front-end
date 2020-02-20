<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/11/20
  Time: 9:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<head>
    <title>我的优惠券</title>
</head>
<%@include file="/jsp/personalCenter/mySpace/common/header.jsp" %>
<link href="/static/guoda.com_files/css/index.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="/static/css/zxf_page.css"/>
<link rel="stylesheet" type="text/css" href="/static/fenye/jquery.sPage.css">
<script type="text/javascript" src="/static/js/zxf_page.js"></script>
<script src="/static/fenye/jquery.sPage.js"></script>
<link rel="stylesheet" type="text/css" href="/static/css/youhuiquan.css"/>
<script>
    $(function () {
        ajaxPage();
    })

    //查询优惠券
    function ajaxPage(page) {

        var p = page || 1;
        $.ajax({
            type: "POST",
            url: "/user/listActivityUser",
            dataType: "json",
            data: {
                "pageNum": p,
                "pageSize": 4,
                "userid":${param.userid}
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
                "        <p>您还没有优惠券，快去参加优惠活动吧！</p>\n" +
                "      </div>";
            $("#chuzulist").html("");
            $("#ccc").html(str);
            $("#myPage").html("");
            return false;
        }
        $("#ccc").html("");
        for (var i = 0; i < da.length; i++) {
            if (da[i].way == 'rent') {
                str += "<li style='width: 400px'>\n" +
                    "<div class=\"stamp stamp03\">\n" +
                    "       <div class=\"par\"><p>国大" + da[i].activityName + "租房折扣</p><sub class=\"sign\">￥</sub><span>" + da[i].money + "</span><sub>优惠券</sub><p>该券只限于租房</p></div>\n" +
                    "       <div class=\"copy\">副券<p>过期时间:<br>" + da[i].expirationDate + "</p><a href=\"/jsp/zuFang/chuzufang.jsp\">立即使用</a></div>\n" +
                    "       <i></i>\n" +
                    " </div>\n" +
                    " </li>";
            } else if (da[i].way == 'sellers') {
                str += "<li style='width: 400px'>\n" +
                    "<div class=\"stamp stamp04\">\n" +
                    "     <div class=\"par\"><p>国大" + da[i].activityName + "买房折扣</p><sub class=\"sign\">￥</sub><span>" + da[i].money + "</span><sub>优惠券</sub><p>该券只限于买房</p></div>\n" +
                    "     <div class=\"copy\">副券<p>过期时间:<br>" + da[i].expirationDate + "</p><a href=\"/jsp/zuFang/xinfang.jsp\">立即使用</a></div>\n" +
                    "     <i></i>\n" +
                    " </div>\n" +
                    " </li>";
            }
        }
        $("#chuzulist").html(str);
        $("#myPage").sPage({
            page: p,//当前页码，必填
            total: data.total,//数据总条数，必填
            pageSize: 4,//每页显示多少条数据，默认10条
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

        //立即使用
        function shiyong(way) {
            alert(way)
            if (way == 'rent') {
                window.location.href = "/jsp/zuFang/chuzufang.jsp";
            } else if (way == 'sellers') {
                window.location.href = "/jsp/zuFang/xinfang.jsp";
            }
        }
    }

    function aaa() {
        alert(1)
    }
</script>
<div hidden style="width: 100px">

</div>
<div class="container">
    <div class="row clearfix">
        <%@include file="/jsp/personalCenter/mySpace/common/left.jsp" %>
        <div class="col-md-10 column">
            <div class="t_spacemainboxright">
                <div class="ziroom_box_right">
                    <div class="ziroom_box_right_h  lh30">
                        <h3>我的优惠券</h3>
                    </div><!--ziroom_box_right_h -->
                    <div class="ziroom_box_right_c">
                        <div style="margin-bottom:8px;background:#eee;height:40px;line-height:40px;padding-left:10px;"
                             class="clearfix">

                            <div class="fl">
                                <p class="fb color_333">
                                    <a href="/jsp/personalCenter/mySpace/myFavorite.jsp" class="org">我的优惠券</a>
                                </p>
                            </div>
                            <div class="fr page_c" id="page_show"></div>
                        </div>
                        <div id="ccc"></div>
                        <div class="collection"><%--contract--%>
                            <ul class="clearfix" id="chuzulist">


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