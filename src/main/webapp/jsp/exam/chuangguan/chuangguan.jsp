<%--
  Created by IntelliJ IDEA.
  User: 智慧
  Date: 2020/2/17
  Time: 20:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="/jsp/commet/header.jsp" %>
    <style>
        .b:hover{
            background-color: #ec971f;
            color: #fbfbfb;
            transform:scale(1.1);
        }
        .b{
            background-color: #F5FAFC;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <h1 style="margin: 40px 280px">闯关答题</h1>
            <div class="b" style="height: 150px;border: #0C0C0C solid 1px;margin: 5px;text-align: center">
                <h3 style="margin: 40px">
                    1-1~1-5<br>
                    奖励：10积分
                </h3>
            </div>
            <div class="b" style="height: 150px;border: #0C0C0C solid 1px;margin: 5px;text-align: center">
                <h3 style="margin: 40px">
                    1-6~1-10<br>
                    请先解锁1-1~1-5
                </h3>
                <div style="margin: -30px">
                    <i class="iconfont iconsuo1"></i>
                </div>
            </div>
            <div class="b" style="height: 150px;border: #0C0C0C solid 1px;margin: 5px;text-align: center">
                <h3 style="margin: 40px">
                    2-1~2-5<br>
                    请先解锁1-6~1-10
                </h3>
                <div style="margin: -30px;">
                    <i class="iconfont iconsuo1"></i>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    $(function () {

    })
    /*加载章节*/
    function zhangjie() {
        $.ajax({
            url:"",
            type:"post",
            dataType:"json",
            data:{},
            success:function (data) {

            }
        })
    }
</script>
</html>
