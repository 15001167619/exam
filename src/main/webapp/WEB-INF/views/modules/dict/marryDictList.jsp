<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>业务管理</title>
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
		<li class="active"><a href="${ctx}/dict/marryDict/list?type=${marryDict.type}">${fns:getMarryDictName(marryDict.type)}数据列表</a></li>
		<shiro:hasPermission name="dict:marryDict:edit"><li><a href="${ctx}/dict/marryDict/form?type=${marryDict.type}&sort=0&parentId=0">${fns:getMarryDictName(marryDict.type)}类别添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="marryDict" action="${ctx}/dict/marryDict/list?type=${marryDict.type}" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>类别</label>
				<form:select path="category" class="input-medium">
					<form:option value="" label="">全部类别</form:option>
					<form:options items="${fns:getMarryDictList(marryDict.type,0)}" itemLabel="label" itemValue="category" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>标签名称</label>
				<form:input path="label" htmlEscape="false" maxlength="100" class="input-medium"/>
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
				<shiro:hasPermission name="dict:marryDict:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="marryDict">
			<tr>
				<td>
						${marryDict.label}
				</td>
				<td>
						${marryDict.sort}
				</td>
				<td><fmt:formatDate value="${marryDict.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>

				<shiro:hasPermission name="dict:marryDict:edit"><td>
    				<a href="${ctx}/dict/marryDict/form?id=${marryDict.id}">编辑</a>
					<a href="${ctx}/dict/marryDict/delete?id=${marryDict.id}" onclick="return confirmx('确认要删除该业务吗？', this.href)">删除</a>
					<c:if test="${marryDict.parentId == 0}">
						<a href="<c:url value='${fns:getAdminPath()}/dict/marryDict/labelForm?type=${marryDict.type}&sort=${marryDict.sort+1}&parentId=${marryDict.id}&category=${marryDict.category}'>
								</c:url>">
							下级标签值添加</a>
					</c:if>
					<c:if test="${marryDict.parentId != 0}">
						归属分类【${fns:getMarryDictCategoryName(marryDict.parentId)}】
					</c:if>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>