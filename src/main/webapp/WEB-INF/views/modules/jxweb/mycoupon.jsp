<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>个人中心-个人分享</title>
    <link rel="stylesheet" href="jxweb/jx/css/mycoupon.css">
    <script src="jxweb/jx/js/jquery.min.js"></script>
    <script src="jxweb/jx/js/common.js"></script>
</head>
<body>
    <!-- 头部开始-->
    <%@ include file="common/header.jsp"%>
    <!-- 头部结束-->
    <!-- 导航位置 -->
    <section class="Navigation">
        <a href="index.html">首页</a>><a href="javascript:;">个人中心</a>><a href="javascript:;">我的优惠券</a>
    </section>
    <!-- 内容开始 -->
   <section class="content">
        <!-- 左侧菜单 -->
       <%@ include file="common/userLeft.jsp"%>
        <div class="content_right_list">
            <div class="content_right_list_con">
                <p>如想使用优惠券，请立即咨询<a href="javascript:;">在线客服</a></p>
                <div class="content_right_list_cont">
                    <c:forEach items="${couponList}" var="coupon">
                        <a href="javascript:;">
                            <img src="${coupon.coverPath}" alt="优惠券" width="384px" height="225px">
                        </a>
                    </c:forEach>
                </div>
            </div>
        </div>
   </section>

    <!-- 内容结束 -->

    <!-- 底部开始 -->
    <%@ include file="common/foot.jsp"%>
    <!-- 底部结束 -->



</body>
</html>