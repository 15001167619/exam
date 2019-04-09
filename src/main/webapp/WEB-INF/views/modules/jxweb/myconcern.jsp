<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>个人中心-我的关注</title>
    <link rel="stylesheet" href="jxweb/jx/css/myconcern.css">
    <script src="jxweb/jx/js/jquery.min.js"></script>
    <script src="jxweb/jx/js/common.js"></script>
    <link rel="stylesheet" href="jxweb/jx/css/share.css"/>
    <script src="jxweb/jx/js/ZeroClipboard.js"></script>
</head>
<body>
    <!-- 头部开始-->
    <%@ include file="common/header.jsp"%>
    <input type="hidden" id="userId" value="${userId}"/>
    <!-- 头部结束-->
    <!-- 导航位置 -->
    <section class="Navigation">
        <a href="index.html">首页</a>><a href="">${fns:getMarryDictName(type)}</a>
    </section>
    <!-- 内容开始 -->
   <section class="content">
        <!-- 左侧菜单 -->
       <%@ include file="common/userLeft.jsp"%>

        <div class="content_right_list">
            <div class="content_right_list_con">
                <h4>
                    <i class="iconfont icon-xin"></i>
                    <span>我的关注</span>
                </h4>
            </div>
            <!-- 分类 -->
            <section class="list-wrapper">
                <div class="ul-1">
                    <c:choose>
                        <c:when test="${type==0}">
                        <a class="li active" href="myconcern?type=0">
                        </c:when>
                        <c:otherwise>
                            <a class="li" href="myconcern?type=0">
                        </c:otherwise>
                    </c:choose>
                        <i class="iconfont icon-jishiben"></i>
                        <div class="text">婚礼策划</div>
                        <div class="line-up"></div>
                        <div class="line-down"></div>
                    </a>
                    <c:choose>
                        <c:when test="${type==1}">
                            <a class="li active" href="myconcern?type=1">
                        </c:when>
                        <c:otherwise>
                            <a class="li" href="myconcern?type=1">
                        </c:otherwise>
                    </c:choose>
                        <i class="iconfont icon-xiangji"></i>
                        <div class="text">婚纱摄影</div>
                        <div class="line-up"></div>
                        <div class="line-down"></div>
                    </a>
                    <c:choose>
                        <c:when test="${type==2}">
                            <a class="li active" href="myconcern?type=2">
                        </c:when>
                        <c:otherwise>
                            <a class="li" href="myconcern?type=2">
                        </c:otherwise>
                    </c:choose>
                        <i class="iconfont icon-nvsheng"></i>
                        <div class="text">艺术写真</div>
                        <div class="line-up"></div>
                        <div class="line-down"></div>
                    </a>
                    <c:choose>
                        <c:when test="${type==3}">
                            <a class="li active" href="myconcern?type=3">
                        </c:when>
                        <c:otherwise>
                            <a class="li" href="myconcern?type=3">
                        </c:otherwise>
                    </c:choose>
                        <i class="iconfont icon-hunsha"></i>
                        <div class="text">婚纱礼服</div>
                        <div class="line-up"></div>
                        <div class="line-down"></div>
                    </a>
                    <c:choose>
                        <c:when test="${type==4}">
                            <a class="li active" href="myconcern?type=4">
                        </c:when>
                        <c:otherwise>
                            <a class="li" href="myconcern?type=4">
                        </c:otherwise>
                    </c:choose>
                        <i class="iconfont icon--zuanjie"></i>
                        <div class="text">结婚钻戒</div>
                        <div class="line-up"></div>
                        <div class="line-down"></div>
                    </a>
                    <c:choose>
                        <c:when test="${type==5}">
                            <a class="li active" href="myconcern?type=5">
                        </c:when>
                        <c:otherwise>
                            <a class="li" href="myconcern?type=5">
                        </c:otherwise>
                    </c:choose>
                        <i class="iconfont icon-tang"></i>
                        <div class="text">结婚用品</div>
                        <div class="line-up"></div>
                        <div class="line-down"></div>
                    </a>
                    <c:choose>
                        <c:when test="${type==6}">
                            <a class="li active" href="myconcern?type=6">
                        </c:when>
                        <c:otherwise>
                            <a class="li" href="myconcern?type=6">
                        </c:otherwise>
                    </c:choose>
                        <i class="iconfont icon-miyue"></i>
                        <div class="text">蜜月旅行</div>
                        <div class="line-up"></div>
                        <div class="line-down"></div>
                    </a>
                    <c:choose>
                        <c:when test="${type==7}">
                            <a class="li active" href="myconcern?type=7">
                        </c:when>
                        <c:otherwise>
                            <a class="li" href="myconcern?type=7">
                        </c:otherwise>
                    </c:choose>
                        <i class="iconfont icon-jiudian"></i>
                        <div class="text">酒店预订</div>
                        <div class="line-up"></div>
                        <div class="line-down"></div>
                    </a>
                </div>
            </section>
            <div class="content_right_list_con">
                <ul class="theme-2-3 common-theme-2-3" id="productShowList">
                    <c:forEach items="${productList}" var="product">
                        <li class="common-theme-2-3-item">
                            <img src="${product.coverPath}" alt="" width="215" height="260">
                            <div class="c-1">
                                <div class="c-1-1">
                                    <div class="t">${product.name}</div>
                                    <div class="focus"><a href="javascript:;" class="already"><i class="iconfont icon-xin"></i><span onclick="followOnclick(${product.businessId})">已关注</span></a><a href="javascript:;" class="share"><i class="iconfont icon-fenxiang"></i>
                                        <span class="share-span" onclick="shareOnclick(${product.businessId})">分享</span>
                                    </a><a href="javascript:;" class="contrast"><i class="iconfont icon-duibi"></i><span>对比</span></a></div></div></div>
                            <a href="productdetails?id=${product.businessId}" class="xq">查看详情</a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            <c:choose>
                <c:when test="${pageProduct.pages == 1}">
                </c:when>
                <c:when test="${pageProduct.pages > 1}">
                    <c:if test="${pageProduct.pages <= 8}">
                        <div class="page-wrapper" id="page_wrapper">
                            <ul>
                                <li><a href="" class="up">首页</a></li>
                                <li><a class="active">1</a></li>
                                <c:forEach var="pageNo" begin="2" end="${pageProduct.pages}">
                                    <li><a  href ="javascript:void(0);" onclick ="getProductList(${pageNo})">${pageNo}</a></li>
                                </c:forEach>
                                <li><a href ="javascript:void(0);" onclick ="getPageTurningProductList(1)" class="x">></a></li>
                                <li><a href ="javascript:void(0);" onclick ="getProductList(${pageProduct.pages})" class="next">末页</a></li>
                            </ul>
                        </div>

                    </c:if>
                    <c:if test="${pageProduct.pages > 8}">
                        <div class="page-wrapper" id="page_wrapper">
                            <ul>
                                <li><a href="" class="up">首页</a></li>
                                <li><a class="active">1</a></li>
                                <c:forEach var="pageNo" begin="2" end="5">
                                    <li><a  href ="javascript:void(0);" onclick ="getProductList(${pageNo})">${pageNo}</a></li>
                                </c:forEach>
                                <li class="ellipsis">...</li>
                                <c:forEach var="pageNo" begin="${pageProduct.pages-1}" end="${pageProduct.pages}">
                                    <li><a  href ="javascript:void(0);" onclick ="getProductList(${pageNo})">${pageNo}</a></li>
                                </c:forEach>
                                <li><a href ="javascript:void(0);" onclick ="getPageTurningProductList(1)" class="x">></a></li>
                                <li><a href ="javascript:void(0);" onclick ="getProductList(${pageProduct.pages})" class="next">末页</a></li>
                            </ul>
                        </div>
                    </c:if>
                </c:when>
            </c:choose>
        </div>
   </section>

    <!-- 内容结束 -->

    <!-- 底部开始 -->
    <%@ include file="common/foot.jsp"%>
    <!-- 底部结束 -->

