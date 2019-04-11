<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>答题记录管理</title>
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
		<li class="active"><a href="${ctx}/record/examRecord/">答题记录列表</a></li>
		<shiro:hasPermission name="record:examRecord:edit"><li><a href="${ctx}/record/examRecord/form">答题记录添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="examRecord" action="${ctx}/record/examRecord/" method="post" class="breadcrumb form-search">
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
				<shiro:hasPermission name="record:examRecord:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="examRecord">
			<tr>
				<shiro:hasPermission name="record:examRecord:edit"><td>
    				<a href="${ctx}/record/examRecord/form?id=${examRecord.id}">修改</a>
					<a href="${ctx}/record/examRecord/delete?id=${examRecord.id}" onclick="return confirmx('确认要删除该答题记录吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>