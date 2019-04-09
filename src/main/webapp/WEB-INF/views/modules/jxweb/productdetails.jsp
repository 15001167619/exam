<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="jxweb/jx/css/productdetails.css">
    <link rel="stylesheet" href="jxweb/jx/css/iconfont.css">
    <title>产品详情</title>
    <script src="jxweb/jx/js/jquery.min.js"></script>
    <script src="jxweb/jx/js/common.js"></script>
    <script src="jxweb/jx/js/details.js"></script>
    <script src="${ctxStatic}/picture/jquery.form.js" type="text/javascript"></script>
    <link href="${ctxStatic}/picture/jx_cover.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="${ctxStatic}/picture/mgScroll.js"></script>
    <link rel="stylesheet" href="jxweb/jx/css/share.css"/>
    <script src="jxweb/jx/js/ZeroClipboard.js"></script>
</head>
<body>

<form:form id="searchForm"  action="productdetails" method="post" class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${pageNo}"/>
    <input id="id" name="id" type="hidden" value="${marryProduct.id}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="2"/>
</form:form>
<input id="userId" name="userId" type="hidden" value="${userId}"/>
<input type="hidden" id="type_Product" value="${marryProduct.type}"/>
<input type="hidden" id="originalPicUrl" name="picPath">
<!-- 头部开始-->
<%@ include file="common/header.jsp"%>
<!-- 头部结束-->

<!-- 导航位置 -->
<section class="Navigation">
    <a href="index">首页</a>><a href="productlist?type=${marryProduct.type}">${fns:getMarryDictName(marryProduct.type)}</a>><span>${marryProduct.type}</span>
</section>

