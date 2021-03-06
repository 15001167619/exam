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
<title>房山区教育系统团队活动课比赛理论考试</title>

<style type="text/css">
    .navbar-inner {
        background: linear-gradient(to bottom,#c71c22,#c26e1b)!important;
        border: 1px solid #d51919!important;;
    }
    .navbar .nav>li>a:focus, .navbar .nav>li>a:link {
        background: linear-gradient(to bottom,#c71c22,#c26e1b)!important;
    }
    .navbar .nav>li>a:focus, .navbar .nav>li>a:visited {
        background: linear-gradient(to bottom,#c71c22,#c26e1b)!important;
    }
    .navbar .nav>li>a:focus, .navbar .nav>li>a:hover {
        background: linear-gradient(to bottom,#c71c22,#c26e1b)!important;
    }
    .navbar .nav>li>a:focus, .navbar .nav>li>a:active {
        background: linear-gradient(to bottom,#c71c22,#c26e1b)!important;
    }
    .btn-primary {
        background: linear-gradient(to bottom,#c71c22,#c26e1b)!important;
    }

</style>

<body>

<div id="main">
    <div id="header" class="navbar navbar-fixed-top">
        <div class="navbar-inner">
            <div class="brand"><span id="productName" style="margin-left: 20px">${exam}</span></div>
            <ul id="userControl" class="nav pull-right">
                <li id="userInfo" class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown"  title="个人信息" href ="javascript:return false;" onclick="return false;">您好, ${userName}&nbsp; 您的考号:${studentId}&nbsp;</a>
                </li>
                <%--<li><a href="${logout}" title="退出考试">退出考试</a></li>--%>
                <li>&nbsp;</li>
            </ul>
        </div>
    </div>
    <div class="container-fluid">
        <div id="footer" class="row-fluid">
        </div>
    </div>
</div>

<input type="hidden" value="${examQuestions.questionIds}" id="questionIds"/>
<input type="hidden" value="${userName}" id="userName"/>
<input type="hidden" value="${company}" id="company"/>
<input type="hidden" value="${scene}" id="scene"/>
<input type="hidden" value="${studentId}" id="studentId"/>
<input type="hidden" value="${examName}" id="paperId"/>
<input type="hidden" value="${useType}" id="useType"/>


<table id="contentTable" class="table table-striped table-bordered table-condensed" style="margin-top: 20px">
    <thead>
    <tr>
        <th style="text-align: center;" width="50px" bgcolor="#7cb96e">题号</th>
        <th style="text-align: center;">题目内容</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${examQuestions.questionList}" var="examQuestion" varStatus="indexs">

        <tr>
            <td style="text-align: center;" id="index_${examQuestion.questionId}">${indexs.index+1}</td>
            <td style="font-weight:bold;font-size: 14px"> <br/>[${examQuestion.questionType}]&nbsp;&nbsp;${examQuestion.question}<br/>
                <br/>
                <input type="hidden" value="${examQuestion.correctAnswer}" id="answer_${examQuestion.questionId}"/>
                <input type="hidden" value="${examQuestion.questionId}" id="question_${examQuestion.questionId}"/>
                <input type="hidden" value="${examQuestion.type}" id="questionType_${examQuestion.questionId}"/>
                <c:choose>
                    <c:when test="${examQuestion.type == 0}">
                        <label><input name="radio_${examQuestion.questionId}" type="radio" value="A" />A:${examQuestion.answerContent.A}</label><br/>
                        <label><input name="radio_${examQuestion.questionId}" type="radio" value="B" />B:${examQuestion.answerContent.B}</label><br/>
                        <c:if test="${not empty examQuestion.answerContent.C || examQuestion.answerContent.C != ''}">
                        <label><input name="radio_${examQuestion.questionId}" type="radio" value="C" />C:${examQuestion.answerContent.C}</label><br/></c:if>
                        <c:if test="${not empty examQuestion.answerContent.D || examQuestion.answerContent.D != ''}">
                        <label><input name="radio_${examQuestion.questionId}" type="radio" value="D" />D:${examQuestion.answerContent.D}</label><br/></c:if>
                    </c:when>
                    <c:when test="${examQuestion.type == 2}">
                        <label><input name="checkbox_${examQuestion.questionId}" type="checkbox" value="A" />A:${examQuestion.answerContent.A}</label><br/>
                        <label><input name="checkbox_${examQuestion.questionId}" type="checkbox" value="B" />B:${examQuestion.answerContent.B}</label><br/>
                        <c:if test="${not empty examQuestion.answerContent.C}">
                        <label><input name="checkbox_${examQuestion.questionId}" type="checkbox" value="C" />C:${examQuestion.answerContent.C}</label><br/></c:if>
                        <c:if test="${not empty examQuestion.answerContent.D}">
                        <label><input name="checkbox_${examQuestion.questionId}" type="checkbox" value="D" />D:${examQuestion.answerContent.D}</label><br/></c:if>
                        <c:if test="${not empty examQuestion.answerContent.E}">
                        <label><input name="checkbox_${examQuestion.questionId}" type="checkbox" value="E" />E:${examQuestion.answerContent.E}</label><br/></c:if>
                        <c:if test="${not empty examQuestion.answerContent.F}">
                        <label><input name="checkbox_${examQuestion.questionId}" type="checkbox" value="F" />F:${examQuestion.answerContent.F}</label><br/></c:if>
                    </c:when>
                    <c:otherwise>
                        <label><input name="radio_${examQuestion.questionId}" type="radio" value="1" >正确</label>
                        <label><input name="radio_${examQuestion.questionId}" type="radio" value="0" />错误</label><br/>
                    </c:otherwise>
                </c:choose>
                <br/>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<div id="foot" class="navbar navbar-fixed-foot">
    <div style="text-align: center;"><input class="btn btn-large btn-primary" type="button"  value="确认交卷"  onclick="submitExam()"/>&nbsp;&nbsp;</div>
</div>

<script>
    function submitExam() {
        //答题录入考试
        var questionIds = $("#questionIds").val();
        var studentId = $("#studentId").val();
        if(questionIds!=''){
            var questionIdArrays = questionIds.split(',');
            for ( var i = 0; i <questionIdArrays.length; i++){
                var questionType = $("#questionType_"+questionIdArrays[i]).val();
                if(questionType == 2){
                    var chk_userAnswer =[];
                    var checkboxName = 'checkbox_'+questionIdArrays[i];
                    $('input[name="'+checkboxName+'"]:checked').each(function(){
                        chk_userAnswer.push($(this).val());
                    });
                    if(chk_userAnswer.length == 0){
                        swal({
                            title: '您有未完成的试题',
                            confirmButtonColor: '#d33'
                        })
                        return;
                    }
                }else {
                    //校验是否有未完成的试题
                    var radioName = 'radio_'+questionIdArrays[i];
                    var select_Id = $('input[name="'+radioName+'"]:checked').val();
                    if(typeof(select_Id) =="undefined"){
                        swal({
                            title: '您有未完成的试题',
                            confirmButtonColor: '#c71c22'
                        })
                        return;
                    }
                }

            }

            swal({
                title : "",
                text: "感谢您参加2019年房山区教育系统团队活动课比赛理论考试。",
                type: 'success',
                showCancelButton : true,
                confirmButtonColor: '#c71c22',
                closeOnConfirm : false,
                animation : "slide-from-top"
            }, function(inputValue) {
                if(inputValue){
                    for ( var j = 0; j <questionIdArrays.length; j++){
                        // 0错误1为正确
                        var correct = 0;
                        var questionId = $("#question_"+questionIdArrays[j]).val();
                        var userAnswer;
                        var questionType = $("#questionType_"+questionIdArrays[j]).val();
                        if(questionType == 2){
                            //用户选择
                            var chk_userAnswer =[];
                            var checkboxName = 'checkbox_'+questionIdArrays[j];
                            $('input[name="'+checkboxName+'"]:checked').each(function(){
                                chk_userAnswer.push($(this).val());
                            });
                            var question_value = $("#answer_"+questionIdArrays[j]).val().split(',');
                            if(equar(chk_userAnswer,question_value)){
                                correct = 1;
                            }
                            userAnswer = chk_userAnswer.join(',');
                        }else {
                            var radioName = 'radio_'+questionIdArrays[j];
                            userAnswer = $('input[name="'+radioName+'"]:checked').val();
                            var answerId = $("#answer_"+questionIdArrays[j]).val();
                            if(userAnswer == answerId){
                                correct = 1;
                            }
                        }
                        addExamReply(createUserExamReply(questionId,userAnswer,correct));
                    }
                    //提交试题
                    var userExamReplyText = JSON.stringify(userExamReplyArray);
                    var useType = $("#useType").val();
                    var paperId = $("#paperId").val();
                    var userName = $("#userName").val();
                    var company = $("#company").val();
                    var scene = $("#scene").val();
                    $.ajax({
                        url: "<c:url value='addExamReply'/>",
                        type:"POST",
                        cache: true,
                        async: false,
                        dataType:"json",
                        data: {
                            userExamReplyArray:userExamReplyText,
                            questionIds:questionIds,
                            useType:useType,
                            paperId:paperId,
                            userName:userName,
                            company:company,
                            scene:scene,
                            studentId:studentId
                        },
                        success: function (data) {
                            if(data==true){
                                swal({
                                    title : "",
                                    text: "感谢您参加2019年房山区教育系统团队活动课比赛理论考试。",
                                    type: 'success',
                                    showCancelButton : true,
                                    closeOnConfirm : false,
                                    animation : "slide-from-top"
                                }, function(inputValue) {
                                    if(inputValue){
                                        window.location.href = "<c:url value='examination'/>"
                                    }
                                })
                            }
                        }
                    });
                    window.location.href = "<c:url value='examination'/>"
                }
            })
        }
    }

    function equar(a, b) {
        // 判断数组的长度
        if (a.length !== b.length) {
            return false
        } else {
            // 循环遍历数组的值进行比较
            for (let i = 0; i < a.length; i++) {
                if (a[i] !== b[i]) {
                    return false
                }
            }
            return true;
        }
    }

    var userExamReplyArray = new Array();

    function addExamReply(userExamReply) {
        userExamReplyArray.push(userExamReply);
    }


    function createUserExamReply(questionId,userAnswer,correct) {
        var userExamReply = new Object();
        userExamReply.questionId = questionId;
        userExamReply.userAnswer = userAnswer;
        userExamReply.correct = correct;
        userExamReply.studentId = $("#studentId").val();
        return userExamReply;
    }

</script>




</body>
</html>