<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>个人中心-我的评论</title>
    <link rel="stylesheet" href="jxweb/jx/css/myevaluation.css">
    <link rel="stylesheet" href="jxweb/jx/css/myevaluation.css">
    <script src="jxweb/jx/js/jquery.min.js"></script>
    <script src="jxweb/jx/js/common.js"></script>
    <script src="jxweb/jx/js/mycomment.js"></script>
    <link rel="stylesheet" href="jxweb/jx/css/share.css"/>
    <script src="jxweb/jx/js/ZeroClipboard.js"></script>
</head>
<body>
    <input id="userId" name="userId" type="hidden" value="${userId}"/>
    <form:form id="searchForm"  action="myevaluation" method="post" class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="3"/>
    </form:form>
    <!-- 头部开始-->
    <%@ include file="common/header.jsp"%>
    <!-- 头部结束-->
    <!-- 导航位置 -->
    <section class="Navigation">
        <a href="index.html">首页</a>><a href="">个人中心</a>><a href="">我的评论</a>
    </section>
    <!-- 内容开始 -->
   <section class="content">
        <!-- 左侧菜单 -->
       <%@ include file="common/userLeft.jsp"%>
        <div class="content_right_list">
            <ul class="ul-1" id="productShowList">
                <c:forEach items="${userEvaluationList}" var="userEvaluation">
                    <li class="li">
                        <div class="left">
                            <div class="left-1">
                                <img src="${userEvaluation.productInfo.coverPath}" alt="" width="88" height="106">
                            </div>
                            <div class="left-2">
                                <div class="left-2-1">${userEvaluation.productInfo.productName}</div>
                                <div class="left-2-2">
                                    <c:choose>
                                    <c:when test="${userEvaluation.productInfo.isFollow==0}">
                                    <a href="javascript:;" class="not">
                                        </c:when>
                                        <c:otherwise>
                                        <a href="javascript:;" class="already">
                                            </c:otherwise>
                                            </c:choose>
                                            <i class="iconfont icon-xin"></i>
                                            <span  onclick="followOnclick(${userEvaluation.productInfo.businessId})">${userEvaluation.productInfo.followName}</span>
                                        </a>
                                        <a href="javascript:;" class="share">
                                            <i class="iconfont icon-fenxiang"></i>
                                            <span class="share-span" onclick="shareOnclick(${userEvaluation.productInfo.businessId})">分享</span>
                                        </a>
                                        <a href="javascript:;" class="contrast">
                                            <i class="iconfont icon-duibi"></i>
                                            <span>对比</span>
                                        </a>
                                </div>
                            </div>
                        </div>
                        <div class="line"></div>
                        <div class="right">
                            <c:forEach items="${userEvaluation.evaluationList}" var="evaluation">
                                <div class="list-item">
                                    <img src="${evaluation.headUrl}" alt="" width="53" height="53">
                                    <dl>
                                        <dt>${evaluation.userName}</dt>
                                        <dd class="dd-1">${evaluation.content}</dd>
                                        <dd class="dd-2">${evaluation.createTime}</dd>
                                    </dl>
                                </div>
                            </c:forEach>
                            <a href="javascript:;" class="more">查看更多</a>
                        </div>
                    </li>
                </c:forEach>
            </ul>
            <!-- 分页 -->
            ${pageStr}
        </div>
   </section>

    <%@ include file="common/foot.jsp"%>
    <!-- 底部结束 -->
    <script>
        function getProductList(pageNo) {
            $("#pageNo").val(pageNo);
            $("#searchForm").submit();
            return false;
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
                        window.location.href = "myevaluation";
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