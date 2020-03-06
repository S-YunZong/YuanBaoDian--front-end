<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/11/20
  Time: 9:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="/static/guoda.com_files/css/index.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/static/guoda.com_files/js/g-common.js"></script>
<script type="text/javascript" src="/static/guoda.com_files/js/index.js"></script>
<head>
    <title>我的空间</title>
</head>
<%@include file="/jsp/personalCenter/mySpace/common/header.jsp" %>
<div class="container">
    <div class="row clearfix">
        <%@include file="/jsp/personalCenter/mySpace/common/left.jsp" %>
        <div class="col-md-10 column">
            <div class="mainRight notFrameBox">
                <!-- 个人 -->
                <div class="person clearfix">
                    <div class="photo fl">
                        <img src="" id="J-m-imgFileImg5">
                        <script>
                            $(function () {
                                var id ="${user_session.id}";
                                $.ajax({
                                    url: "/user/Personal",
                                    dataType: "json",
                                    type: "post",
                                    data: {
                                        id: id
                                    },
                                    success: function (data) {
                                        if (data) {
                                            $("#J-m-imgFileImg5").attr("src",data.pictureUrl);
                                        }
                                    }
                                })
                            })
                        </script>
                    </div>
                    <div class="information fl">
                        <p class="p1" id="p1"></p>
                        <p class="p2"><a href="/jsp/personalCenter/myProfile/myProfile.jsp">修改个人资料<i></i></a></p>
                        <p class="p3">
                            <c:if test="${not empty user_session.phone}" var="judge">
                                <span class="active">已绑定手机号</span>
                            </c:if>
                            <c:if test="${!judge}">
                                <span>未绑定手机号</span>
                            </c:if>
                            <i class="phone active"></i>
                        </p>
                    </div>
                    <div class="line fr"></div>
                    <div class="wallet fr"><p class="p1">剩余积分</p>
                        <p class="p2"><span id="integral"></span></p></div>
                </div>

                <!-- 我的礼物 -->
                <div class="collection"><%--contract--%>
                    <h5>我的礼物</h5>
                    <div id="bbb">

                    </div>
                    <div class="clearfix" id="liwu">
<%--                        <div style="float: left;border: 2px dashed red;width: 140px;height: 170px;text-align:center;padding-top: 20px;margin-left:20px" class="a">--%>
<%--                            <img src="https://kidding.oss-cn-beijing.aliyuncs.com/WeChat/know.jpg" style="width: 100px;height: 100px;">--%>
<%--                            <p style="font-size: 10px;margin: 0 auto;">所需积分:100</p>--%>
<%--                            <p style="font-size: 15px;margin: 0 auto;">兑换量化积分：10</p>--%>
<%--                        </div>--%>
                    </div>
                </div>

                <!-- 最近收藏 -->
                <div class="collection">
                    <h5>最近收藏</h5>
                    <div id="ccc">

                    </div>
                    <table id="myFavorite" width="100%" cellpadding="0" cellspacing="0" class="collect_sheet">

                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="/jsp/personalCenter/mySpace/common/footer.jsp" %>
