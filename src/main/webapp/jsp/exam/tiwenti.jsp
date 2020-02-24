<%--
  Created by IntelliJ IDEA.
  User: 智慧
  Date: 2020/2/22
  Time: 20:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<!-- 模态框（Modal） -->
<div class="modal fade" id="tiwenModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">提出疑问？</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label>
                        <%--题目--%>
                        <span id="timuu"></span>
                            <%--出题人--%>
                        <p id="chutiren" style="margin: 0px 220px"></p>
                            <%--出题人id--%>
                        <span id="chutirenid" style="display: none"></span>
                            <%--题目id--%>
                        <span id="timuid" style="display: none"></span>
                    </label>
                    <textarea class="form-control" id="description" rows="3"></textarea>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="tijiao()">提交</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</body>
<script>
    /*提交疑问*/
    function tijiao(){
        var userid="${user_session.id}";
        if(userid!=null && userid!="") {
            var chutirenid = $("#chutirenid").text();
            var timuid = $("#timuid").text();
            var description = $("#description").val();
            $.ajax({
                url: "/user/insYbdPutQuestionsTo",
                type: "post",
                dataType: "json",
                data: {
                    objectUserId: chutirenid,
                    startUserId:userid,
                    questionBackId: timuid,
                    description: description
                },
                success: function (data) {
                    if (data) {
                        alert("提交成功！");
                        $("#tiwenModal").modal('hide');
                    } else {
                        alert("提交失败！");
                    }
                }
            })
        }else {
            alert("登录后才能提问！")
        }
    }
</script>
</html>
