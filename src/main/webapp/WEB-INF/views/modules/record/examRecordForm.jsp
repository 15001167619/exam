<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>答题记录管理</title>
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
		<li><a href="${ctx}/record/examRecord/">答题记录列表</a></li>
		<li class="active"><a href="${ctx}/record/examRecord/examRecordForm?id=${examRecord.id}">答题记录<shiro:hasPermission name="record:examRecord:edit">${not empty examRecord.id?'查看':'添加'}</shiro:hasPermission><shiro:lacksPermission name="record:examRecord:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="searchForm" modelAttribute="examRecord" action="${ctx}/record/examRecord/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<li><label>试卷 ：${examRecord.paperId} 卷</label></li>
		<li><label>组别 ：${examRecord.useType ==1 ? '中学组':'小学组'} </label></li>
		<li><label>姓名 ：${examRecord.userName} </label></li>
		<li><label>单位 ：${examRecord.company} </label></li>
		<li><label>场次 ：${examRecord.scene} </label></li>
		<li class="clearfix"></li>
	</form:form>
	<table id="contentTable" class="table table-striped table-bordered table-condensed" style="margin-top: 20px">
		<thead>
		<tr>
			<th style="text-align: center;" width="50px" bgcolor="#7cb96e">题号</th>
			<th style="text-align: center;">题目内容</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${questions}" var="examQuestion" varStatus="indexs">
			<tr>
				<td style="text-align: center;" id="index_${examQuestion.questionId}">${indexs.index+1}</td>
				<td style="font-weight:bold;font-size: 14px"> <br/>[${examQuestion.questionType}]&nbsp;&nbsp;${examQuestion.question}<br/>
					<br/>
					<input type="hidden" value="${examQuestion.correctAnswer}" id="answer_${examQuestion.questionId}"/>
					<input type="hidden" value="${examQuestion.questionId}" id="question_${examQuestion.questionId}"/>
					<c:choose>
						<c:when test="${examQuestion.type == 0}">
							<label><input name="radio_${examQuestion.questionId}" type="radio" value="A" <c:if test="${examQuestion.correctAnswer == 'A'}">checked</c:if>/>A:${examQuestion.answerContent.A}</label><br/>
							<label><input name="radio_${examQuestion.questionId}" type="radio" value="B" <c:if test="${examQuestion.correctAnswer == 'B'}">checked</c:if>/>B:${examQuestion.answerContent.B}</label><br/>
							<label><input name="radio_${examQuestion.questionId}" type="radio" value="C" <c:if test="${examQuestion.correctAnswer == 'C'}">checked</c:if>/>C:${examQuestion.answerContent.C}</label><br/>
							<label><input name="radio_${examQuestion.questionId}" type="radio" value="D" <c:if test="${examQuestion.correctAnswer == 'D'}">checked</c:if>/>D:${examQuestion.answerContent.D}</label><br/>
							<br/>
							您的选择答案：&nbsp;&nbsp;A &nbsp;&nbsp;得分情况：${examQuestion.score}&nbsp;&nbsp;分
						</c:when>
						<c:otherwise>
							<label><input name="radio_${examQuestion.questionId}" type="radio" value="1" <c:if test="${examQuestion.correctAnswer == 1}">checked</c:if>/>正确</label>
							<label><input name="radio_${examQuestion.questionId}" type="radio" value="0" <c:if test="${examQuestion.correctAnswer == 0}">checked</c:if>/>错误</label><br/>
							<br/>
							您的选择答案：&nbsp;&nbsp;${examQuestion.userAnswer == 0 ? '错误':'正确'} &nbsp;&nbsp;得分情况：${examQuestion.score}&nbsp;&nbsp;分
						</c:otherwise>
					</c:choose>
					<br/>

				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</body>
</html>