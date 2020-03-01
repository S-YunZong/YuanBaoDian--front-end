$(function () {
   $.ajax({
       url:"/GoodsNew/GoodsNew",
       data:{},
       type:"post",
       dataType:"json",
       success:function (data) {
           var str="";
           if (data!=null){
<<<<<<< HEAD
                str +="<img src=\"/static/images/Bann01.jpg\" width=\"900px;\">"
               str +="     <h3>学生喜报</h3>"
               str +=" <div class=\"container\">";
               str +=" <div class=\"row clearfix\" id=\"goodNews\">";
               for (var i = 0; i <data.length ; i++) {
                   str +="<div class=\"col-md-6 column\" style=\"background-color:red;border: silver solid 1px;height: 200px;width: 500px;margin: 20px 20px\">\n" +
                       "                                    <div style=\"float: right\">\n" +
                       "                                        <img src=\""+data[i].personalPic+"\" class=\"img-thumbnail\" >\n" +
                       "                                    </div>\n" +
                       "                                    <div class=\"massage\">\n" +
                       "                                        <p>姓名："+data[i].userName+"</p>\n" +
                       "                                        <p>年龄："+data[i].age+"</p>\n" +
                       "                                        <div style=\"height: 10px\"></div>\n" +
                       "                                        <p>入职时间："+data[i].entrytime+"</p>\n" +
                       "                                        <p>入职公司："+data[i].entrycompany+"</p>\n" +
                       "                                        <p>薪资待遇："+data[i].salary+"元+"+data[i].treatment+"</p>\n" +
                       "                                    </div>\n" +
                       "                                </div>";
=======
               var a="<img src=\"/static/images/Bann01.jpg\" width=\"900px;\">"
               var b="     <h3>学生喜报</h3>"
               for (let i = 0; i <data.length ; i++) {
                   str=str+" <img src="+data[i].personalPic+" width=\"400\" height='200px' style=\"float: left\">\n" +
                       "                <div >\n" +
                       "                    &nbsp; &nbsp; &nbsp; &nbsp;<span style=\"font-size: 20px;\">姓名:"+data[i].userName+"</span> <br><br>\n" +
                       "                    &nbsp; &nbsp; &nbsp; &nbsp;<span style=\"font-size: 20px; \" >年龄:"+data[i].age+"</span><br><br>\n" +
                       "                    &nbsp; &nbsp; &nbsp; &nbsp;<span style=\"font-size: 20px;\">公司:"+data[i].entrycompany+"</span><br><br>\n" +
                       "                    &nbsp; &nbsp; &nbsp; &nbsp;<span style=\"font-size: 20px;\">薪资："+data[i].salary+"</span><br><br>\n" +
                       "                    &nbsp; &nbsp; &nbsp; &nbsp;<span style=\"font-size: 20px;\">待遇："+data[i].treatment+"</span><br><br>\n" +
                       "                </div>"
>>>>>>> origin/master
               }
               str+="</div>";
               str+="</div>";
               $("#xibao").html(str);
           }
       },error:function () {
           alert("获取失败！");
       }
   })

})