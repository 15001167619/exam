<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <title>开始答题</title>
    <meta name="decorator" content="default"/>
</head>
<body>

<div id="main">
    <div id="header" class="navbar navbar-fixed-top">
        <div class="navbar-inner">
            <div class="brand"><span id="productName" style="margin-left: 20px">在线考试&nbsp; &nbsp; 试卷类型【A】</span></div>
            <ul id="userControl" class="nav pull-right">
                <li id="userInfo" class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#" title="个人信息">您好, ${userName}&nbsp; 您的学号:${studentId}&nbsp;<span id="notifyNum" class="label label-info hide"></span></a>
                </li>
                <li><a href="${ctx}/${logout}" title="退出考试">退出考试</a></li>
                <li>&nbsp;</li>
            </ul>
        </div>
    </div>
    <div class="container-fluid">
        <div id="footer" class="row-fluid">
        </div>
    </div>
</div>

<table id="contentTable" class="table table-striped table-bordered table-condensed" style="margin-top: 20px">
    <thead>
    <tr>
        <th>名称</th>
        <th>排序</th>
        <th>添加时间</th>

    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="marryBanner">
        <tr>
            <td><a href="${ctx}/banner/marryBanner/form?id=${marryBanner.id}">
                    ${marryBanner.name}
            </a></td>
            <td>${marryBanner.sort}</td>
            <td><fmt:formatDate value="${marryBanner.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            <shiro:hasPermission name="banner:marryBanner:edit"><td>
                <a href="${ctx}/banner/marryBanner/form?id=${marryBanner.id}">修改</a>
                <a href="${ctx}/banner/marryBanner/delete?id=${marryBanner.id}" onclick="return confirmx('确认要删除该轮播图吗？', this.href)">删除</a>
            </td></shiro:hasPermission>
        </tr>
    </c:forEach>
    </tbody>
</table>




</body>
</html>