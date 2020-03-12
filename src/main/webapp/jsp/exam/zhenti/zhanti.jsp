<%--
  Created by IntelliJ IDEA.
  User: 智慧
  Date: 2020/2/17
  Time: 19:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>Title</title>
    <%@include file="/jsp/commet/header.jsp" %>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="/static/guoda.com_files/css/zoneStyle.css">
    <style>

        #biaoti{
            position: absolute;
            left: 30px;
        }
        table tr, table td {
            font-size: 14px;
        }
        .tm{
            font-size: 30px;
            text-align: center;
        }
    </style>
</head>
<script>
    $(function () {
        selgjc()
    })
    //查询关键词
    function selgjc() {
        $.ajax({
            url: "/user/selYbdQuestionBackKeyword",
            type: "post",
            dataType: "json",
            data: {},
            success: function (data) {
                if(data){
                    var mm="";
                   $(data).each(function (a,b) {
                       mm+="<span onclick=\"xuanzeguanjianci(this)\">"+b.keyword+"</span>";
                   })
                    $("#tabsSpan").html(mm);
                }
            }
        })
    }
    //选择关键词
    function xuanzeguanjianci(t) {
        var list=$("#gjzinput").val();
        var s=list.split(",");
        var p=0;
        for (var o=0;o<s.length;o++){
            p++;
        }
        var b=$(t).hasClass("active");
        var gjz=$(t).text();
        if(b==true){
            var mm=[];
            for (var i=0;i<s.length;i++) {
                if(gjz!=s[i]){
                    mm.push(s[i]);
                }else {
                    $(t).removeClass("active");
                }
            }
            $("#gjzinput").val(mm);
        }else {
            if(p<5){//限制关键词个数
                $(t).addClass("active");
                var gjzinput=$("#gjzinput").val();
                if(gjzinput==""){
                    $("#gjzinput").val(gjz)
                }else {
                    $("#gjzinput").val($("#gjzinput").val()+","+gjz);
                }
            }else {
                alert("最多查询5个关键词！")
            }

        }

    }
</script>
<body>
<div class="container" id="dati" style="display: block">
    <div class="row clearfix">
        <div class="col-md-12 column">

                <h1 style="margin: 30px 280px">真题题库</h1>

                <div class="form-group">
                    <input type="text" class="form-control" style="width: 650px" id="gjzinput" placeholder="请选择下列关键词进行搜索！最多查询5个关键词！" disabled>
                </div>
                <table>
                <tr>
                    <td colspan="3">关键词</td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="2">
                        <div class="tags clearfix" id="tabsSpan">
                            <%--<span onclick="xuanzeguanjianci(this)">体育运动</span>--%>

                            </div>
                        <input type="hidden" name="tags" id="tagsList">
                    </td>
                </tr>

            </table>
            <%--<h1 style="margin: 90px 280px">真题题库</h1>
            <h3 style="margin: 90px 133px">
                学生们可以免费的享受真题题库带来<br><br>
                的知识考验！！同学们快开始答题吧！
            </h3>--%>
            <button type="button" class="btn btn-default btn-lg" onclick="kaishi()" style="margin: 60px 246px;width: 200px;background-color: #F5FAFC">开始答题</button>
        </div>
    </div>
</div>

