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
    <title>猿宝典</title>
    <!-- -->
    <%@include file="/jsp/commet/header.jsp" %>
    <style>
        .massage p{
            margin: 10px 10px 1px;
            font-size: 15px;
            color: #000000;
        }
        .massage2 p{
            margin: 10px 10px 1px;
            font-size: 15px;
        }
        .img-thumbnail{
            width:197px;
            height:197px
        }
        .panel-heading .img {
            width: 20px;
            height: 20px;
            border-radius: 10px;
        }
        h2 {
            font-weight: bolder;
        }
    </style>
</head>
<body>
<div class="d1" style="background-color: #EEEEEE;width: 100%;height: auto;" >
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
                            <li class=" " data-slide-to="0" data-target="#carousel-481935">
                            </li>
                            <li data-slide-to="1" data-target="#carousel-481935">
                            </li>
                            <li data-slide-to="2" data-target="#carousel-481935">
                            </li>
                        </ol>
                        <div class="carousel-inner" id="rotationChart">
<%--                            <div class="item active">--%>
<%--                                <img alt="" src="/static/image/timg.gif" style="height: 400px;width: 1140px"/>--%>
<%--                            </div>--%>
<%--                            <div class="item">--%>
<%--                                <img alt="" src="/static/image/tim.jpg" style="height: 400px;width: 1140px"/>--%>
<%--                            </div>--%>
<%--                            <div class="item">--%>
<%--                                <img alt="" src="/static/image/比心.jpg" style="height: 400px;width: 1140px"/>--%>
<%--                            </div>--%>
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
                            <div style="border: silver solid 1px;border-radius: 10px;height: 300px;width: 500px;margin: 0px 40px;background-color: #F5F5F5">
                                <h3 style="margin: 30px 200px">学前教育</h3>
                                <div style="background-color: #F5F5F5;border-radius:5px;width: 400px;height: 130px;margin: 0px 50px;text-align: center">
                                    <div style="height: 10px"></div>
                                    <h4>
                                        做好充分准备，只为走的更远<br>
                                        同学们快开始答题吧！<br>
                                    </h4>
                                </div>
                                <a type="button" href="/jsp/exam/practiceTest.jsp" class="btn btn-default btn-lg" style="margin: 10px 200px">开始答题</a>
                            </div>
                        </div>
                        <div class="col-md-6 column">
                            <div style="border: silver solid 1px;border-radius: 10px;height: 300px;width: 500px;background-color: #F5F5F5">
                                <h3 style="margin: 30px 200px">闯关答题</h3>
                                <div style="background-color: #F5F5F5;border-radius:5px;width: 400px;height: 130px;margin: 0px 50px;text-align: center">
                                    <div style="height: 10px"></div>
                                    <h4>
                                        在这里可以解锁更多的知识<br>
                                        同学们，快开始闯关答题吧！
                                    </h4>
                                </div>
                                <a type="button" href="/jsp/exam/practiceTest.jsp" class="btn btn-default btn-lg" style="margin: 10px 200px">开始闯关</a>
                            </div>

                        </div>
                    </div>
                        <h2 style="margin: 50px 500px">排行榜</h2>
                        <div class="row clearfix">
                            <div class="col-md-6 column">
                                <div style="border: silver solid 1px;height: 60px;width: 500px;margin: 0px 40px;background-color:#FFD700">
                                    <h3 style="margin: 15px 180px">答题排行榜</h3>
                                </div>
                                <div class="panel panel-default" style="width: 500px;margin: 0px 40px" id="queryUserListByQuestion">
<%--                                    <div class="panel-heading">--%>
<%--                                        <span style="margin-left: 20px;float: left">1</span>--%>
<%--                                        <span style="margin-left: 120px;"><img src="https://kangkang666666.oss-cn-beijing.aliyuncs.com/oss/2019-11-18/473652de70d54749a6216dc419e18a83-blob.png" class="img"></span>--%>
<%--                                        <span style="margin-left: 20px">kangkang</span>--%>
<%--                                        <span style="margin-right: 20px;float: right;color:  #FF6100">1关</span>--%>
<%--                                    </div>--%>
                                </div>
                            </div>
                            <div class="col-md-6 column">
                                <div style="border: silver solid 1px;height: 60px;width: 500px;margin: 0px 0px;background-color:#FFD700">
                                    <h3 style="margin: 15px 170px">准确率排行榜</h3>
                                </div>
                                <div class="panel panel-default" style="width: 500px" id="queryUserListByanswerRate">

                                </div>
                            </div>
                        </div>
                        <h2 style="margin: 50px 490px">学生喜报</h2>
                        <div class="container">
                            <div class="row clearfix" id="goodNews">
