<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<head>
	<meta charset="UTF-8">
	<title>首页</title>
	<!-- saved from url=(0014)about:internet -->
	<meta http-equiv="X-UA-Compatible" content="IE=Edge，chrome=1">
	<meta name="viewport"
		  content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<!--[if IE]>
	<script src="https://libs.useso.com/js/html5shiv/3.7/html5shiv.min.js"></script>
	<script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.js"></script>
	<![endif]-->
	<link rel="icon" href="images/favicon.ico" type="images/logo3">
	<link rel="stylesheet" href="${ctxStatic}/dati/layui/css/layui.css">
	<link rel="stylesheet" href="${ctxStatic}/dati/css/style.css">
</head>
<body>

<form id="loginForm" name="loginIndexFirst">
	<input type="hidden" id="useType" name="useType" value="2">
	<input type="hidden" id="userName" name="userName">
	<input type="hidden" id="company" name="company" >
	<input type="hidden" id="studentId" name="studentId" >
	<input type="hidden" id="scene" name="scene" >
</form>



<div class="all">
	<div class="title"><img src="${ctxStatic}/dati/img/title.png" alt=""></div>
	<div class="login clearfix">
		<div class="login_l fl"></div>
		<div class="login_r fr">
			<h2>考生登录</h2>
			<div class="account">
				<label>
					<span class="fl">姓名</span>
					<input class="name fl" type="text">
				</label>
				<label>
					<span class="fl">单位</span>
					<input class="company fl" type="text">
				</label>
				<label>
					<span class="fl">考场</span>
					<input class="room fl" type="text">
				</label>
				<label>
					<span class="fl">考号</span>
					<input class="number fl" type="text">
				</label>
			</div>
			<a class="btn" href="javascript:;">开始答题</a>
		</div>
	</div>
	<div class="foot">
		<p>共青团房山区委教育工作委员会</p>
		<p>版权所有@共青团房山区委教育工作委员会 京ICP备S231231</p>
	</div>
</div>

</body>
<script src="${ctxStatic}/dati/js/jquery.min.js"></script>
<script src="${ctxStatic}/dati/layui/layui.all.js"></script>
<script>
	//点击注册按钮
	$(".btn").on("click", function () {
		var n = $(".name").val();
		var c = $(".company").val();
		var r = $(".room").val();
		var num = $(".number").val();
		if (!n) {
			layer.msg("请输入姓名！");
			return false;
		}
		if (!/^[\u4e00-\u9fa5]+$/gi.test(n)) {
			layer.msg("请输入汉字！");
			return false;
		}
		if (!c) {
			layer.msg("请输入单位！");
			return false;
		}
		if (!r) {
			layer.msg("请输入考场！");
			return false;
		}
		if (!num) {
			layer.msg("请输入考号！");
			return false;
		}
		$('#userName').val(n);
		$('#company').val(c);
		$('#scene').val(r);
		$('#studentId').val(num);
		document.loginIndexFirst.action = "<c:url value='questions'/>";
		document.loginIndexFirst.submit();
	});
</script>
</html>