<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>${fns:getConfig('productName')} 登录</title>
	<meta name="decorator" content="blank"/>
	<style type="text/css">
		html,body,table{background-color:#f5f5f5;width:100%;text-align:center;}.form-signin-heading{font-family:Helvetica, Georgia, Arial, sans-serif, 黑体;font-size:36px;margin-bottom:20px;color:#0663a2;}
		.form-signin{position:relative;text-align:left;width:300px;padding:25px 29px 29px;margin:0 auto 20px;background-color:#fff;border:1px solid #e5e5e5;
			-webkit-border-radius:5px;-moz-border-radius:5px;border-radius:5px;-webkit-box-shadow:0 1px 2px rgba(0,0,0,.05);-moz-box-shadow:0 1px 2px rgba(0,0,0,.05);box-shadow:0 1px 2px rgba(0,0,0,.05);}
		.form-signin .checkbox{margin-bottom:10px;color:#0663a2;} .form-signin .input-label{font-size:16px;line-height:23px;color:#999;}
		.form-signin .input-block-level{font-size:16px;height:auto;margin-bottom:15px;padding:7px;*width:283px;*padding-bottom:0;_padding:7px 7px 9px 7px;}
		.form-signin .btn.btn-large{font-size:16px;} .form-signin #themeSwitch{position:absolute;right:15px;bottom:10px;}
		.form-signin div.validateCode {padding-bottom:15px;} .mid{vertical-align:middle;}
		.header{height:80px;padding-top:20px;} .alert{position:relative;width:300px;margin:0 auto;*padding-bottom:0px;}
		label.error{background:none;width:270px;font-weight:normal;color:inherit;margin:0;}
	</style>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#loginForm").validate({
				rules: {
					validateCode: {remote: "${pageContext.request.contextPath}/servlet/validateCodeServlet"}
				},
				messages: {
					username: {required: "请填写用户名."},password: {required: "请填写密码."},
					validateCode: {remote: "验证码不正确.", required: "请填写验证码."}
				},
				errorLabelContainer: "#messageBox",
				errorPlacement: function(error, element) {
					error.appendTo($("#loginError").parent());
				}
			});
		});
		// 如果在框架或在对话框中，则弹出提示并跳转到首页
		if(self.frameElement && self.frameElement.tagName == "IFRAME" || $('#left').length > 0 || $('.jbox').length > 0){
			alert('未登录或登录超时。请重新登录，谢谢！');
			top.location = "${ctx}";
		}
	</script>
</head>
<body>
<!--[if lte IE 6]><br/><div class='alert alert-block' style="text-align:left;padding-bottom:10px;"><a class="close" data-dismiss="alert">x</a><h4>温馨提示：</h4><p>你使用的浏览器版本过低。为了获得更好的浏览体验，我们强烈建议您 <a href="http://browsehappy.com" target="_blank">升级</a> 到最新版本的IE浏览器，或者使用较新版本的 Chrome、Firefox、Safari 等。</p></div><![endif]-->
<div class="header">
	<div id="messageBox" class="alert alert-error ${empty message ? 'hide' : ''}"><button data-dismiss="alert" class="close">×</button>
		<label id="loginError" class="error">${message}</label>
	</div>
</div>
<h1 class="form-signin-heading">${fns:getConfig('productName')}</h1>
<form id="loginForm" name="loginIndexFirst" class="form-signin" action="" method="post">
	<label class="input-label" >姓名</label>
	<input type="text" id="userName" name="userName" class="input-block-level required">
	<label class="input-label" >学号</label>
	<input type="text" id="studentId" name="studentId" class="input-block-level required">
	<input class="btn btn-large btn-primary" type="button" value="登 录" onclick="loginFirst()"/>&nbsp;&nbsp;
</form>
<div class="footer">
	<a href="${pageContext.request.contextPath}${fns:getAdminPath()}">${fns:getConfig('productName')}</a>
</div>
<script src="${ctxStatic}/flash/zoom.min.js" type="text/javascript"></script>

<script>
	function loginFirst() {
		var userName = $('#userName').val();
		var studentId = $('#studentId').val();
		if(userName == ""){
			swal("姓名未填写", "", "error");
			return;
		}
		if(studentId == ""){
			swal("学号未填写", "", "error");
			return;
		}
		document.loginIndexFirst.action = "<c:url value='loginFirst'/>";
		document.loginIndexFirst.submit();
	}
</script>

</body>
</html>