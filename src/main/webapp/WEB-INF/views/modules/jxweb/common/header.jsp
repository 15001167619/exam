<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="<c:url value='/jxweb/jx/js/base-api.js'/>"></script>
<html>
<head>
    <title>Title</title>
</head>
<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? "https://" : "http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1276895709'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s23.cnzz.com/z_stat.php%3Fid%3D1276895709%26show%3Dpic1' type='text/javascript'%3E%3C/script%3E"));</script>

<script>
    $(document).ready(function() {
        $('#cnzz_stat_icon_1276895709').hide();
    });
    function logOut() {
        //利用对话框返回的值 （true 或者 false）
        if (confirm("您确定退出登录吗？")) {
            $.ajax({
                url: "<c:url value='/api/user/logOut'/>",
                method: 'POST',
                dataType: 'json',
                success: function (res) {
                    if (res.code == 200) {
                        window.location.href = "<c:url value='/index'/>"
                    }
                }
            })
        }
    }

</script>

<body>

<header class="header-wrapper">
    <div class="up">
        <div class="up-son">
            <div class="sign">
                <c:if test="${empty marryUser}" >
                    <!-- 登录前 -->
                    <a href="loginordinary" class="front">登录/注册</a>
                </c:if>
                <c:if test="${!empty marryUser}" >
                    <!-- 登陆后 -->
                    <a href="peoplecenter" class="after">
                        <img src="${marryUser.headUrl}" alt="用户头像" width="27" height="27">
                        <span>${marryUser.name}</span>
                        <a href="javascript:;" onclick="logOut()" class="front">退出登录</a>
                    </a>
                </c:if>
            </div>
            <div class="code">
                <div class="code-up">
                    <div class="code-up-son">
                        <span>9XiAPP</span>
                        <i class="icon iconfont icon-shouji"></i>
                    </div>
                </div>
                <img src="/marry/jxweb/jx/img/201901081101.jpg" alt="手机app下载" width="441" height="247">
            </div>
            <div class="search">
                <input type="text" placeholder="请输入产品类别或产品名称" id="searchContent" value="${keyword}">
                <div class="line"></div>
                <i class="iconfont icon-sousuo" onclick="search()"></i>
            </div>
            <div class="customer-service">客服：400-000-2861</div>
        </div>
    </div>
    <%@ include file="head.jsp"%>
</header>
</body>
</html>