<!-- 内容开始 -->
<section class="content">
    <div class="content_tab">
        <div class="content_tab-1">
            <ul class="content_tab-1-1">
                <c:forEach items="${picList}" var="pic">
                    <li>
                        <img src="${pic.picPath}" alt="" width="120" height="146">
                    </li>
                </c:forEach>
            </ul>
            <div class="magnifier">
                <i class="iconfont icon-fangdajing"></i>
            </div>
        </div>
        <div class="content_tab-2">
            <h4>${marryProduct.name}</h4>
            <p>${marryProduct.brief}</p>
            <div class="focus-x">
                <c:choose>
                <c:when test="${isFollow==0}">
                <a href="javascript:;" class="not">
                    </c:when>
                    <c:otherwise>
                    <a href="javascript:;" class="already">
                        </c:otherwise>
                        </c:choose>
                    <i class="iconfont icon-xin"></i>
                    <span onclick="followOnclick(${marryProduct.id})" >${followName}</span>
                </a>
                        <a href="javascript:;" class="share">
                            <i class="iconfont icon-fenxiang"></i>
                            <span class="share-span" onclick="shareOnclick(${marryProduct.id})">分享</span></a>
                <a href="javascript:;" class="contrast">
                    <i class="iconfont icon-duibi"></i>
                    <span>对比</span>
                </a>
            </div>
        </div>
    </div>

    <script>



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
                        window.location.href = "productdetails?id="+businessId;
                    }
                });
            }

        }




    </script>

    <div class="content_con">
        <!-- 分类 -->
        <div class="list-wrapper">
            <div class="list-wrapper-son">
                <ul class="ul-1">
                    <c:choose>
                    <c:when test="${li ==1}">
                    <li class="li  active"  >
                        </c:when>
                        <c:otherwise>
                    <li class="li" >
                        </c:otherwise>
                        </c:choose>

                        <div class="text"><a href="productdetails?id=${marryProduct.id}#a">${fns:getMarryDictName(marryProduct.type)}</a></div>
                        <div class="line-up"></div>
                        <div class="line-down"></div>
                    </li>
                    <li class="li">
                        <div class="text"><a href="productdetails?id=${marryProduct.id}#b">参数说明</a></div>
                        <div class="line-up"></div>
                        <div class="line-down"></div>
                    </li>
                    <li class="li">
                        <div class="text"><a href="productdetails?id=${marryProduct.id}#c">商品故事</a></div>
                        <div class="line-up"></div>
                        <div class="line-down"></div>
                    </li>
                    <c:choose>
                    <c:when test="${li ==0}">
                    <li class="li  active"  >
                        </c:when>
                        <c:otherwise>
                    <li class="li" >
                        </c:otherwise>
                        </c:choose>
                        <div class="text"><a href="productdetails?id=${marryProduct.id}#d">用户讨论(<span>${userCommentsCounts}</span>)</a></div>
                        <div class="line-up"></div>
                        <div class="line-down"></div>
                    </li>
                </ul>
            </div>


            <ul class="ul-2">
                <li class="li active">
                    <div class="li_con">
                        <h4><img src="/marry/jxweb/jx/img/xingxing_44.png" width="21" height="21" id="a">详细介绍</h4>
                        <div class="introduce">
                            ${marryProduct.content}

                        </div>
                        <h4 id="b"><img src="/marry/jxweb/jx/img/xingxing_44.png" width="21" height="21">参数说明</h4>
                        ${marryProduct.specification}
                        <h4 id="c"><img src="/marry/jxweb/jx/img/xingxing_44.png" width="21" height="21">商品故事</h4>
                        <div class="story">
                            ${marryProduct.story}
                        </div>
                        <h4 id="d"><img src="/marry/jxweb/jx/img/xingxing_44.png" width="21" height="21">用户评论</h4>
                        <!-- 用户评论1 -->
                        <div class="user_con">


                            <c:forEach items="${userComments}" var="userComment">
                                <div class="user_con_1">
                                    <div class="user_img">
                                        <img src="${userComment.parentComment.headUrl}" alt="用户头像" width="53px" height="53px">
                                    </div>
                                    <div class="user_content">
                                        <div>${userComment.parentComment.userName}</div>
                                        <p>${userComment.parentComment.content}</p>
                                        <c:if test="${userComment.parentComment.hasPicture == 1}">
                                            <div class="user_content_img">
                                                <c:forEach items="${userComment.parentComment.picUrls}" var="userPicUrl">
                                                    <img src="${userPicUrl}" alt="用户图片" width="196" height="122">
                                                </c:forEach>
                                            </div>
                                        </c:if>
                                        <div class="user_time">
                                            <span>${userComment.parentComment.createTime}</span>
                                            <span class="reply-trigger-1">回复</span>
                                        </div>
                                        <div class="level-1-box">
                                            <textarea name="" id="firstComment_${userComment.pId}" cols="30" rows="10" class="level-1" placeholder="回复 ${userComment.parentComment.userName}"></textarea>
                                            <div class="confirm-1" onclick="addComment(${marryProduct.id},${userComment.pId})">确定</div>
                                        </div>
                                        <div class="line-wrapper"></div>
                                        <div class="comment-wrapper" id="userCommentList_${userComment.pId}">
                                            <c:forEach items="${userComment.childComment}" var="childUserComment" >
                                                <div class="user_con_1_1">
                                                    <div class="user_img">
                                                        <img src="${childUserComment.headUrl}" alt="用户头像" width="53px" height="53px">
                                                    </div>
                                                    <div class="user_content_1_1">
                                                        <div>${childUserComment.userName}</div>
                                                        <p>${childUserComment.content}</p>
                                                        <div class="user_time_1_1">
                                                            <span>${childUserComment.createTime}</span>
                                                            <span class="reply-trigger-2">回复</span>
                                                        </div>
                                                        <!-- 二级回复框 -->
                                                        <div class="level-2-box">
                                                            <textarea name="" id="second_${childUserComment.id}" cols="30" rows="10" class="level-2" placeholder="回复 ${childUserComment.userName}"></textarea>
                                                            <div class="confirm-2" onclick="addSecondComment(${marryProduct.id},${userComment.pId},${childUserComment.id})">确定</div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                        <div class="loading">
                                            <c:if test="${userComment.childCommentCount > 2}">
                                                <a href="javascript:;" onclick="addMore(${userComment.businessId},${userComment.pId})">加载更多</a>
                                                <input id="pageNo_${userComment.pId}" type="hidden" value="2"/>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>



                        </div>
                    </div>
                </li>
                <li class="li">2</li>
                <li class="li">3</li>
                <li class="li">4</li>
            </ul>
            <!-- 分页 -->
            ${pageStr}



            <div class="add-comments">
                <div class="up">
                    <textarea name="" id="comments" cols="30" rows="10" class="textarea"></textarea>
                    <span class="word-number">0 / 300</span>
                    <div class="control-group">
                        <div class="controls">
                            <form id="inputForm" method="post" enctype="multipart/form-data">
                                <div class="f_choim">
                                    <ul class="st_tis" style="margin: 0;">
                                        <c:forEach items="${projectAlbum}" var="album">
                                            <li style="display: block"><img class="opic" src="${album}" /><a onclick="closeImg(this)" style="cursor: pointer"></a></li>
                                        </c:forEach>
                                    </ul>
                                    <input type="file" class="f_img"  id="imgFile" name="imgFile" onchange="uploadPic('inputForm')"><a class="uplo_i"></a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="down">
                    <a href="javascript:;" onclick="addUserComments(${marryProduct.id})">发表</a>
                </div>
            </div>
        </div>
        <aside class="aside">
            <div class="aside-box">
                <div class="title-wrapper">
                    <h3 class="h3-label-2">最新推荐</h3>
                    <a href="strategy" class="more">MORE &gt;</a>
                </div>
                <ul class="theme-2-3 common-theme-2-3">

                    <c:forEach items="${productList.productsList}" var="product">
                        <li class="common-theme-2-3-item">
                            <img src="${product.coverPath}" alt="" width="258" height="310">
                            <i class="iconfont icon-shipinbofang"></i>
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
                                                    <span onclick="followOnclick(${marryProduct.id})">${product.followName}</span>
                                        </a>
                                        <a href="javascript:;" class="share">
                                            <i class="iconfont icon-fenxiang"></i>
                                            <span class="share-span" onclick="shareOnclick(${marryProduct.id})">分享</span>
                                        </a>
                                        <a href="javascript:;" class="contrast">
                                            <i class="iconfont icon-duibi"></i>
                                            <span>对比</span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <a href="productdetails?id=${marryProduct.id}" class="xq">查看详情</a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </aside>
    </div>
