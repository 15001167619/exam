<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>答题记录管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#btnExport").click(function(){
				top.$.jBox.confirm("确认要导出考生数据吗？","系统提示",function(v,h,f){
					if(v=="ok"){
						$("#searchForm").attr("action","${ctx}/record/examRecord/export");
						$("#searchForm").submit();
					}
				},{buttonsFocus:1});
				top.$('.jbox-body .jbox-icon').css('top','55px');
			});
		});
		function page(n,s){
			if(n) $("#pageNo").val(n);
			if(s) $("#pageSize").val(s);
			$("#searchForm").attr("action","${ctx}/record/examRecord/list");
			$("#searchForm").submit();
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/record/examRecord/">答题记录列表</a></li>
	</ul>
	<form:form id="searchForm" modelAttribute="examRecord" action="${ctx}/record/examRecord/list" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<sys:tableSort id="orderBy" name="orderBy" value="${page.orderBy}" callback="page();"/>
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
		<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询" onclick="return page();"/>
			<input id="btnExport" class="btn btn-primary" type="button" value="导出"/></li>
		<li class="clearfix"></li>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>序号</th>
				<th>考生姓名</th>
				<th>所在组</th>
				<th>考生单位</th>
				<th>类型</th>
				<th class="sort-column score_sum">考生总分</th>
				<th class="sort-column correct_sum">答对总数</th>
				<th class="sort-column error_sum">答错总数</th>
				<shiro:hasPermission name="record:examRecord:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="examRecord" varStatus="indexs">
			<tr>
				<td>${indexs.index+1}</td>
				<td>${examRecord.userName}</td>
				<td>${fns:getDictLabel(examRecord.useType, 'useTpye','')}</td>
				<td>${examRecord.company}</td>
				<td>${examRecord.scene}</td>
				<td>${examRecord.scoreSum}</td>
				<td>${examRecord.correctSum}</td>
				<td>${examRecord.errorSum}</td>
				<shiro:hasPermission name="record:examRecord:edit"><td>
					<a href="${ctx}/record/examRecord/examRecordForm?id=${examRecord.id}">查看详情</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>