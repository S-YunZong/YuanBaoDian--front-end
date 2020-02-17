function Exchange() {
    var Computer=$("#Computer").text();
    if(!confirm("确定要兑换"+Computer+"吗？")){
            return false;
    }else {
        alert("222");
        return true;
    }



}