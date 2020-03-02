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
        #fanhui{
            position: absolute;
            top:0px;
            left: 20px;
        }
        #fanhui2{
            position: absolute;
            top:20px;
        }

        #biaoti{
            position: absolute;
            left: 30px;
        }
    </style>
</head>
<body>
<%--章节--%>
<div class="container" id="container1" style="display: block">
    <div class="row clearfix">
        <div class="col-md-12 column" id="chuangguan">
            <h1 style="margin: 40px 280px">闯关答题</h1>
            <%--<div class="b" style="height: 150px;border: #0C0C0C solid 1px;margin: 5px;text-align: center">
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
            </div>--%>
        </div>
    </div>
</div>
<%--关卡--%>
<div class="container" id="container2" style="display: none">
    <div class="row clearfix">
        <div class="col-md-12 column" id="guanqia">
            <h2 style="margin: 10px 220px">
                <span>闯关答题</span>
                <span id="zhangjie"></span>
            </h2>
            <button type="button" id="fanhui" class="btn btn-default">返回</button>
            <%--<div class="b" style="height: 100px;border: #0C0C0C solid 1px;margin: 5px;text-align: center">
                <h3 style="margin: 40px">
                    1-1~1-5
                </h3>
            </div>
            <div class="b" style="height: 100px;border: #0C0C0C solid 1px;margin: 5px;text-align: center">
                <h3 style="margin: 40px">
                    1-6~1-10
                </h3>
                <div style="margin: -30px">
                    <i class="iconfont iconsuo1"></i>
                </div>
            </div>
            <div class="b" style="height: 100px;border: #0C0C0C solid 1px;margin: 5px;text-align: center">
                <h3 style="margin: 40px">
                    2-1~2-5
                </h3>
                <div style="margin: -30px;">
                    <i class="iconfont iconsuo1"></i>
                </div>
            </div>
            <div class="b" style="height: 100px;border: #0C0C0C solid 1px;margin: 5px;text-align: center">
                <h3 style="margin: 40px">
                    2-1~2-5
                </h3>
                <div style="margin: -30px;">
                    <i class="iconfont iconsuo1"></i>
                </div>
            </div>
            <div class="b" style="height: 100px;border: #0C0C0C solid 1px;margin: 5px;text-align: center">
                <h3 style="margin: 40px">
                    2-1~2-5
                </h3>
                <div style="margin: -30px;">
                    <i class="iconfont iconsuo1"></i>
                </div>
            </div>--%>

        </div>
    </div>
