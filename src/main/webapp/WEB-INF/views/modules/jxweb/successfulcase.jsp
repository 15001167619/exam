<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>成功案例</title>
		<link rel="stylesheet" type="text/css" href="jxweb/jx/css/successfulcase.css">
		<script src="jxweb/jx/js/jquery.min.js"></script>
		<script src="jxweb/jx/js/common.js"></script>
		<script src="jxweb/jx/js/case.js"></script>
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
			<a href="index">首页</a>><a href="">成功案例</a>
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
				<a href="successfulcase?page=0&type=0" class="li active">
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
				<h2 class="t-1">成功案例</h2>
				<div class="t-2">SUCCESS CASE</div>
				<div class="t-3"></div>
			</div>
			<section class="product-switching-effect">
				<ul class="tab-item">
					<c:forEach items="${successCaseList}" var="suc">
						<li class="li-item" id="product-switching-list">
							<div class="v-1">
								<div class="v-1-1">
									<div class="v-1-1-1">
										<img src="${suc.pic1}" alt="" width="301" height="362">
									</div>
									<div class="v-1-1-2">
										<a href="productdetails?id=${suc.productId}">
											<img src="/marry/jxweb/jx/img/search.png" alt="">
											<p>
													${suc.title}<br>
												<span>${suc.content}</span>
											</p>
										</a>
									</div>
								</div>
								<div class="v-1-1">
									<div class="v-1-1-1">
										<img src="${suc.pic2}" alt="" width="301" height="362">
									</div>
									<div class="v-1-1-2">
										<a href="productdetails?id=${suc.productId}">
											<img src="/marry/jxweb/jx/img/search.png" alt="">
											<p>
													${suc.title}<br>
												<span>${suc.content}</span>
											</p>
										</a>
									</div>
								</div>
							</div>
							<div class="v-2">
								<div class="v-2-1">
									<img src="${suc.pic3}" alt="" width="621" height="752">
								</div>
								<div class="v-2-2">
									<a href="productdetails?id=${suc.productId}">
										<img src="/marry/jxweb/jx//img/search.png" alt="">
										<p>
												${suc.title}<br>
											<span>${suc.content}</span>
										</p>
									</a>
								</div>
							</div>
							<div class="v-3">
								<div class="v-3-1">
									<img src="${suc.pic4}" alt="" width="315" height="379">
								</div>
								<div class="v-3-2">
									<a href="productdetails?id=${suc.productId}">
										<img src="/jxweb/jx/img/search.png" alt="">
										<p>
												${suc.title}<br>
											<span>${suc.content}</span>
										</p>
									</a>
								</div>
							</div>
							<div class="v-4"></div>
							<div class="v-5">PRODUCT CENTER</div>
						</li>
					</c:forEach>
				</ul>

					<<div class="toggle-button">
						<span class="front">
							<i class="iconfont icon-jiantou"></i>
						</span>
						<span class="after">
							<i class="iconfont icon-jiantou"></i>
						</span>
					</div>
				</section>
				<ul class="theme-2-3 common-theme-2-3">
					<c:forEach var="sta" items="${marryProducts}">
					<li class="common-theme-2-3-item">
						<img src="${sta.coverPath}" alt="" width="282" height="340">
						<i class="iconfont icon-shipinbofang"></i>
						<div class="c-1">
							<div class="c-1-1">
								<div class="t">${sta.brief} </div>
								<div class="focus">
								<%--	<a href="javascript:;" class="not">
										<i class="iconfont icon-xin"></i>
										<span>关注</span>
									</a> -->--%>
									<a href="javascript:;" class="already">
										<i class="iconfont icon-xin"></i>
										<span>已关注</span>
									</a>
									<a href="javascript:;" class="share">
										<i class="iconfont icon-fenxiang"></i>
										<span>分享</span>
									</a>
									<a href="javascript:;" class="contrast">
										<i class="iconfont icon-duibi"></i>
										<span>对比</span>
									</a>
								</div>
							</div>
						</div>
						<a href="productdetails?id=${sta.id}" class="xq">查看详情</a>
					</li>
					</c:forEach>

				</ul>
				<!-- 分页 -->
				<div class="page-wrapper">
					<ul>
						<li><a href="successfulcase?type=4&page=0" class="up">首页</a></li>
						<c:forEach var="li" items="${integers}">
							<li><a href="successfulcase?type=4&page=${li-1}">${li}</a></li>
						</c:forEach>
						<li><a href="successfulcase?type=4&page=${num}" class="next">末页</a></li>
					</ul>
				</div>
				</section>
		</section>
	<%@ include file="common/foot.jsp"%>
	</body>
</html>
	