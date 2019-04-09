<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>公司信息管理</title>
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
		<li class="active"><a href="${ctx}/compony/marryCompany/">公司信息列表</a></li>
		<shiro:hasPermission name="compony:marryCompany:edit"><li><a href="${ctx}/compony/marryCompany/form">公司信息添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="marryCompany" action="${ctx}/compony/marryCompany/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>公司姓名：</label>
				<form:input path="name" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>标题：</label>
				<form:input path="title" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>公司姓名</th>
				<th>标题</th>
				<shiro:hasPermission name="compony:marryCompany:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="marryCompany">
			<tr>
				<td><a href="${ctx}/compony/marryCompany/form?id=${marryCompany.id}">
					${marryCompany.name}
				</a></td>
				<td>
					${marryCompany.title}
				</td>
				<shiro:hasPermission name="compony:marryCompany:edit"><td>
    				<a href="${ctx}/compony/marryCompany/form?id=${marryCompany.id}">修改</a>
					<a href="${ctx}/compony/marryCompany/delete?id=${marryCompany.id}" onclick="return confirmx('确认要删除该公司信息吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>