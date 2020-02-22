function Exchange() {
    var Computer=$("#Computer").text();

    if (Computer.trim()=='手机'.trim()){
        if(!confirm("确定要兑换"+Computer+"吗？")){
            return false;
        }else {
           /* $.ajax({
                url:"",
                data:{},
                type:"post",
                dataType:"json",
                success:function (data) {
                    if (data){

                    } else {

                    }
                }
            })*/
            return true;
        }
    }else if (Computer.trim()=='电脑'.trim()){
        if(!confirm("确定要兑换"+Computer+"吗？")){
            return false;
        }
    }


}

$(function () {
    $.ajax({
        url:"/ExchanageMall/SelectExchanageMall",
        data:{},
        type:"post",
        dataType:"json",
        success:function (data) {
            var str="";
            if (data){
                for (let i = 0; i <data.length ; i++) {
                    str=str+="<div style=\"padding-left: 30px;padding-top: 20px;float: left\"  class=\"a\">\n" +
                        "                     <img src="+data[i].itemPic+" style=\"width: 100px;height: 100px;\" >\n" +
                        "                     <p style=\"font-size: 10px;margin: auto;\" id=\"Computer\"> "+data[i].itemDescription+"</p>\n" +
                        "                     <p style=\"font-size: 15px;margin: auto;\"> 所需积分"+data[i].price+"</p>\n" +
                        "                     <button type=\"button\" class=\"btn btn-default\" onclick=\"Exchange()\" >兑换</button>\n" +
                        "                 </div>";
                }
                $("#biankuang2").append(str);
            }
        }
    })
})