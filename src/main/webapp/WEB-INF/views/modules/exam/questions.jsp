<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
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
        <th style="text-align: center;" width="50px" bgcolor="#7cb96e">题号</th>
        <th style="text-align: center;">题目内容</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td style="text-align: center;">1</td>
        <td style="font-weight:bold;font-size: 14px"> <br/>[选择题]&nbsp;&nbsp;党的十九大的主题是：不忘初心，____，高举中国特色社会主义伟大旗帜，决胜全面建成小康社会，夺取新时代中国特色社会主义伟大胜利，为实现中华民族伟大复兴的中国梦不懈奋斗。<br/>
            <br/>
            <input name="radio+${examQuestion.questionId}" type="radio" value="A" >A:党的十九大的主题是：不忘初心，____<br/>
            <input name="radio+${examQuestion.questionId}" type="radio" value="B" />B:党的十九大的主题是：不忘初心，____<br/>
            <input name="radio+${examQuestion.questionId}" type="radio" value="C" />C:党的十九大的主题是：不忘初心，____<br/>
            <input name="radio+${examQuestion.questionId}" type="radio" value="D" />D:党的十九大的主题是：不忘初心，____<br/>
            <br/>
        </td>
    </tr>
    <tr>
        <td style="text-align: center;">2</td>
        <td style="font-weight:bold;font-size: 14px"> <br/>[判断题]&nbsp;&nbsp;党的十九大的主题是：不忘初心，____，高举中国特色社会主义伟大旗帜，决胜全面建成小康社会，夺取新时代中国特色社会主义伟大胜利，为实现中华民族伟大复兴的中国梦不懈奋斗。<br/>
            <br/>
            <input name="radio+${examQuestion.questionId}" type="radio" value="1" >正确
            <input name="radio+${examQuestion.questionId}" type="radio" value="0" />错误<br/>
            <br/>
        </td>
    </tr>
    <tr>
        <td style="text-align: center;">3</td>
        <td style="font-weight:bold;font-size: 14px"> <br/>党的十九大的主题是：不忘初心，____，高举中国特色社会主义伟大旗帜，决胜全面建成小康社会，夺取新时代中国特色社会主义伟大胜利，为实现中华民族伟大复兴的中国梦不懈奋斗。<br/>
            <br/>
            <input name="radio+${examQuestion.questionId}" type="radio" value="A" >A:党的十九大的主题是：不忘初心，____<br/>
            <input name="radio+${examQuestion.questionId}" type="radio" value="B" />B:党的十九大的主题是：不忘初心，____<br/>
            <input name="radio+${examQuestion.questionId}" type="radio" value="C" />C:党的十九大的主题是：不忘初心，____<br/>
            <input name="radio+${examQuestion.questionId}" type="radio" value="D" />D:党的十九大的主题是：不忘初心，____<br/>
            <br/>
        </td>
    </tr>
    </tbody>
</table>




</body>
</html>