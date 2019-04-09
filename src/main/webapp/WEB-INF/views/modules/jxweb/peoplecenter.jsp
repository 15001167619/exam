<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>个人中心-首页</title>
    <link rel="stylesheet" href="jxweb/jx/css/peoplecenter.css">
    <script src="jxweb/jx/js/jquery.min.js"></script>
    <script src="jxweb/jx/js/common.js"></script>
    <link rel="stylesheet" href="jxweb/jx/css/share.css"/>
    <script src="jxweb/jx/js/ZeroClipboard.js"></script>
    <style>
        .content_right_list_head_step .speed .speed-son {
            position: absolute;
            top: 0;
            left: 0;
            width: ${scale};
            height: 100%;
            background: #b12f2a;
        }
    </style>
</head>
<body>
    <input type="hidden" id="userId" value="${userId}"/>
    <!-- 头部开始-->
    <%@ include file="common/header.jsp"%>
    <!-- 头部结束-->
    <!-- 导航位置 -->
    <section class="Navigation">
        <a href="index.html">首页</a>><a href="javascript:;">个人中心</a>><a href="">我的首页</a>
    </section>
    <!-- 内容开始 -->
   <section class="content">
       <%@ include file="common/userLeft.jsp"%>
        <div class="content_right_list">
            <div class="content_right_list_head">
                <img src="${marryUser.headUrl}" alt="头像" width="99" height="99">
                <div class="content_right_list_head_step">
                    <h4>${marryUser.name}</h4>
                    <div class="speed">
                        <div class="speed-son"></div>
                    </div>
                    <div class="speed-text">${scale}</div>
                    <p>信息完成度</p>
                </div>
            </div>
            <div class="content_right_list_con">
                <h4>
                    <i class="iconfont icon-yanjing-zheng"></i>
                    <span>最近浏览</span>
                </h4>
                <ul class="theme-2-3 common-theme-2-3">
                    <c:forEach items="${productBrowseList}" var="productBrowse">
                        <li class="common-theme-2-3-item">
                            <img src="${productBrowse.coverPath}" alt="" width="215" height="260">
                            <div class="c-1">
                                <div class="c-1-1">
                                    <div class="t">${productBrowse.name}</div>
                                    <div class="focus">
                                        <c:choose>
                                        <c:when test="${productBrowse.isFollow==0}">
                                        <a href="javascript:;" class="not">
                                            </c:when>
                                            <c:otherwise>
                                            <a href="javascript:;" class="already">
                                                </c:otherwise>
                                                </c:choose>
                                            <i class="iconfont icon-xin"></i>
                                            <span onclick="followOnclick(${productBrowse.businessId})" >${productBrowse.followName}</span>
                                        </a>
                                        <a href="javascript:;" class="share">
                                            <i class="iconfont icon-fenxiang"></i>
                                            <span class="share-span" onclick="shareOnclick(${productBrowse.businessId})">分享</span>
                                        </a>
                                        <a href="javascript:;" class="contrast">
                                            <i class="iconfont icon-duibi"></i>
                                            <span>对比</span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <a href="productdetails?id=${productBrowse.businessId}" class="xq">查看详情</a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            <div class="content_right_list_con">
                <h4>
                    <i class="iconfont icon-xin"></i>
                    <span>我的关注</span>
                </h4>
                <ul class="theme-2-3 common-theme-2-3">
                    <c:forEach items="${productFollowList}" var="productFollow">
                        <li class="common-theme-2-3-item">
                            <img src="${productFollow.coverPath}" alt="" width="215" height="260">
                            <div class="c-1">
                                <div class="c-1-1">
                                    <div class="t">${productFollow.name}</div>
                                    <div class="focus">
                                        <a href="javascript:;" class="already">
                                            <i class="iconfont icon-xin"></i>
                                            <span onclick="followOnclick(${productFollow.businessId})">已关注</span>
                                        </a>
                                        <a href="javascript:;" class="share">
                                            <i class="iconfont icon-fenxiang"></i>
                                            <span class="share-span" onclick="shareOnclick(${productFollow.businessId})">分享</span>
                                        </a>
                                        <a href="javascript:;" class="contrast">
                                            <i class="iconfont icon-duibi"></i>
                                            <span>对比</span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <a href="productdetails?id=${productFollow.businessId}" class="xq">查看详情</a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
   </section>

    <!-- 内容结束 -->

    <!-- 底部开始 -->
    <%@ include file="common/foot.jsp"%>
    <!-- 底部结束 -->

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
                        window.location.href = "peoplecenter";
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