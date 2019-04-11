<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>我的回答管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			if(n) $("#pageNo").val(n);
			if(s) $("#pageSize").val(s);
			$("#searchForm").attr("action","${ctx}/reply/examReply/list");
			$("#searchForm").submit();
			return false;
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/reply/examReply/">考生列表</a></li>
	</ul>
	<form:form id="searchForm" modelAttribute="examReply" action="${ctx}/reply/examReply/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<li><label>试卷</label>

			<form:select path="paperId" class="input-medium">
				<form:option value="" label="">全部试卷</form:option>
				<form:options items="${fns:getDictList('paperType')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
			</form:select>
		</li>
		<li><label>考生组别</label>
			<form:select path="useType" class="input-medium">
				<form:option value="" label="">全部组别</form:option>
				<form:options items="${fns:getDictList('useTpye')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
			</form:select>
		</li>
		<li><label>考生姓名</label>
			<form:input path="userName" htmlEscape="false" maxlength="100" class="input-medium"/>
		</li>
		<li><label>考生单位</label>
			<form:input path="company" htmlEscape="false" maxlength="100" class="input-medium"/>
		</li>
		<li><label>考生场次</label>
			<form:input path="scene" htmlEscape="false" maxlength="100" class="input-medium"/>
		</li>
		<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询" onclick="return page();"/></li>
		<li class="clearfix"></li>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>序号</th>
				<th>考生姓名</th>
				<th>考生单位</th>
				<th>考生场次</th>
				<th>考生总分</th>
				<th>答对总数</th>
				<th>答错总数</th>
				<shiro:hasPermission name="reply:examReply:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="examReply" varStatus="indexs">
			<tr>
				<td>${indexs.index+1}</td>
				<td>${examReply.userName}</td>
				<td>${examReply.company}</td>
				<td>${examReply.scene}</td>
				<td>${examReply.scoreSum}</td>
				<td>${examReply.correctSum}</td>
				<td>${examReply.questionSum - examReply.correctSum}</td>
				<shiro:hasPermission name="reply:examReply:edit"><td>
    				<a href="${ctx}/reply/examReply/form?id=${examReply.studentId}">查看详情</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>