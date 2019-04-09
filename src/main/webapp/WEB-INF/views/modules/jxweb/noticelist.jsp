<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<html>
	<head>
		<meta charset="UTF-8">
		<title>公告</title>
		<link rel="stylesheet" type="text/css" href="jxweb/jx/css/noticelist.css">
		<script src="jxweb/jx/js/jquery.min.js"></script>
		<script src="jxweb/jx/js/common.js"></script>
	</head>
	<body>
	<%@ include file="common/header.jsp"%>
		<!-- 导航位置 -->
		<section class="Navigation">
			<a href="index.html">首页</a>><a href="">公告</a>
		</section>
		<!-- 分类 -->
		<section class="list-wrapper">
			<ul class="ul">
				<c:forEach items="${notices}" var="nt">
				<li class="li-item">
					<a href="noticeById?id=${nt.id}" class="up">
						<i class="iconfont icon-laba"></i>
						<span class="span-1">${nt.title}</span>
						<span class="span-2"><fmt:formatDate value="${nt.creatTime }" pattern="yyyy-MM-dd"/></span>
					</a>
					<p class="down">${nt.introduction}</p>
				</li>
				</c:forEach>
			</ul>

			<!-- 分页 -->
			<div class="page-wrapper">
				<ul>
					<li><a href="notice?page=0" class="up">首页</a></li>
					<c:forEach var="li" items="${integers}">
						<li><a href="notice?type=4&page=${li-1}">${li}</a></li>
					</c:forEach>
					<li><a href="notice?state=1&page=${num}" class="next">末页</a></li>
				</ul>
			</div>
		</section>
		<footer class="footer">
			<div class="up">
				<ul class="ul">
					<li><a href="index">首页</a></li>
					<li><a href="productlist?type=7">酒店预订</a></li>
					<li><a href="productlist?type=0">婚礼策划</a></li>
					<li><a href="aboutenterprises">公司简介</a></li>
					<li><a href="productlist?type=1">婚纱摄影</a></li>
					<li><a href="Straty?type=1&page=0">推荐攻略</a></li>
					<li><a href="productlist?type=2">艺术写真</a></li>
					<li><a href="Straty?type=4&page=0">新闻资讯</a></li>
					<li><a href="productlist?type=3">婚纱礼服</a></li>
					<li><a href="latestactivitieslist">最新活动</a></li>
					<li><a href="productlist?type=4">结婚钻戒</a></li>
					<li><a href="Joinussocial?page=0&state=1">加入我们</a></li>
					<li><a href="productlist?type=5">结婚用品</a></li>
					<li><a href="contactinformation">联系我们</a></li>
					<li><a href="productlist?type=6">蜜月旅行</a></li>
					<li><a href="notice?page=0">公告</a></li>
				</ul>
				<div class="address">
					<dl>
						<dt>合作洽谈：</dt>
						<dd>love@9xi.com</dd>
					</dl>
					<dl>
						<dt>朝阳门店地址：</dt>
						<dd>北京市朝阳区朝外大街丙10号佰宝汇4层</dd>
					</dl>
					<dl>
						<dt>蓝色港湾店地址：</dt>
						<dd>朝阳公园路6号蓝色港湾国际商区内(朝阳公园西北角)二层</dd>
					</dl>
				</div>
			</div>
			<div class="line"></div>
			<div class="copyright">京ICP备17050536号&nbsp;&nbsp;&nbsp;&nbsp;版权所有©2016-2017&nbsp;&nbsp;北京久禧科技有限公司&nbsp;&nbsp;技术支持：时代创信</div>
		</footer>
	</body>
</html>
	