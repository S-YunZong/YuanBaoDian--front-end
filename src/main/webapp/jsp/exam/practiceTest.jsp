<%--
  Created by IntelliJ IDEA.
  User: 智慧
  Date: 2020/2/17
  Time: 15:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="/jsp/commet/header.jsp" %>

</head>
<body>
<div class="second" style="width: 100%;height:auto;background-color: #EEEEEE">
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <!-- Header  头部 -->
                    <%@include file="/jsp/commet/top.jsp" %>
                </div>
            </div>
            <div style="height: 50px"></div>
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <%--选项--%>
                    <div class="row clearfix" style="margin: 30px 0px">
                        <div class="col-md-3 column">
                            <!-- 左列表 -->
                            <%@include file="/jsp/commet/left.jsp" %>
                        </div>

                        <div class="col-md-9 column">
                            <iframe src="/jsp/exam/zonghe/zongHe.jsp" style="height: 640px;width: 840px;border: none" id="urljsp"></iframe>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <!-- 尾部 -->
                    <%@include file="/jsp/commet/bottom.jsp" %>
                </div>
            </div>
        </div>
    </div>
</div>

</body>

</html>
