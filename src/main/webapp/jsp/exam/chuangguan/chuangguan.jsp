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
         #div3{
             position: absolute;
             top: 390px;
             right: 180px;
         }
        #c-chutiren{
            position: absolute;
            right: 330px;
        }
        #c-xuanxiang{
            position: absolute;
            top: 170px;
        }
        #timu{
            position: absolute;
            top: 60px;
        }
        #anniou{
            position: absolute;
            top: 300px;
        }
        #biaoti{
            position: absolute;
            left: 30px;
        }
        .iconiconfontweibiaoti1{
            position: absolute;
            top: 15px;
            left: 560px;
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
                    <h3>
                        <span id="c-shumu"></span>&nbsp;
                        <span id="c-timu"></span>
                    </h3>
                    <p id="c-chutiren" style="margin: 0px -500px"></p>
                </div>
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
                <div id="anniou">
                    <button type="button" class="btn btn-success" onclick="shangyiye(this)" style="margin: 0px 100px">上一题</button>
                    <button type="button" class="btn btn-success" onclick="xiayiye(this)">下一题</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <button type="button" class="btn btn-default" id="collect" onclick="shoucang()">收藏</button>
                    <span id="timuid" style="display: none"></span>
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
            <%--解析--%>
            <div id="div3" style="border:#EEEEEE solid 2px;width: 600px;height: 200px;">
                <h3 style="margin: 20px 50px">试题讲解：</h3>
                <i class="iconfont iconiconfontweibiaoti1" onclick="wenti()"></i>
                <div style="overflow: auto; width: 500px;height:130px;margin: -10px 80px;">
                    <h5 id="c-jiangjie" style="display: none"></h5>
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
        zhangjie()
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
                        mm+="<div class=\"b\" onclick=\"guanqia("+b.id+",'"+b.chapterName+"')\" style=\"height: 150px;border: #0C0C0C solid 1px;margin: 5px;text-align: center;\">\n" +
                            "                <h3 style=\"margin: 60px\">\n" +
                            "                    "+b.chapterName+"\n" +
                            "                </h3>\n" +
                            "            </div>";
                    })
                    $("#chuangguan").append(mm);
                }
            }
        })
    }
    /*关卡展示*/
    function guanqia(id,name) {
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
                        mm+="<div class=\"b\" onclick=\"zhanshidati("+b.id+",'"+b.gameLevelName+"')\" style=\"height: 100px;border: #0C0C0C solid 1px;margin: 5px;text-align: center\">\n" +
                            "                <h3 style=\"margin: 20px\">\n" +
                            "                    "+b.gameLevelName+"<br>\n" +
                            "                奖励:10积分</h3>\n" +
                            "            </div>";
                    })
                    $("#guanqia").append(mm);
                }
            }
        })
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
            chaxuntiku(page)
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
            chaxuntiku(page);
        }else if(page>ss){
            map=[];
            $("#dati2").attr("style","display:none");
            $("#dati").attr("style","display:block");
        }else {
            chaxuntiku(page);
        }
    }
    /*点击跳转指定习题*/
    function xuanxiang(page) {
        $("#c-jiangjie").attr("style","display:none");
        chaxuntiku(page);
        var mm=$("#c-shumu").html();
        var ss=mm.substr(mm.indexOf('/') + 1);//总页数
        if(page==ss){
            $("button:contains('下一题')").text("完成练习");
        }else{
            $("button:contains('完成练习')").text("下一题");
        }
    }
    /*选择后*/
    var map = new Array();//创建map数组
    function xuanze(x,z,t) {
        var mm=$("#c-shumu").html();
        var page=parseInt(mm.substr(0,mm.indexOf('/')));//当前页数
        map.push({key:page,xvalue:x,zvalue:z});//存入map
        $("#c-xuanxiang input[name='option']").attr("disabled",true);//选择后禁止在选
        $("#c-jiangjie").attr("style","display:block");//展示解析
        if(x==z){
            $(t).parent().css("color","#4cae4c");//改变正确答案的颜色
            $("#c-xuanti input[value='"+z+"']").attr("style","width: 50px;background-color:#4cae4c");//改变选项列表字体颜色
        }else {
            $("#c-xuanxiang input[value='"+z+"']").parent().css("color","#4cae4c");//改变正确答案的颜色
            $("#c-xuanti input[value='"+z+"']").attr("style","width: 50px;background-color:#ff3737");//改变选项列表字体颜色
            $(t).parent().css("color","#ff3737");//改变错误答案颜色
        }
    }
    /*持久化选项列表的颜色*/
    function xuanxiangliebiao() {
        if(map != null && map.length > 0) {//查看map是否为空
            var mm=$("#c-shumu").html();
            var page=parseInt(mm.substr(0,mm.indexOf('/')));//当前页数
            for (var i = 0; i < map.length; i++) {
                if(map[i].xvalue==map[i].zvalue){//判断选的答案和正确的答案是否一样
                    $("#c-xuanti input[value='"+map[i].key+"']").attr("style","width: 50px;background-color: #4cae4c");//改变选项列表字体颜色
                }else {
                    $("#c-xuanti input[value='"+map[i].key+"']").attr("style","width: 50px;background-color: #ff3737");//改变选项列表字体颜色
                }
                if(map[i].key==page){
                    $("#c-xuanxiang input[name='option']").attr("disabled",true);//选择后禁止在选
                    $("#c-jiangjie").attr("style","display:block");//展示解析
                    $("#c-xuanxiang input[value='"+map[i].xvalue+"']").attr("checked",true);
                    if(map[i].xvalue==map[i].zvalue){//判断选的答案和正确的答案是否一样
                        $("#c-xuanxiang input[value='"+map[i].zvalue+"']").parent().css("color","#4cae4c");//改变正确答案的颜色
                    }else {
                        $("#c-xuanxiang input[value='"+map[i].zvalue+"']").parent().css("color","#4cae4c");//改变正确答案的颜色
                        $("#c-xuanxiang input[value='"+map[i].xvalue+"']").parent().css("color","#ff3737");//改变错误答案的颜色
                    }
                }
            }
        }
    }
    /*展示答题页面*/
    function zhanshidati(id,name) {
        var phone="${user_session.phone}";
        if(phone!=null && phone!="") {
            $("#container3").attr("style", "display:block");
            $("#container2").attr("style", "display:none");
            $("#container1").attr("style", "display:none");
            $("#guanqia2").html(" - " + name)
            $("#guanqia_id").html(id)
            $("button:contains('完成练习')").text("下一题");
            chaxuntiku();
        }else {
            alert("登录后才能享受闯关乐趣！")
        }
    }
    /*分页展示题库*/
    function chaxuntiku(page) {
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
                if(data){
                    var shang="";
                    var xia="";
                    //当前页/总页数
                    $("#c-shumu").html(data.offset+1+"/"+data.total);
                    for(var i=1;i<=data.total;i++){
                        if(page==i||p==i){
                            xia+="<input onclick=\'xuanxiang("+i+")\' type=\"button\" class=\"btn btn-default\" style=\"width: 50px;background-color: #E6E6E6\" value='"+i+"'>";
                        }else {
                            xia+="<input onclick=\'xuanxiang("+i+")\' type=\"button\" class=\"btn btn-default\" style=\"width: 50px\" value=\'"+i+"\'>";
                        }
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
                    alert("没数据")
                }
            }
        })
    }
</script>
</html>
