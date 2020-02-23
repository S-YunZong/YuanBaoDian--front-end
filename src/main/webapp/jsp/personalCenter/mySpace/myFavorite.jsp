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

</script>
<div class="container">
    <div class="row clearfix">
        <%@include file="/jsp/personalCenter/mySpace/common/left.jsp" %>
        <div class="col-md-10 column">
            <div class="t_spacemainboxright">
                <div class="ziroom_box_right">

                    <div class="ziroom_box_right_c">
                        <div style="margin-bottom:8px;background:#eee;height:40px;line-height:40px;padding-left:10px;"
                             class="clearfix">

                            <div class="fl">
                                <p class="fb color_333">
                                    <a href="/jsp/personalCenter/mySpace/myFavorite.jsp" class="org" onclick="del()">我的消息</a>
                                    <%--&nbsp;&nbsp;
                                    <a href="http://i.ziroom.com/index.php?uri=collect/sublet">转租收藏</a>--%>
                                </p>
                            </div>
                            <div class="fr page_c" id="page_show"></div>
                        </div>

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
