function Exchange(id,itemDescription,price) {
    if (!confirm("确认要兑换"+itemDescription+"吗？")) {
        return false;
    }else {
        var user_1=$("#user_1").val();
    if (user_1== price || user_1>= price ) {
        $.ajax({
            url:"/Integeral/ExchangeGifts",
            data:{price:price,id:id,itemDescription:itemDescription},
            type:"post",
            dataType:"json",
            success:function (data) {
                if (data){
                    alert("兑换成功！")
                } else {
                    alert("积分或库存不足兑换失败！")
                }
            }
        })
        }else {
        alert("积分不足!")
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
                        "                     <button type=\"button\" class=\"btn btn-default\" " +
                        "onclick=\"Exchange('"+data[i].id+"','"+data[i].itemDescription+"','"+data[i].price+"')\" >兑换</button>\n" +
                        "                 </div>";
                }
                $("#biankuang2").append(str);
            }
        }
    })
})