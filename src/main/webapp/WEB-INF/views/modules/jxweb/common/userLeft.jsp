<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="content_left_list">
    <ul>
        <c:choose>
            <c:when test="${tabType==1}">
                <li class="active">
            </c:when>
            <c:otherwise>
                <li>
            </c:otherwise>
        </c:choose>
            <a href="peoplecenter">
                <i class="iconfont icon-fangwuxinxi"></i>
                <span>我的首页</span>
            </a>
        </li>
        <c:choose>
            <c:when test="${tabType==2}">
                <li class="active">
            </c:when>
            <c:otherwise>
                <li>
            </c:otherwise>
        </c:choose>
            <a href="personalinformation">
                <i class="iconfont icon-gerenxinxixiugai"></i>
                <span>个人信息</span>
            </a>
        </li>
        <c:choose>
            <c:when test="${tabType==3}">
                <li class="active">
            </c:when>
            <c:otherwise>
                <li>
            </c:otherwise>
        </c:choose>
            <a href="recentlybrowse">
                <i class="iconfont icon-yanjing-zheng"></i>
                <span>浏览记录</span>
            </a>
        </li>
        <c:choose>
            <c:when test="${tabType==4}">
                <li class="active">
            </c:when>
            <c:otherwise>
                <li>
            </c:otherwise>
        </c:choose>
            <a href="myconcern?type=0">
                <i class="iconfont icon-xin"></i>
                <span>我的关注</span>
            </a>
        </li>
        <c:choose>
            <c:when test="${tabType==5}">
                <li class="active">
            </c:when>
            <c:otherwise>
                <li>
            </c:otherwise>
        </c:choose>
            <a href="myevaluation">
                <i class="iconfont icon-icon-pinglun"></i>
                <span>我的评论</span>
            </a>
        </li>
        <c:choose>
            <c:when test="${tabType==6}">
                <li class="active">
            </c:when>
            <c:otherwise>
                <li>
            </c:otherwise>
        </c:choose>
            <a href="mycoupon">
                <i class="iconfont icon-youhuiquan"></i>
                <span>我的优惠券</span>
            </a>
        </li>
        <c:choose>
            <c:when test="${tabType==7}">
                <li class="active">
            </c:when>
            <c:otherwise>
                <li>
            </c:otherwise>
        </c:choose>
            <a href="personalsharing">
                <i class="iconfont icon-fenxiang"></i>
                <span>个人分享</span>
            </a>
        </li>
    </ul>
</div>
</body>
</html>
