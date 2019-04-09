<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>推荐攻略管理</title>
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
	<script src="${ctxStatic}/ueditor/ueditor.config.js" type="text/javascript"></script>
	<script src="${ctxStatic}/ueditor/ueditor.all.js" type="text/javascript"></script>
	<script src="${ctxStatic}/ueditor/lang/zh-cn/zh-cn.js" type="text/javascript"></script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/strategy/marryStrategy/">推荐攻略列表</a></li>
		<li class="active"><a href="${ctx}/strategy/marryStrategy/form?id=${marryStrategy.id}">推荐攻略<shiro:hasPermission name="strategy:marryStrategy:edit">${not empty marryStrategy.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="strategy:marryStrategy:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" name="marryStrategyForm" modelAttribute="marryStrategy" action="${ctx}/strategy/marryStrategy/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>
		<div class="hide">
			<textarea id="pageInfoValue">${marryStrategy.content}</textarea>
		</div>
		<input type="hidden" name="coverPath" id="primaryPicUrl" value="${marryStrategy.coverPath}"/>
		<div class="control-group">
			<label class="control-label">标题</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="200" class="input-xlarge " id="name"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">推荐类型</label>
			<form:hidden path="type" id="type"/>
			<div class="controls">
				<select path="" class="input-medium" id="typeValue">
					<c:forEach items="${mapList}" var="dict">
						<option value="${dict.id}"
						<c:if test="${dict.id == marryStrategy.type}">selected = "selected"</c:if>
						>${dict.name}</option>
					</c:forEach>
				</select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">排序</label>
			<div class="controls">
				<form:input path="sort" htmlEscape="false" class="input-xlarge required digits" id="sort"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">来源</label>
			<div class="controls">
				<form:input path="createName" htmlEscape="false" maxlength="200" class="input-xlarge "/>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label">内容</label>
			<div class="controls">
				<script id="editor" type="text/plain" style="width:1024px;height:500px;"></script>
				<form:hidden path="content" id="contentEditor"/>
				<script type="text/javascript">
				//实例化编辑器
				var ueTemplate = UE.getEditor('editor',{allowDivTransToP: false});
				//初始化编辑框内容
				var pageInfoStr = $("#pageInfoValue").val();
				ueTemplate.ready(function() {
					ueTemplate.setContent(pageInfoStr, false);
				});
				UE.Editor.prototype._bkGetActionUrl=UE.Editor.prototype.getActionUrl;
				UE.Editor.prototype.getActionUrl=function(action){
					if (action == 'uploadimage'||action =='uploadfile'){//图片上传
						return 'upload/images';
					}else{
						return this._bkGetActionUrl.call(this, action);
					}
				};
				</script>

			</div>
		</div>

		<div class="control-group">
			<label class="control-label">图片</label>
			<div class="controls">
				<div id="previewList">
					<c:choose>
						<c:when test="${not empty marryStrategy.coverPath}">
							<img id="imgListName" alt="" src="${marryStrategy.coverPath}" style="width: 200px;height: 150px">
						</c:when>
						<c:otherwise>
							<img id="imgListName" alt="" src="${ctxStatic}/common/imgs/img.png" style="width: 200px;height: 150px">
						</c:otherwise>
					</c:choose>
				</div>
				<input type="file" onchange="previewList(this)" id="listUrlPic" />
			</div>
		</div>



		<div class="form-actions">
			<shiro:hasPermission name="strategy:marryStrategy:edit">
				<input id="btnSubmit" onclick="saveMarryStrategy()" class="btn btn-primary" type="button" value="保存"/>
				&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>

	<script type="text/javascript">
		function saveMarryStrategy(){
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
			$("#contentEditor").val(UE.getEditor('editor').getContent());
			$("#type").val($("#typeValue").val());
			document.marryStrategyForm.action = "<c:url value='/a/strategy/marryStrategy/save'/>";
			document.marryStrategyForm.submit();
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