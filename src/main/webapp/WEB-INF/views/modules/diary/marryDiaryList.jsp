<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>内容管理</title>
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
		<li class="active"><a href="${ctx}/diary/marryDiary/list?type=${marryDiary.type}">${fns:getMarryDiaryName(marryDiary.type)}列表</a></li>
		<shiro:hasPermission name="diary:marryDiary:edit"><li><a href="${ctx}/diary/marryDiary/form?type=${marryDiary.type}&sort=0">${fns:getMarryDiaryName(marryDiary.type)}添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="marryDiary" action="${ctx}/diary/marryDiary/?type=${marryDiary.type}" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>名称：</label>
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
				<th>名称</th>
				<th>排序</th>
				<th>添加时间</th>
				<shiro:hasPermission name="diary:marryDiary:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="marryDiary">
			<tr>
				<td><a href="${ctx}/diary/marryDiary/form?id=${marryDiary.id}">
					${marryDiary.name}
				</a></td>
				<td>
						${marryDiary.sort}
				</td>
				<td>
					<fmt:formatDate value="${marryDiary.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<shiro:hasPermission name="diary:marryDiary:edit"><td>
    				<a href="${ctx}/diary/marryDiary/form?id=${marryDiary.id}">编辑</a>
					<a href="${ctx}/diary/marryDiary/delete?id=${marryDiary.id}" onclick="return confirmx('确认要删除该内容吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>