$(function () {
   $.ajax({
       url:"/GoodsNew/GoodsNew",
       data:{},
       type:"post",
       dataType:"json",
       success:function (data) {
           var str="";
           if (data!=null){
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
               }
               $("#xibao").append(a+b+str);
           }
       },error:function () {
           alert("获取失败！");
       }
   })

})