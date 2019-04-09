<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>轮播图管理</title>
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
		<li><a href="${ctx}/banner/marryBanner/">轮播图列表</a></li>
		<li class="active"><a href="${ctx}/banner/marryBanner/form?sort=0&id=${marryBanner.id}">轮播图<shiro:hasPermission name="banner:marryBanner:edit">${not empty marryBanner.id?'编辑':'添加'}</shiro:hasPermission><shiro:lacksPermission name="banner:marryBanner:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm"  name="marryBannerForm" modelAttribute="marryBanner" action="${ctx}/banner/marryBanner/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>
		<input type="hidden" name="coverPath" id="primaryPicUrl" value="${marryBanner.coverPath}"/>
		<div class="control-group">
			<label class="control-label">名称</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="200" class="input-xlarge required" id="name"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">banner</label>
			<div class="controls">
				<div id="previewList">
					<c:choose>
						<c:when test="${not empty marryBanner.coverPath}">
							<img id="imgListName" alt="" src="${marryBanner.coverPath}" style="width: 300px;height: 200px">
						</c:when>
						<c:otherwise>
							<img id="imgListName" alt="" src="${ctxStatic}/common/imgs/img.png" style="width: 300px;height: 200px">
						</c:otherwise>
					</c:choose>
				</div>
				<input type="file" onchange="previewList(this)" id="listUrlPic" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">排序</label>
			<div class="controls">
				<form:input path="sort" htmlEscape="false" class="input-xlarge required digits" id="sort"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="banner:marryBanner:edit">
				<input id="btnSubmit" onclick="saveMarryBanner()" class="btn btn-primary" type="button" value="保存"/>
				&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>

	<script type="text/javascript">
		function saveMarryBanner(){
			var name = $('#name').val();
			var imgUploadPath = $('#primaryPicUrl').val();
			if(name == ""){
				swal("名称未填写", "", "error");
				return;
			}
			if(imgUploadPath == ""){
				swal("未上传图片", "", "error");
				return;
			}
			var sort = $('#sort').val();
			var re = /^[0-9]+.?[0-9]*$/;
			if (!re.test(sort)) {
				swal("请输入数字", "", "error");
				$('#sort').val(0);
				return;
			}
			document.marryBannerForm.action = "<c:url value='/a/banner/marryBanner/save'/>";
			document.marryBannerForm.submit();
		}
		function previewList(file) {
			var formData = new FormData();
			var listCoverPic = $("#listUrlPic").val();
			formData.append("file", $("#listUrlPic")[0].files[0]);
			formData.append("headerPic", listCoverPic);
			var listPicPath;
			$.ajax({
				url : "<c:url value='/a/banner/marryBanner/bannerUpload'/>",
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