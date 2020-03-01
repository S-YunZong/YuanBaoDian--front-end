<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/11/20
  Time: 9:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link rel="stylesheet" href="${pageContext.request.contextPath }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css">
<link href="/static/guoda.com_files/css/common_space.css" rel="stylesheet" type="text/css">

<title>我的资料</title>
<%@include file="/jsp/personalCenter/myProfile/common/header.jsp" %>
<script>
    $(function () {
        gerenxinxi();
    })

    //个人信息
    function gerenxinxi() {
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
                    $("#userName").val(data.userName);
                    if (data.sex == 0) {
                        $("input[name='sex'][value='0']").attr("checked", true);
                    }
                    if (data.sex == 1) {
                        $("input[name='sex'][value='1']").attr("checked", true);
                    }
                    $("#tel").text(data.tel);
                    $("#email").text(data.email);
                    $("#tel").text(data.phone);
                    $("#position").val(data.position);
                    $("#integral").val(data.integral);
                    $("#quantizationIntegral").val(data.quantizationIntegral);
                    $("#J-m-imgFileImg").attr("src",data.pictureUrl);
                    if (data.email != null) {
                        $("#youxiang").attr("style", "");
                        $("#youxiang2").attr("style", "display:none");
                    } else {
                        $("#youxiang2").attr("style", "");
                        $("#youxiang").attr("style", "display:none");
                    }
                }
            }
        })
    }

    //保存
    function baocun() {
        var id =${user_session.id};
        var userName = $("#userName").val();
        var sex = $('input[name="sex"]:checked').val();
        if (id != null && id != '') {
            if (userName == null && userName == '') {
                mLayerMsg('昵称不能为空!');
                return false;
            };
            $.ajax({
                url: "/user/update_Personal",
                dataType: "json",
                type: "post",
                data: {
                    id: id,
                    userName: userName,
                    sex: sex
                },
                success: function (data) {
                    if (data) {
                        alert("保存成功！");
                        gerenxinxi();
                        location.reload();
                    } else {
                        alert("保存失败！");
                    }
                }
            })
        } else {
            alert("请重新登录！")
        }
    }