<script>

    var type = ${type};
    var userId=${marryUser.id};

    function getProductList(pageNo) {
        $("#productShowList").html("");
        $("#page_wrapper").html("");
        $.ajax({
            url: "api/operation/getOperationList",
            type:"get",
            cache: true,
            async: false,
            data: {
                userId:userId,
                businessType:0,
                type:type,
                pageNo:pageNo,
                pageSize:20
            },
            success: function (data) {
                // 数据绑定
                for(var i =0 ;i<data.productList.length; i++){
                    var proInfo = data.productList[i];
                    var str ='<li class="common-theme-2-3-item"><img src="'+ proInfo.coverPath+'" alt="" width="215" height="260"><div class="c-1"><div class="c-1-1">';
                    var str1 ='<div class="t">'+proInfo.name+'</div>';
                    var str2 ='<div class="focus"><a href="javascript:;" class="already"><i class="iconfont icon-xin"></i><span onclick="followOnclick('+proInfo.businessId+')">已关注</span></a><a href="javascript:;" class="share"><i class="iconfont icon-fenxiang"></i><span class="share-span" onclick="shareOnclick('+proInfo.businessId+')">分享</span>';
                    var str3 = '</a><a href="javascript:;" class="contrast"><i class="iconfont icon-duibi"></i><span>对比</span></a></div></div></div>';
                    var str4 = '<a href="productdetails?id='+proInfo.businessId+'" class="xq">查看详情</a></li>';
                    $("#productShowList").append(str+str1+str2+str3+str4);
                }
                //分页展示
                showPage(pageNo,data.pageProduct)
            }
        });


    }

    function showPage(pageNo,pageData) {
        var page_start = '<div class="page-wrapper" id="page_wrapper"><ul><li><a href="" class="up">首页</a></li>';
        var page_content = "";
        var pageStr = '';
        var pages = pageData.pages;
        if(pages <= 8){
            if(pageNo!=1){   // 不是点击第一页  会有 向前 箭头
                page_content = '<li><a href="javascript:void(0);" onclick ="getPageTurningProductList(0)" class="s"><</a></li>';
            }
            for(var i =1 ;i<= pages; i++){
                if(pageNo == i){
                    pageStr = '<li><a class="active">'+ i + '</a></li>';
                }else {
                    pageStr = '<li><a  href ="javascript:void(0);" onclick ="getProductList('+ i + ')">'+ i + '</a></li>';
                }
                page_content = page_content + pageStr;
            }
        }else {  //超过 8 页 会有 ... 展示
            if(pageNo!=1){   // 不是点击第一页  会有 向前 箭头
                page_content = '<li><a href="javascript:void(0);" onclick ="getPageTurningProductList(0)" class="s"><</a></li>';
            }
            var difference = pages - pageNo;
            if(difference == 3 ){ //刚刚好
                for(var n = pageNo - 4 ;n <= pages; n++){
                    if(pageNo == n){
                        pageStr = '<li><a class="active">'+ pageNo + '</a></li>';
                    }else {
                        pageStr = '<li><a  href ="javascript:void(0);" onclick ="getProductList('+ n + ')">'+ n + '</a></li>';
                    }
                    page_content = page_content + pageStr;
                }
            }else if(difference > 3){ // 展示 ...  分三批展示
                // 第一批展示
                if(pageNo<= 5){  // 5 ---> 5 以内 全部展示
                    for(var p =1 ;p <= 5; p++){
                        if(pageNo == p){
                            pageStr = '<li><a class="active">'+ pageNo + '</a></li>';
                        }else {
                            pageStr = '<li><a  href ="javascript:void(0);" onclick ="getProductList('+ p + ')">'+ p + '</a></li>';
                        }
                        page_content = page_content + pageStr;
                    }
                }else{
                    for(var p = pageNo-4 ;p <= pageNo; p++){
                        if(pageNo == p){
                            pageStr = '<li><a class="active">'+ pageNo + '</a></li>';
                        }else {
                            pageStr = '<li><a  href ="javascript:void(0);" onclick ="getProductList('+ p + ')">'+ p + '</a></li>';
                        }
                        page_content = page_content + pageStr;
                    }
                }
                // 第二批展示
                page_content = page_content + '<li class="ellipsis">...</li>';
                // 第三批展示
                for(var p = pages-1 ;p <= pages; p++){
                    if(pageNo == p){
                        pageStr = '<li><a class="active">'+ pageNo + '</a></li>';
                    }else {
                        pageStr = '<li><a  href ="javascript:void(0);" onclick ="getProductList('+ p + ')">'+ p + '</a></li>';
                    }
                    page_content = page_content + pageStr;
                }
            }else {// 已经到 最底页
                for(var n = pages - 7 ;n <= pages; n++){
                    if(pageNo == n){
                        pageStr = '<li><a class="active">'+ pageNo + '</a></li>';
                    }else {
                        pageStr = '<li><a  href ="javascript:void(0);" onclick ="getProductList('+ n + ')">'+ n + '</a></li>';
                    }
                    page_content = page_content + pageStr;
                }
            }
        }
        var page_end = '';
        var end = '';
        if(pageNo!=pages){
            var pageNext = '<li><a href ="javascript:void(0);" onclick ="getPageTurningProductList(1)" class="x">></a></li>';
            page_end = page_end + pageNext;
        }
        end = '<li><a href ="javascript:void(0);" onclick ="getProductList('+pages +')" class="next">末页</a></li></ul>';
        page_end = page_end + end;
        $("#page_wrapper").append(page_start + page_content + page_end);
    }

    function getPageTurningProductList(type) {
        var pageNo = $('#page_wrapper .active').html();
        if(type == 1){
            getProductList(pageNo*1+1);
        }else {
            getProductList(pageNo*1-1);
        }
    }