</section>
<!-- 大图 -->
<div class="Big-Picture-wrapper">
    <div class="son-wrapper">
        <div class="item">
            <img src="/marry/jxweb/jx/img/201901191649.jpg" alt="" width="844" height="1022">
        </div>
        <div class="item">
            <img src="/marry/jxweb/jx/img/201901191649.jpg" alt="" width="844" height="1022">
        </div>
        <div class="item">
            <img src="/marry/jxweb/jx/img/201901191649.jpg" alt="" width="844" height="1022">
        </div>
        <div class="item">
            <img src="/marry/jxweb/jx/img/201901191649.jpg" alt="" width="844" height="1022">
        </div>
    </div>
    <div class="upper">
        <i class="iconfont icon-zuo"></i>
    </div>
    <div class="next">
        <i class="iconfont icon-zuo"></i>
    </div>
</div>
<!-- 对比栏 -->
<section class="comparison-column">
    <div class="up-wrapper">
        <div class="son">
            <div class="text">对比栏</div>
            <div class="line-up"></div>
            <div class="line-down"></div>
        </div>
        <i class="iconfont icon-guanbi"></i>
    </div>
    <div class="down-wrapper">
        <ul class="ul">
            <li class="li">
                <!--                     <div class="li-1">
                                        <div class="bg">1</div>
                                        <p>您还可以继续添加</p>
                                    </div> -->
                <div class="li-2">
                    <img src="/marry/jxweb/jx/img/201901191909.jpg" alt="" width="91" height="111">
                    <p>不负花期不负卿——在最美的花海遇见你</p>
                </div>
            </li>
            <li class="li">
                <div class="li-1">
                    <div class="bg">2</div>
                    <p>您还可以继续添加</p>
                </div>
                <!--                     <div class="li-2">
                                        <img src="./img/201901191909.jpg" alt="" width="91" height="111">
                                        <p>不负花期不负卿——在最美的花海遇见你</p>
                                    </div> -->
            </li>
            <li class="li">
                <div class="li-1">
                    <div class="bg">3</div>
                    <p>您还可以继续添加</p>
                </div>
                <!--                     <div class="li-2">
                                        <img src="./img/201901191909.jpg" alt="" width="91" height="111">
                                        <p>不负花期不负卿——在最美的花海遇见你</p>
                                    </div> -->
            </li>
        </ul>
        <div class="right">
            <div class="contrast">
                <i class="iconfont icon-duibi"></i>
                <span>对比</span>
            </div>
            <a href="javascript:;" class="empty">清空对比栏</a>
        </div>
    </div>
</section>


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


