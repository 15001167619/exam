<%@ page contentType="text/html;charset=UTF-8" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>发展历程</title>
		<link rel="stylesheet" type="text/css" href="jxweb/jx/css/development.css">
		<script src="jxweb/jx/js/jquery.min.js"></script>
		<script src="jxweb/jx/js/common.js"></script>
	</head>
	<body>
	<%@ include file="common/header.jsp"%>
		<!-- banner -->
		<section class="banner-wrapper">
			<div class="banner-son">
				<img src="${company.development}" alt="" width="1920" height="500">
			</div>
		</section>
		<!-- 导航位置 -->
		<section class="Navigation">
			<a href="index">首页</a>><a href="">发展历程</a>
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
				<a href="development" class="li active">
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
				<h2 class="t-1">发展历程</h2>
				<div class="t-2">DEVELOPMENT PATH</div>
				<div class="t-3"></div>
			</div>
			<div class="li-2">
				<img src="/marry/jxweb/jx/img/201901111445.jpg" alt="" width="1200" height="966">
				<img src="/marry/jxweb/jx/img/201901111546.jpg" alt="" width="1200" height="768">
			</div>
			<img src="/marry/jxweb/jx/img/201901111600.png" alt="" class="img-1" width="143" height="89">
			<img src="/marry/jxweb/jx/img/201901111601.png" alt="" class="img-2" width="100" height="79">
			<img src="/marry/jxweb/jx/img/201901111602.png" alt="" class="img-3" width="310" height="486">
		</section>
		<section class="heart-shaped"></section>
	<%@ include file="common/foot.jsp"%>
	</body>
</html>
	