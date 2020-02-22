<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/11/20
  Time: 9:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
                        <p class="p1">上午好，<span>
                            ${user_session.userName}
                        </span></p>
                        <p class="p2"><a href="/jsp/personalCenter/myProfile/myProfile.jsp">修改个人资料<i></i></a></p>
                        <p class="p3">
                            <span class="active">已绑定手机号</span>
                            <i class="phone active"></i>
                            <span>未绑定邮箱</span>
                            <i class="email "></i>
                        </p>
                    </div>
                    <div class="line fr"></div>
                    <div class="wallet fr"><p class="p1">钱包余额</p>
                        <p class="p2"><span>¥</span><a
                                href="http://passport.ziroom.com/index.php?r=account%2Fwallet">0</a></p></div>
                </div>

                <!-- 履行中合同 -->
                <div class="collection"><%--contract--%>
                    <h5>履行中合同</h5>
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
                    <ul class="clearfix" id="ulzuijin">
                        <%--<li>
                            <a href="/static/image/CtgFCF3JIwiAGsloADDvzA054os031.jpg">
                                <div class="img">
                                    <img width="285" height="190" src="/static/image/CtgFCF3JIwiAGsloADDvzA054os031.jpg">
                                </div>
                                <div class="clearfix">
                                    <p class="name fl">丰台角门10号线角门东司达小区2居室</p>
                                    <p class="price fr">¥6030/月</p>
                                </div>
                            </a>
                        </li>--%>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="/jsp/personalCenter/mySpace/common/footer.jsp" %>
<script>
    $(function () {

    })

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
                } else {

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
</script>