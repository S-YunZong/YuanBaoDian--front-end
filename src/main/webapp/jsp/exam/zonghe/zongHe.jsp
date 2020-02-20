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
        #div3{
            position: absolute;
            top: 390px;
            right: 180px;
        }
        #z-chutiren{
            position: absolute;
            right: 330px;
        }
    </style>
</head>
<body>
<div class="container" id="dati" style="display: block">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <h1 style="margin: 60px 280px">综合答题</h1>
            <h3 style="margin: 60px 220px">
                学生们可以在综合答题<br>
                里自由练习习题为闯关<br>
                答题做好充分的知识储备<br>
                同学们快开始答题吧！<br>
            </h3>
            <button type="button" class="btn btn-default btn-lg" onclick="kaishi()" style="margin: 60px 280px">开始答题</button>
        </div>
    </div>
</div>

<div class="container" id="dati2" style="display: none">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div style="border: #0C0C0C solid 1px;width: 610px;height: 390px;margin: 0px -50px">
                <div style="margin: 50px 100px">
                    <h3>
                        <span id="z-shumu"></span>
                        <span id="z-timu"></span>
                    </h3>
                    <p id="z-chutiren"></p>
                </div>

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
                <button type="button" class="btn btn-success" onclick="shangyiye()" style="margin: 50px 100px">上一题</button>
                <button type="button" class="btn btn-success" onclick="xiayiye()">下一题</button>
            </div>
            <div style="border: #0C0C0C solid 1px;width: 200px;height: 590px;margin: -390px 570px">
                <div class="btn-group" id="z-xuanti">
                    <button type="button" class="btn btn-default" style="background-color: #4cae4c">1</button>
                    <button type="button" class="btn btn-default" style="background-color: #ff3737">2</button>
                    <button type="button" class="btn btn-default" style="width: 50px">323</button>

                </div>
            </div>
            <div id="div3" style="border: #0C0C0C solid 1px;width: 600px;height: 200px;">
                <h3 style="margin: 20px 50px">试题讲解：</h3>
                <div style="overflow: auto; width: 500px;height:130px;margin: -10px 80px;">
                    <h5 id="z-jiangjie"></h5>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    $(function () {

    })
    /*点击开始考试*/
    function kaishi() {
        $("#dati2").attr("style","display:block");
        $("#dati").attr("style","display:none");
        chaxuntiku()
    }
    /*上一页*/
    function shangyiye() {
        var mm=$("#z-shumu").html();
        var page=mm.substr(0,mm.indexOf('/'))-1;//当前页数
        if(page<=0){
            alert("当前是第一题！")
        }else {
            chaxuntiku(page)
        }
    }
    /*下一页*/
    function xiayiye() {
        var mm=$("#z-shumu").html();
        var page=parseInt(mm.substr(0,mm.indexOf('/')))+1;//当前页数
        var ss=mm.substr(mm.indexOf('/') + 1);//总页数
        if(page>ss){
            alert("当前是最后一题！")
        }else {
            chaxuntiku(page)
        }
    }
    /*分页展示题库*/
    function chaxuntiku(page) {
        var p=page || 1;
        $.ajax({
            url:"/user/listYbdQuestionBack",
            type:"post",
            dataType:"json",
            data:{
                offset:p-1,
                limit:1,
                questionTypeId:1
            },
            success:function (data) {
                if(data){
                    var shang="";
                    var xia="";
                    //当前页/总页数
                    $("#z-shumu").html(data.offset+1+"/"+data.total);
                    for(var i=1;i<=data.total;i++){
                        xia+="<button type=\"button\" class=\"btn btn-default\" style=\"width: 50px\">"+i+"</button>";
                    }
                    //习题题号
                    $("#z-xuanti").html(xia);
                    $(data.rows).each(function (a,b) {
                        //题目
                        $("#z-timu").html(b.questionBack);
                        //出题人
                        $("#z-chutiren").html("—— "+b.userName);
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
                                "        <input type=\"radio\" name=\"option\" value=\'"+d.option+"\'>"+xu+""+d.optionDescribe+"\n" +
                                "   </label><br>";
                        })
                    })
                    //选项
                    $("#z-xuanxiang").html(shang);
                }else {
                    alert("没数据")
                }
            }
        })
    }
</script>
</html>
