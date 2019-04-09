<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>推荐攻略</title>
		<link rel="stylesheet" type="text/css" href="jxweb/jx/css/strategy.css">
		<script src="jxweb/jx/js/jquery.min.js"></script>
		<script src="jxweb/jx/js/common.js"></script>
	</head>
	<body>
	<%@ include file="common/header.jsp"%>
		<section class="banner-wrapper">
			<div class="banner-son">
				<img src="jxweb/jx/img/201901121314.jpg" alt="" width="1920" height="500">
			</div>
		</section>
		<!-- 导航位置 -->
		<section class="Navigation">
			<a href="index">首页</a>><a href="">推荐攻略</a>
			<input type="hidden" id="type" name="type" value="${type}">
		</section>
		<!-- 分类 -->
		<section class="list-wrapper">
			<ul class="ul-1">
				<c:forEach items="${mapList}" var="map">
					<c:choose>
						<c:when test="${map.id == init}">
							<li class="li active" id="tj">
						</c:when>
						<c:otherwise>
							<li class="li" id="tj">
						</c:otherwise>
					</c:choose>
						<a href="strategy?type=${map.id}" class="text">${map.name}</a>
						<div class="line-up"></div>
						<div class="line-down"></div>
					</li>
				</c:forEach>
			</ul>
		</section>
		<section class="content">
			<ul class="unified-ul" id="strategyShowList">
				<c:forEach var="strategy" items="${strategyList}">
					<li class="unified-li">
						<a href="strategycontent?id=${strategy.id}" class="a-1">
							<img src="${strategy.coverPath}" alt="" width="282" height="340">
						</a>
						<a href="strategycontent?id=${strategy.id}" class="a-2">${strategy.name}</a>
					</li>
				</c:forEach>
			</ul>

			<!-- 分页 -->
			${pageStr}

		</section>
	<%@include file="common/foot.jsp"%>
	</body>

    <script>
        let type = ${init};
        function getProductList(pageNo) {
            $("#strategyShowList").html("");
            $("#page_wrapper").html("");
            $.ajax({
                url: "api/strategy/getStrategyList",
                type:"get",
                cache: true,
                async: false,
                data: {
                    type:type,
                    pageNo:pageNo,
                    pageSize:16
                },
                success: function (data) {
                    for(let i =0 ;i<data.strategyList.length; i++){
                        let proInfo = data.strategyList[i];
						let str ='<li class="unified-li"><a href="strategycontent?id='+proInfo.id+'" class="a-1"><img src="'+proInfo.coverPath+'" alt="" width="282" height="340"></a>';
						let str1 ='<a href="strategycontent?id='+proInfo.id+'" class="a-2">'+proInfo.name+'</a></li>';
                        $("#strategyShowList").append(str+str1);
                    }
                    //分页展示
                    showPage(pageNo,data.pageStrategy)
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

</html>
	