<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
	<head>
		<meta charset="UTF-8">
		<title>最新活动详情</title>
		<link rel="stylesheet" type="text/css" href="jxweb/jx/css/noticecontent.css">
		<script src="jxweb/jx/js/jquery.min.js"></script>
		<script src="jxweb/jx/js/common.js"></script>
	</head>
	<body>
	<%@ include file="common/header.jsp"%>
		<!-- 导航位置 -->
		<section class="Navigation">
			<a href="index">首页</a>><a href="">公告详情</a>
		</section>
		<article class="article">
			<h1 class="title">${marryDiary.name}</h1>
			<div class="brief-introduction">
				<dl class="source">
					<dt>来源：</dt>
					<dd>${marryDiary.createUserId}</dd>
				</dl>
				<dl class="date">
					<dt>日期：</dt>
					<dd><fmt:formatDate value="${marryDiary.createTime}" pattern="yyyy-MM-dd"/></dd>
				</dl>
<%--				<div class="share">--%>
<%--					<i class="iconfont icon-fenxiang"></i>--%>
<%--					<span>分享</span>--%>
<%--				</div>--%>
			</div>
			<div class="content">
				${marryDiary.content}
			</div>
			<div class="page-turning">
				<c:if test="${topId != 0}">
					<dl>
						<dt>上一页：</dt>
						<dd><a href="latestactivitiescontent?id=${topId}">${topName}</a></dd>
					</dl>
				</c:if>
				<c:if test="${nextId != 0}">
					<dl>
						<dt>下一页：</dt>
						<dd><a href="latestactivitiescontent?id=${nextId}">${nextName}</a></dd>
					</dl>
				</c:if>
			</div>
		</article>
	<%@ include file="common/foot.jsp"%>
	</body>
</html>
	