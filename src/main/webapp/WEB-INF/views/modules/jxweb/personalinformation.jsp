<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>个人中心-个人信息</title>
    <link rel="stylesheet" href="jxweb/jx/css/personalinformation.css">
    <link rel="stylesheet" type="text/css" href="jxweb/jx/css/Ecalendar.css">
    <script src="jxweb/jx/js/jquery.min.js"></script>
    <script src="jxweb/jx/js/common.js"></script>
    <script type="text/javascript" src="jxweb/jx/js/Ecalendar.jquery.min.js"></script>
</head>
<body>
    <!-- 头部开始-->
    <%@ include file="common/header.jsp"%>
    <!-- 头部结束-->
    <!-- 导航位置 -->
    <section class="Navigation">
        <a href="index.html">首页</a>><a href="javascript:;">个人中心</a>><a href="javascript:;">个人信息</a>
    </section>
    <!-- 内容开始 -->
   <section class="content">

        <!-- 左侧菜单 -->
       <%@ include file="common/userLeft.jsp"%>
       <style type="text/css">
           #camera {
               display: none;
           }
       </style>
       <script type="text/javascript">
           $(function() {
               $('.update-pic').on('click', function() {
                   $('#camera').click()
               });
               // 图片上传
               $('#camera').on('change', function() {
                   var formData = new FormData();
                   var listCoverPic = $("#camera").val();
                   formData.append("file", $("#camera")[0].files[0]);
                   formData.append("headerPic", listCoverPic);
                   var listPicPath;
                   $.ajax({
                       url : "<c:url value='/api/user/headPic'/>",
                       type : 'POST',
                       data : formData,
                       async : false,
                       cache : false,
                       contentType : false,
                       processData : false,
                       success : function(returndata) {
                           $("#imgListName").attr("src", returndata);
                           listPicPath =  returndata;
                           $("#primaryPicUrl").val(listPicPath);
                       },
                       error : function(returndata) {
                           var path = returndata.responseText;
                           $("#imgListName").attr("src", path);
                           listPicPath =  path;
                           $("#primaryPicUrl").val(listPicPath);
                       }
                   });

               })
               // 生日
               $("#Birthday").ECalendar({
                   type:"date",
                   skin:"#b12f2a",
                   offset:[0,2],
                   callback: function(v, e) {
                       console.log(v)
                       console.log(e)
                   }
               })
               // 婚期
               $("#marry").ECalendar({
                   type:"date",
                   skin:"#b12f2a",
                   offset:[0,2],
                   callback: function(v, e) {
                       console.log(v)
                       console.log(e)
                   }
               })
           })
       </script>

       <form:form id="inputForm"  name="marryUserForm" >
           <input type="hidden" name="id" id="userId" value="${marryUser.id}"/>
           <input type="hidden" name="phoneNum" id="phoneNum" value="${marryUser.phoneNum}"/>
           <input type="hidden" name="sex" id="sex" value="${marryUser.sex}"/>
           <input type="hidden" name="headUrl" id="primaryPicUrl" value="${marryUser.headUrl}"/>
       </form:form>


       <div class="content_right_list">
           <div class="content_right_list_head">
               <img src="${marryUser.headUrl}" alt="头像" width="99" height="99" id="imgListName">
               <div class="content_right_list_head_step">
                   <button class="update-pic">修改头像</button>
                   <input type="file" id="camera" multiple="multiple" capture="camera" accept="image/*">

                   <p>图片大小不能超过200M</p>
               </div>
           </div>
           <div class="content_right_list_con">
               <div class="nickname">
                   <span>昵&nbsp;&nbsp;称</span>
                   <input type="text" name="nickname" value="${marryUser.name}" id="nickname">
               </div>
               <div class="sex">
                   <span>性&nbsp;&nbsp;别</span>
                   <div class="radio">
                       <div class="female">
                           <input type="radio" id="female" name="sexs"   value="1"  <c:if test="${marryUser.sex == 1}">checked</c:if>  />
                           <label for="female">男</label>
                       </div>
                       <div class="male">
                           <input type="radio" id="male" name="sexs"  value="0"  <c:if test="${marryUser.sex == 0}">checked</c:if>  />
                           <label for="male">女</label>
                       </div>
                   </div>
               </div>
               <div class="birthday">
                   <span class="b1">生&nbsp;&nbsp;日</span>
                   <input type="text" name="birthday" id="Birthday" placeholder="2010-09-13" value="${marryUser.birthday}">
               </div>
               <div class="marry">
                   <span class="m1">婚&nbsp;&nbsp;期</span>
                   <input type="text" name="marry" id="marry" placeholder="2010-09-13" value="${marryUser.weddingDate}">
               </div>
               <div class="tel">
                   <span>手机号码</span>
                   <input type="text" name="tel" value="${marryUser.phoneNum}" id="tel" style="display: none">
                   <button class="phone_xiugai">修改</button>
               </div>
               <div class="pass">
                   <span>修改密码</span>
                   <input type="password" name="pass" placeholder="******" value="${marryUser.password}"  style="display: none">
                   <button class="pass_xiugai">修改</button>
               </div>
               <button class="save" onclick="saveMarryUser()">保存</button>
           </div>
       </div>
   </section>

    <!-- 内容结束 -->

    <!-- 底部开始 -->
    <%@ include file="common/foot.jsp"%>
    <!-- 底部结束 -->
    
    <script>
        function saveMarryUser() {
            var userId = $('#userId').val();
            var headUrl = $('#primaryPicUrl').val();
            var name = $('#nickname').val();
            var sex = $("input[name='sexs']:checked").val();
            var birthday = $('#Birthday').val();
            var weddingDate = $('#marry').val();

            $.ajax({
                url : "<c:url value='/api/user/userInfo'/>",
                type : "POST",
                async : false,
                data : {
                    userId : userId,
                    headUrl : headUrl,
                    name : name,
                    sex : sex,
                    birthday : birthday,
                    weddingDate : weddingDate
                },
                success : function(data) {
                    if (data.code == 200) {
                        window.location.href = "<c:url value='/personalinformation'/>"
                    }
                }
            });
            
        };
        function getVerificationCode() {
            if (verphone()) {
                var new_tel = $('.new_tel').val();
                $.ajax({
                    url: 'getVerificationCode',
                    method: 'POST',
                    data: {"tel": new_tel},
                    dataType: 'json',
                    success: function (res) {
                        if (res.code == 20000) {
                            $('.mask').show();
                            var time = 59;
                            var t = setInterval(function () {
                                if (time == 0) {
                                    $('.mask').hide();
                                    $('.obtain').html('重新发送');
                                    $('.obtain').removeAttr("disabled");
                                    clearInterval(t);
                                } else {
                                    $('.obtain').attr('disabled',"true");
                                    $('.obtain').html(time + 's重新发送');
                                    --time
                                }
                            }, 1000);
                            $('.err-info').html("验证码已发送，请注意查收");
                        } else {
                            $('.err-info').html(res.message);
                        }
                    }
                })
            }
        };
        function verphone() {
            var user = $('.new_tel').val();
            var reg=/^[1][3,4,5,7,8][0-9]{9}$/;

            if(user == '') {
                $('.err-info').html('请输入手机号');
                return false;
            } else if(!reg.test(user)) {
                $('.err-info').html('手机号格式不正确');
                return false;
            } else {
                $('.err-info').html('');
                return true;
            }
        };
        function updatePhone() {
            var userId = $('#userId').val();
            var new_tel = $('.new_tel').val();
            var Verification = $('.VerificationCode').val();
            if(verphone()){
                $.ajax({
                    url : "<c:url value='/api/user/updatePhone'/>",
                    type : "POST",
                    async : false,
                    data : {
                        userId : userId,
                        tel : new_tel,
                        verification : Verification
                    },
                    success : function(data) {
                        if (data.code == 10005) {
                            window.location.href = "<c:url value='/personalinformation'/>"
                        }else{
                            $('.err-info').html(data.message);
                        }
                    }
                });
            }
        };
        function updatePassword() {
            var userId = $('#userId').val();
            var ordPass = $('#ordPass').val();
            var newPass = $('#newPass').val();
            var surePass = $('#surePass').val();
            if(passCheck()){
                $.ajax({
                    url : "<c:url value='/api/user/updatePassword'/>",
                    type : "POST",
                    async : false,
                    data : {
                        userId : userId,
                        ordPass : ordPass,
                        newPass : newPass,
                        surePass : surePass
                    },
                    success : function(data) {
                        if (data.code == 10008) {
                            window.location.href = "<c:url value='/personalinformation'/>"
                        }else{
                            $('.err-info-pass').html(data.message);
                        }
                    }
                });
            }
        };
        function passCheck() {
            var pass1 = $('#newPass').val();
            var pass2 = $('#surePass').val();

            var rule =/^[a-zA-Z]{1}([a-zA-Z0-9]|[._]){5,19}$/;
            if (pass1 == '') {
                $('.err-info-pass').html('请输入密码');
                return false;
            } else if (!rule.test(pass1)) {
                $('.err-info-pass').html('密码格式不正确');
                return false;
            } else if (pass2 != pass1) {
                $('.err-info-pass').html('确认密码不一致');
                return false;
            } else {
                $('.err-info-pass').html('');
                return true;
            }
        };
    </script>


