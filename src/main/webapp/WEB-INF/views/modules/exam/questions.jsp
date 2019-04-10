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
            <div class="brand"><span id="productName" style="margin-left: 20px">${exam}</span></div>
            <ul id="userControl" class="nav pull-right">
                <li id="userInfo" class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown"  title="个人信息">您好, ${userName}&nbsp; 您的单位:${company}&nbsp;您的场次:${scene}&nbsp;您的考号:${studentId}&nbsp;</a>
                </li>
                <li><a href="${logout}" title="退出考试">退出考试</a></li>
                <li><a href="#" title="退出考试" onclick="js_delete()">ddd</a></li>
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
                <c:choose>
                    <c:when test="${examQuestion.type == 0}">
                        <label><input name="radio_${examQuestion.questionId}" type="radio" value="A" />A:${examQuestion.answerContent.A}</label><br/>
                        <label><input name="radio_${examQuestion.questionId}" type="radio" value="B" />B:${examQuestion.answerContent.B}</label><br/>
                        <label><input name="radio_${examQuestion.questionId}" type="radio" value="C" />C:${examQuestion.answerContent.C}</label><br/>
                        <label><input name="radio_${examQuestion.questionId}" type="radio" value="D" />D:${examQuestion.answerContent.D}</label><br/>
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
    <div class="navbar-inner">
        <div class="brand"><span id="productNameFoot" style="margin-left: 20px">请再次确认答题完毕</span></div>
        <ul id="userControlFoot" class="nav pull-right">
            <li><a href="#" title="提交答案" onclick="submitExam()">提交答案</a></li>
            <li>&nbsp;</li>
        </ul>
    </div>
</div>

<script>
    function submitExam() {
        //答题录入考试
        debugger;
        var questionIds = $("#questionIds").val();
        var studentId = $("#studentId").val();
        if(questionIds!=''){
            var questionIdArrays = questionIds.split(',');
            for ( var i = 0; i <questionIdArrays.length; i++){
                //校验是否有未完成的试题
                var radioName = 'radio_'+questionIdArrays[i];
                var select_Id = $('input[name="'+radioName+'"]:checked').val();
                if(typeof(select_Id) =="undefined"){
                    swal("您有未完成的试题");
                    return;
                }
            }
            for ( var j = 0; j <questionIdArrays.length; j++){
                // 0错误1为正确
                var correct = 0;
                var radioName = 'radio_'+questionIdArrays[j];
                var userAnswer = $('input[name="'+radioName+'"]:checked').val();
                var answerId = $("#answer_"+questionIdArrays[j]).val();
                var questionId = $("#question_"+questionIdArrays[j]).val();
                if(userAnswer == answerId){
                    correct = 1;
                }
                addExamReply(createUserExamReply(questionId,userAnswer,correct));
            }
            //提交试题
            var userExamReplyText = JSON.stringify(userExamReplyArray);
            $.ajax({
                url: "<c:url value='addExamReply'/>",
                type:"POST",
                cache: true,
                async: false,
                dataType:"json",
                data: {
                    userExamReplyArray:userExamReplyText,
                    questionIds:questionIds,
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
                                window.location.href = "<c:url value='${logout}'/>"
                            }else {
                                window.location.href = "<c:url value='${logout}'/>"
                            }
                        })
                    }
                }
            });


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
        userExamReply.paperId = $("#paperId").val();
        userExamReply.userName = $("#userName").val();
        userExamReply.company = $("#company").val();
        userExamReply.scene = $("#scene").val();
        return userExamReply;
    }

    function js_delete() {


    }

</script>




</body>
</html>