<script>
    $(function () {
        ajaxPage();
        time();
        liwu();
        findIntegralById();
    })

    // 问好
    function time(){
        var myDate = new Date();
        var hour = myDate.getHours();
        if(7<=hour && hour<12){
            $("#p1").append("上午好，<span>\n" +
                "                            ${user_session.userName}\n" +
                "                        </span>")
        }else if(12<=hour && hour<19){
            $("#p1").append("下午好，<span>\n" +
                "                            ${user_session.userName}\n" +
                "                        </span>")
        }else{
            $("#p1").append("晚上好，<span>\n" +
                "                            ${user_session.userName}\n" +
                "                        </span>")
        }
    }

    //查询最近收藏
    function ajaxPage(page) {
        var phone="${user_session.phone}";
        $.ajax({
            type: "POST",
            url: "/QuestionBack/myFavorite",
            dataType: "json",
            data: {
                "pageSize": 5,
                "sign": 1,
                "phone": phone
            },
            success: function (data) {
                var da = data.list;
                var str = "";
                if (da == null || da == "") {
                    str += "<div class=\"Z_list-stat Z_list-empty\">\n" +
                        "        <img src=\"https://webimg.ziroom.com/5df144d1-4513-44e2-a885-715b149765a6.png\" alt=\"\">\n" +
                        "        <p>您还没有收藏，快去收藏吧！</p>\n" +
                        "      </div>";
                    $("#myFavorite").html("");
                    $("#ccc").html(str);
                    return false;
                }
                str += "<tbody id=\"tbody\">\n" +
                    "                                    <tr class=\"ttl_cs\">\n" +
                    "                                        <td class=\"td_firsr\" width=\"70%\">题目</td>\n" +
                    "                                        <td class=\"td_second\" align=\"center\" width=\"15%\">出题人</td>\n" +
                    "                                    </tr>";
                for (var i = 0; i < da.length; i++) {
                    str += "<tr class=\"content_cs\">\n" +
                        "                                        <td >\n" +
                        "                                            <div class=\"left_imgs clearfix\">\n" +
                        "                                                <div class=\"txt_li\" width=\"100%\">\n" +
                        "                                                    <div class=\"panel-group\" id=\"accordion\">\n" +
                        "                                    <div class=\"panel-heading\">\n" +
                        "                            <h4 class=\"panel-title\">\n" +
                        "     <a data-toggle=\"collapse\" data-parent=\"#accordion\" \n" +
                        "      href=\"#collapse"+da[i].id+"\">\n" +
                        " "+da[i].questionBack+"\n" +
                        "     </a>\n" +
                        "                </h4>\n" +
                        "                            </div>\n" +
                        "                           <div id=\"collapse"+da[i].id+"\" class=\"panel-collapse collapse\">\n" +
                        " <div class=\"panel-body\">\n" +
                        " <p>正确答案：</p>"+da[i].optionDescribe+" \n" +
                        " <p>解释：</p>"+da[i].analysis+" \n" +
                        " </div>\n" +
                        "                        </div>\n" +
                        "        </div>\n" +
                        "    </div>\n" +
                        "                                            </div>\n" +
                        "                                        </td>\n" +
                        "                                        <td align=\"center\" >\n" +
                        "                                            <p>"+da[i].userName+"</p>\n" +
                        "                                        </td>\n" +
                        "                                    </tr>";
                }
                str += "</tbody>";
                $("#myFavorite").html(str);
            }
        });
    }

    // 我的礼物
    function liwu(){
        var uid="${user_session.id}";
        $.ajax({
            type: "POST",
            url: "/QuestionBack/queryConvertRecord2",
            dataType: "json",
            data: {
                "id": uid
            },
            success: function (data) {
                var str = "";
                if (data == "" || data  == null) {
                    str += "<div class=\"Z_list-stat Z_list-empty\">\n" +
                        "        <img src=\"https://webimg.ziroom.com/5df144d1-4513-44e2-a885-715b149765a6.png\" alt=\"\">\n" +
                        "        <p>您还没有礼物，快去兑换吧！</p>\n" +
                        "      </div>";
                    $("#myFavorite").html("");
                    $("#bbb").html(str);
                    return false;
                }
                for(var i=0;i<data.length;i++){
                    str += "<div style=\"float: left;border: 2px solid #DCDCDC;width: 140px;height: 170px;text-align:center;padding-top: 20px;margin-left:20px\" class=\"a\">\n" +
                        "                            <img src=\""+data[i].itemPic+"\" style=\"width: 100px;height: 100px;\">\n" +
                        "                            <p style=\"font-size: 10px;margin: 0 auto;\">所需积分:"+data[i].price+"</p>\n" +
                        "                            <p style=\"font-size: 15px;margin: 0 auto;\">兑换量化积分："+data[i].itemDescription+"</p>\n" +
                        "                        </div>";
                }
                $("#liwu").html(str);
            }
        });
    }

    //查询用户积分
    function findIntegralById(){
        var uid="${user_session.id}";
        $.ajax({
            type: "POST",
            url: "/user/Personal",
            dataType: "json",
            data: {
                "id": uid
            },
            success: function (data) {
                if(data.integral==null){
                    data.integral=0;
                }
                $("#integral").html(data.integral);
            }
        });
    }
</script>