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
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
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
		<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
		<li class="clearfix"></li>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<shiro:hasPermission name="reply:examReply:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="examReply">
			<tr>
				<shiro:hasPermission name="reply:examReply:edit"><td>
    				<a href="${ctx}/reply/examReply/form?id=${examReply.id}">修改</a>
					<a href="${ctx}/reply/examReply/delete?id=${examReply.id}" onclick="return confirmx('确认要删除该我的回答吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>