<%--                                <div class="col-md-6 column" style="background-color:red;border: silver solid 1px;height: 200px;width: 500px;margin: 20px 20px">--%>
<%--                                    <div style="float: right">--%>
<%--                                        <img src="/static/image/眼镜猫.jpg" height="197" width="197px" class="img-thumbnail">--%>
<%--                                    </div>--%>
<%--                                    <div class="massage">--%>
<%--                                        <p>姓名：杨某某</p>--%>
<%--                                        <p>年龄：22</p>--%>
<%--                                        <div style="height: 10px"></div>--%>
<%--                                        <p>入职时间：2020-02-04</p>--%>
<%--                                        <p>入职公司：北京新科技有限公司</p>--%>
<%--                                        <p>薪资待遇：12000+五险一金</p>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
                            </div>
                        </div>
                            <button onclick="goodNewsBtn()" type="button" class="btn btn-default btn-lg" style="margin: 0px 500px">查看更多</button>

                            </div>
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
                                        <div class="col-md-6 column" style="border: silver solid 1px;height: 200px;width: 500px;margin: 20px 20px">
                                            <div style="float: right">
                                                <img src="/static/image/2017419153426.jpg" height="197" width="197px" class="img-thumbnail">
                                            </div>
                                            <div class="massage2">
                                                <p style="color: red"><a target="_blank" href="http://www.bjuba.com.cn/Item/2764.aspx">“记联想服务校园行”</a></p>
                                                <p>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    在这风花正好的时候，应我校邀请，
                                                    我们迎来了联想集团昌平分公司售后维修服务部的团队，
                                                    为我校师生免费进行计算机的维修、检测及除尘。
                                                    利用课间及休息时间，工程师们检修电脑，
                                                    还向同学们传授计算机的日常使用及维护常识。
                                                </p>
                                            </div>
                                        </div>
                                        <div class="col-md-6 column" style="border: silver solid 1px;height: 200px;width: 500px;margin: 20px 20px">
                                            <div style="float: right">
                                                <img src="/static/image/2015122512710.png" height="197" width="197px" class="img-thumbnail">
                                            </div>
                                            <div class="massage2">
                                                <p style="color: red"><a target="_blank" href="http://www.bjuba.com.cn/Item/2522.aspx">院长荣获“优秀校长奖”</a></p>
                                                <p>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                                    “2015第九届北京民办教育园丁奖”颁奖典礼在北京教育评估院举行。
                                                    在本次活动中，我院董事长、院长平桂祥荣获“优秀校长奖”，
                                                    学务处长王家纲荣获“优秀教育工作者”称号。
                                                </p>
                                            </div>
                                        </div>
                                        <div class="col-md-6 column" style="border: silver solid 1px;height: 200px;width: 500px;margin: 20px 20px">
                                            <div style="float: right">
                                                <img src="/static/image/2015123142220.png" height="197" width="197px" class="img-thumbnail">
                                            </div>
                                            <div class="massage2">
                                                <p style="color: red"><a target="_blank" href="http://www.bjuba.com.cn/Item/2490.aspx">学生成长笔记-学务处举办</a></p>
                                                <p>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                                    学生成长笔记展内容丰富，各二级学院都为此次展览做出了精心的准备
                                                    同学们很认真的写出了自己在入学后学习的传统文化，
                                                    学习上、生活上感恩父母，感恩学校的感悟和体会。
                                                    对于自己的目标、理想、憧憬落实在具体行动上或思想上的深刻认识。
                                                </p>
                                            </div>
                                        </div>
                                        <div class="col-md-6 column" style="border: silver solid 1px;height: 200px;width: 500px;margin: 20px 20px">
                                            <div style="float: right">
                                                <img src="/static/image/20151225115046.png" height="197" width="197px" class="img-thumbnail">
                                            </div>
                                            <div class="massage2">
                                                <p style="color: red"><a target="_blank" href="http://www.bjuba.com.cn/Item/2519.aspx">你我共参与 依法防控结核</a></p>
                                                <p>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                                    为进一步宣传普及结核病防治知识，营造良好社会氛围，
                                                    我院医务室联合学务处和志愿者开展主题宣传活动。
                                                    继续深入宣传《传染病防治法》和《结核病防治管理办法》，
                                                    依法依规防治结核病。
                                                </p>
                                            </div>
                                        </div>
                                        <button onclick="teaching()" type="button" class="btn btn-default btn-lg" style="margin: 0px 500px">查看更多</button>
                                    </div>
                                    <div class="tab-pane active" id="panel-190440">
                                        <div class="col-md-6 column" style="border: silver solid 1px;height: 200px;width: 500px;margin: 20px 20px">
                                            <div style="float: right">
                                                <img src="/static/image/2014416152829.jpg" height="197" width="197px" class="img-thumbnail">
                                            </div>
                                            <div class="massage2">
                                                <p style="color: red"><a target="_blank" href="http://www.bjuba.com.cn/Item/2742.aspx">昌平区开展杜绝酒驾专项宣传的通知</a></p>
                                                <p>
                                                    各中央市属、大中院校： <br/>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                                    为确保单位落实交通安全教育主体责任，
                                                    杜绝酒后驾驶机动车交通违法行为的发生，
                                                    结合2016年全市将继续保持对酒驾的严管高压态势，
                                                    请各单位开展宣传教育工作。具体要求通知如下：...
                                                </p>
                                            </div>
                                        </div>
                                        <div class="col-md-6 column" style="border: silver solid 1px;height: 200px;width: 500px;margin: 20px 20px">
                                            <div style="float: right">
                                                <img src="/static/image/2010812142430.jpg" height="197" width="197px" class="img-thumbnail">
                                            </div>
                                            <div class="massage2">
                                                <p style="color: red"><a target="_blank" href="http://www.bjuba.com.cn/Item/2489.aspx">北京工商管理专修学院控烟工作方案</a></p>
                                                <p>
                                                    各市场运营部、处室、二级学院：  <br/>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                                    为认真落实北京市控烟条例，
                                                    更好的做好我院控烟工作，
                                                    有效降低吸烟对公众健康危害，
                                                    形成控烟、戒烟的良好氛围，
                                                    营造一个无烟、清洁、健康、和谐的学习、工作和生活环境，
                                                    结合学院的实际情况，特制定本方案。...
                                                </p>
                                            </div>
                                        </div>
                                        <div class="col-md-6 column" style="border: silver solid 1px;height: 200px;width: 500px;margin: 20px 20px">
                                            <div style="float: right">
                                                <img src="/static/image/2010812142858.jpg" height="197" width="197px" class="img-thumbnail">
                                            </div>
                                            <div class="massage2">
                                                <p style="color: red"><a target="_blank" href="http://www.bjuba.com.cn/Item/2379.aspx">校园环境整治通知</a></p>
                                                <p>
                                                    各处室、二级学院：<br/>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                                    根据院（后）字【2014】22号文件精神，
                                                    贯彻落实学院关于开展环境综合治理工作部署，
                                                    营造良好的校园环境，
                                                    对校园环境治理进行责任区域划分，
                                                    具体区域划分见附表。...
                                                </p>
                                            </div>
                                        </div>
                                        <div class="col-md-6 column" style="border: silver solid 1px;height: 200px;width: 500px;margin: 20px 20px">
                                            <div style="float: right">
                                                <img src="/static/image/2010811192250.jpg" height="197" width="197px" class="img-thumbnail">
                                            </div>
                                            <div class="massage2">
                                                <p style="color: red"><a target="_blank" href="http://www.bjuba.com.cn/Item/2311.aspx">关于开展“学习四个一”活动的通知</a></p>
                                                <p>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                                    为了进一步提高学生管理队伍工作水平和业务能力，
                                                    提高自身的科学文化、技能和业务素质，
                                                    增强竞争能力，具备驾驭本职工作的本领。
                                                    培养“爱岗敬业、争创一流、淡泊名利、甘于奉献”的精神，
                                                    形成以敬业、爱校、爱生、为人师表，
                                                    无私奉献为核心内容...
                                                </p>
                                            </div>
                                        </div>
                                        <button onclick="teaching()" type="button" class="btn btn-default btn-lg" style="margin: 0px 500px">查看更多</button>
                                    </div>
                                    <div class="tab-pane" id="panel-121212">
                                        <div class="col-md-6 column" style="border: silver solid 1px;height: 200px;width: 500px;margin: 20px 20px">
                                            <div style="float: right">
                                                <img src="/static/image/640.jpg" height="197" width="197px" class="img-thumbnail">
                                            </div>
                                            <div class="massage2">
                                                <p style="color: red"><a target="_blank" href="https://mp.weixin.qq.com/s?__biz=MzI1NDQ3MjQxNA==&mid=2247486163&idx=1&sn=048762563d66fa5db2a35496e031f7c7&chksm=e9c5f362deb27a74a87aeb0b52975ef6c62f3b4fd2637680bc613ad01b346975ee42c07f4a26&scene=21#wechat_redirect"> Java工程师修炼之道！</a></p>
                                                <p>
                                                    一、软件开发的核心原则<br/>
                                                    二、软件过程<br/>
                                                    三、日常开发<br/>
                                                    四、运行环境<br/>
                                                    五、第三方服务<br/>
                                                    六、计算机基础科学知识<br/>
                                                    七、数据...<br/>
                                                </p>
                                            </div>
                                        </div>
                                        <div class="col-md-6 column" style="border: silver solid 1px;height: 200px;width: 500px;margin: 20px 20px">
                                            <div style="float: right">
                                                <img src="/static/image/641.jpg" height="197" width="197px" class="img-thumbnail">
                                            </div>
                                            <div class="massage2">
                                                <p style="color: red"><a target="_blank" href="https://mp.weixin.qq.com/s?__biz=MzI1NDQ3MjQxNA==&mid=2247486342&idx=1&sn=c94599a5146a6ee0a37b63a33a892377&chksm=e9c5f237deb27b215f68f3a34a2243ed05108bdcd3401e88904f82a8864f8856cb7cd82ab5b0&scene=21#wechat_redirect">架构师升级步骤和平时的工作内容！</a></p>
                                                <p>
                                                    一、先说下大家对架构师认识的误区<br/>
                                                    二、高级开发升级到架构师的必要条件<br/>
                                                    三、高级开发不会自动升级到架构<br/>
                                                    四、架构师必备的技能<br/>
                                                    五、架构师平时干什么？<br/>
                                                    六、架构师更多的是和人打交道<br/>
                                                    七、总结<br/>
                                                </p>
                                            </div>
                                        </div>
                                        <div class="col-md-6 column" style="border: silver solid 1px;height: 200px;width: 500px;margin: 20px 20px">
                                            <div style="float: right">
                                                <img src="/static/image/642.jpg" height="197" width="197px" class="img-thumbnail">
                                            </div>
                                            <div class="massage2">
                                                <p style="color: red"><a target="_blank" href="https://mp.weixin.qq.com/s?__biz=MzI1NDQ3MjQxNA==&mid=2247486605&idx=1&sn=0a6f1dd8a9de8136babb3b8158507f1f&chksm=e9c5f53cdeb27c2aa0d628ef2cfa91cfc794fbcbbf96be1502e2d3d48d100c2f2ae3dacdcf08&scene=21#wechat_redirect">初探性能优化！</a></p>
                                                <p>
                                                    一、项目描述<br/>
                                                    二、第一版：面向过程<br/>
                                                    三、第二版：面向对象<br/>
                                                    四、第三版：完全解耦（队列+多线程）<br/>
                                                    五、第四版：高度抽象（一键启动）<br/>
                                                    六、关于继续优化的思考<br/>
                                                </p>
                                            </div>
                                        </div>
                                        <div class="col-md-6 column" style="border: silver solid 1px;height: 200px;width: 500px;margin: 20px 20px">
                                            <div style="float: right">
                                                <img src="/static/image/643.jpg" height="197" width="197px" class="img-thumbnail">
                                            </div>
                                            <div class="massage2">
                                                <p style="color: red"><a target="_blank" href="https://mp.weixin.qq.com/s?__biz=MzI1NDQ3MjQxNA==&mid=2247488386&idx=1&sn=e3290f622ab11df795834d8cec7cdb2a&chksm=e9c5ea33deb26325a9a8e7f08d875921f5d3796e852a8c6449f2b47bf1a0231eaf6ac9455d6a&scene=21#wechat_redirect">Java必知必会的20种常用类库和API</a></p>
                                                <p>
                                                    一、日志相关类库<br/>
                                                    二、JSON解析库<br/>
                                                    三、单元测试库<br/>
                                                    四、通用类库<br/>
                                                    五、Http 库<br/>
                                                    六、XML解析库<br/>
                                                    七、Excel读写库...<br/>
                                                </p>
                                            </div>
                                        </div>
                                        <button onclick="teaching()" type="button" class="btn btn-default btn-lg" style="margin: 0px 500px">查看更多</button>
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
