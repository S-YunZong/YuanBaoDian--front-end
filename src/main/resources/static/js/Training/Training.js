$(function () {
   $.ajax({
       url:"/GoodsNew/GoodsNew",
       data:{},
       type:"post",
       dataType:"json",
       success:function (data) {
           var str="";
           if (data!=null){
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