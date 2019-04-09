<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>普通方式登录</title>
    <link rel="stylesheet" href="jxweb/jx/css/login.css">
    <script src="jxweb/jx/js/jquery.min.js"></script>
    <script src="jxweb/jx/js/login.js"></script>
</head>
<body>
<input type="hidden"  class="message" value="${message}">
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
                    <h4>登录<a href="loginphone">普通方式登录<span class="iconfont icon-yonghuming"></span></a></h4>
                    <form action="<c:url value='/baseUserLogin'/>" method="post" onsubmit="return formCheck()">
                        <input type="text" placeholder="请输入手机号" name="tel" class="user">
                        <div class="message">
                            <input type="password" name="pass" placeholder="请输入密码" class="password">
                        </div>
                        <div class="err-info"></div>
                        <div class="loginup">
                            <input type="submit" value="登录" name="loginup" readonly>
                            <p>
                                <a href="retrieve" class="pass">忘记密码></a>
                                <span>没有账号<a href="register">去注册></a></span>
                            </p>
                        </div>
                    </form>
                </div>
                <div class="section_login_con_bottom">
                    <div class="section_login_con_bottom_con">
                        <p>第三方登录:</p>
                        <div class="section_login_con_bottom_login">
                            <dl>
                                <dt>
                                    <a href="social/wechat"><img src="/marry/jxweb/jx/img/we_52.png" alt="微信" width="45" height="45"></a>
                                </dt>
                                <dd>微信</dd>
                            </dl>
                             <dl>
                                <dt>
                                    <a href="social/qq"><img src="/marry/jxweb/jx/img/we_47.png" alt="QQ" width="45" height="45"></a>
                                </dt>
                                <dd>QQ</dd>
                            </dl>
                             <dl>
                                <dt>
                                    <a href="social/weibo"><img src="/marry/jxweb/jx/img/we_49.png" alt="微博" width="45" height="45"></a>
                                </dt>
                                <dd>微博</dd>
                            </dl>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- 中间内容结束 -->
    <!-- 底部开始 -->
    <%@ include file="common/foot.jsp"%>
    <!-- 底部结束 -->
</body>
</html>