<script>
    var g_url = window.location.href;
    $('.share-copy-c input').val(g_url);

    var clip = new ZeroClipboard( document.getElementById("btnCopy"));

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


    function closeImg(obj) {
        let imgSrc = $(obj).parent().find("img")[0].src;
        let baseUrl = 'http://'+document.location.host;
        imgSrc = imgSrc.replace(baseUrl,"");
        let originalPicUrl = $("#originalPicUrl").val();
        let originalPicUrls = originalPicUrl.split(";");
        $("#originalPicUrl").val("");
        for (let int = 0; int < originalPicUrls.length; int++) {
            if(originalPicUrls[int]!=imgSrc){
                if ($("#originalPicUrl").val() != "") {
                    $("#originalPicUrl").val($("#originalPicUrl").val()	+ ";" + originalPicUrls[int]);
                } else {
                    $("#originalPicUrl").val(originalPicUrls[int]);
                }
            };

        }
        $(obj).parent().hide().remove();
        $('.f_choim input.f_img,.f_choim a.uplo_i').css('left',
            $('.st_tis').width());
    };


    function uploadPic(formId) {
        $('input.f_file').hover(
            function() {
                $(this).next().find('img.halrea').removeClass('shay')
                    .addClass('disn');
                $(this).next().find('img.f_coimg').removeClass('disn')
                    .addClass('shay');
            },
            function() {
                $(this).next().find('img.halrea').removeClass('disn')
                    .addClass('shay');
                $(this).next().find('img.f_coimg').removeClass('shay')
                    .addClass('disn');
            });
        var formObj = $("#" + formId)
        //异步表单提交 先提交图片
        formObj.ajaxSubmit({
            type : "POST",
            url : "<c:url value='/api/user/commentPicUpload'/>",
            dataType : "text",
            async : false,
            data : {
                fileType : "imge"
            },
            success : function(data) {
                debugger;

                if (formId == "inputForm") {
                    if ($("#originalPicUrl").val() != "") {
                        $("#originalPicUrl").val($("#originalPicUrl").val()	+ ";" + data);
                    } else {
                        $("#originalPicUrl").val(data);

                    }
                    $(".st_tis").append('<li style="display:block"><img class="opic" src="'+data+'"/><a onclick="closeImg(this)" style="cursor:pointer"></a></li>');
                    $('.f_choim input.f_img,a.uplo_i').css('left',$(".st_tis").width());

                }

            }
        });
    }


    function addSecondComment(businessId,pId,childUserCommentId) {
        let userId = $('#userId').val();
        if(userId == ''){
            window.location.href = "<c:url value='loginordinary'/>"
        }
        let content = $("#second_"+childUserCommentId).val();
        if(content == ''){
            alert('请输入回复信息')
        }else {
            $.ajax({
                url: "<c:url value='/api/user/addComment'/>",
                type:"post",
                cache: true,
                async: false,
                data: {
                    userId:userId,
                    content:content,
                    businessId:businessId,
                    pId:pId
                },
                success: function (data) {
                    window.location.href = "productdetails?id="+businessId;
                }
            });
        }
    }

    function addComment(businessId,pId) {
        let userId = $('#userId').val();
        if(userId == ''){
            window.location.href = "<c:url value='loginordinary'/>"
        }
        let content = $("#firstComment_"+pId).val();
        if(content == ''){
            alert('请输入回复信息')
        }else {
            $.ajax({
                url: "<c:url value='/api/user/addComment'/>",
                type:"post",
                cache: true,
                async: false,
                data: {
                    userId:userId,
                    content:content,
                    businessId:businessId,
                    pId:pId
                },
                success: function (data) {
                    window.location.href = "productdetails?id="+businessId;
                }
            });
        }
    }

    function addMore(businessId,pId) {
        var pageNo = $('#pageNo_'+pId).val();
        $.ajax({
            url: "<c:url value='/api/user/childCommentList'/>",
            type:"get",
            cache: true,
            async: false,
            data: {
                pageNo:pageNo,
                businessId:businessId,
                pId:pId,
                pageSize:2
            },
            success: function (data) {
                // 数据绑定
                for(var i =0 ;i< data.childComment.length; i++){
                    var info = data.childComment[i];
                    var commentInfo = '';
                    var commentInfoStr1 = '<div class="user_con_1_1"><div class="user_img"><img src="'+info.headUrl+'" alt="用户头像" width="53px" height="53px"></div>';
                    var commentInfoStr2 = '<div class="user_content_1_1"><div>'+info.userName+'</div><p>'+info.content+'</p><div class="user_time_1_1"><span>'+info.createTime+'</span><span class="reply-trigger-2">回复 '+info.userName+'</span></div>';
                    var commentInfoStr3 = '<div class="level-2-box"><textarea name="" id="second_'+info.id+'" cols="30" rows="10" class="level-2" placeholder="回复"></textarea><div class="confirm-2" onclick="addSecondComment('+businessId+','+pId+','+info.id+')">确定</div></div></div></div>';
                    commentInfo = commentInfoStr1 + commentInfoStr2 + commentInfoStr3;
                    $("#userCommentList_"+pId).append(commentInfo);
                }
                $('#pageNo_'+pId).val(pageNo*1+1);
            }
        });
    }
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

    function addUserComments(businessId) {

        debugger;
        //是否有图 0 无图 1 有图
        let hasPicture = 0;
        //
        let picUrls = $("#originalPicUrl").val();
        if(picUrls != ''){
            hasPicture = 1;
        }
        let userId = $("#userId").val();
        if(userId == ''){
            window.location.href = "<c:url value='loginordinary'/>"
        }else {
            let content = $("#comments").val();
            if(content == ''){
                alert('请输入回复信息')
            }else {
                $.ajax({
                    url: "<c:url value='/api/user/addComment'/>",
                    type:"post",
                    cache: true,
                    async: false,
                    data: {
                        userId:userId,
                        hasPicture:hasPicture,
                        picUrls:picUrls,
                        content:content,
                        businessId:businessId,
                        pId:0
                    },
                    success: function (data) {
                        window.location.href = "productdetails?id="+businessId;
                    }
                });
            }
        }


    }

</script>
</body>
</html>