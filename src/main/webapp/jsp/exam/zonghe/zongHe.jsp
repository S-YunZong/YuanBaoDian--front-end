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
    <style>

        #biaoti{
            position: absolute;
            left: 30px;
        }

    </style>
</head>
<body>
<div class="container" id="dati" style="display: block;background-color: #ffffff">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <h1 style="margin: 60px 280px">学前教育</h1>
            <h3 style="margin: 60px 133px">
                大家可以免费、免登陆的享受学前教育<br><br>
                带来的知识考验,同学们快开始答题吧！
            </h3>
            <button type="button" class="btn btn-default btn-lg" onclick="kaishi()" style="margin: 60px 246px;width: 200px;background-color: #F5FAFC">开始答题</button>
        </div>
    </div>
</div>

<div class="container" id="dati2" style="display: none">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div style="word-wrap:break-word;width: 610px;height: 390px;margin: 0px -50px">
                <h3 id="biaoti">学前教育</h3>
                <div style="margin: 0px 100px"  id="timu">
                    &nbsp;<br>&nbsp;
                    <h3>
                        <span id="z-shumu"></span>&nbsp;
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
                &nbsp;<br>&nbsp;
                    <div id="anniou">
                        <button type="button" class="btn btn-success" onclick="shangyiye(this)" style="margin: 0px 100px">上一题</button>
                        <button type="button" class="btn btn-success" onclick="xiayiye(this)">下一题</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <button type="button" class="btn btn-default" id="collect" onclick="shoucang()">收藏</button>
                        <span id="timuid" style="display: none"></span>
                    </div>
                &nbsp;<br>&nbsp;
                <%--解析--%>
                <div id="div3" style="border:#EEEEEE solid 2px;width: 600px;height: 200px;">
                    <h3 style="margin: 20px 50px">
                        试题讲解：</h3>
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
        $("#dati2").attr("style","display:block");
        $("#dati").attr("style","display:none");
        $("button:contains('完成练习')").text("下一题");
        chaxuntiku()   /*分页展示题库*/

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
            chaxuntiku(page)
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
        $("#z-jiangjie").attr("style","display:none");
        chaxuntiku(page);
        var mm=$("#z-shumu").html();
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
        var mm=$("#z-shumu").html();
        var page=parseInt(mm.substr(0,mm.indexOf('/')));//当前页数
        map.push({key:page,xvalue:x,zvalue:z});//存入map
        $("#z-xuanxiang input[name='option']").attr("disabled",true);//选择后禁止在选
        $("#z-jiangjie").attr("style","display:block");//展示解析
        if(x==z){
            $(t).parent().css("color","#4cae4c");//改变正确答案的颜色
            $("#z-xuanti input[value='"+z+"']").attr("style","width: 50px;background-color:#4cae4c");//改变选项列表字体颜色
        }else {
            $("#z-xuanxiang input[value='"+z+"']").parent().css("color","#4cae4c");//改变正确答案的颜色
            $("#z-xuanti input[value='"+z+"']").attr("style","width: 50px;background-color:#ff3737");//改变选项列表字体颜色
            $(t).parent().css("color","#ff3737");//改变错误答案颜色
        }
    }
    /*持久化选项列表的颜色*/
    function xuanxiangliebiao() {
        if(map != null && map.length > 0) {//查看map是否为空
            var mm=$("#z-shumu").html();
            var page=parseInt(mm.substr(0,mm.indexOf('/')));//当前页数
            for (var i = 0; i < map.length; i++) {
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
            }
        }
    }
    /*分页展示题库*/
    function chaxuntiku(page) {
        var p=page || 1;
        var gjzz="";
        $.ajax({
            url:"/user/listYbdQuestionBack",
            type:"post",
            dataType:"json",
            data:{
                offset:p-1,
                limit:1,
                questionTypeId:1,//{param.typeid}
                gjzz:gjzz
            },
            success:function (data) {
                if(data){
                    var shang="";
                    var xia="";
                    //当前页/总页数
                    $("#z-shumu").html(data.offset+1+"/"+data.total);
                    for(var i=1;i<=data.total;i++){
                        if(page==i||p==i){
                            xia+="<input onclick=\'xuanxiang("+i+")\' type=\"button\" class=\"btn btn-default\" style=\"width: 50px;background-color: #E6E6E6\" value='"+i+"'>";
                        }else {
                            xia+="<input onclick=\'xuanxiang("+i+")\' type=\"button\" class=\"btn btn-default\" style=\"width: 50px\" value=\'"+i+"\'>";
                        }
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

</script>
</html>
