<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>内容管理</title>
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
	<script src="${ctxStatic}/picture/jquery.form.js" type="text/javascript"></script>
	<link href="${ctxStatic}/picture/cover.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="${ctxStatic}/picture/mgScroll.js"></script>
	<script src="${ctxStatic}/ueditor/ueditor.config.js" type="text/javascript"></script>
	<script src="${ctxStatic}/ueditor/ueditor.all.js" type="text/javascript"></script>
	<script src="${ctxStatic}/ueditor/lang/zh-cn/zh-cn.js" type="text/javascript"></script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/product/marryProduct/list?type=${marryProduct.type}">${fns:getMarryDictName(marryProduct.type)}内容列表</a></li>
		<li class="active"><a href="${ctx}/product/marryProduct/form?type=${marryProduct.type}&sort=0&id=${marryProduct.id}">${fns:getMarryDictName(marryProduct.type)}内容<shiro:hasPermission name="product:marryProduct:edit">${not empty marryProduct.id?'编辑':'添加'}</shiro:hasPermission><shiro:lacksPermission name="product:marryProduct:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" name="marryProductForm" modelAttribute="marryProduct" action="${ctx}/product/marryProduct/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<form:hidden path="type"/>
		<form:hidden path="dictIds" id="dictIds" value="${dictIds}"/>
		<input type="hidden" id="originalPicUrl" name="picPath" value="${marryProduct.picPath}">
		<input type="hidden" name="coverPath" id="primaryPicUrl" value="${marryProduct.coverPath}"/>
		<div class="hide">
			<textarea id="pageInfoValue">${marryProduct.content}</textarea>
			<textarea id="pageInfoSpecificationValue">${marryProduct.specification}</textarea>
			<textarea id="pageInfoStoryValue">${marryProduct.story}</textarea>
		</div>
		<sys:message content="${message}"/>
		<c:forEach items="${marryDictList}" var="marryDict">
			<div class="control-group">
				<label class="control-label">${marryDict.valueName}</label>
				<div class="controls">
					<select path="" class="input-medium" id="${marryDict.marryDictId}">
						<c:forEach items="${marryDict.valueList}" var="dict">
							${dict.strName}
						</c:forEach>
					</select>
				</div>
			</div>
		</c:forEach>


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
			<label class="control-label">详细介绍</label>
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
			<label class="control-label">参数说明</label>
			<div class="controls">
				<script id="editor-specification" type="text/plain" style="width:1024px;height:500px;"></script>
				<form:hidden path="specification" id="specificationEditor"/>
				<script type="text/javascript">
				//实例化编辑器
				var specificationEditorTemplate = UE.getEditor('editor-specification',{allowDivTransToP: false});
				//初始化编辑框内容
				var pageInfoSpecificationStr = $("#pageInfoSpecificationValue").val();
				specificationEditorTemplate.ready(function() {
					specificationEditorTemplate.setContent(pageInfoSpecificationStr, false);
				});
				</script>

			</div>
		</div>
		<div class="control-group">
			<label class="control-label">商品故事</label>
			<div class="controls">
				<script id="editor-story" type="text/plain" style="width:1024px;height:500px;"></script>
				<form:hidden path="story" id="storyEditor"/>
				<script type="text/javascript">
				//实例化编辑器
				var storyTemplate = UE.getEditor('editor-story',{allowDivTransToP: false});
				//初始化编辑框内容
				var pageInfoStoryStr = $("#pageInfoStoryValue").val();
				storyTemplate.ready(function() {
					storyTemplate.setContent(pageInfoStoryStr, false);
				});
				</script>

			</div>
		</div>
		<div class="control-group">
			<label class="control-label font_weight">是否置顶</label>
			<div class="controls">
				<form:radiobuttons path="topOn"
								   items="${fns:getDictList('topOn')}" itemLabel="label"
								   itemValue="value" htmlEscape="false" class="required" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label font_weight">是否成功案例</label>
			<div class="controls">
				<form:radiobuttons path="showState"
								   items="${fns:getDictList('show_state')}" itemLabel="label"
								   itemValue="value" htmlEscape="false" class="required" />
			</div>
		</div>

		<div class="control-group">
			<label class="control-label">封面图</label>
			<div class="controls">
				<div id="previewList">
					<c:choose>
						<c:when test="${not empty marryProduct.coverPath}">
							<img id="imgListName" alt="" src="${marryProduct.coverPath}" style="width: 250px;height: 150px">
						</c:when>
						<c:otherwise>
							<img id="imgListName" alt="" src="${ctxStatic}/common/imgs/img.png" style="width: 250px;height: 150px">
						</c:otherwise>
					</c:choose>
				</div>
				<input type="file" onchange="previewCoverPath(this)" id="listUrlPic" />
			</div>
		</div>



		<div class="control-group">
			<label class="control-label">排序</label>
			<div class="controls">
				<form:input path="sort" htmlEscape="false" maxlength="3" class="input-xlarge required" id="sort"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>


		<div class="control-group">
			<label class="control-label">产品展示图片</label>
			<div class="controls">
				<form id="inputForm" method="post" enctype="multipart/form-data">
					<div class="f_choim">
						<ul class="st_tis" style="margin: 0;">
							<c:forEach items="${projectAlbum}" var="album">
								<li style="display: block"><img class="opic" src="${album}" /><a onclick="closeImg(this)" style="cursor: pointer"></a></li>
							</c:forEach>
						</ul>
						<input type="file" class="f_img" id="imgFile" name="imgFile" onchange="uploadPic('inputForm')"><a class="uplo_i"></a>
					</div>
				</form>
			</div>
		</div>




		<div class="form-actions">
			<shiro:hasPermission name="product:marryProduct:edit">
				<input id="btnSubmit" onclick="marryProductSave()" class="btn btn-primary" type="button" value="保存"/>
				&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
	<script>
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
				url : "<c:url value='/a/product/marryProduct/commodityUrlPicUpload'/>",
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
						$(".st_tis").append('<li style="display:block"><img class="opic" src="'+data+'"/><a onclick="closeImg(this)" style="cursor:pointer"></a></li>');
						$('.f_choim input.f_img,a.uplo_i').css('left',$(".st_tis").width());

					}

				}
			});
		}
		function previewCoverPath(file) {
			var formData = new FormData();
			var listCoverPic = $("#listUrlPic").val();
			formData.append("file", $("#listUrlPic")[0].files[0]);
			formData.append("headerPic", listCoverPic);
			var listPicPath;
			$.ajax({
				url : "<c:url value='/a/product/marryProduct/coverPicUpload'/>",
				type : 'POST',
				data : formData,
				async : false,
				cache : false,
				contentType : false,
				processData : false,
				success : function(returndata) {
					$("#imgListName").attr("src", "${picUrl}" + returndata);
					listPicPath =  returndata;
					$("#primaryPicUrl").val(listPicPath);
				},
				error : function(returndata) {
					alert(returndata);
				}
			});
		}

		function marryProductSave() {
			var name = $('#name').val();
			var type = $('#type').val();
			var dictIdList= $("#dictIds").val().split(';');
			debugger;
			var id_index,dictIds = "";
			for(id_index in dictIdList){
				if(dictIdList[id_index]!=""){
					var id= $("#"+dictIdList[id_index]).val();
					dictIds = dictIds + id + ",";
				}
			}
			if(dictIds.endsWith(",")){
				dictIds = dictIds.substring(0,dictIds.length-1);
			}
			$('#dictIds').val(dictIds);
			if(name == ""){
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
			$("#contentEditor").val(UE.getEditor('editor').getContent());
			$("#specificationEditor").val(UE.getEditor('editor-specification').getContent());
			$("#storyEditor").val(UE.getEditor('editor-story').getContent());
			document.marryProductForm.action = "<c:url value='/a/product/marryProduct/save'/>";
			document.marryProductForm.submit();
		}
	</script>
</body>
</html>