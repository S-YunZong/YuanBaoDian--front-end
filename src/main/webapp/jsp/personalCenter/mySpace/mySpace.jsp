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
                            <c:if test="${not empty user_session.email}" var="judge">
                                <span class="active">已绑定邮箱</span>
                            </c:if>
                            <c:if test="${!judge}">
                                <span>未绑定邮箱</span>
                            </c:if>
                            <i class="email "></i>
                        </p>
                    </div>
                    <div class="line fr"></div>
                    <div class="wallet fr"><p class="p1">剩余积分</p>
                        <p class="p2"><span>${user_session.integral}分</span></p></div>
                </div>

                <!-- 履行中合同 -->
                <div class="collection"><%--contract--%>
                    <h5>我的礼物</h5>
                    <ul class="clearfix" id="luxinghetong">
                        <%--<li>
                            <a href="https://btupian.oss-cn-beijing.aliyuncs.com/tupian/201912091451-cdefc8aa62ae405ebb2e7278af8544fa.jpg">
                                <div class="img">
                                    <img width="285" height="190" src="https://btupian.oss-cn-beijing.aliyuncs.com/tupian/201912091451-cdefc8aa62ae405ebb2e7278af8544fa.jpg">
                                </div>
                            </a>
                        </li>--%>
                    </ul>
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

    //房源redis取
    function fangyuanid() {
        var userid =${param.userid};
        $.ajax({
            url: "/redis/listrediszuijin",
            dataType: "json",
            type: "post",
            data: {
                userid: userid
            },
            success: function (data) {
                if (data) {
                    zuijinshouchang(data);
                }
            }
        })
    }

    //房源分页
    function zuijinshouchang(hid) {
        var ids = [];
        ids.push(hid);
        $.ajax({
            type: "POST",
            url: "/user/zuijinHousing",
            dataType: "json",
            data: {
                "hid": ids
            },
            traditional: true,
            success: function (data) {
                if (data) {
                    var m = "";
                    $(data).each(function (a, b) {
                        m += "<li>\n" +
                            "                        <a href=\"" + b.pictureName + "\">\n" +
                            "                            <div class=\"img\">\n" +
                            "                                <img width=\"285\" height=\"190\" src=\"" + b.pictureName + "\">\n" +
                            "                            </div>\n" +
                            "                            <div class=\"clearfix\">\n" +
                            "                                <p class=\"name fl\">" + b.sheng + "" + b.shi + "" + b.areaName + "" + b.housingName + "" + b.houseType + "</p>\n" +
                            "                                <p class=\"price fr\">¥" + b.rental + "/月</p>\n" +
                            "                            </div>\n" +
                            "                        </a>\n" +
                            "                    </li>";
                    })
                    $("#ulzuijin").html(m)
                } else {

                }
            }
        });
    }

    //合同
    function hetong() {
        $.ajax({
            type: "POST",
            url: "/user/ListSell2",
            dataType: "json",
            data: {
                id:${param.userid}
            },
            success: function (data) {
                if (data !== '') {
                    var m = "";
                    for (var i = 0; i < 2; i++) {
                        m += "<li>\n" +
                            "   <a href=\"" + data[i].contract + "\">\n" +
                            "       <div class=\"img\">\n" +
                            "           <img width=\"285\" height=\"190\" src=\"" + data[i].contract + "\">\n" +
                            "        </div>\n" +
                            "    </a>\n" +
                            "</li>";
                    }
                    $("#luxinghetong").html(m)
                } else {
                    var s = "<p class=\"noContent\">您还没有履行中的合同，快去签约吧！</p>";
                    $("#luxinghetong").html(s);
                }
            }
        })
    }

    //查询我的收藏
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
                if (da == null) {
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
</script>