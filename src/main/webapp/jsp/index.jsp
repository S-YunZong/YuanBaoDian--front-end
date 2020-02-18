<%--
  Created by IntelliJ IDEA.
  User: 智慧
  Date: 2020/2/16
  Time: 14:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <!-- -->
    <%@include file="/jsp/commet/header.jsp" %>
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <!-- Header  头部 -->
                    <%@include file="/jsp/commet/top.jsp" %>
                </div>
            </div>
            <div class="row clearfix"  style="margin: 60px 0px">
                <div class="col-md-12 column">
                    <%--轮播图--%>
                    <div class="carousel slide" id="carousel-481935">
                        <ol class="carousel-indicators">
                            <li class="active" data-slide-to="0" data-target="#carousel-481935">
                            </li>
                            <li data-slide-to="1" data-target="#carousel-481935">
                            </li>
                            <li data-slide-to="2" data-target="#carousel-481935">
                            </li>
                        </ol>
                        <div class="carousel-inner">
                            <div class="item active">
                                <img alt="" src="/static/image/timg.gif" style="height: 400px;width: 1140px"/>

                            </div>
                            <div class="item">
                                <img alt="" src="/static/image/tim.jpg" style="height: 400px;width: 1140px"/>

                            </div>
                            <div class="item">
                                <img alt="" src="/static/image/比心.jpg" style="height: 400px;width: 1140px"/>

                            </div>
                        </div>
                        <a class="left carousel-control" href="#carousel-481935" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left"></span>
                        </a>
                        <a class="right carousel-control" href="#carousel-481935" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right"></span>
                        </a>
                    </div>
                    <h2 style="margin: 50px 480px">模拟考试</h2>
                    <div class="row clearfix">
                        <div class="col-md-6 column">
                            <div style="border: silver solid 1px;height: 300px;width: 500px;margin: 0px 40px;background-color: #F2F2F2">
                                <h3 style="margin: 30px 200px">综合答题</h3>
                                <div style="background-color: #F1F8FF;width: 400px;height: 130px;margin: 0px 50px;text-align: center">
                                    <div style="height: 10px"></div>
                                    <h4>
                                        学生们可以在综合答题<br>
                                        里自由练习习题为闯关<br>
                                        答题做好充分的知识储备<br>
                                        同学们快开始答题吧！<br>
                                    </h4>
                                </div>
                                <button type="button" class="btn btn-default btn-lg" style="margin: 10px 200px">开始答题</button>
                            </div>
                        </div>
                        <div class="col-md-6 column">
                            <div style="border: silver solid 1px;height: 300px;width: 500px;background-color: #F2F2F2">
                                <h3 style="margin: 30px 200px">闯关答题</h3>
                                <div style="background-color: #F1F8FF;width: 400px;height: 130px;margin: 0px 50px;text-align: center">
                                    <div style="height: 10px"></div>
                                    <h4>
                                        闯关答题分为1-1~1-5,1-6~1-10，<br>
                                        2-1~2-5每个关卡里还有小关卡，<br>
                                        完成2-1~2-5后可解锁真题题库，<br>
                                        同学们，快开始闯关答题吧！！
                                    </h4>
                                </div>
                                <button type="button" class="btn btn-default btn-lg" style="margin: 10px 200px">开始闯关</button>
                            </div>

                        </div>
                    </div>
                        <h2 style="margin: 50px 500px">排行榜</h2>
                        <div class="row clearfix">
                            <div class="col-md-6 column">
                                <div style="border: silver solid 1px;height: 60px;width: 500px;margin: 0px 40px">
                                    <h3 style="margin: 15px 180px">成绩排行榜</h3>
                                </div>
                                <div class="panel panel-default" style="width: 500px;margin: 0px 40px">
                                    <div class="panel-heading">
                                        Panel title
                                    </div>
                                    <div class="panel-body">
                                        Panel content
                                    </div>
                                    <div class="panel-footer">
                                        Panel footer
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 column">
                                <div style="border: silver solid 1px;height: 60px;width: 500px;margin: 0px 0px">
                                    <h3 style="margin: 15px 180px">答题排行榜</h3>
                                </div>
                                <div class="panel panel-default" style="width: 500px">
                                    <div class="panel-heading">
                                        Panel title
                                    </div>
                                    <div class="panel-body">
                                        Panel content
                                    </div>
                                    <div class="panel-footer">
                                        Panel footer
                                    </div>
                                </div>
                            </div>
                        </div>
                        <h2 style="margin: 50px 490px">学生喜报</h2>
                        <div class="row clearfix">
                            <div class="col-md-6 column">
                                <div style="border: silver solid 1px;height: 200px;width: 500px;margin: 0px 40px">
                                    <img src="/static/image/眼镜猫.jpg" width="197px" class="img-thumbnail">
                                </div>
                                <div style="border: silver solid 1px;height: 200px;width: 500px;margin: 20px 40px">
                                    <img src="/static/image/眼镜猫.jpg" width="197px" class="img-thumbnail">

                                </div>
                            </div>
                            <div class="col-md-6 column">
                                <div style="border: silver solid 1px;height: 200px;width: 500px;margin: 0px 0px">
                                    <img src="/static/image/眼镜猫.jpg" width="197px" class="img-thumbnail">

                                </div>
                                <div style="border: silver solid 1px;height: 200px;width: 500px;margin: 20px 0px">
                                    <img src="/static/image/眼镜猫.jpg" width="197px" class="img-thumbnail">

                                </div>
                            </div>
                            <button type="button" class="btn btn-default btn-lg" style="margin: 0px 500px">查看更多</button>
                        </div>
                        <h2 style="margin: 50px 490px">教学指南</h2>
                        <div class="row clearfix">
                            <div class="tabbable" id="tabs-111681">
                                <ul class="nav nav-tabs">
                                    <li>
                                        <a href="#panel-717607" data-toggle="tab">热门文章</a>
                                    </li>
                                    <li class="active">
                                        <a href="#panel-190440" data-toggle="tab">教学通知</a>
                                    </li>
                                    <li>
                                        <a href="#panel-121212" data-toggle="tab">考试秘笈</a>
                                    </li>
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane" id="panel-717607">
                                        <div class="col-md-6 column">
                                            <div style="border: silver solid 1px;height: 200px;width: 500px;margin: 0px 40px">
                                                <img src="/static/image/眼镜猫.jpg" width="197px" class="img-thumbnail">
                                            文章
                                            </div>
                                            <div style="border: silver solid 1px;height: 200px;width: 500px;margin: 20px 40px">
                                                <img src="/static/image/眼镜猫.jpg" width="197px" class="img-thumbnail">

                                            </div>
                                        </div>
                                        <div class="col-md-6 column">
                                            <div style="border: silver solid 1px;height: 200px;width: 500px;margin: 0px 0px">
                                                <img src="/static/image/眼镜猫.jpg" width="197px" class="img-thumbnail">

                                            </div>
                                            <div style="border: silver solid 1px;height: 200px;width: 500px;margin: 20px 0px">
                                                <img src="/static/image/眼镜猫.jpg" width="197px" class="img-thumbnail">

                                            </div>
                                        </div>
                                        <button type="button" class="btn btn-default btn-lg" style="margin: 0px 500px">查看更多</button>
                                    </div>
                                    <div class="tab-pane active" id="panel-190440">
                                        <div class="col-md-6 column">
                                            <div style="border: silver solid 1px;height: 200px;width: 500px;margin: 0px 40px">
                                                <img src="/static/image/眼镜猫.jpg" width="197px" class="img-thumbnail">
                                            通知
                                            </div>
                                            <div style="border: silver solid 1px;height: 200px;width: 500px;margin: 20px 40px">
                                                <img src="/static/image/眼镜猫.jpg" width="197px" class="img-thumbnail">

                                            </div>
                                        </div>
                                        <div class="col-md-6 column">
                                            <div style="border: silver solid 1px;height: 200px;width: 500px;margin: 0px 0px">
                                                <img src="/static/image/眼镜猫.jpg" width="197px" class="img-thumbnail">

                                            </div>
                                            <div style="border: silver solid 1px;height: 200px;width: 500px;margin: 20px 0px">
                                                <img src="/static/image/眼镜猫.jpg" width="197px" class="img-thumbnail">

                                            </div>
                                        </div>
                                        <button type="button" class="btn btn-default btn-lg" style="margin: 0px 500px">查看更多</button>
                                    </div>
                                    <div class="tab-pane" id="panel-121212">
                                        <div class="col-md-6 column">
                                            <div style="border: silver solid 1px;height: 200px;width: 500px;margin: 0px 40px">
                                                <img src="/static/image/眼镜猫.jpg" width="197px" class="img-thumbnail">
                                                秘笈
                                            </div>
                                            <div style="border: silver solid 1px;height: 200px;width: 500px;margin: 20px 40px">
                                                <img src="/static/image/眼镜猫.jpg" width="197px" class="img-thumbnail">

                                            </div>
                                        </div>
                                        <div class="col-md-6 column">
                                            <div style="border: silver solid 1px;height: 200px;width: 500px;margin: 0px 0px">
                                                <img src="/static/image/眼镜猫.jpg" width="197px" class="img-thumbnail">

                                            </div>
                                            <div style="border: silver solid 1px;height: 200px;width: 500px;margin: 20px 0px">
                                                <img src="/static/image/眼镜猫.jpg" width="197px" class="img-thumbnail">

                                            </div>
                                        </div>
                                        <button type="button" class="btn btn-default btn-lg" style="margin: 0px 500px">查看更多</button>
                                    </div>
                                </div>
                            </div>

                        </div>
                </div>
            </div>
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <!-- 尾部 -->
                    <%@include file="/jsp/commet/bottom.jsp" %>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
