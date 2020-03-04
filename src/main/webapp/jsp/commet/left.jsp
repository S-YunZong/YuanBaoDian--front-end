<%--
  Created by IntelliJ IDEA.
  User: 智慧
  Date: 2020/2/18
  Time: 13:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        .a:hover{
            background-color: pink;
            color: #fbfbfb;
            transform:scale(1.1);
        }
        .c{
            background-color: #ffffff;
            padding-top: 20px;
            height: 640px;
            text-align: center;
        }
        .a{
            background-color: #F5FAFC;
        }
    </style>
</head>
<body>
<div class="c">
    <%--<div class="a" style="height: 70px;border: #0C0C0C solid 1px;margin: 5px" onclick="zonghe()">
        <h3>综合答题</h3>
    </div>
    <div class="a"  style="height: 70px;border: #0C0C0C solid 1px;margin: 5px" onclick="chuagguan()">
        <h3>闯关答题</h3>
    </div>
    <div class="a"  style="height: 70px;border: #0C0C0C solid 1px;margin: 5px" onclick="zhenti()">
        <h3>真题题库</h3>
        <div style="margin: -30px 180px">
            <i class="iconfont iconsuo2"></i>
        </div>
    </div>--%>
</div>

<!-- 模态框（Modal） -->
<%--<div class="modal fade" id="zhantiModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">真题题库提示！</h4>
            </div>
            <div class="modal-body">
                当前模式需要完成闯关模式或者支付100积分方可解锁！
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="zhifu()">支付</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<!-- 确认支付模态框（Modal） -->
<div class="modal fade" id="zhifuModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">友情提示！</h4>
            </div>
            <div class="modal-body">
                是否确认支付100积分开启该关卡！
                <input type="hidden" id="integral">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" onclick="querenzhifu()">确认支付</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>--%>
</body>
<script>
    $(function () {
        jindu();//用户学习进度
    })
    /*支付确认*/
    /*function zhifu() {
        var id="{user_session.id}";
        zongjifen(id);//获取用户积分
        $("#zhifuModal").modal('show');
    }*/
    /*进行支付*/
    /*function querenzhifu() {
        var id="{user_session.id}";
        var integral=$("#integral").val();
        if(integral!=null&&integral!=""){
            var mm=integral-100;
            if(mm<0){
                alert("抱歉，您的积分不足");
            }else {
                updintegral(id,mm)
            }
        }
        $("#zhantiModal").modal('hide');
        $("#zhifuModal").modal('hide');
    }*/
    /*修改积分*/
    /*function updintegral(id,mm) {
        $.ajax({
            url: "/user/updintegral",
            type: "post",
            dataType: "json",
            data:{
                id:id,
                integral:mm
            },
            success: function (data) {
                if(data){
                    alert("恭喜您成功解锁真题库！")
                    window.location.reload();
                }
            }
        })
    }*/
    /*用户积分*/
    /*function zongjifen(id) {
        $.ajax({
            url: "/user/selintegral",
            type: "post",
            dataType: "json",
            data:{
                id:id
            },
            success: function (data) {
                if(data){
                    $("#integral").val(data);
                }
            }
        })
    }*/
    //查询用户进度
    function jindu() {
        var id="${user_session.id}";
        if(id!=null&&id!=""){
            $.ajax({
                url: "/user/selYbdUserAnswerRecord",
                type: "post",
                dataType: "json",
                data:{
                    id:id
                },
                success: function (data) {
                    if(data){
                        timutype(data.realTopicStatus)//查询模块
                    }
                },error:function (data) {
                    xinzeng(id);//新增用户进度
                }
            })
        }else {
            timutype(0)
        }
    }
    /*新增用户进度*/
    function xinzeng(id) {
        $.ajax({
            url: "/user/addYbdUserAnswerRecord",
            type: "post",
            dataType: "json",
            data: {
                id: id
            },
            success: function (data) {
                if(data){
                    jindu()
                }
            }
        })
    }
    /*查询模块*/
    function timutype(realTopicStatus) {
        $.ajax({
            url:"/user/selYbdQuestionType",
            type:"post",
            dataType:"json",
            success:function(data){
                var id="${user_session.id}";
                var m="";
                $(data).each(function (a,b) {
                    if(b.id==1){
                        m+="<div class=\"a\" style=\"height: 70px;margin: 5px\" onclick=\'zonghe("+b.id+")\'>\n" +
                            "        <h3 style='line-height:70px'>"+b.questionTypeName+"</h3>\n" +
                            "    </div>";
                    }
                    if(b.id==2){
                        if(id!=null&&id!=""){
                            m+="<div class=\"a\" style=\"height: 70px;margin: 5px\" onclick=\'chuangguan("+b.id+")\'>\n" +
                                "        <h3 style='line-height:70px'>"+b.questionTypeName+"</h3>\n" +
                                "    </div>";
                        }else {
                            m+="<div class=\"a\"  style=\"height: 70px;margin: 5px\" onclick=\'chuangguan("+0+")\'>\n" +
                                "        <h3 style='line-height:70px'>"+b.questionTypeName+"</h3>\n" +
                                "        <div style=\"margin: -50px 180px\">\n" +
                                "            <i class=\"iconfont iconsuo1\"></i>\n" +
                                "        </div>\n" +
                                "    </div>";
                        }
                    }
                    if(b.id==3){
                         /*if(id!=null&&id!=""&&realTopicStatus==0){
                            m+="<div class=\"a\"  style=\"height: 70px;border: #0C0C0C solid 1px;margin: 5px\" onclick=\'zhenti("+b.id+","+realTopicStatus+")\'>\n" +
                                "        <h3>"+b.questionTypeName+"</h3>\n" +
                                "        <div style=\"margin: -30px 180px\">\n" +
                                "            <i class=\"iconfont iconsuo2\"></i>\n" +
                                "        </div>\n" +
                                "    </div>";
                        }else*/ if(id!=null&&id!=""){
                            m+="<div class=\"a\" style=\"height: 70px;margin: 5px\" onclick=\'zhenti("+b.id+","+realTopicStatus+")\'>\n" +
                                "        <h3 style='line-height:70px'>"+b.questionTypeName+"</h3>\n" +
                                "    </div>";
                        }else{
                            m+="<div class=\"a\"  style=\"height: 70px;margin: 5px\" onclick=\'zhenti("+0+","+realTopicStatus+")\'>\n" +
                                "        <h3 style='line-height: 70px'>"+b.questionTypeName+"</h3>\n" +
                                "        <div style=\"margin: -50px 180px\">\n" +
                                "            <i class=\"iconfont iconsuo1\"></i>\n" +
                                "        </div>\n" +
                                "    </div>";
                        }
                    }
                })
                $(".c").html(m)
            }
        })
    }
    /*学前教育*/
    function zonghe(typeid) {
        $("#urljsp").attr("src", "/jsp/exam/zonghe/zongHe.jsp?typeid="+typeid);
    }
    /*闯关答题*/
    function chuangguan(typeid) {
        if(typeid!=0){
            $("#urljsp").attr("src", "/jsp/exam/chuangguan/chuangguan.jsp?typeid="+typeid);
        }else {
            alert("当前模式需要登录！");
        }

    }
    /*真题题库*/
    function zhenti(typeid,realTopicStatus) {
        if(typeid==0){
            alert("当前模式需要登录！");
        }/*else if(typeid!=0&&realTopicStatus==0){
            $("#zhantiModal").modal('show');
        }*/else {
            $("#urljsp").attr("src", "/jsp/exam/zhenti/zhanti.jsp?typeid="+typeid);

        }
    }

</script>
</html>
