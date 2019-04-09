<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>注册</title>
    <link rel="stylesheet" href="jxweb/jx/css/regidter.css">
    <script src="jxweb/jx/js/jquery.min.js"></script>
    <script src="jxweb/jx/js/common.js"></script>
    <script src="jxweb/jx/js/regidter.js"></script>
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
                    <h4>注册</h4>
                    <form action="<c:url value="/registUser"/>" method="post" onsubmit="return formCheck()">
                        <div class="phone">
                            <span>手机号</span>
                            <input type="tel" placeholder="手机号" name="tel" class="user">
                        </div>
                        <div class="message">
                            <span>验证码</span>
                            <input type="text" name="Verification" placeholder="短信验证码" class="Code" >
                            <div class="obtain" onclick="getVerificationCode()">获取验证码</div>
                            <div class="mask"></div>
                        </div>
                        <div class="pass">
                                <span>密码</span>
                                <input type="password" placeholder="6-20位字母/数字组合" name="pass" class="password-1">
                        </div>
                        <div class="sure_pass">
                                <span>确认密码</span>
                                <input type="password" placeholder="6-20位字母/数字组合" name="sure_pass" class="password-2">
                        </div>
                        <div class="err-info"></div>
                        <div class="loginup">
                            <p><span>*</span>注册即表示同意<a href="useragreement">《玖禧用户协议》</a></p>
                           <input type="submit" name="loginup" value="注册" readonly id="register" class="loginup-button">
                           <div>
                               已有账号<a href="loginordinary">去登录></a>
                           </div>
                        </div>
                    </form>
                </div>
                <div class="section_login_con_bottom">
                    <div class="section_login_con_bottom_con">
                        <p>第三方登录:</p>
                        <div class="section_login_con_bottom_login">
                            <dl>
                                <dt>
                                    <img src="/marry/jxweb/jx/img/we_52.png" alt="微信" width="45" height="45">
                                </dt>
                                <dd>微信</dd>
                            </dl>
                             <dl>
                                <dt>
                                    <img src="/marry/jxweb/jx/img/we_47.png" alt="QQ" width="45" height="45">
                                </dt>
                                <dd>QQ</dd>
                            </dl>
                             <dl>
                                <dt>
                                    <img src="/marry/jxweb/jx/img/we_49.png" alt="微博" width="45" height="45">
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

    
    <!-- 注册成功的提示框开始 -->
    <div class="model">
            <div class="model_content">         
               <div class="model_content_text">
                    <h4>恭喜您，注册成功！<p>您已获得以下代金券，请尽快使用哦</p></h4>
               </div>
                <div class="youhui">
                    <a href="javascript:;"><img src="/marry/jxweb/jx/img/youhui_10.png" alt="优惠券" width="384" height="225"></a>
                    <a href="javascript:;"><img src="/marry/jxweb/jx/img/youhui_10.png" alt="优惠券" width="384" height="225"></a>
                    <a href="javascript:;"><img src="/marry/jxweb/jx/img/youhui_10.png" alt="优惠券" width="384" height="225"></a>
                    <a href="javascript:;"><img src="/marry/jxweb/jx/img/youhui_10.png" alt="优惠券" width="384" height="225"></a>
                    <a href="javascript:;"><img src="/marry/jxweb/jx/img/youhui_10.png" alt="优惠券" width="384" height="225"></a>
                    <a href="javascript:;"><img src="/marry/jxweb/jx/img/youhui_10.png" alt="优惠券" width="384" height="225"></a>
                </div>
            </div>
        </div>

    <!-- 注册成功的提示框结束 -->

<!--     <script>
        // 点击注册出来的弹出框
        $('#register').click(function(){
            // alert('1')
            $('.model').slideDown()
            $('.model_content').slideDown()
        });
        $('.model').click(function(){
            $('.model_content').slideUp()
            $('.model').slideUp()
            
        })
    </script> -->
</body>
</html>