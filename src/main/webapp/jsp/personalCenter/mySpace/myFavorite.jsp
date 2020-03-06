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

    //查询我的收藏
    function ajaxPage(page) {
        var phone="${user_session.phone}";
        var p = page || 1;
        $.ajax({
            type: "POST",
            url: "/QuestionBack/myFavorite",
            dataType: "json",
            data: {
                "pageNum": p,
                "pageSize": 5,
                "sign": 0,
                "phone": phone
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
                "        <p>您还没有收藏，快去收藏吧！</p>\n" +
                "      </div>";
            $("#myFavorite").html("");
            $("#ccc").html(str);
            $("#myPage").html("");
            return false;
        }
        $("#ccc").html("");

        str += "<tbody id=\"tbody\">\n" +
            "                                    <tr class=\"ttl_cs\">\n" +
            "                                        <td class=\"td_firsr\" width=\"70%\">题目</td>\n" +
            "                                        <td class=\"td_second\" align=\"center\" width=\"15%\">出题人</td>\n" +
            "                                        <td class=\"td_second\" align=\"center\" width=\"15%\">操作</td>\n" +
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
                "                                        <td>\n" +
                "                                            <div class=\"yk-btn\">\n" +
                "                                                <input type=\"button\" value=\"取消收藏\" onclick=\"ykDelete2("+da[i].id+")\">\n" +
                "                                            </div>\n" +
                "                                        </td>\n" +
                "                                    </tr>";
        }
        str += "</tbody>";
        $("#myFavorite").html(str);
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

    // 取消收藏
    function ykDelete2(id) {
        var phone="${user_session.phone}";
        $.ajax({
            url: "/redis/COLLECT_dellist",
            type: "post",
            dataType: "json",
            data: {
                questionBack_id:id,
                phone:phone
            },
            success: function (data) {
                if(data){
                    alert("收藏取消成功！");
                    ajaxPage();
                }else {
                    alert("取消失败！");
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
                        <h3>我的收藏</h3>
                    </div>
                    <div class="ziroom_box_right_c">
                        <div id="ccc">

                        </div>
                        <div class="Z_list-box">
                            <table id="myFavorite" width="100%" cellpadding="0" cellspacing="0" class="collect_sheet">
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
