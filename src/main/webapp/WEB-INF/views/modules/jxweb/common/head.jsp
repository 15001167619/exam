<%--
  Created by IntelliJ IDEA.
  User: EDZ
  Date: 2019/3/8
  Time: 15:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Title</title>
    <script>
        $(document).ready(function() {
            var type_on = $('#type_Product').val();
            if(type_on==0){
                $("#hlch").attr("class","on");
                $("#hl_ch").addClass("active");
            }else if(type_on==1){
                $("#hssy").attr("class","on");
                $("#hs_sy").addClass("active");
            }else if(type_on==2){
                $("#ysxz").attr("class","on");
                $("#ys_xz").addClass("active");
            }else if(type_on==3){
                $("#hslf").attr("class","on");
                $("#hs_lf").addClass("active");
            }else if(type_on==4){
                $("#jhzj").attr("class","on");
                $("#jh_zj").addClass("active");
            }else if(type_on==5){
                $("#jhyp").attr("class","on");
                $("#jh_yp").addClass("active");
            }else if(type_on==6){
                $("#mylx").attr("class","on");
                $("#my_lx").addClass("active");
            }else if(type_on==7){
                $("#jdyd").attr("class","on");
                $("#jd_yd").addClass("active");
            }else {
                $("#index").attr("class","on");
            }

        });
    </script>
</head>
<body>
<div class="nav-wrapper">
    <div class="nav-son-wrapper">
        <div class="logo">
            <img src="/marry/jxweb/jx/img/201901081623.png" alt="结婚汇" width="170" height="55">
        </div>
        <nav class="nav">
            <a href="index" id="index">首页</a>
            <a href="productlist?type=0" id="hlch">婚礼策划</a>
            <a href="productlist?type=1" id="hssy">婚纱摄影</a>
            <a href="productlist?type=2" id="ysxz">艺术写真</a>
            <a href="productlist?type=3" id="hslf">婚纱礼服</a>
            <a href="productlist?type=4" id="jhzj">结婚钻戒</a>
            <a href="productlist?type=5" id="jhyp">结婚用品</a>
            <a href="productlist?type=6" id="mylx">蜜月旅行</a>
            <a href="productlist?type=7" id="jdyd">酒店预订</a>
        </nav>
    </div>
</div>
</body>
</html>
