$(function () {
    MyMessage();

})
function MyMessage() {
    $("#table_1").bootstrapTable('destroy');
    $("#table_1").bootstrapTable({
        url: "/QuestionBack/MyMessage",//路径
        sortName: "id", //排序名
        sortOrder: "desc", //排序方式
        method: "get", //请求方式
        cache: false, //关闭缓存
        pagination: true, //开启分页
        pageNumber: 1, //分页起始行,默认第一行
        striped: true,       //是否显示行间隔色
        toolbar: '#toolbar', //工具按钮用哪个容器
        columns: [{
            field: "xh",
            title: "序号",
            align: "center",
            width: 8,
            formatter: function (value, row, index) {
                row.index = index;
                return index + 1;
            }
        },
            {
                field: "questionBack",
                title: "题目",
                align: "center",
            }, {
                field: "description",
                title: "我的问题",
                align: "center",
            },  {
                field: "",
                title: "操作",
                align: "center",
                formatter: function (value, row, index) {
                    var a='<input id="xiangqing" value="详情" type="button" class="btn btn-default" onclick="MyMessage_1('+row.id+')">'
                    return a;
                }
            },
        ]
    })
}
function MyMessage_1(id) {
    MyMessage_2(id);
    $("#MyMessage_1").modal("show");
}

function MyMessage_2(id) {
    $("#table_21").bootstrapTable('destroy');
    $("#table_21").bootstrapTable({
        url: "/QuestionBack/MyMessage_2?id="+id,//路径
        sortName: "id", //排序名
        sortOrder: "desc", //排序方式
        method: "get", //请求方式
        cache: false, //关闭缓存
        pagination: true, //开启分页
        pageNumber: 1, //分页起始行,默认第一行
        striped: true,       //是否显示行间隔色
        toolbar: '#toolbar', //工具按钮用哪个容器
        columns: [{
            field: "xh",
            title: "序号",
            align: "center",
            width: 8,
            formatter: function (value, row, index) {
                row.index = index;
                return index + 1;
            }
        },
            {
                field: "questionBack",
                title: "题目",
                align: "center",
            }, {
                field: "description",
                title: "我的问题",
                align: "center",
            }, {
                field: "userName",
                title: "出题人",
                align: "center",
            },{
                field: "analysis",
                title: "老师解答",
                align: "center",
            },  {
                field: "",
                title: "操作",
                align: "center",
                formatter: function (value, row, index) {
                    var a='<input id="xiangqing" value="回复" type="button" class="btn btn-default" >'
                    return a;
                }
            },
        ]
    })
}


