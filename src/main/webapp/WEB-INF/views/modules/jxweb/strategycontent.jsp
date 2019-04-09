<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>推荐攻略详情</title>
		<link rel="stylesheet" type="text/css" href="jxweb/jx/css/strategycontent.css">
		<script src="jxweb/jx/js/jquery.min.js"></script>
		<script src="jxweb/jx/js/common.js"></script>
		<link rel="stylesheet" href="jxweb/jx/css/share.css"/>
		<script src="jxweb/jx/js/ZeroClipboard.js"></script>
	</head>
	<body>
	<%@ include file="common/header.jsp"%>
		<!-- 导航位置 -->
		<section class="Navigation">
			<a href="index">首页</a>><a href="">推荐攻略详情</a>
		</section>

		<!-- 内容 -->
		<section class="article-wrapper">
			<article class="article">
				<h1 class="title">${marryStrategy.name}</h1>
				<div class="brief-introduction">
					<dl class="source">
						<dt>来源：</dt>
						<dd>${marryStrategy.createName}</dd>
					</dl>
					<dl class="date">
						<dt>日期：</dt>
						<dd><fmt:formatDate value="${marryStrategy.createTime}" pattern="yyyy-MM-dd"/></dd>
					</dl>
					<a href="javascript:;">
						<div class="share">
							<i class="iconfont icon-fenxiang"></i>
							<span onclick="shareOnclick()">分享</span>
						</div>
					</a>
				</div>
				<div class="content">
					${marryStrategy.content}
				</div>
				<div class="page-turning">
					<c:if test="${topId != 0}">
						<dl>
							<dt>上一页：</dt>
							<dd><a href="strategycontent?id=${topId}">${topName}</a></dd>
						</dl>
					</c:if>
					<c:if test="${nextId != 0}">
						<dl>
							<dt>下一页：</dt>
							<dd><a href="strategycontent?id=${nextId}">${nextName}</a></dd>
						</dl>
					</c:if>
				</div>
			</article>
			<aside class="aside">
				<div class="aside-box">
					<div class="title-wrapper">
						<h3 class="h3-label-2">推荐攻略</h3>
						<a href="strategy" class="more">MORE &gt;</a>
					</div>
					<ul class="unified-ul">
						<c:forEach var="otherStrategy" items="${otherStrategyList}">
							<li class="unified-li">
								<a href="strategycontent?id=${otherStrategy.id}" class="a-1">
									<img src="${otherStrategy.coverPath}" alt="" width="250" height="301">
								</a>
								<a href="" class="a-2">${otherStrategy.name}</a>
							</li>
						</c:forEach>
					</ul>
				</div>
			</aside>
		</section>
		<%@include file="common/foot.jsp"%>

	<!-- 分享 -->

	<div class="mark"></div>
	<div class="share-dialog">
		<div class="share-close"></div>
		<div class="share-dialog-title">分享</div>
		<div class="share-dialog-cont">
			<div class="share-copy">
				<div class="share-copy-l">分享链接：</div>
				<div class="share-copy-c"><input id="copytext" type="text"/></div>
				<div id="btnCopy" class="share-copy-r"  data-clipboard-target="copytext">复制链接</div>
				<div class="clear"></div>
			</div>
			<div class="share-platform">
				<div class="share-platform-l">社交平台：</div>
				<div class="share-platform-r">
					<div class="bdsharebuttonbox">
						<a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a>
						<a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a>
						<a href="#" class="bds_sqq" data-cmd="sqq" title="分享到QQ好友"></a>
						<a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a>
					</div>
					<div class="share-platform-text">
						您可以直接复制短链，分享给朋友，也可直接点击社交平台图标，指定分享。
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"分享到新浪微博","bdMini":"1","bdMiniList":["bdxc","tqf","douban","bdhome","sqq","thx","ibaidu","meilishuo","mogujie","diandian","huaban","duitang","hx","fx","youdao","sdo","qingbiji","people","xinhua","mail","isohu","yaolan","wealink","ty","iguba","fbook","twi","linkedin","h163","evernotecn","copy","print"],"bdPic":"","bdStyle":"1","bdSize":"32"},"share":{}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>


	<script type="text/javascript">
		var g_url = window.location.href;
		$('.share-copy-c input').val(g_url);

		var clip = new ZeroClipboard( document.getElementById("btnCopy"));


		function shareOnclick(){
			//用户分享
			$('.mark').show();
			$('.share-dialog').show();
		}

		$('.share-close').on('click', function() {
			$('.mark').hide()
			$('.share-dialog').hide()
		})
	</script>
	</body>
</html>
	