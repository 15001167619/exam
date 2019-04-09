<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
	<head>
		<meta charset="UTF-8">
		<title>最新活动</title>
		<link rel="stylesheet" type="text/css" href="jxweb/jx/css/journalismlist.css">
		<script src="jxweb/jx/js/jquery.min.js"></script>
		<script src="jxweb/jx/js/common.js"></script>
	</head>
	<body>
	<%@ include file="common/header.jsp"%>
		<!-- 导航位置 -->
		<section class="Navigation">
			<a href="index">首页</a>><a href="">最新活动</a>
		</section>
		<!-- 内容 -->
		<section class="content">
			<ul class="ul" id="diaryShowList">
				<c:forEach items="${diaryList}" var="diary">
					<li class="li">
						<a href="latestactivitiescontent?id=${diary.id}" class="li-1">
							<img src="${diary.bannerPicPath}" alt="" width="285" height="173">
						</a>
						<div class="li-2">
							<a href="latestactivitiescontent?id=${diary.id}" class="a-1">${diary.name}</a>
							<a href="latestactivitiescontentid?=${diary.id}" class="a-2">${diary.brief}</a>
						</div>
					</li>
				</c:forEach>
			</ul>
			<c:choose>
				<c:when test="${pageDiary.pages == 1}">
				</c:when>
				<c:when test="${pageDiary.pages > 1}">
					<c:if test="${pageDiary.pages <= 8}">
						<div class="page-wrapper" id="page_wrapper">
							<ul>
								<li><a href="" class="up">首页</a></li>
								<li><a class="active">1</a></li>
								<c:forEach var="pageNo" begin="2" end="${pageDiary.pages}">
									<li><a  href ="javascrit:void(0);" onclick ="getDiaryList(${pageNo})">${pageNo}</a></li>
								</c:forEach>
								<li><a href ="javascrit:void(0);" onclick ="getPageTurningDiaryList(1)" class="x">></a></li>
								<li><a href ="javascrit:void(0);" onclick ="getDiaryList(${pageDiary.pages})" class="next">末页</a></li>
							</ul>
						</div>
					</c:if>
					<c:if test="${pageDiary.pages > 8}">
						<div class="page-wrapper" id="page_wrapper">
							<ul>
								<li><a href="" class="up">首页</a></li>
								<li><a class="active">1</a></li>
								<c:forEach var="pageNo" begin="2" end="5">
									<li><a  href ="javascrit:void(0);" onclick ="getDiaryList(${pageNo})">${pageNo}</a></li>
								</c:forEach>
								<li class="ellipsis">...</li>
								<c:forEach var="pageNo" begin="${pageDiary.pages-1}" end="${pageDiary.pages}">
									<li><a  href ="javascrit:void(0);" onclick ="getDiaryList(${pageNo})">${pageNo}</a></li>
								</c:forEach>
								<li><a href ="javascrit:void(0);" onclick ="getPageTurningDiaryList(1)" class="x">></a></li>
								<li><a href ="javascrit:void(0);" onclick ="getDiaryList(${pageDiary.pages})" class="next">末页</a></li>
							</ul>
						</div>
					</c:if>
				</c:when>
				<c:otherwise>

				</c:otherwise>
			</c:choose>
		</section>
	<%@ include file="common/foot.jsp"%>

	<script type="text/javascript">
		function getDiaryList(pageNo) {
			$("#diaryShowList").html("");
			$("#page_wrapper").html("");
			//获取推荐日记列表
			$.ajax({
				url: "/api/diary/getDiaryList",
				type:"get",
				cache: true,
				async: false,
				data: {
					type:1,
					pageNo:pageNo,
					pageSize:20
				},
				success: function (data) {
					// 数据绑定
					for(var i =0 ;i<data.diaryList.length; i++){
						var proInfo = data.diaryList[i];
						var str ='<li class="li"><a href="latestactivitiescontent?id='+proInfo.id+'"  class="li-1"><img src="'+proInfo.bannerPicPath+'" alt="" width="285" height="173"></a>';
						var str_start = '<div class="li-2"><a href="latestactivitiescontent?id='+proInfo.id+'"  class="a-1">'+proInfo.name+'</a>';
						var str_end = '<a href="latestactivitiescontent?id='+proInfo.id+'"  class="a-2">'+proInfo.brief+'</a></div></li>';
						$("#diaryShowList").append(str+str_start+str_end);
					}
					//分页展示
					showPage(pageNo,data.pageDiary)
				}
			});

		}

		function getPageTurningDiaryList(type) {
			var pageNo = $('#page_wrapper .active').html();
			if(type == 1){
				getDiaryList(pageNo*1+1);
			}else {
				getDiaryList(pageNo*1-1);
			}
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
						pageStr = '<li><a  href ="javascrit:void(0);" onclick ="getDiaryList('+ i + ')">'+ i + '</a></li>';
					}
					page_content = page_content + pageStr;
				}
			}else {  //超过 8 页 会有 ... 展示
				if(pageNo!=1){   // 不是点击第一页  会有 向前 箭头
					page_content = '<li><a href="javascrit:void(0);" onclick ="getPageTurningDiaryList(0)" class="s"><</a></li>';
				}
				var difference = pages - pageNo;
				if(difference == 3 ){ //刚刚好
					for(var n = pageNo - 4 ;n <= pages; n++){
						if(pageNo == n){
							pageStr = '<li><a class="active">'+ pageNo + '</a></li>';
						}else {
							pageStr = '<li><a  href ="pjavascrit:void(0);" onclick ="getDiaryList('+ n + ')">'+ n + '</a></li>';
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
								pageStr = '<li><a  href ="javascrit:void(0);" onclick ="getDiaryList('+ p + ')">'+ p + '</a></li>';
							}
							page_content = page_content + pageStr;
						}
					}else{
						for(var p = pageNo-4 ;p <= pageNo; p++){
							if(pageNo == p){
								pageStr = '<li><a class="active">'+ pageNo + '</a></li>';
							}else {
								pageStr = '<li><a  href ="javascrit:void(0);" onclick ="getDiaryList('+ p + ')">'+ p + '</a></li>';
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
							pageStr = '<li><a  href ="javascrit:void(0);" onclick ="getDiaryList('+ p + ')">'+ p + '</a></li>';
						}
						page_content = page_content + pageStr;
					}
				}else {// 已经到 最底页
					for(var n = pages - 7 ;n <= pages; n++){
						if(pageNo == n){
							pageStr = '<li><a class="active">'+ pageNo + '</a></li>';
						}else {
							pageStr = '<li><a  href ="pjavascrit:void(0);" onclick ="getDiaryList('+ n + ')">'+ n + '</a></li>';
						}
						page_content = page_content + pageStr;
					}
				}
			}
			var page_end = '';
			var end = '';
			if(pageNo!=pages){
				var pageNext = '<li><a href ="javascrit:void(0);" onclick ="getPageTurningDiaryList(1)" class="x">></a></li>';
				page_end = page_end + pageNext;
			}
			end = '<li><a href ="javascrit:void(0);" onclick ="getDiaryList('+pages +'") class="next">末页</a></li></ul>';
			page_end = page_end + end;
			$("#page_wrapper").append(page_start + page_content + page_end);
		}
	</script>


	</body>
</html>
	