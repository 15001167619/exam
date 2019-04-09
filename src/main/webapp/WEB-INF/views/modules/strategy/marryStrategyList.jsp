<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>推荐攻略管理</title>
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
		<li class="active"><a href="${ctx}/strategy/marryStrategy/">推荐攻略列表</a></li>
		<shiro:hasPermission name="strategy:marryStrategy:edit"><li><a href="${ctx}/strategy/marryStrategy/form">推荐攻略添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="marryStrategy" action="${ctx}/strategy/marryStrategy/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>标题：</label>
				<form:input path="name" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>标题</th>
				<shiro:hasPermission name="strategy:marryStrategy:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="marryStrategy">
			<tr>
				<td><a href="${ctx}/strategy/marryStrategy/form?id=${marryStrategy.id}">
					${marryStrategy.name}
				</a></td>
				<shiro:hasPermission name="strategy:marryStrategy:edit"><td>
    				<a href="${ctx}/strategy/marryStrategy/form?id=${marryStrategy.id}">修改</a>
					<a href="${ctx}/strategy/marryStrategy/delete?id=${marryStrategy.id}" onclick="return confirmx('确认要删除该推荐攻略吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>