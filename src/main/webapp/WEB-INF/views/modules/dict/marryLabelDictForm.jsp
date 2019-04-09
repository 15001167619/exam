<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>业务管理</title>
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
		<li><a href="${ctx}/dict/marryDict/list?type=${marryDict.type}">${fns:getMarryDictName(marryDict.type)}数据列表</a></li>
		<li class="active"><a href="${ctx}/dict/marryDict/labelForm?type=${marryDict.type}&sort=${marryDict.sort}&parentId=${marryDict.id}&category=${marryDict.category}&id=${marryDict.id}">${fns:getMarryDictName(marryDict.type)}标签值<shiro:hasPermission name="dict:marryDict:edit">${not empty marryDict.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="dict:marryDict:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" name="marryLabelDictForm" modelAttribute="marryDict" action="${ctx}/dict/marryDict/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<form:hidden path="type" id="type"/>
		<form:hidden path="parentId" id="parentId"/>
		<form:hidden path="category" id="category"/>
		<sys:message content="${message}"/>
		<div class="control-group">
			<label class="control-label">标签值</label>
			<div class="controls">
				<form:input path="label" htmlEscape="false" maxlength="100" class="input-xlarge required" id="label"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">排序</label>
			<div class="controls">
				<form:input path="sort" htmlEscape="false" class="input-xlarge required" id="sort"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="dict:marryDict:edit">
				<input id="btnSubmit" onclick="marryLabelDictSave()" class="btn btn-primary" type="button" value="保存"/>
				&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>

	<script>
		function marryLabelDictSave() {
			var label = $('#label').val();
			var type = $('#type').val();
			var parentId = $('#parentId').val();
			var category = $('#category').val();
			if(label == ""){
				swal("名称未填写", "", "error");
				return;
			}
			var sort = $('#sort').val();
			var re = /^[0-9]+.?[0-9]*$/;
			if (!re.test(sort)) {
				swal("请输入数字", "", "error");
				$('#sort').val(0);
				return;
			}
			document.marryLabelDictForm.action = "<c:url value='/a/dict/marryDict/save'/>";
			document.marryLabelDictForm.submit();
		}
	</script>

</body>
</html>