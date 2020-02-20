<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/11/20
  Time: 9:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>实名认证</title>
</head>
<body>
<%@include file="/jsp/personalCenter/myProfile/common/header.jsp" %>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="row clearfix">
                <%@include file="/jsp/commet/grren.jsp" %>
                <div class="col-md-10 column">
                    <div class="mainRight">

                        <form class="layui-form" action="" style="margin-top: 80px">
                            <div class="layui-form-item">
                                <label class="layui-form-label" style="width: 100px">真实姓名：</label>
                                <div class="layui-input-block" style="width: 400px">
                                    <input type="text" id="realname" required lay-verify="required"
                                           placeholder="请输入真实姓名" autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label" style="width: 100px">身份证：</label>
                                <div class="layui-input-block" style="width: 400px">
                                    <input type="text" id="IDNumber" required lay-verify="required" placeholder="请输入身份证"
                                           autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <div class="layui-input-block">
                                    <button class="layui-btn layui-btn-radius" onclick="shimingrenzheng()" type="button"
                                            lay-submit lay-filter="formDemo">立即提交
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    function shimingrenzheng() {

        var name = $("#realname");
        var ID = $("#IDNumber");
        var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
        if (!name.val()) {
            alert("姓名不能为空！");
            return false;
        }

        if (!ID.val()) {
            alert("身份不能为空！");
            return false;
        }

        if (!reg.test(ID.val())) {
            alert("请输入正确的身份证！");
            return false;
        }
        $.ajax({
            type: "POST",    //请求方式
            url: "http://apis.juhe.cn/idcard/index",
            data: {"key": "be2a28b5926b77171451b23df0ecf7bc", "cardno": ID.val()},    //请求参数
            dataType: "jsonp",    //跨域json请求一定是jsonp
            crossDomain: true,//如果加了jsonp还不行 加个crossDomain: true
            success: function (data) {
                if (data.resultcode == '200') {
                    update_usermess();
                } else {
                    alert("身份证错误！");
                }
            },
            error: function () {
                alert("异常！");
            }
        });
    }

    //修改
    function update_usermess() {
        var id =${param.userid};
        var name = $("#realname").val();
        var ID = $("#IDNumber").val();
        alert(ID);
        $.ajax({
            url: "/user/updshenfen",
            dataType: "json",
            type: "post",
            data: {
                id: id,
                idNumber: ID,
                realname: name
            },
            success: function (data) {
                if (data) {
                    alert("认证成功！");
                } else {
                    alert("认证失败！");
                }
            }
        })
    }
</script>
</body>
</html>