</div>
<%--答题--%>
<div class="container" id="container3" style="display: none">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div style="width: 610px;height: 390px;margin: 0px -50px">
                <h3 id="biaoti">
                    <span>闯关答题</span>
                    <span id="zhangjie2"></span>
                    <span id="guanqia2"></span>
                    <span id="guanqia_id" style="display: none"></span>
                </h3>
                <button type="button" id="fanhui2" class="btn btn-default">返回</button>
                <div style="margin: 0px 100px"  id="timu">
                    &nbsp;<br>&nbsp;
                    <h3>
                        <span id="c-shumu"></span>&nbsp;
                        <span id="c-timu"></span>
                    </h3>
                    <p id="c-chutiren"></p>
                </div>
                &nbsp;<br>
                <%--选项--%>
                <div style="margin: 0px 100px" id="c-xuanxiang">
                    <%--<label class="radio-inline">
                        <input type="radio" name="option" id="option1" value="1"> A:狼
                    </label><br>
                    <label class="radio-inline">
                        <input type="radio" name="option" id="option2"  value="2"> B:weq
                    </label><br>
                    <label class="radio-inline">
                        <input type="radio" name="option" id="option3" value="3"> C:fd
                    </label><br>
                    <label class="radio-inline">
                        <input type="radio" name="option" id="option4"  value="4"> D:ds
                    </label>--%>
                </div>
                &nbsp;<br>&nbsp;
                <div id="anniou">
                    <button type="button" class="btn btn-success" onclick="shangyiye(this)" style="margin: 0px 100px">上一题</button>
                    <button type="button" class="btn btn-success" onclick="xiayiye(this)">下一题</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <button type="button" class="btn btn-default" id="collect" onclick="shoucang()">收藏</button>
                    <span id="timuid" style="display: none"></span>
                    <input type="hidden" id="integral">
                </div>
                &nbsp;<br>&nbsp;
                <%--解析--%>
                <div id="div3" style="border:#EEEEEE solid 2px;width: 600px;height: 200px;">
                    <h3 style="margin: 20px 50px">
                        试题讲解：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <i class="iconfont iconiconfontweibiaoti1" onclick="wenti()"></i>
                    </h3>
                    <div style="overflow: auto; width: 500px;height:130px;margin: -10px 80px;">
                        <h5 id="c-jiangjie" style="display: none"></h5>
                    </div>
                </div>
            </div>
            <%--题号列表--%>
            <div style="overflow: auto;width: 200px;height: 590px;margin: -390px 570px">
                <div class="btn-group" id="c-xuanti" style="margin: 0px 1px">
                    <%--<button type="button" class="btn btn-default" style="background-color: #4cae4c">1</button>
                    <button type="button" class="btn btn-default" style="background-color: #ff3737">2</button>
                   --%>
                </div>
            </div>
        </div>
    </div>
