<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>coupon管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/coupon/marryCoupon/">优惠券列表</a></li>
		<li class="active"><a href="${ctx}/coupon/marryCoupon/form?id=${marryCoupon.id}">优惠券<shiro:hasPermission name="coupon:marryCoupon:edit">${not empty marryCoupon.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="coupon:marryCoupon:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm"  name="marryCouponForm" modelAttribute="marryCoupon" action="${ctx}/coupon/marryCoupon/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>
		<input type="hidden" name="coverPath" id="primaryPicUrl" value="${marryCoupon.coverPath}"/>
		<div class="control-group">
			<label class="control-label">优惠券</label>
			<div class="controls">
				<div id="previewList">
					<c:choose>
						<c:when test="${not empty marryCoupon.coverPath}">
							<img id="imgListName" alt="" src="${marryCoupon.coverPath}" style="width: 300px;height: 200px">
						</c:when>
						<c:otherwise>
							<img id="imgListName" alt="" src="${ctxStatic}/common/imgs/img.png" style="width: 300px;height: 200px">
						</c:otherwise>
					</c:choose>
				</div>
				<input type="file" onchange="previewList(this)" id="listUrlPic" />
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="coupon:marryCoupon:edit">
				<input id="btnSubmit" onclick="saveMarryCoupon()" class="btn btn-primary" type="button" value="保存"/>
				&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>

	<script type="text/javascript">
		function saveMarryCoupon(){
			var imgUploadPath = $('#primaryPicUrl').val();
			if(imgUploadPath == ""){
				swal("未上传图片", "", "error");
				return;
			}
			document.marryCouponForm.action = "<c:url value='/a/coupon/marryCoupon/save'/>";
			document.marryCouponForm.submit();
		}
		function previewList(file) {
			var formData = new FormData();
			var listCoverPic = $("#listUrlPic").val();
			formData.append("file", $("#listUrlPic")[0].files[0]);
			formData.append("headerPic", listCoverPic);
			var listPicPath;
			$.ajax({
				url : "<c:url value='/a/coupon/marryCoupon/couponUpload'/>",
				type : 'POST',
				data : formData,
				async : false,
				cache : false,
				contentType : false,
				processData : false,
				success : function(returndata) {
					$("#imgListName").attr("src", returndata);
					listPicPath =  returndata;
					$("#primaryPicUrl").val(listPicPath);
				},
				error : function(returndata) {
					alert(returndata);
				}
			});
		}
	</script>
</body>
</html>