<%@ page contentType="text/html;charset=UTF-8" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>企业文化</title>
		<link rel="stylesheet" type="text/css" href="jxweb/jx/css/corporateculture.css">
		<script src="jxweb/jx/js/jquery.min.js"></script>
		<script src="jxweb/jx/js/common.js"></script>
	</head>
	<body>
	<%@ include file="common/header.jsp"%>
		<!-- banner -->
		<section class="banner-wrapper">
			<div class="banner-son">
				<img src="${company.culturePic}" alt="" width="1920" height="500">
			</div>
		</section>
		<!-- 导航位置 -->
		<section class="Navigation">
			<a href="index">首页</a>><a href="">企业文化</a>
		</section>
		<!-- 分类 -->
		<section class="list-wrapper">
			<div class="ul-1">
				<a href="aboutenterprises" class="li">
					<div class="text">公司介绍</div>
					<div class="line-up"></div>
					<div class="line-down"></div>
				</a>
				<a href="corporateculture" class="li active">
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
				<a href="corporatenews?page=0&type=5" class="li">
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
				<h2 class="t-1">企业文化</h2>
				<div class="t-2">COMPANY CULTURE</div>
				<div class="t-3"></div>
			</div>
			<div class="li-2">
				<img src="/marry/jxweb/jx/img/201901111500.jpg" alt="" width="1200" height="540">
			</div>
		</section>
	<%@ include file="common/foot.jsp"%>
	</body>
</html>
	