</div>
<%--提出疑问--%>
<%@include file="/jsp/exam/tiwenti.jsp" %>
</body>
<script>
    $(function () {
        zhangjie()//获取章节
    })
    /*关卡返回*/
    $("#fanhui").click(function () {
        $("#container1").attr("style","display:block");
        $("#container2").attr("style","display:none");
        $("#guanqia > div").remove();
    })
    /*答题返回*/
    $("#fanhui2").click(function () {
        $("#container1").attr("style","display:none");
        $("#container2").attr("style","display:block");
        $("#container3").attr("style","display:none");
    })
    /*查询章节进度*/
    function xuexijindu() {
        var id="${user_session.id}";
        $.ajax({
            url: "/user/selYbdUserAnswerRecord",
            type: "post",
            dataType: "json",
            data:{
                id:id
            },
            success: function (data) {
                if(data){
                    if(data.chapterSerialNumber<=5){
                        if($("#zhang2").find("div").length<=0){
                            $("#zhang2").append("<div style=\"margin: -50px;\">\n" +
                                "                    <i class=\"iconfont iconsuo1\"></i>\n" +
                                "                </div>");
                        }
                        if($("#zhang3").find("div").length<=0){
                            $("#zhang3").append("<div style=\"margin: -50px;\">\n" +
                                "                    <i class=\"iconfont iconsuo1\"></i>\n" +
                                "                </div>");
                        }
                    }else if(data.chapterSerialNumber<=10){
                        if($("#zhang3").find("div").length<=0){
                            $("#zhang3").append("<div style=\"margin: -50px;\">\n" +
                                "                    <i class=\"iconfont iconsuo1\"></i>\n" +
                                "                </div>");
                        }
                    }else if(data.chapterSerialNumber>15){
                        updzhanti(id);//解锁真题题库
                    }
                    for(var i=data.chapterSerialNumber+1;i<16;i++){
                        $("#guanqia div[name='guan"+i+"']").append("<div style=\"margin: -20px;\">\n" +
                            "                    <i class=\"iconfont iconsuo1\"></i>\n" +
                            "                </div>");
                    }
                }
            }
        })
    }
    /*修改真题题库状态*/
    function updzhanti(id) {
        $.ajax({
            url: "/user/updzhanti",
            type: "post",
            dataType: "json",
            data:{
                id:id
            },
            success: function (data) {

            }
        })
    }
    /*加载章节*/
    function zhangjie() {
        $.ajax({
            url:"/user/ybdChapterList",
            type:"post",
            dataType:"json",
            data:{},
            success:function (data) {
                if(data){
                    var mm="";
                    $(data).each(function (a,b) {
                        mm+="<div class=\"b\" id=\'zhang"+b.id+"\' onclick=\"guanqia("+b.id+",'"+b.chapterName+"',this)\" style=\"height: 150px;border: #0C0C0C solid 1px;margin: 5px;text-align: center;\">\n" +
                            "                <h3 style=\"margin: 60px\">\n" +
                            "                    "+b.chapterName+"\n" +
                            "                </h3>\n" +
                            "            </div>";
                    })
                    $("#chuangguan").append(mm);
                    xuexijindu();//学习进度
                }
            }
        })
    }
    /*关卡展示*/
    function guanqia(id,name,th) {
        if($(th).find("div").length>0){
            alert("请先完成上一章节");
        }else {
            zongjifen()//查询用户积分
            $("#container2").attr("style","display:block");
            $("#container1").attr("style","display:none");
            $("#zhangjie").html(" - "+name)
            $("#zhangjie2").html(" - "+name)
            $.ajax({
                url: "/user/ybdGameLevelList",
                type: "post",
                dataType: "json",
                data: {
                    id:id
                },
                success: function (data) {
                    if(data){
                        var mm="";
                        $(data).each(function (a,b) {
                            mm+="<div class=\"b\" name=\'guan"+b.id+"\' onclick=\"zhanshidati("+b.id+",'"+b.gameLevelName+"',this)\" style=\"height: 100px;border: #0C0C0C solid 1px;margin: 5px;text-align: center\">\n" +
                                "                <h3 style=\"margin: 20px\">\n" +
                                "                    "+b.gameLevelName+"<br>\n" +
                                "                奖励:50积分</h3>\n" +
                                "            </div>";
                        })
                        $("#guanqia").append(mm);
                        xuexijindu();//学习进度
                    }
                }
            })
        }
    }
    /*查看是否收藏*/
    function see() {
        var phone="${user_session.phone}";
        var timuid=$("#timuid").text();
        if(phone!=null && phone!=""){
            seecollect(timuid,phone)
        }
    }
    /*点击收藏*/
    function shoucang() {
        var phone="${user_session.phone}";
        var timuid=$("#timuid").text();
        if(phone!=null && phone!=""){
            var mm=$("#collect").text();
            if(mm=="收藏"){
                collect(timuid,phone)
            }else {
                cancelcollect(timuid,phone)
            }
        }else {
            alert("登录后才能收藏！")
        }
    }
    /*点击提问*/
    function wenti() {
        var userid="${user_session.id}";
        if(userid!=null && userid!="") {
            $("#tiwenModal").modal('show');
            var mm=$("#c-timu").html();
            var mn=$("#c-chutiren").html();
            $("#timuu").html(mm)
            $("#chutiren").html(mn);
        }else {
            alert("登录后才能提问！");
        }
    }
    /*上一页*/
    function shangyiye(t) {
        $("#c-jiangjie").attr("style","display:none");//隐藏解释
        var mm=$("#c-shumu").html();
        var page=mm.substr(0,mm.indexOf('/'))-1;//当前页数
        if(page<=0){
            alert("当前是第一题！")
        }else {
            $(t).next().text("下一题")
            redisfenye(page);
        }
    }
    /*下一页*/
    function xiayiye(t) {
        $("#c-jiangjie").attr("style","display:none");//隐藏解释
        var mm=$("#c-shumu").html();
        var page=parseInt(mm.substr(0,mm.indexOf('/')))+1;//当前页数
        var ss=mm.substr(mm.indexOf('/') + 1);//总页数
        if(page==ss){
            $(t).text("完成练习");
            redisfenye(page);
        }else if(page>ss){
            var s=parseInt(ss);
            var zhengque=0;
            var meizuowan=0;
            for(var i=1;i<=s;i++){
                var color=$("#c-xuanti > input[value='"+i+"']").attr("style");
                var q=color.substr(color.indexOf('#'));
                if(q=="#4cae4c"){
                    zhengque++;
                }else if(q!="#4cae4c"&&q!="#ff3737"){
                    meizuowan++;
                }
            }
            if(meizuowan==0){//习题已经做完
                jindu2(zhengque)
            }else {
                alert("你还剩"+meizuowan+"道题没答完！")
            }
        }else {
            redisfenye(page);
        }
    }
    /*用户进度查询*/
    function jindu2(zhengque) {
        var id="${user_session.id}";
        $.ajax({
            url: "/user/selYbdUserAnswerRecord",
            type: "post",
            dataType: "json",
            data:{
                id:id
            },
            success: function (data) {
                if(data){
                    var guanqia_id=$("#guanqia_id").text();
                    if(data.chapterSerialNumber==guanqia_id){
                        updjifen(zhengque);
                    }else {
                        $("#container1").attr("style","display:none");
                        $("#container2").attr("style","display:block");
                        $("#container3").attr("style","display:none");
                    }
                }
            }
        })
    }
    /*用户积分*/
    function zongjifen() {
        var id="${user_session.id}";
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
    }
    /*计算总积分*/
    function updjifen(zhengque) {
        var id="${user_session.id}";
        var integral=$("#integral").val();
        if(integral!=null&&integral!=""){
            var mm=parseInt(integral)+parseInt(zhengque);
            updintegral(id,mm,zhengque)
        }
    }
    /*修改积分,用户进度*/
    function updintegral(id,mm,zhengque) {
        var guanqia_id=$("#guanqia_id").text();
        var s=parseInt(guanqia_id)+1;
        $.ajax({
            url: "/user/updintegral",
            type: "post",
            dataType: "json",
            data:{
                id:id,
                integral:mm,
                chapterSerialNumber:s
            },
            success: function (data) {
                if(data){
                    alert("恭喜您获得"+zhengque+"积分！");
                    window.location.reload();
                }
            }
        })
    }
    /*点击跳转指定习题*/
    function xuanxiang(page) {
        $("#c-jiangjie").attr("style","display:none");
        redisfenye(page)
        var mm=$("#c-shumu").html();
        var ss=mm.substr(mm.indexOf('/') + 1);//总页数
        if(page==ss){
            $("button:contains('下一题')").text("完成练习");
        }else{
            $("button:contains('完成练习')").text("下一题");
        }
    }
    /*选择后*/
    function xuanze(x,z,t) {
        var phone="${user_session.phone}";//手机号
        if(phone!=null && phone!=""){
            var timuid=$("#timuid").text();//题目id
            var mm=$("#c-shumu").html();
            var page=parseInt(mm.substr(0,mm.indexOf('/')));//当前页数
            Record(phone,timuid,x,z);//习题记录redis phone手机号 timuid题目id  x自选答案  z正确答案
            $("#c-xuanxiang input[name='option']").attr("disabled",true);//选择后禁止在选
            $("#c-jiangjie").attr("style","display:block");//展示解析
            if(x==z){
                $(t).parent().css("color","#4cae4c");//改变正确答案的颜色
                $("#c-xuanti input[value='"+page+"']").attr("style","width: 50px;background-color:#4cae4c");//改变选项列表字体颜色

            }else {
                $("#c-xuanxiang input[value='"+z+"']").parent().css("color","#4cae4c");//改变正确答案的颜色
                $("#c-xuanti input[value='"+page+"']").attr("style","width: 50px;background-color:#ff3737");//改变选项列表字体颜色
                $(t).parent().css("color","#ff3737");//改变错误答案颜色
                cuoti(timuid,x);//错题录入
            }
        }else {
            alert("登录后才能做题！")
        }
    }
    /*持久化选项列表的颜色*/
    function xuanxiangliebiao() {
        var timuid=$("#timuid").text();//题目id
        var phone="${user_session.phone}";//手机号
        $.ajax({
            url: "/redis/RECORD_allHash",
            type: "post",
            dataType: "json",
            data: {
                phone: phone
            },
            success: function (data) {
                if(data.length!=0){
                    var mm=$("#c-shumu").html();
                    var page=parseInt(mm.substr(0,mm.indexOf('/')));//当前页数
                    for (var i=0;i<data.length;i++) {
                        var timu=parseInt(data[i].substr(0,data[i].indexOf(',')));//题目
                        var answer=parseInt(data[i].substr(data[i].indexOf(',') + 1));//正确
                        var zixuan=parseInt(data[i].substr(data[i].indexOf(',') + 3));//错误
                       if(timu==timuid){
                           if(zixuan==answer){//判断选的答案和正确的答案是否一样
                               /*$("#c-xuanti input[value='"+page+"']").attr("style","width: 50px;background-color: #4cae4c");*///改变选项列表字体颜色
                               $("#c-xuanxiang input[value='"+answer+"']").parent().css("color","#4cae4c");//改变正确答案的颜色
                           }else {
/*
                               $("#c-xuanti input[value='"+page+"']").attr("style","width: 50px;background-color: #ff3737");//改变选项列表字体颜色
*/
                               $("#c-xuanxiang input[value='"+answer+"']").parent().css("color","#4cae4c");//改变正确答案的颜色
                               $("#c-xuanxiang input[value='"+zixuan+"']").parent().css("color","#ff3737");//改变错误答案的颜色
                           }
                           $("#c-xuanxiang input[name='option']").attr("disabled",true);//选择后禁止在选
                           $("#c-jiangjie").attr("style","display:block");//展示解析
                           $("#c-xuanxiang input[value='"+zixuan+"']").attr("checked",true);
                       }
                    }
                }else {

                }
            }
        })
    }
    /*展示答题页面*/
    function zhanshidati(id,name,th) {
        if($(th).find("div").length>0){
            alert("请先完成上一关卡");
        }else {
            var phone="${user_session.phone}";
            if(phone!=null && phone!="") {
                $("#container3").attr("style", "display:block");
                $("#container2").attr("style", "display:none");
                $("#container1").attr("style", "display:none");
                $("#guanqia2").html(" - " + name)
                $("#guanqia_id").html(id)
                $("button:contains('完成练习')").text("下一题");
                redisfenye(0);
            }else {
                alert("登录后才能享受闯关乐趣！")
            }
        }
    }
    /*带做过题的数据跳转分页查询*/
    function redisfenye(page) {
        var phone="${user_session.phone}";
        $.ajax({
            url: "/redis/RECORD_allHash",
            type: "post",
            dataType: "json",
            data: {
                phone: phone
            },
            success: function (data) {
                chaxuntiku(page,data);
            }
        })
    }
    /*分页展示题库*/
    function chaxuntiku(page,redti) {
        var gameLevelId=$("#guanqia_id").text();
        var p=page || 1;
        $.ajax({
            url:"/user/chuangYbdQuestionBack",
            type:"post",
            dataType:"json",
            data:{
                offset:p-1,
                limit:1,
                questionTypeId:${param.typeid},
                gameLevelId:gameLevelId
            },
            success:function (data) {
                if(data.total!=0){
                    var shang="";
                    var xia="";
                    //当前页/总页数
                    $("#c-shumu").html(data.offset+1+"/"+data.total);
                    var timu="";//redis存的题目id
                    var timu2="";//查出来的题目id
                    var answer="";//正确答案
                    var zixuan="";//错误答案
                    var o=0;//选项数组按钮的题号
                    for (var t=0;t<data.timuid.length;t++){
                        var p=0;
                        timu2=parseInt(data.timuid[t]);
                        o++;
                        if(redti.length!=0) {
                            for (var y = 0; y < redti.length; y++) {
                                timu = parseInt(redti[y].substr(0, redti[y].indexOf(',')));//题目
                                answer = parseInt(redti[y].substr(redti[y].indexOf(',') + 1));//正确
                                zixuan = parseInt(redti[y].substr(redti[y].indexOf(',') + 3));//错误
                                if (timu == timu2) {//题目id相匹配
                                    p++;
                                    if (zixuan == answer) {//判断选的答案和正确的答案是否一样
                                        xia += "<input onclick=\'xuanxiang(" + o + ")\' type=\"button\" class=\"btn btn-default\" style=\"width: 50px;background-color: #4cae4c\" value='" + o + "'>";
                                    } else {
                                        xia += "<input onclick=\'xuanxiang(" + o + ")\' type=\"button\" class=\"btn btn-default\" style=\"width: 50px;background-color: #ff3737\" value='" + o + "'>";
                                    }
                                    break;
                                }
                            }
                            if(p==0){//说明题目id没有匹配过
                                if(page==o||p==o){
                                    xia+="<input onclick=\'xuanxiang("+o+")\' type=\"button\" class=\"btn btn-default\" style=\"width: 50px;background-color: #E6E6E6\" value='"+o+"'>";
                                }else {
                                    xia+="<input onclick=\'xuanxiang("+o+")\' type=\"button\" class=\"btn btn-default\" style=\"width: 50px\" value=\'"+o+"\'>";
                                }
                            }
                        }else {
                            if(page==o||p==o){
                                xia+="<input onclick=\'xuanxiang("+o+")\' type=\"button\" class=\"btn btn-default\" style=\"width: 50px;background-color: #E6E6E6\" value='"+o+"'>";
                            }else {
                                xia+="<input onclick=\'xuanxiang("+o+")\' type=\"button\" class=\"btn btn-default\" style=\"width: 50px\" value=\'"+o+"\'>";
                            }
                        }
                        continue;
                    }
                    //习题题号
                    $("#c-xuanti").html(xia);
                    $(data.rows).each(function (a,b) {
                        //题目
                        $("#c-timu").html(b.questionBack);
                        //出题人
                        $("#c-chutiren").html("—— "+b.userName);
                        $("#chutirenid").html(b.createUser);//出题人id
                        $("#timuid").html(b.id);//题目id
                        //习题讲解
                        $("#c-jiangjie").html(b.analysis);
                        $(b.optionList).each(function (c,d) {
                            var xu="";
                            if(d.option=="1"){
                                xu+="A: ";
                            }
                            if(d.option=="2"){
                                xu+="B: ";
                            }
                            if(d.option=="3"){
                                xu+="C: ";
                            }
                            if(d.option=="4"){
                                xu+="D: ";
                            }
                            shang+="<label class=\"radio-inline\">\n" +
                                "        <input type=\"radio\" onclick=\'xuanze("+d.option+","+b.answer+",this)\' id=\'option"+d.option+"\' name=\"option\" value=\'"+d.option+"\'>"+xu+""+d.optionDescribe+"\n" +
                                "   </label><br>";
                        })
                    })
                    //选项
                    $("#c-xuanxiang").html(shang);
                    xuanxiangliebiao()    /*持久化选项列表的颜色*/
                    see();//查看是否收藏
                }else {
                    $("#c-timu").html("当前没有考题可做！");
                }
            }
        })
    }
    /*错题录入*/
    function cuoti(questionBackId,errorOption) {
    var id="${user_session.id}";
        $.ajax({
            url:"/user/insYbdWrongTopicRecord",
            type:"post",
            dataType:"json",
            data:{
                questionBackId:questionBackId,
                userId:id,
                errorOption:errorOption
            },
            success:function (data) {
                if(data){
                    alert("错题录入成功");
                }
            }
        })
    }
</script>
</html>