</script>
<body style="font-size: 12px">
<div class="col-md-12 column">
    <div class="row clearfix">
        <%@include file="/jsp/commet/grren.jsp" %>
        <div class="col-md-9 column">
            <%--个人中心--%>
            <div class="mainRight" id="profile_div">
                <div class="title">个人信息</div>
                <div class="tableForm">
                    <table>
                        <tbody>
                        <tr class="trBorder">
                            <td width="100">头像</td>
                            <td width="160"><img src="" width="140" height="140"
                                                 id="J-m-imgFileImg"/></td>
                            <td width="600">
                                <form class="s-m-imgForm" action="/user/update_Head"
                                      enctype="multipart/form-data" method="post" id="form1" name="upform" dotype="ajax"
                                      callback="form1">
                                    <input type="button" value="本地照片" class="ui_btn ui_org_btn" id="uploadImg">
                                    <input type="hidden" name="id" value="${user_session.id}">
                                    <input type="file" name="file" id="J-m-imgFile" class="s-m-file">
                                    <p class="gray mt10">仅支持JPG、PNG格式，文件小于3M。</p>
                                </form>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-top:10px;">昵称</td>
                            <td colspan="2" style="padding-top:10px;"><input type="text" id="userName"
                                                                             class="ui_inp ui_inp_big" value=""></td>
                        </tr>
                        <tr>
                            <td style="padding-top:10px;">职业</td>
                            <td colspan="2" style="padding-top:10px;"><input type="text" id="position"
                                                                             class="ui_inp ui_inp_big" readonly value=""></td>
                        </tr>
                        <tr>
                            <td style="padding-top:10px;">积分</td>
                            <td colspan="2" style="padding-top:10px;"><input type="text" id="integral"
                                                                             class="ui_inp ui_inp_big" readonly value=""></td>
                        </tr>
                        <tr>
                            <td style="padding-top:10px;">量化积分</td>
                            <td colspan="2" style="padding-top:10px;"><input type="text" id="quantizationIntegral"
                                                                             class="ui_inp ui_inp_big" readonly value=""></td>
                        </tr>
                        <tr>
                            <td>性别</td>
                            <td colspan="2">
                                <label class="radio-inline">
                                    <input type="radio" name="sex" value="1">男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="sex" value="0">女
                                </label>
                            </td>
                        </tr>
                        <tr style="display:none">
                            <form></form>
                            <td>手机号</td>
                            <td colspan="2">
                                <input type="button" value="立即绑定" class="ui_btn ui_org_btn abled" id="yzTel">
                            </td>
                        </tr>
                        <tr style="">
                            <td>手机号</td>
                            <td colspan="2">
                                <span class="gray" id="tel"></span>&nbsp;&nbsp;&nbsp;
                                <a href="/jsp/personalCenter/myProfile/update_phone.jsp" class="org j-m-change">修改</a>
                            </td>
                        </tr>
                        <tr style="" id="youxiang2">
                            <td>邮箱</td>
                            <td colspan="2">
                                <input type="button" value="立即绑定" class="ui_btn ui_org_btn abled" id="yzTel1">
                            </td>
                        </tr>
                        <tr style="display:none" id="youxiang">
                            <td>邮箱</td>
                            <td colspan="2">
                                <span class="gray" id="email"></span>
                                <a href="javascript:;" class="org j-m-change">修改</a>
                            </td>
                        </tr>
                        <tr style="">
                            <td>密码</td>
                            <td colspan="2">
                                <a href="/jsp/personalCenter/myProfile/update_password.jsp"
                                   class="org j-m-change">修改密码</a>
                            </td>
                        </tr>

                        <tr>
                            <td></td>
                            <td colspan="3">
                                <input id="save_button" onclick="baocun()" type="button" value="保存"
                                       class="ui_btn ui_org_btn">
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div><!--/clearfix-->


        </div>
    </div>
</div>
</body>

<%@include file="/jsp/personalCenter/myProfile/common/footer.jsp" %>

<!--毛群植2016.4.5：兴趣爱好添加的交互，-->

<!-- mqz 2016.5.14图片上传 -->
<script type="text/javascript" src="/static/guoda.com_files/js/jquery.form.js"></script>
<script>


    $("#weiboGoUnbind").on("click", function () {
        $.ajax({
            url: '/api/index.php?r=user/three-unbind&type=3',
            type: 'GET',
            dataType: 'json',
            success: function (data) {
                if (data == '20000') {
                    mLayerMsg('解绑成功');
                    window.location = "/index.php?r=user/index";
                } else {
                    mLayerMsg("解绑失败，请稍后重试");
                    window.location = "/index.php?r=user/index";
                }
            },
            error: function () {
            }
        });
    });


    $("#qqGoUnbind").on("click", function () {
        $.ajax({
            url: '/api/index.php?r=user/three-unbind&type=2',
            type: 'GET',
            dataType: 'json',
            success: function (data) {
                if (data == '20000') {
                    mLayerMsg('解绑成功');
                    window.location = "/index.php?r=user/index";
                } else {
                    mLayerMsg("解绑失败，请稍后重试");
                    window.location = "/index.php?r=user/index";
                }
            },
            error: function () {
            }
        });
    });


    (function () {
        var file = $('#J-m-imgFile');
        var img = $('#J-m-imgFileImg');

        file.change(function () {
            // debugger

            var f = $(this).val();

            if (!/\.(jpg|jpeg|png|JPG|PNG)$/.test(f)) {
                mLayerMsg('您上传的文件有误');
            }
            else {
                var options = {
                    success: function (txt) {
                        var txt = eval('(' + txt + ')');
                        if (txt) {
                            // alert("touxiang success");
                            //如果图片上传成功
                            alert("更换头像成功")
                            location.reload();

                        } else {
                            // console.log(txt);
                        }
                    }
                };
                file.parents("form").ajaxSubmit(options);
                return false;
            }

        })
    })();
</script>
<!--/clearfix-->
