<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>产品中心</title>
		<link rel="stylesheet" type="text/css" href="jxweb/jx/css/productlist.css">
		<link rel="stylesheet" href="jxweb/jx/css/iconfont.css">
		<script src="jxweb/jx/js/jquery.min.js"></script>
		<script src="jxweb/jx/js/common.js"></script>
		<link rel="stylesheet" href="jxweb/jx/css/share.css"/>
		<script src="jxweb/jx/js/ZeroClipboard.js"></script>
		<!-- <script src="js/index.js"></script> -->

		<script>
			var searchAllId = "",historyRecord = "";
			function searchOnclick(searchId) {
			    debugger;
				var isFirst = true;
				//获取全部查询 id 集合
				if(searchAllId == ""){//首次点击
					var  uniqueIdsList = $("#uniqueIds").val().split(',');
					for(var j = 0,len = uniqueIdsList.length; j < len; j++){
						if(uniqueIdsList[j]!=""){
							var id= $("#unique_"+uniqueIdsList[j]).val();
							searchAllId = searchAllId + id;
						}
						if(j!=len-1){
							searchAllId = searchAllId + ",";
						}
					}
				}else {
					isFirst = false;
				}
				console.log("全部数值---------->"+ searchAllId);
				var dictIdList = searchId.split('_');
				//查看是否 点击全部
				if(dictIdList.length==3){//防止空指针
					var categoryBaseId = dictIdList[0] + "_"+ dictIdList[1] + "_";
					if(dictIdList[2]==0){
						// 点击 全部按钮 添加选中效果
						$("#"+categoryBaseId+"0").attr("class","active");
						//移除 其他按钮 效果
						var otherIdList =  $('#unique_'+dictIdList[1]).val().split(',');
						var id_index;
						for(id_index in otherIdList){
							//移除 class 样式
							$("#"+categoryBaseId+otherIdList[id_index]).removeClass("active");
						}
						var a = searchAllId.split(',');
						var b = otherIdList;
						var searchAllIdArrays = a.concat(b.filter(function(v){ return !(a.indexOf(v) > -1)}));
						searchAllId = searchAllIdArrays.join(",");
					}else{
						//点击 其他按钮 添加选中效果
						$("#"+searchId).attr("class","active");
						//移除 全部按钮 效果
						$("#"+categoryBaseId+"0").removeClass("active");
						if(isFirst){
							//移除 改分类下的其他数值选项的
							//第一次点击  获取该按钮下的全部数值
							var categoryIds= $("#unique_"+dictIdList[1]).val();
							console.log("点击该分类下的全部数值---------->"+ categoryIds);
							var categoryIdArray  = categoryIds.split(',');
							console.log("点击的数值---------->"+ dictIdList[2]);
							var removeArray = removeOtherSearchId(categoryIdArray,dictIdList[2]);
							console.log("需要剔除的数值---------->"+ removeArray);
							var  searchAllIdArray = searchAllId.split(',');
							var searchIdArray = getSearchIdArray(searchAllIdArray,removeArray);
							console.log("差集---------->"+ searchIdArray);
							//赋值最新的 参与查询的数值
							searchAllId = searchIdArray.join(",");
							console.log("参与查询的数值---------->"+ searchAllId);
						}else {
							//多次点击
							console.log("historyRecord  上次点击值---------->"+ historyRecord);
							if(historyRecord!=searchId){//点击非自己
								var historyRecordArrays = historyRecord.split('_');
								if(historyRecordArrays.length==3){//防止空指针
									//是否为 本类别 查询
									if(historyRecordArrays[0]+"_"+historyRecordArrays[1]+"_"  == categoryBaseId){
										console.log("为 本类别 查询");
										if(historyRecordArrays[2]!=0){
											searchAllId = searchAllId + "," + dictIdList[2];
										}else {
											var categoryIds= $("#unique_"+dictIdList[1]).val();
											console.log("点击该分类下的全部数值---------->"+ categoryIds);
											var categoryIdArray  = categoryIds.split(',');
											console.log("点击的数值---------->"+ dictIdList[2]);
											var removeArray = removeOtherSearchId(categoryIdArray,dictIdList[2]);
											console.log("需要剔除的数值---------->"+ removeArray);
											var  searchAllIdArray = searchAllId.split(',');
											var searchIdArray = getSearchIdArray(searchAllIdArray,removeArray);
											console.log("差集---------->"+ searchIdArray);
											//赋值最新的 参与查询的数值
											searchAllId = searchIdArray.join(",");
										}
									}else {//非本类别查询
										// 查看 源数据 是否包含 此次查询值所在类别
										var theSame = includes($("#unique_"+dictIdList[1]).val().split(','),searchAllId.split(','));
										console.log("查看 源数据 是否包含 此次查询值所在类别------------->"+theSame);
										if(theSame){
											var searchIdArray = getSearchIdArray(searchAllId.split(','),removeOtherSearchId($("#unique_"+dictIdList[1]).val().split(','),dictIdList[2]));
											searchAllId = searchIdArray.join(",");

										}else {
											searchAllId = searchAllId + "," + dictIdList[2];
										}
									}
								}
							}
						}
					}
					//记录点击
					historyRecord = searchId;
					console.log("上次点击的数值---------->"+ historyRecord);
					//提交查询
					console.log("最终查询的数值---------->"+ searchAllId);
					pageNo = 1;
					getProductList(0);
				}
			}



			function includes(srcIdsArray,searchIdAll) {
				var count = 0;
				var result = false;
				for (var i = 0; i < srcIdsArray.length; i++) {
					for (var j = 0; j < searchIdAll.length; j++) {
						if (srcIdsArray[i] == searchIdAll[j]) {
							result = true;
							count = 0;
							break;
						}else {
							count++;
						}
						if(count==searchIdAll.length){
							return false;
						}
					}
				}
				return result;
			}



			function removeOtherSearchId(arr, item) {
				var ret=[];
				for(var i=0;i<arr.length;i++){
					if(arr[i]!=item){
						ret.push(arr[i]);
					}
				}
				return ret;
			}


			function getSearchIdArray(searchAllIdArray, removeArray) {
				var searchAllIdSet = new Set(searchAllIdArray);
				var removeSet = new Set(removeArray);
				var searchIdArray=[];
				for (let item of searchAllIdSet) {
					if (!removeSet.has(item)) {
						searchIdArray.push(item);
					}
				}
				return searchIdArray;
			}


		</script>
	</head>
	<body>

		<input type="hidden" id="type_Product" value="${type}"/>
		<input type="hidden" id="userId" value="${marryUser.id}"/>
		<input type="hidden" id="uniqueIds" value="${uniqueIds}"/>
		<input type="hidden" id="totalCategory" value="${totalCategory}"/>
		<%@ include file="common/header.jsp"%>
		<!-- 导航位置 -->
		<section class="Navigation">
			<a href="index">首页</a>><a href="">产品列表</a>
		</section>
		<!-- 分类 -->
		<section class="list-wrapper">
			<div class="ul-1 box-list-1">
                <a href="productlist?type=0" class="li" id="hl_ch">
                    <i class="iconfont icon-jishiben"></i>
                    <div class="text">婚礼策划</div>
                    <div class="line-up"></div>
                    <div class="line-down"></div>
                </a>
                <a href="productlist?type=1" class="li" id="hs_sy">
                    <i class="iconfont icon-xiangji"></i>
                    <div class="text">婚纱摄影</div>
                    <div class="line-up"></div>
                    <div class="line-down"></div>
                </a>
                <a href="productlist?type=2" class="li" id="ys_xz">
                    <i class="iconfont icon-nvsheng"></i>
                    <div class="text">艺术写真</div>
                    <div class="line-up"></div>
                    <div class="line-down"></div>
                </a>
                <a href="productlist?type=3" class="li" id="hs_lf">
                    <i class="iconfont icon-hunsha"></i>
                    <div class="text">婚纱礼服</div>
                    <div class="line-up"></div>
                    <div class="line-down"></div>
                </a>
                <a href="productlist?type=4" class="li" id="jh_zj">
                    <i class="iconfont icon--zuanjie"></i>
                    <div class="text">结婚钻戒</div>
                    <div class="line-up"></div>
                    <div class="line-down"></div>
                </a>
                <a href="productlist?type=5" class="li" id="jh_yp">
                    <i class="iconfont icon-tang"></i>
                    <div class="text">结婚用品</div>
                    <div class="line-up"></div>
                    <div class="line-down"></div>
                </a>
                <a href="productlist?type=6" class="li" id="my_lx">
                    <i class="iconfont icon-miyue"></i>
                    <div class="text">蜜月旅行</div>
                    <div class="line-up"></div>
                    <div class="line-down"></div>
                </a>
                <a href="productlist?type=7" class="li" id="jd_yd">
                    <i class="iconfont icon-jiudian"></i>
                    <div class="text">酒店预订</div>
                    <div class="line-up"></div>
                    <div class="line-down"></div>
                </a>
            </div>
			<div class="ul-2 box-list-2">
				<div class="li active" id="wuhaisheng">
					<c:forEach items="${marryDictList}" var="marryDict">
						<input type="hidden" id="${marryDict.unique}" value="${marryDict.valueIds}"/>
						<dl>
							<dt>${marryDict.valueName}：</dt>
							<c:forEach items="${marryDict.valueList}" var="dict">
								<dd id="${dict.searchId}" <c:if test="${dict.id == 0}"> class="active" </c:if>>
									<a href="javascript:void(0);" onclick ="searchOnclick('${dict.searchId}')">${dict.name}</a>
								</dd>
							</c:forEach>
						</dl>
					</c:forEach>
				</div>

			</div>
		</section>
		<section class="theme-wrapper">
			<c:if test="${topProduct.topOn==1}">
				<div class="theme-1">
					<img src="${topProduct.coverPath}" alt="" width="1200" height="612">
				</div>
			</c:if>
			<ul class="theme-2-3 common-theme-2-3" id="product-show-list">
				<c:forEach items="${productList}" var="product">
					<li class="common-theme-2-3-item">
						<img src="${product.coverPath}" alt="" width="282" height="340">
						<%--<i class="iconfont icon-shipinbofang"></i>--%>
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
				<c:if test="${productSize == 12}">
					<a  href ="javascript:void(0);" onclick ="getProductList(1)" class="viewMore">查看更多</a>
				</c:if>
			</div>

		</section>
		<%@ include file="common/foot.jsp"%>

		<script type="text/javascript">
			var pageSearchNo = 1;
			var pageFilterNo = 1;
			var productType = $("#type_Product").val();
			var userId = $('#userId').val();
			function searchContent() {
				search();
			}

			function search() {
				var searchContent = $("#searchContent").val();
				if(pageSearchNo == 1){
					$("#product-show-list").html("");
				}
				$("#viewMore").html("");
				//获取产品列表
				$.ajax({
					url: "api/product/getSearchList",
					type:"get",
					cache: true,
					async: false,
					data: {
						userId:userId,
						pageNo:pageSearchNo,
						searchContent:searchContent,
						topOn:0,
						pageSize:12
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
						pageSearchNo++;
						if(dataLength==12){
							var viewMoreDetails = '<a  href ="javascript:void(0);" onclick ="searchContent()" class="viewMore">查看更多</a>';
							$("#viewMore").append(viewMoreDetails);
						}
					}
				});
			}

			var pageNo = 2;

			function getProductList(searchType) {
				debugger;
				var searchNo;

				if(searchType==0){ //筛选查询
					if(pageFilterNo==1){
						$("#product-show-list").html("");
					}
					searchNo = pageFilterNo;
				}else {
					searchNo = pageNo;
				}
				$("#viewMore").html("");
				var totalCategory = $("#totalCategory").val();
				//获取产品列表
				$.ajax({
					url: "api/product/getProductList",
					type:"get",
					cache: true,
					async: false,
					data: {
						userId:userId,
						type:productType,
						pageNo:searchNo,
						dictIds:searchAllId,
						totalCategory:totalCategory,
						topOn:0,
						pageSize:12
					},
					success: function (data) {
						// 数据绑定
						var dataLength = data.productsList.length;
						for(var i =0 ;i<data.productsList.length; i++){
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
						if(searchType==0){
							pageFilterNo++;
						}else {
							pageNo++;
						}

						if(dataLength==12){
							var _search = 0;
							if(searchType==1){
								_search = 1;
							}
							var viewMoreDetails = '<a  href ="javascript:void(0);" onclick ="getProductList('+_search+')" class="viewMore">查看更多</a>';
							$("#viewMore").append(viewMoreDetails);
						}
					}
				});
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
							window.location.href = "productlist?type="+productType;
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
	