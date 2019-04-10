<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <title>${fns:getConfig('productName')} 登录</title>
    <meta name="decorator" content="blank"/>
    <%@ page contentType="text/html;charset=UTF-8" %><meta http-equiv="Content-Type" content="text/html;charset=utf-8" /><meta name="author" content="http://jeesite.com/"/>
    <meta name="renderer" content="webkit"><meta http-equiv="X-UA-Compatible" content="IE=8,IE=9,IE=10" />
    <meta http-equiv="Expires" content="0"><meta http-equiv="Cache-Control" content="no-cache"><meta http-equiv="Cache-Control" content="no-store">
    <script src="${ctxStatic}/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
    <link href="${ctxStatic}/bootstrap/2.3.1/css_${not empty cookie.theme.value ? cookie.theme.value : 'cerulean'}/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="${ctxStatic}/bootstrap/2.3.1/js/bootstrap.min.js" type="text/javascript"></script>
    <link href="${ctxStatic}/bootstrap/2.3.1/awesome/font-awesome.min.css" type="text/css" rel="stylesheet" />
    <!--[if lte IE 7]><link href="${ctxStatic}/bootstrap/2.3.1/awesome/font-awesome-ie7.min.css" type="text/css" rel="stylesheet" /><![endif]-->
    <!--[if lte IE 6]><link href="${ctxStatic}/bootstrap/bsie/css/bootstrap-ie6.min.css" type="text/css" rel="stylesheet" />
<script src="${ctxStatic}/bootstrap/bsie/js/bootstrap-ie.min.js" type="text/javascript"></script><![endif]-->
    <link href="${ctxStatic}/jquery-select2/3.4/select2.min.css" rel="stylesheet" />
    <script src="${ctxStatic}/jquery-select2/3.4/select2.min.js" type="text/javascript"></script>
    <link href="${ctxStatic}/jquery-validation/1.11.0/jquery.validate.min.css" type="text/css" rel="stylesheet" />
    <script src="${ctxStatic}/jquery-validation/1.11.0/jquery.validate.min.js" type="text/javascript"></script>
    <link href="${ctxStatic}/jquery-jbox/2.3/Skins/Bootstrap/jbox.min.css" rel="stylesheet" />
    <script src="${ctxStatic}/jquery-jbox/2.3/jquery.jBox-2.3.min.js" type="text/javascript"></script>
    <script src="${ctxStatic}/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script src="${ctxStatic}/common/mustache.min.js" type="text/javascript"></script>
    <link href="${ctxStatic}/common/jeesite.css" type="text/css" rel="stylesheet" />
    <script src="${ctxStatic}/common/jeesite.js" type="text/javascript"></script>
    <script type="text/javascript">var ctx = '${ctx}', ctxStatic='${ctxStatic}';</script>
    <link href="${ctxStatic}/myalert/sweetalert.css" type="text/css" rel="stylesheet" />
    <script src="${ctxStatic}/myalert/sweetalert.min.js" type="text/javascript"></script>
    <style type="text/css">
        html,body,table{background-color:#f5f5f5;width:100%;text-align:center;}.form-signin-heading{font-family:Helvetica, Georgia, Arial, sans-serif, 黑体;font-size:36px;margin-bottom:20px;color:#0663a2;}
        .form-signin{position:relative;text-align:left;width:300px;padding:25px 29px 29px;margin:0 auto 20px;background-color:#fff;border:1px solid #e5e5e5;
            -webkit-border-radius:5px;-moz-border-radius:5px;border-radius:5px;-webkit-box-shadow:0 1px 2px rgba(0,0,0,.05);-moz-box-shadow:0 1px 2px rgba(0,0,0,.05);box-shadow:0 1px 2px rgba(0,0,0,.05);}
        .form-signin .checkbox{margin-bottom:10px;color:#0663a2;} .form-signin .input-label{font-size:16px;line-height:23px;color:#999;}
        .form-signin .input-block-level{font-size:16px;height:auto;margin-bottom:15px;padding:7px;*width:283px;*padding-bottom:0;_padding:7px 7px 9px 7px;}
        .form-signin .btn.btn-large{font-size:16px;} .form-signin #themeSwitch{position:absolute;right:15px;bottom:10px;}
        .form-signin div.validateCode {padding-bottom:15px;} .mid{vertical-align:middle;}
        .header{height:80px;padding-top:20px;} .alert{position:relative;width:300px;margin:0 auto;*padding-bottom:0px;}
        label.error{background:none;width:270px;font-weight:normal;color:inherit;margin:0;}
    </style>
</head>
<body>
<%--<div id="header" class="navbar navbar-fixed-top">--%>
    <%--<div class="navbar-inner">--%>
        <%--<div class="brand"><span id="productName">答题管理系统</span></div>--%>
        <%--<ul id="userControl" class="nav pull-right">--%>
            <%--<li id="userInfo" class="dropdown">--%>
                <%--<a class="dropdown-toggle" data-toggle="dropdown" href="#" title="个人信息">您好, 系统管理员&nbsp;<span id="notifyNum" class="label label-info hide"></span></a>--%>
            <%--</li>--%>
            <%--<li><a href="/exam/a/logout" title="退出登录">退出</a></li>--%>
            <%--<li>&nbsp;</li>--%>
        <%--</ul>--%>
    <%--</div>--%>
<%--</div>--%>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>名称</th>
        <th>排序</th>
        <th>添加时间</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>222</td>
        <td>333</td>
        <td>444</td>
    </tr>
    </tbody>
</table>
</body>
</html>