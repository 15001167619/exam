<%@ page contentType="text/html;charset=UTF-8" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>搜索</title>
		<link rel="stylesheet" type="text/css" href="jxweb/jx/css/searchlist.css">
		<script src="jxweb/jx/js/jquery.min.js"></script>
		<script src="jxweb/jx/js/common.js"></script>
	</head>
	<body>
    <input type="hidden" id="userId" value="${userId}"/>
    <input type="hidden" id="searchContent" value="${keyword}"/>
	<%@ include file="common/header.jsp"%>
		<!-- 导航位置 -->
		<section class="Navigation">
			<a href="index.html">首页</a>>"${keyword}"的搜索结果
		</section>
		<section class="content">
				<!-- 找到数据显示的内容 -->
				<ul class="theme-2-3 common-theme-2-3" id="product-show-list">
                    <c:forEach items="${productsList}" var="product">
                        <li class="common-theme-2-3-item">
                            <img src="${product.coverPath}" alt="" width="282" height="340">
                            <div class="c-1">
                                <div class="c-1-1">
                                    <div class="t">${product.name}</div>
                                    <div class="focus">
                                        <c:choose>
                                        <c:when test="${product.isFollow==0}">
                                        <a href="javascript:;" class="not">
                                            </c:when>
                                            <c:otherwise>
                                            <a href="javascript:;" class="already">
                                                </c:otherwise>
                                                </c:choose>
                                                <i class="iconfont icon-xin"></i>
                                                <span onclick="followOnclick(${product.id})">${product.followName}</span>
                                            </a>
                                            <a href="javascript:;" class="share">
                                                <i class="iconfont icon-fenxiang"></i>
                                                <span class="share-span" onclick="shareOnclick(${product.id})">分享</span>
                                            </a>
                                            <a href="javascript:;" class="contrast">
                                                <i class="iconfont icon-duibi"></i>
                                                <span>对比</span>
                                            </a>
                                    </div>
                                </div>
                            </div>
                            <a href="productdetails?id=${product.id}" class="xq">查看详情</a>
                        </li>
                    </c:forEach>
				</ul>
            <div id="viewMore">
                <c:if test="${productSize > 16}">
                    <a  href ="javascript:void(0);" onclick ="getMoreProductList()" class="load-more">查看更多</a>
                </c:if>
            </div>
		</section>
		<%@include file="common/foot.jsp"%>
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


    <script>

        var g_url = window.location.href;
        $('.share-copy-c input').val(g_url);

        var clip = new ZeroClipboard( document.getElementById("btnCopy"));

        function followOnclick(businessId) {
            var userId = $('#userId').val();
            var keyword = $("#searchContent").val();
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
                        window.location.href = "searchlist?keyword="+keyword;
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

        var pageNo = 2;
        function getMoreProductList() {
            var searchContent = $("#searchContent").val();
            var userId = $("#userId").val();
            $("#viewMore").html("");
            //获取产品列表
            $.ajax({
                url: "api/product/getSearchList",
                type:"get",
                cache: true,
                async: false,
                data: {
                    userId:userId,
                    pageNo:pageNo,
                    searchContent:searchContent,
                    topOn:0,
                    pageSize:16
                },
                success: function (data) {
                    // 数据绑定
                    var dataLength = data.productsList.length;
                    for(var i =0 ;i<dataLength; i++){
                        var proInfo = data.productsList[i];
                        var start = '<li class="common-theme-2-3-item"><img src="'+proInfo.coverPath+'" alt="" width="282" height="340"><div class="c-1"><div class="c-1-1"><div class="t">'+proInfo.name+'</div>';
                        var follow = proInfo.isFollow;
                        var followStr = '';
                        if(follow==0){
                            followStr = '<a href="javascript:;" class="not">'
                        }else {
                            followStr = '<a href="javascript:;" class="already">'
                        }
                        var focus = '<div class="focus">'+followStr+'<i class="iconfont icon-xin"></i><span onclick="followOnclick('+proInfo.id+')">'+proInfo.followName+'</span></a>';
                        var share = '<a href="javascript:;" class="share"><i class="iconfont icon-fenxiang"></i><span class="share-span" onclick="shareOnclick('+proInfo.id+')">分享</span></a>';
                        var contrast = '<a href="javascript:;" class="contrast"><i class="iconfont icon-duibi"></i><span>对比</span></a></div>';
                        var end = '</div></div><a href="productdetails?id='+proInfo.id+'"   class="xq" >查看详情</a></li>';
                        var productDetails = start + focus + share + contrast + end;
                        $("#product-show-list").append(productDetails);
                    }
                    pageNo ++;
                    if(dataLength==16){
                        var viewMoreDetails = '<a  href ="javascript:void(0);" onclick ="getMoreProductList()" class="load-more">查看更多</a>';
                        $("#viewMore").append(viewMoreDetails);
                    }
                }
            });
        }
    </script>

	</body>
</html>
	