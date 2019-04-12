<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<head>
    <meta charset="UTF-8">
    <title>首页</title>
    <!-- saved from url=(0014)about:internet -->
    <meta http-equiv="X-UA-Compatible" content="IE=Edge，chrome=1">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <!--[if IE]>
    <script src="https://libs.useso.com/js/html5shiv/3.7/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.js"></script>
    <![endif]-->
    <link rel="icon" href="images/favicon.ico" type="images/logo3">
    <link rel="stylesheet" href="${ctxStatic}/dati/layui/css/layui.css">
    <link rel="stylesheet" href="${ctxStatic}/dati/css/style.css">
</head>
<body>

<form id="loginForm" name="loginIndexFirst" method="post">
    <input type="hidden" id="useType" name="useType">
    <input type="hidden" id="userName" name="userName">
    <input type="hidden" id="company" name="company" >
    <input type="hidden" id="studentId" name="studentId" >
    <input type="hidden" id="scene" name="scene" >
</form>
<div class="all">
    <div class="title"><img src="${ctxStatic}/dati/img/title.png" alt=""></div>
    <div class="login clearfix">
        <div class="login_l box_sizing fl">
            <h2>考生注意事项</h2>
            <p>
                1.开考前20分钟，考生凭准考证和身份证进入指定考场，
                按考生号对号入座，将准考证和身份证放到桌面右上角，以备查对 ，
                证件不全者不得进入考场。
            </p>
            <p>
                2.开考15分钟后，考生不得进入考场；开考30分钟内，不得交卷退场。
            </p>
            <p>
                3.考生自备黑色或蓝色签字笔、橡皮进入考场，不得携带任何书籍、笔记、纸张、报刊及手机等通讯工具进入考场。
            </p>
            <p>
                4.自备实践能力考核所需工具,笔、彩笔或彩铅、尺、橡皮。
            </p>
            <p>
                5.考试铃响后开始答题。答题前必须在试题本、答题纸规定位置填写姓名、准考证号、所在单位，不在规定位置填写，
                成绩无效。规定在答题纸上答题的部分，一律按要求用蓝色或黑色签字笔在规定位置上作答，
                在试题本、草稿纸上作答无效。
            </p>
            <p>
                6.不得要求监考人员解释试题，如遇试卷模糊、污损等问题，可举手询问。
            </p>
            <p>
                7.考试结束铃响，应立即停止答卷，经监考人员允许方能离开考场，严禁将试题本、答题纸、草稿纸带出考场。
            </p>
            <p>
                8.遵守考场纪律，违纪违规者取消考试资格，按照相关规定严肃处理。
            </p>
        </div>
        <div class="login_r fr">
            <h2>考生登录</h2>
            <div class="account">
                <label>
                    <span class="fl">姓名</span>
                    <input class="name fl" type="text">
                </label>
                <label>
                    <span class="fl">单位</span>
                    <input class="company fl" type="text">
                </label>
                <label>
                    <span class="fl">考场</span>
                    <select name="" class="room fl">
                        <option value="1">共青团</option>
                        <option value="2">少先队</option>
                    </select>
                    <!--<input class="room fl" type="text">-->
                </label>
                <label>
                    <span class="fl">考号</span>
                    <input class="number fl" type="text">
                </label>
            </div>
            <a class="btn" href="javascript:;">开始答题</a>
        </div>
    </div>
    <div class="foot">
        <p>共青团房山区委教育工作委员会</p>
        <p>版权所有@共青团房山区委教育工作委员会 京ICP备S231231</p>
    </div>
</div>

</body>
<script src="${ctxStatic}/dati/js/jquery.min.js"></script>
<script src="${ctxStatic}/dati/layui/layui.all.js"></script>
<script>
    //点击注册按钮
    $(".btn").on("click", function () {
        var n = $(".name").val();
        var c = $(".company").val();
        var r = $(".room").val();
        var num = $(".number").val();
        if (!n) {
            layer.msg("请输入姓名！");
            return false;
        }
        if (!/^[\u4e00-\u9fa5]+$/gi.test(n)) {
            layer.msg("请输入汉字！");
            return false;
        }
        if (!c) {
            layer.msg("请输入单位！");
            return false;
        }
        if (!r) {
            layer.msg("请输入考场！");
            return false;
        }
        if (!num) {
            layer.msg("请输入考号！");
            return false;
        }
        $('#userName').val(n);
        $('#company').val(c);
        $('#studentId').val(num);
        $('#useType').val(r);
        document.loginIndexFirst.action = "<c:url value='questions'/>";
        document.loginIndexFirst.submit();
    });
</script>
</html>