</script>

    <!-- 分享 -->

    <div class="mark"></div>
    <div class="share-dialog">
        <div class="share-close"></div>
        <div class="share-dialog-title">分享</div>
        <div class="share-dialog-cont">
            <div class="share-copy">
                <div class="share-copy-l">分享链接：</div>
                <div class="share-copy-c"><input id="copytext" type="text"/></div>
                <div id="btnCopy" class="share-copy-r"  data-clipboard-target="copytext">复制链接</div>
                <div class="clear"></div>
            </div>
            <div class="share-platform">
                <div class="share-platform-l">社交平台：</div>
                <div class="share-platform-r">
                    <div class="bdsharebuttonbox">
                        <a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a>
                        <a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a>
                        <a href="#" class="bds_sqq" data-cmd="sqq" title="分享到QQ好友"></a>
                        <a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a>
                    </div>
                    <div class="share-platform-text">
                        您可以直接复制短链，分享给朋友，也可直接点击社交平台图标，指定分享。
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"分享到新浪微博","bdMini":"1","bdMiniList":["bdxc","tqf","douban","bdhome","sqq","thx","ibaidu","meilishuo","mogujie","diandian","huaban","duitang","hx","fx","youdao","sdo","qingbiji","people","xinhua","mail","isohu","yaolan","wealink","ty","iguba","fbook","twi","linkedin","h163","evernotecn","copy","print"],"bdPic":"","bdStyle":"1","bdSize":"32"},"share":{}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>


    <script type="text/javascript">
        var g_url = window.location.href;
        $('.share-copy-c input').val(g_url);

        var clip = new ZeroClipboard( document.getElementById("btnCopy"));
        function followOnclick(businessId) {
            var userId = $('#userId').val();
            if(userId ==''){
                window.location.href = "<c:url value='loginordinary'/>"
            }else {
                $.ajax({
                    url : "<c:url value='api/user/addOperation'/>",
                    type : "POST",
                    async : false,
                    data : {
                        userId : userId,
                        businessId : businessId,
                        businessType : 0
                    },
                    success : function(data) {
                        window.location.href = "myconcern?type="+type;
                    }
                });
            }

        }

        function shareOnclick(businessId){
            //用户分享
            var userId = $('#userId').val();
            if(userId ==''){
                window.location.href = "<c:url value='loginordinary'/>"
            }else {
                $('.mark').show();
                $('.share-dialog').show();
                $.ajax({
                    url : "<c:url value='api/user/addOperation'/>",
                    type : "POST",
                    async : false,
                    data : {
                        userId : userId,
                        businessId : businessId,
                        businessType : 2
                    },
                    success : function(data) {
                        if (data.code == 200) {
                            window.location.href = "<c:url value='personalinformation'/>"
                        }
                    }
                });
            }
        }

        $('.share-close').on('click', function() {
            $('.mark').hide()
            $('.share-dialog').hide()
        })
    </script>





</body>
</html>