<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>找回密码</title>
    <link rel="stylesheet" href="jxweb/jx/css/retrieve.css">
    <script src="jxweb/jx/js/jquery.min.js"></script>
    <script src="jxweb/jx/js/common.js"></script>
</head>
<body>
    <!-- 头部开始-->
    <header class="header-wrapper">
        <div class="nav-wrapper">
            <div class="nav-son-wrapper">
                <div class="logo">
                    <img src="/marry/jxweb/jx/img/201901081623.png" alt="结婚汇" width="170" height="55">
                </div>
               
            </div>
        </div>
    </header>
    <!-- 头部结束-->

    <!-- 中间内容开始 -->
    <section class="content">
        <div class="section_img">
            <img src="/marry/jxweb/jx/img/left.png" alt="咱们结婚吧" width="613" height="512">
        </div>
        <div class="section_login">
            <div class="section_login_con">
                <div class="section_login_con_top">
                    <h4>找回密码</h4>
                    <div class="phone">
                        <span>手机号</span>
                        <input type="tel" placeholder="手机号" name="tel">
                    </div>
                    <div class="message">
                        <span>验证码</span>
                        <input type="text" name="Verification" placeholder="短信验证码">
                        <input type="button" value="获取短信验证码" name="Obtain">
                    </div>
                    <div class="pass">
                            <span>设置密码</span>
                            <input type="pass" placeholder="6-20位字母/数字组合" name="pass">
                    </div>
                    <div class="sure_pass">
                            <span>确认新密码</span>
                            <input type="pass" placeholder="6-20位字母/数字组合" name="sure_pass">
                    </div>
                    <div class="loginup">
                       <input type="text" name="loginup" value="确定" class="Determine" readonly>
                    </div>
                </div>
               
            </div>
        </div>
    </section>
    <!-- 中间内容结束 -->
    <!-- 底部开始 -->
    <%@ include file="common/foot.jsp"%>
    <!-- 底部结束 -->

    <!-- 找回密码成功的提示框开始 -->
        <div class="model">
            <div class="model_content">
                <img src="/marry/jxweb/jx/img/succpass_03.png" alt="找回密码" width="347" height="247">
                <p>恭喜您，成功设置了新密码！</p>
                <div class="model_button">
                    <a href="index">去首页</a>
                    <a href="">去我的中心</a>
                </div>
            </div>
        </div>

    <!-- 找回密码成功的提示框结束 -->
    <script>
        // 点击确定出来的弹出框
        $('.Determine').click(function(){
            // alert('1')
            $('.model').slideDown()
            $('.model_content').slideDown()
        });
        $('.model').click(function(){
            $('.model').slideUp()
            $('.model_content').slideUp()
        })
    </script>
</body>
</html>