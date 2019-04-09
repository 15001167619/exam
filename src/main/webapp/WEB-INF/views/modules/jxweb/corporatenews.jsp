<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>企业新闻</title>
		<link rel="stylesheet" type="text/css" href="jxweb/jx/css/corporatenews.css">
		<script src="jxweb/jx/js/jquery.min.js"></script>
		<script src="jxweb/jx/js/common.js"></script>
	</head>
	<body>
	<%@ include file="common/header.jsp"%>
		<!-- banner -->
		<section class="banner-wrapper">
			<div class="banner-son">
				<img src="/marry/jxweb/jx/img/201901141436.jpg" alt="" width="1920" height="500">
			</div>
		</section>
		<!-- 导航位置 -->
		<section class="Navigation">
			<a href="index">首页</a>><a href="">企业新闻</a>
		</section>
		<!-- 分类 -->
		<section class="list-wrapper">
			<div class="ul-1">
				<a href="aboutenterprises" class="li">
					<div class="text">公司介绍</div>
					<div class="line-up"></div>
					<div class="line-down"></div>
				</a>
				<a href="corporateculture" class="li">
					<div class="text">企业文化</div>
					<div class="line-up"></div>
					<div class="line-down"></div>
				</a>
				<a href="senseofworth" class="li">
					<div class="text">价值观</div>
					<div class="line-up"></div>
					<div class="line-down"></div>
				</a>
				<a href="development" class="li">
					<div class="text">发展历程</div>
					<div class="line-up"></div>
					<div class="line-down"></div>
				</a>
				<a href="successfulcase?page=0&type=0" class="li">
					<div class="text">成功案例</div>
					<div class="line-up"></div>
					<div class="line-down"></div>
				</a>
				<a href="corporatenews?page=0&type=5" class="li active">
					<div class="text">企业新闻</div>
					<div class="line-up"></div>
					<div class="line-down"></div>
				</a>
				<a href="contactinformation" class="li">
					<div class="text">联系方式</div>
					<div class="line-up"></div>
					<div class="line-down"></div>
				</a>				
			</div>
		</section>
		<section class="content">
			<div class="common-title-wrapper">
				<h2 class="t-1">企业新闻</h2>
				<div class="t-2">CORPORATE NEWS</div>
				<div class="t-3"></div>
			</div>
			<ul class="ul">
				<ul class="ul">
					<c:forEach var="sta" items="${marryStrategyList}">
						<li class="li">
							<a href="latestactivitiescontent?id=18" class="li-1">
								<img src="${sta.url}" alt="" width="285" height="173">
								<i class="iconfont icon-shipinbofang"></i>
							</a>
							<div class="li-2">
								<a href="latestactivitiescontent?id=18" class="a-1">${sta.title}</a>
								<a href="latestactivitiescontent?id=18" class="a-2">${sta.subtitle}</a>
							</div>
						</li>
					</c:forEach>
				</ul>
			</ul>
			<!-- 分页 -->
			<div class="page-wrapper">
				<ul>
					<li><a href="Straty?type=4&page=0" class="up">首页</a></li>
					<c:forEach var="li" items="${integers}">
						<li><a href="Straty?type=4&page=${li-1}">${li}</a></li>
					</c:forEach>
					<li><a href="Straty?type=4&page=${num}" class="next">末页</a></li>
				</ul>
			</div>
		</section>
	<%@ include file="common/foot.jsp"%>
	</body>
</html>
	