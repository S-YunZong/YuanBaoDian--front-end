<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/11/20
  Time: 9:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<head>
    <title>我的信息</title>
</head>
<%@include file="/jsp/personalCenter/mySpace/common/header.jsp" %>
<link href="/static/guoda.com_files/css/index.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="/static/css/zxf_page.css"/>
<link rel="stylesheet" type="text/css" href="/static/fenye/jquery.sPage.css">
<script type="text/javascript" src="/static/js/zxf_page.js"></script>
<script src="/static/fenye/jquery.sPage.js"></script>
<link rel="stylesheet" type="text/css" href="/static/css/youhuiquan.css"/>
<script type="text/javascript" src="/static/js/MyMessage/MyMessage.js"></script>

<!-- 模态框（Modal） -->
<div class="modal fade" id="MyMessage_1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content"  style="width: 800px;margin-left: -800px;">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    详情>>
                </h4>
            </div>
            <div class="modal-body">
                <table id="table_21" border="1" ></table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary">
                    提交更改
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<div hidden style="width: 100px">

</div>
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
                                    <a href="/jsp/personalCenter/mySpace/myFavorite.jsp" class="org">我的信息</a>
                                </p>
                            </div>
                            <div class="fr page_c" id="page_show"></div>
                        </div>
                        <div id="ccc" style="height: 500px">
                                <table id="table_1" border="1" ></table>


                        </div>
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