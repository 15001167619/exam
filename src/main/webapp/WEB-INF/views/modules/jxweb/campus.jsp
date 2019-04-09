<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
	<head>
		<meta charset="UTF-8">
		<title>加入我们-校园招聘</title>
		<link rel="stylesheet" type="text/css" href="jxweb/jx/css/Joinussocial.css">
		<script src="jxweb/jx/js/jquery.min.js"></script>
		<script src="jxweb/jx/js/common.js"></script>
		<script src="jxweb/jx/js/recruit.js"></script>
	</head>
	<body>
	<%@ include file="common/header.jsp"%>
		<section class="banner-wrapper">
			<div class="banner-son">
				<img src="/marry/jxweb/jx/img/201901141436.jpg" alt="" width="1920" height="500">
			</div>
		</section>
		<!-- 导航位置 -->
		<section class="Navigation">
			<a href="index.html">首页</a>><a href="">校园招聘</a>
		</section>
		<!-- 分类 -->
		<section class="list-wrapper">
			<ul class="ul-1">
				<li class="li">
					<a href="corporatewelfare" class="text">公司福利</a>
					<div class="line-up"></div>
					<div class="line-down"></div>
				</li>
				<li class="li">
					<a href="Joinussocial?page=0&state=1" class="text">社会招聘</a>
					<div class="line-up"></div>
					<div class="line-down"></div>
				</li>
				<li class="li active">
					<a href="Joinussocial?page=0&state=0" class="text">校园招聘</a>
					<div class="line-up"></div>
					<div class="line-down"></div>
				</li>
			</ul>
		</section>
		<section class="content">
			<div class="table-title">
				<div class="s-1">职位名称</div>
				<div class="s-1">职位类别</div>
				<div class="s-1">工作地点</div>
				<div class="s-1">招聘人数</div>
				<div class="s-1">更新时间</div>
			</div>
			<ul class="table-ul">
				<c:forEach items="${recruitmentList}" var="st">
					<li class="table-li">
						<div class="table-li-1">
							<div class="table-li-1-1">${st.name}</div>
							<div class="table-li-1-1">${st.workType}</div>
							<div class="table-li-1-1">${st.address}</div>
							<div class="table-li-1-1">${st.num}</div>
							<div class="table-li-1-1">
								<span>2018-01-01</span>
								<i class="iconfont icon-shipinbofang"></i>
							</div>
						</div>
						<div class="operable">
							<div class="table-li-2">
								<dl class="dl dl-1">
									<dt class="dt">职位名称：</dt>
									<dd class="dd">${st.name}</dd>
								</dl>
								<dl class="dl dl-2">
									<dt class="dt">工作地点：</dt>
									<dd class="dd">${st.address}</dd>
								</dl>
								<dl class="dl dl-3">
									<dt class="dt">职位类别：</dt>
									<dd class="dd">${st.workType}</dd>
								</dl>
								<dl class="dl dl-4">
									<dt class="dt">工作职责：</dt>
									<dd class="dd">
										<p>${st.responsibilities}</p>
									</dd>
								</dl>
								<dl class="dl dl-5">
									<dt class="dt">投递简历发送至：</dt>
									<dd class="dd">${st.email}</dd>
								</dl>
							</div>
						</div>
					</li>
				</c:forEach>


			</ul>
			<!-- 分页 -->
			<div class="page-wrapper">
				<ul>
					<li><a href="Joinussocial?page=0&state=1" class="up">首页</a></li>
					<c:forEach var="li" items="${integers}">
						<li><a href="Straty?type=4&page=${li-1}">${li}</a></li>
					</c:forEach>
					<li><a href="Joinussocial?state=1&page=${num}" class="next">末页</a></li>
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
	