<!-- 点击修改手机号出来的弹出框开始 -->
    <div class="model">
        <div class="model_content">
            <h4>修改手机号</h4>
            <div class="model_cont">
                <p>当前绑定手机号:<span>${marryUser.phoneNum}</span></p>
                <div class="new_phone">
                    <span>新手机号</span>
                    <input type="text" name="new_tel" class="new_tel">
                    <button class="obtain" onclick="getVerificationCode()">获取验证码</button>
                    <div class="mask"></div>
                </div>
                <div class="Verification">
                    <span>&nbsp;&nbsp;验&nbsp;证&nbsp;码</span>
                    <input type="text" name="Verification" class="VerificationCode">
                </div>
                <div class="err-info"></div>
                <button class="modify" onclick="updatePhone()">确认修改</button>
            </div>
            <div class="fork"></div>
        </div>
    </div>

<!-- 点击修改手机号出来的弹出框结束 -->

<!-- 点击修改密码出来的弹出框开始 -->
<div class="model2">
    <div class="model_content2">
        <h4>修改密码</h4>
        <div class="model_cont2">
            <div class="old_pass">
                <span>原密码</span>
                <input type="password" name="old_pass" id="ordPass">
            </div>
            <div class="new_pass">
                <span>新密码</span>
                <input type="password" name="new_pass" id="newPass">
            </div>
            <div class="new_pass">
                <span>确认密码</span>
                <input type="password" name="new_pass" id="surePass">
            </div>
            <div class="err-info-pass"></div>
            <button class="modify2" onclick="updatePassword();">确认修改</button>
        </div>
        <div class="fork2"></div>
    </div>
</div>

<!-- 点击修改密码出来的弹出框结束 -->
<script>
    $('.phone_xiugai').click(function(){
        $('.model').slideDown()
        $('.model_content').slideDown()
    })
    $('.fork').click(function(){
        $('.model_content').slideUp()
        $('.model').slideUp()
    })
    $('.pass_xiugai').click(function(){
        $('.model2').slideDown()
        $('.model_content2').slideDown()
    })
    $('.fork2').click(function(){
        $('.model_content2').slideUp()
        $('.model2').slideUp()
    })
</script>
</body>
</html>