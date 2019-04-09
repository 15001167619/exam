<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>内容管理</title>
	<meta name="decorator" content="default"/>
	<script src="${ctxStatic}/picture/jquery.form.js" type="text/javascript"></script>
	<link href="${ctxStatic}/picture/cover.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="${ctxStatic}/picture/mgScroll.js"></script>
	<script src="${ctxStatic}/ueditor/ueditor.config.js" type="text/javascript"></script>
	<script src="${ctxStatic}/ueditor/ueditor.all.js" type="text/javascript"></script>
	<script src="${ctxStatic}/ueditor/lang/zh-cn/zh-cn.js" type="text/javascript"></script>
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
		<li><a href="${ctx}/diary/marryDiary/?type=${marryDiary.type}">${fns:getMarryDiaryName(marryDiary.type)}列表</a></li>
		<li class="active"><a href="${ctx}/diary/marryDiary/form?type=${marryDiary.type}&sort=0&id=${marryDiary.id}">${fns:getMarryDiaryName(marryDiary.type)}<shiro:hasPermission name="diary:marryDiary:edit">${not empty marryDiary.id?'编辑':'添加'}</shiro:hasPermission><shiro:lacksPermission name="diary:marryDiary:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" name="marryDiaryForm" modelAttribute="marryDiary" action="${ctx}/diary/marryDiary/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<form:hidden path="type" id="type"/>
		<sys:message content="${message}"/>
		<input type="hidden" id="originalPicUrl" name="coverPath" value="${marryDiary.coverPath}">
		<div class="hide">
			<textarea id="pageInfoValue">${marryDiary.content}</textarea>
		</div>
		<div class="control-group">
			<label class="control-label">名称</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="200" class="input-xlarge required" id="name"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">简介</label>
			<div class="controls">
				<form:textarea path="brief" htmlEscape="false" rows="4" class="input-xxlarge " style="margin: 0px; width: 1008px; height: 143px;"/>
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
			<label class="control-label">排序</label>
			<div class="controls">
				<form:input path="sort" htmlEscape="false" maxlength="3" class="input-xlarge required"  id="sort"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">创建者</label>
			<div class="controls">
				<form:input path="createUserId" htmlEscape="false" maxlength="200" class="input-xlarge required" id="createUserId"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">展示图片</label>
			<div class="controls">
				<form id="inputForm" method="post" enctype="multipart/form-data">
					<div class="f_choim">
						<ul class="st_tis" style="margin: 0;">
							<c:forEach items="${projectAlbum}" var="album">
								<li style="display: block"><img class="opic" src="${picUrl}${album}" /><a onclick="closeImg(this)" style="cursor: pointer"></a></li>
							</c:forEach>
						</ul>
						<input type="file" class="f_img" id="imgFile" name="imgFile" onchange="uploadPic('inputForm')"><a class="uplo_i"></a>
					</div>
				</form>
			</div>
		</div>


		<div class="form-actions">
			<shiro:hasPermission name="diary:marryDiary:edit">
				<input id="btnSubmit" onclick="saveMarryDiary()" class="btn btn-primary" type="button" value="保存"/>
				&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>

	<script type="text/javascript">

		function closeImg(obj) {
			var imgSrc = $(obj).parent().find("img")[0].src;
			imgSrc = imgSrc.replace("${picUrl}","");
			var originalPicUrl = $("#originalPicUrl").val();
			var originalPicUrls = originalPicUrl.split(";");
			$("#originalPicUrl").val("");
			for (var int = 0; int < originalPicUrls.length; int++) {
				if(originalPicUrls[int]!=imgSrc){
					if ($("#originalPicUrl").val() != "") {
						$("#originalPicUrl").val($("#originalPicUrl").val()	+ ";" + originalPicUrls[int]);
					} else {
						$("#originalPicUrl").val(originalPicUrls[int]);

					}
				};

			}
			$(obj).parent().hide().remove();
			$('.f_choim input.f_img,.f_choim a.uplo_i').css('left',
					$('.st_tis').width());
		};


		function uploadPic(formId) {
			$('input.f_file').hover(
					function() {
						$(this).next().find('img.halrea').removeClass('shay')
								.addClass('disn');
						$(this).next().find('img.f_coimg').removeClass('disn')
								.addClass('shay');
					},
					function() {
						$(this).next().find('img.halrea').removeClass('disn')
								.addClass('shay');
						$(this).next().find('img.f_coimg').removeClass('shay')
								.addClass('disn');
					});
			var formObj = $("#" + formId)
			//异步表单提交 先提交图片
			formObj.ajaxSubmit({
				type : "POST",
				url : "<c:url value='/a/diary/marryDiary/commodityUrlPicUpload'/>",
				dataType : "text",
				async : false,
				data : {
					fileType : "imge"
				},
				success : function(data) {
					debugger;

					if (formId == "inputForm") {
						if ($("#originalPicUrl").val() != "") {
							$("#originalPicUrl").val($("#originalPicUrl").val()	+ ";" + data);
						} else {
							$("#originalPicUrl").val(data);

						}
						$(".st_tis").append('<li style="display:block"><img class="opic" src="${picUrl}'+data+'"/><a onclick="closeImg(this)" style="cursor:pointer"></a></li>');
						$('.f_choim input.f_img,a.uplo_i').css('left',$(".st_tis").width());

					}

				}
			});
		}



		function saveMarryDiary(){
			debugger;
			var type = $('#type').val();
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
			document.marryDiaryForm.action = "<c:url value='/a/diary/marryDiary/save'/>";
			document.marryDiaryForm.submit();
		}

	</script>
</body>
</html>