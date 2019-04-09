<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
	<head>
		<meta charset="UTF-8">
		<title>联系方式</title>
		<link rel="stylesheet" type="text/css" href="jxweb/jx/css/contactinformation.css">
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
			<a href="index">首页</a>><a href="">联系方式</a>
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
				<a href="corporatenews?page=0&type=5" class="li">
					<div class="text">企业新闻</div>
					<div class="line-up"></div>
					<div class="line-down"></div>
				</a>
				<a href="contactinformation" class="li active">
					<div class="text">联系方式</div>
					<div class="line-up"></div>
					<div class="line-down"></div>
				</a>
			</div>
		</section>
		<section class="content">
			<div class="common-title-wrapper">
				<h2 class="t-1">联系方式</h2>
				<div class="t-2">CONTACT INFORMATION</div>
				<div class="t-3"></div>
			</div>
			<ul class="map-list">
				<c:forEach var="com" items="${company}">
				<li class="map-list-item">
					<div class="left">
						 <h3 class="l-1">${com.name}</h3>
						 <div class="l-2">
						 	<i class="iconfont icon-dianhua"></i>
						 	<dl class="l-1-1">
						 		<dt class="l-1-1-1">全国咨询电话：</dt>
						 		<dd class="l-1-1-2">${com.allnumber}</dd>
						 	</dl>
						 </div>
						 <div class="l-2">
						 	<i class="iconfont icon-naozhong"></i>
						 	<dl class="l-1-1">
						 		<dt class="l-1-1-1">服务时间：</dt>
						 		<dd class="l-1-1-2">${com.servertime}</dd>
						 	</dl>
						 </div>
						 <div class="l-2">
						 	<i class="iconfont icon-dizhi"></i>
						 	<dl class="l-1-1">
						 		<dt class="l-1-1-1">地址：</dt>
						 		<dd class="l-1-1-2">${com.address}</dd>
						 	</dl>
						 </div>
						 <div class="l-2">
						 	<i class="iconfont icon-zhongguoyouzheng"></i>
						 	<dl class="l-1-1">
						 		<dt class="l-1-1-1">邮编：</dt>
						 		<dd class="l-1-1-2">${com.code}</dd>
						 	</dl>
						 </div>
						 <div class="l-2">
						 	<i class="iconfont icon-dianhua1"></i>
						 	<dl class="l-1-1">
						 		<dt class="l-1-1-1">总机：</dt>
						 		<dd class="l-1-1-2">${com.cellphone}</dd>
						 	</dl>
						 </div>
						 
					</div>
					<div class="right">
						
					</div>
				</li>
				</c:forEach>

			</ul>
		</section>
	<%@ include file="common/foot.jsp"%>
	</body>
</html>
	