
/*收藏*/
function collect(questionBack_id,phone) {
    $.ajax({
        url: "/redis/COLLECT_addlist",
        type: "post",
        dataType: "json",
        data: {
            questionBack_id:questionBack_id,
            phone:phone
        },
        success: function (data) {
            if(data){
                alert("收藏成功！");
                $("#collect").attr("class","btn btn-warning");
                $("#collect").text("取消收藏");
            }else {
                alert("收藏失败！");
            }
        }
    })
}
/*查看是否收藏*/
function seecollect(questionBack_id,phone) {
    $.ajax({
        url: "/redis/COLLECT_Alllist",
        type: "post",
        dataType: "json",
        data: {
            questionBack_id:questionBack_id,
            phone:phone
        },
        success: function (data) {
            if(data){
                $("#collect").attr("class","btn btn-warning");
                $("#collect").text("取消收藏");
            }else {
                $("#collect").attr("class","btn btn-default");
                $("#collect").text("收藏");
            }
        }
    })
}
/*删除收藏*/
function cancelcollect(questionBack_id,phone) {
    $.ajax({
        url: "/redis/COLLECT_dellist",
        type: "post",
        dataType: "json",
        data: {
            questionBack_id:questionBack_id,
            phone:phone
        },
        success: function (data) {
            if(data){
                alert("收藏取消成功！");
                $("#collect").attr("class","btn btn-default");
                $("#collect").text("收藏");
            }else {
                alert("取消失败！");
            }
        }
    })
}