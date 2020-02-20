<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/11/20
  Time: 9:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>证件信息</title>
</head>
<body>
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css">
<%@include file="/jsp/personalCenter/myProfile/common/header.jsp" %>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="row clearfix">
                <%@include file="/jsp/commet/grren.jsp" %>

                <div class="col-md-10 column">
                    <div class="mainRight">

                        <div class="tableForm">
                            <table>
                                <tbody>
                                <tr>
                                    <td width="90">真实姓名</td>
                                    <td width="800" id="name">
                                    </td>
                                </tr>
                                <tr>
                                    <td>证件类型</td>
                                    <td colspan="2">
                                        身份证
                                    </td>
                                </tr>
                                <tr>
                                    <td>证件号码</td>
                                    <td>
                                        <div class="m-pos_parent" id="ID">
                                        </div>
                                    </td>

                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(function () {
        alert(1)
        var id =${param.userid};
        alert(id)
        $.ajax({
            url: "/user/getguser",
            dataType: "json",
            type: "post",
            data: {
                id: id
            },
            success: function (data) {
                if (data) {
                    alert(data.realname)
                    $("#name").text(data.realname);
                    $("#ID").text(data.idNumber);
                } else {

                }
            }
        })
    })
</script>
</body>
</html>
