<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
	<head>
		<meta charset="UTF-8">
		<title>公告详情</title>
		<link rel="stylesheet" type="text/css" href="jxweb/jx/css/noticecontent.css">
		<script src="jxweb/jx/js/jquery.min.js"></script>
		<script src="jxweb/jx/js/common.js"></script>
	</head>
	<body>
	<%@ include file="common/header.jsp"%>
		<!-- 导航位置 -->
		<section class="Navigation">
			<a href="index.html">首页</a>><a href="">公告详情</a>
		</section>
		<article class="article">
			<h1 class="title">${notice.title}</h1>
			<div class="brief-introduction">
				<dl class="source">
					<dt>来源：</dt>
					<dd>${notice.author}</dd>
				</dl>
				<dl class="date">
					<dt>日期：</dt>
					<dd><fmt:formatDate value="${notice.creatTime }" pattern="yyyy-MM-dd"/></dd>
				</dl>
				<div class="share">
					<i class="iconfont icon-fenxiang"></i>
					<span>分享</span>
				</div>
			</div>
			<div class="content">
				<dd>${notice.content}</dd>

			</div>
			<div class="page-turning">
			</div>
		</article>
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
	