<div class="container" id="dati2" style="display: none">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div style="word-wrap:break-word; width: 610px;height: 390px;margin: 0px -50px">
                <h3 id="biaoti">真题题库</h3>
                <div style="word-wrap:break-word;margin: 0px 100px"  id="timu">
                    &nbsp;<br>&nbsp;
                    <h3>
                        <span id="z-shumu"></span>
                        <span id="z-timu"></span>
                    </h3>
                    <p id="z-chutiren"></p>
                </div>
                &nbsp;<br>
                <%--选项--%>
                <div style="margin: 0px 100px" id="z-xuanxiang">
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
                &nbsp;<br>&nbsp;<br>
                    <div id="anniou">
                        <button type="button" class="btn btn-success" onclick="shangyiye(this)" style="margin: 0px 100px">上一题</button>
                        <button type="button" class="btn btn-success" onclick="xiayiye(this)">下一题</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <button type="button" class="btn btn-default" id="collect" onclick="shoucang()">收藏</button>
                        <span id="timuid" style="display: none"></span>
                    </div>
                &nbsp;<br>&nbsp;<br>
                <%--解析--%>
                <div id="div3" style="border:#EEEEEE solid 2px;width: 600px;height: 200px;">
                    <h3 style="margin: 20px 50px">
                        试题讲解：
                    </h3>
                    <div style="overflow: auto; width: 500px;height:130px;margin: -10px 80px;">
                        <h5 id="z-jiangjie" style="display: none"></h5>
                    </div>
                </div>
                </div>

            <%--题号列表--%>
            <div style="overflow: auto;width: 200px;height: 590px;margin: -390px 570px">
                <div class="btn-group" id="z-xuanti" style="margin: 0px 1px">
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

    })
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
            var mm=$("#z-timu").html();
            var mn=$("#z-chutiren").html();
            $("#timuu").html(mm)
            $("#chutiren").html(mn);
        }else {
            alert("登录后才能提问！");
        }
    }
    /*点击开始考试*/
    function kaishi() {
        var phone="${user_session.phone}";
        if(phone!=null && phone!="") {
            $("#dati2").attr("style", "display:block");
            $("#dati").attr("style", "display:none");
            $("button:contains('完成练习')").text("下一题");
            redisfenye(0);/*分页展示题库*/
        }else {
            alert("登录后才能享受真题乐趣！")
        }
    }
    /*上一页*/
    function shangyiye(t) {
        $("#z-jiangjie").attr("style","display:none");//隐藏解释
        var mm=$("#z-shumu").html();
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
        $("#z-jiangjie").attr("style","display:none");//隐藏解释
        var mm=$("#z-shumu").html();
        var page=parseInt(mm.substr(0,mm.indexOf('/')))+1;//当前页数
        var ss=mm.substr(mm.indexOf('/') + 1);//总页数
        if(page==ss){
            $(t).text("完成练习");
            redisfenye(page);
        }else if(page>ss){
            $("#dati2").attr("style","display:none");
            $("#dati").attr("style","display:block");
        }else {
            redisfenye(page);
        }
    }
    /*点击跳转指定习题*/
    function xuanxiang(page) {
        $("#z-jiangjie").attr("style","display:none");
        redisfenye(page);
        var mm=$("#z-shumu").html();
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
        if(phone!=null && phone!="") {
            var timuid = $("#timuid").text();//题目id
            var mm = $("#z-shumu").html();
            var page = parseInt(mm.substr(0, mm.indexOf('/')));//当前页数
            Record(phone,timuid,x,z);//习题记录redis phone手机号 timuid题目id  x自选答案  z正确答案
            $("#z-xuanxiang input[name='option']").attr("disabled", true);//选择后禁止在选
            $("#z-jiangjie").attr("style", "display:block");//展示解析
            if (x == z) {
                $(t).parent().css("color", "#4cae4c");//改变正确答案的颜色
                $("#z-xuanti input[value='" + z + "']").attr("style", "width: 50px;background-color:#4cae4c");//改变选项列表字体颜色
            } else {
                $("#z-xuanxiang input[value='" + z + "']").parent().css("color", "#4cae4c");//改变正确答案的颜色
                $("#z-xuanti input[value='" + z + "']").attr("style", "width: 50px;background-color:#ff3737");//改变选项列表字体颜色
                $(t).parent().css("color", "#ff3737");//改变错误答案颜色
            }
            cuoti(timuid,x);//错题录入
        }else {
            alert("登录后才能享受！")
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
                    var mm=$("#z-shumu").html();
                    var page=parseInt(mm.substr(0,mm.indexOf('/')));//当前页数
                    for (var i=0;i<data.length;i++) {
                        var timu=parseInt(data[i].substr(0,data[i].indexOf(',')));//题目
                        var answer=parseInt(data[i].substr(data[i].indexOf(',') + 1));//正确
                        var zixuan=parseInt(data[i].substr(data[i].indexOf(',') + 3));//错误
                        if(timu==timuid){
                            if(zixuan==answer){//判断选的答案和正确的答案是否一样
                                $("#z-xuanxiang input[value='"+answer+"']").parent().css("color","#4cae4c");//改变正确答案的颜色
                            }else {
                                $("#z-xuanxiang input[value='"+answer+"']").parent().css("color","#4cae4c");//改变正确答案的颜色
                                $("#z-xuanxiang input[value='"+zixuan+"']").parent().css("color","#ff3737");//改变错误答案的颜色
                            }
                            $("#z-xuanxiang input[name='option']").attr("disabled",true);//选择后禁止在选
                            $("#z-jiangjie").attr("style","display:block");//展示解析
                            $("#z-xuanxiang input[value='"+zixuan+"']").attr("checked",true);
                        }
                    }
                }else {

                }
            }
        })

            /*for (var i = 0; i < map.length; i++) {
                if(map[i].xvalue==map[i].zvalue){//判断选的答案和正确的答案是否一样
                    $("#z-xuanti input[value='"+map[i].key+"']").attr("style","width: 50px;background-color: #4cae4c");//改变选项列表字体颜色
                }else {
                    $("#z-xuanti input[value='"+map[i].key+"']").attr("style","width: 50px;background-color: #ff3737");//改变选项列表字体颜色
                }
                if(map[i].key==page){
                    $("#z-xuanxiang input[name='option']").attr("disabled",true);//选择后禁止在选
                    $("#z-jiangjie").attr("style","display:block");//展示解析
                    $("#z-xuanxiang input[value='"+map[i].xvalue+"']").attr("checked",true);
                    if(map[i].xvalue==map[i].zvalue){//判断选的答案和正确的答案是否一样
                        $("#z-xuanxiang input[value='"+map[i].zvalue+"']").parent().css("color","#4cae4c");//改变正确答案的颜色
                    }else {
                        $("#z-xuanxiang input[value='"+map[i].zvalue+"']").parent().css("color","#4cae4c");//改变正确答案的颜色
                        $("#z-xuanxiang input[value='"+map[i].xvalue+"']").parent().css("color","#ff3737");//改变错误答案的颜色
                    }
                }
            }*/
    }
    /*带做过题的数据跳转分页查询*/
    function redisfenye(page) {
        var list=$("#gjzinput").val();
        var phone="${user_session.phone}";
        $.ajax({
            url: "/redis/RECORD_allHash",
            type: "post",
            dataType: "json",
            data: {
                phone: phone
            },
            success: function (data) {
                chaxuntiku(page,data,list);
            }
        })
    }
    /*分页展示题库*/
    function chaxuntiku(page,redti,gjzz) {
        var p=page || 1;
        $.ajax({
            url:"/user/listYbdQuestionBack",
            type:"post",
            dataType:"json",
            data:{
                offset:p-1,
                limit:1,
                questionTypeId:${param.typeid},
                gjzz:gjzz
            },
            success:function (data) {
                if(data){
                    var shang="";
                    var xia="";
                    $("#z-shumu").html(data.offset+1+"/"+data.total);//当前页/总页数
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
                    $("#z-xuanti").html(xia);
                    $(data.rows).each(function (a,b) {
                        //题目
                        $("#z-timu").html(b.questionBack);
                        //出题人
                        $("#z-chutiren").html("—— "+b.userName);
                        $("#chutirenid").html(b.createUser);//出题人id
                        $("#timuid").html(b.id);//题目id
                        //习题讲解
                        $("#z-jiangjie").html(b.analysis);
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
                    $("#z-xuanxiang").html(shang);
                    xuanxiangliebiao()    /*持久化选项列表的颜色*/
                    see();//查看是否收藏
                }else {
                    alert("没数据")
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
