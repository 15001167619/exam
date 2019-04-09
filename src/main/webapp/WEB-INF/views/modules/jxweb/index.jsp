<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
	<head>
		<meta charset="UTF-8">
		<title>久禧</title>
		<link href="jxweb/jx/css/index.css" type="text/css" rel="stylesheet" />
		<link rel="stylesheet" type="text/css" href="jxweb/jx/css/swiper.min.css" />
		<link rel="stylesheet" type="text/css" href="jxweb/jx/css/selectFilter.css">
		<script src="jxweb/jx/js/jquery.min.js" type="text/javascript"></script>
		<script src="jxweb/jx/js/swiper.min.js"></script>
		<script src="jxweb/jx/js/common.js"></script>
		<script src="jxweb/jx/js/index.js"></script>
		<script src="jxweb/jx/js/selectFilter.js"></script>
	</head>
	<body>
	<%@ include file="common/header.jsp"%>
		<section class="banner-wrapper">
		  <!-- Swiper -->
		  <div class="swiper-container swiper-container-1">
		    <div class="swiper-wrapper swiper-wrapper-1">
				<c:forEach items="${bannerList}" var="banner">
					<div class="swiper-slide swiper-slide-1">
						<img src="${banner.bannerPicPath}" alt="">
					</div>
				</c:forEach>
		    </div>
		    <!-- Add Pagination -->
		    <div class="swiper-pagination swiper-pagination-1"></div>
		    <!-- Add Arrows -->
		    <div class="swiper-button-next swiper-button-next-1"></div>
		    <div class="swiper-button-prev swiper-button-prev-1"></div>
		  </div>
		  <!-- Initialize Swiper -->
		  <script>
		    var swiper = new Swiper('.swiper-container-1', {
		      slidesPerView: 1,
		      loop: true,
		      pagination: {
		        el: '.swiper-pagination-1',
		        clickable: true,
		      },
		      navigation: {
		        nextEl: '.swiper-button-next-1',
		        prevEl: '.swiper-button-prev-1',
		      },
		    })
		  </script>
		</section>
		<section class="introduce-wrapper">
			<div class="left">
				<img src="${company.mainPic}" alt="简介" width="648" height="423">
			</div>
			<div class="right">
				<img src="/marry/jxweb/jx/img/201901081840.png" alt="company profile" width="495" height="39">
				<div class="con">
					<h4><span>${company.name}</span> ${company.title}
						<p>${company.introduction}</p>
					</h4>
				</div>
				<a href="aboutenterprises" class="see">查看更多</a>
			</div>
		</section>


		<section class="main-wrapper">
			<section class="main-son-wrapper">
				<section class="s-1">
					<h2 class="title-2">产品中心</h2>
					<div class="info">“执子之手，与子偕老”我为你见证</div>
					<div class="product-center"></div>
				</section>
				<section class="product-switching-effect">
					<ul class="tab-item">
					<c:forEach items="${successCaseList}" var="suc">
						<li class="li-item" id="product-switching-list">
							<div class="v-1">
                                <div class="v-1-1">
                                    <div class="v-1-1-1">
                                        <img src="${suc.pic1}" alt="" width="301" height="362">
                                    </div>
                                    <div class="v-1-1-2">
                                        <a href="productdetails?id=${suc.productId}">
                                            <img src="/marry/jxweb/jx/img/search.png" alt="">
                                            <p>
                                                ${suc.title}<br>
                                                <span>${suc.content}</span>
                                            </p>
                                        </a>
                                    </div>
                                </div>
                                <div class="v-1-1">
                                    <div class="v-1-1-1">
                                        <img src="${suc.pic2}" alt="" width="301" height="362">
                                    </div>
                                    <div class="v-1-1-2">
                                        <a href="productdetails?id=${suc.productId}">
                                            <img src="/marry/jxweb/jx/img/search.png" alt="">
                                            <p>
													${suc.title}<br>
												<span>${suc.content}</span>
                                            </p>
                                        </a>
                                    </div>
                                </div>
							</div>
                            <div class="v-2">
                                <div class="v-2-1">
                                    <img src="${suc.pic3}" alt="" width="621" height="752">
                                </div>
                                <div class="v-2-2">
                                    <a href="productdetails?id=${suc.productId}">
                                        <img src="/marry/jxweb/jx//img/search.png" alt="">
                                        <p>
												${suc.title}<br>
											<span>${suc.content}</span>
                                        </p>
                                    </a>
                                </div>
                            </div>
                            <div class="v-3">
                                <div class="v-3-1">
                                    <img src="${suc.pic4}" alt="" width="315" height="379">
                                </div>
                                <div class="v-3-2">
                                    <a href="productdetails?id=${suc.productId}">
                                        <img src="/jxweb/jx/img/search.png" alt="">
                                        <p>
												${suc.title}<br>
											<span>${suc.content}</span>
                                        </p>
                                    </a>
                                </div>
                            </div>
							<div class="v-4"></div>
							<div class="v-5">PRODUCT CENTER</div>
						</li>
					</c:forEach>
					</ul>
					<ul class="tab-list">
						<li class="tab-list-item active">
							<a href="productlist?type=0" class="text">婚礼策划</a>
							<a href="productlist?type=0" class="icon">
								<i class="iconfont icon-jiantou"></i>
							</a>
						</li>
                        <li class="tab-list-item">
                            <a href="productlist?type=1" class="text">婚纱摄影</a>
                            <a href="productlist?type=1" class="icon">
                                <i class="iconfont icon-jiantou"></i>
                            </a>
                        </li>
                        <li class="tab-list-item">
                            <a href="productlist?type=2" class="text">艺术写真</a>
                            <a href="productlist?type=2" class="icon">
                                <i class="iconfont icon-jiantou"></i>
                            </a>
                        </li>
                        <li class="tab-list-item">
                            <a href="productlist?type=3" class="text">婚纱礼服</a>
                            <a href="productlist?type=3" class="icon">
                                <i class="iconfont icon-jiantou"></i>
                            </a>
                        </li>
						<li class="tab-list-item">
							<a href="productlist?type=4" class="text">结婚钻戒</a>
							<a href="productlist?type=4" class="icon">
								<i class="iconfont icon-jiantou"></i>
							</a>
						</li>
						<li class="tab-list-item">
							<a href="productlist?type=5" class="text">结婚用品</a>
							<a href="productlist?type=5" class="icon">
								<i class="iconfont icon-jiantou"></i>
							</a>
						</li>
						<li class="tab-list-item">
							<a href="productlist?type=6" class="text">蜜月旅行</a>
							<a href="productlist?type=6" class="icon">
								<i class="iconfont icon-jiantou"></i>
							</a>
						</li>
						<li class="tab-list-item">
							<a href="productlist?type=7" class="text">酒店预订</a>
							<a href="productlist?type=7" class="icon">
								<i class="iconfont icon-jiantou"></i>
							</a>
						</li>
					</ul>
					<div class="toggle-button">
						<span class="front">
							<i class="iconfont icon-jiantou"></i>
						</span>
						<span class="after">
							<i class="iconfont icon-jiantou"></i>
						</span>
					</div>
                    <script>
                        var pageTurningType = 0;
                        function getFrontProductList() {
                            pageTurningType--;
                            if(pageTurningType==-1){
                                pageTurningType = 7;
                            }
                            showProductList(pageTurningType);
                        }
                        function getAfterProductList() {
                            pageTurningType++;
                            if(pageTurningType==8){
                                pageTurningType = 0;
                            }
                            showProductList(pageTurningType);
                        }
                        function showProductList(pageTurningType) {
                            $("#diaryShowList").html("");
                            $("#page_wrapper").html("");
                            //获取 首页产品展示
                            $.ajax({
                                url: "/marry/api/product/getPageTurningList",
                                type:"get",
                                cache: true,
                                async: false,
                                data: {
                                    type:pageTurningType,
                                    pageNo:1,
                                    pageSize:4
                                },
                                success: function (data) {
                                    // 数据绑定
                                    console.log(data)
                                    var content = '';
                                    if(data.product_1.id !=0){ //需要展示
                                        var v_1 = '<div class="v-1"><div class="v-1-1"><div class="v-1-1-1"><img src="'+data.product_1.coverPath+'" alt="" width="301" height="362"></div><div class="v-1-1-2"><a href="productdetails?id='+data.product_1.id+'"><img src="/jxweb/jx/img/search.png" alt=""><p>'+data.product_1.name+'<br><span>'+data.product_1.brief+'</span></p></a></div></div>';
                                        if(data.product_2.id !=0){
                                            var v_2 = '<div class="v-1-1"><div class="v-1-1-1"><img src="'+product_2.coverPath+'" alt="" width="301" height="362"></div><div class="v-1-1-2"><a href="productdetails?id='+data.product_2.id+'"><img src="/jxweb/jx/img/search.png" alt=""><p>'+data.product_2.name+'<br><span>'+data.product_2.brief+'</span></p></a></div></div></div>';
                                            content = v_1 + v_2;
                                            if(data.product_3.id !=0){
                                                var v_3 = '<div class="v-2"><div class="v-2-1"><img src="'+product_3.coverPath+'" alt="" width="621" height="752"></div><div class="v-2-2"><a href="productdetails?id='+data.product_3.id+'"><img src="/jxweb/jx//img/search.png" alt=""><p>'+data.product_3.name+'<br><span>'+data.product_3.brief+'</span></p></a></div></div>';
                                                content = content + v_3;
                                                if(data.product_4.id !=0){
                                                    var v_4 = '<div class="v-3"><div class="v-3-1"><img src="'+product_4.coverPath+'" alt="" width="315" height="379"></div><div class="v-3-2"><a href="productdetails?id='+data.product_4.id+'"><img src="/jxweb/jx/img/search.png" alt=""><p>'+data.product_4.name+'<br><span>'+data.product_4.brief+'</span></p></a></div></div>';
                                                    content = content + v_4;
                                                }
                                            }
                                        }else {
                                            content = v_1 + '</div>';
                                        }
                                        content = content + '<div class="v-4"></div><div class="v-5">PRODUCT CENTER</div>';

                                    }
                                }
                            });
                        }
                    </script>
				</section>
				<section class="Recommend-wrapper">
					<div class="left">
						<h3 class="h3-label-1">推荐日记</h3>
						<ul class="ul" id="diaryShowList">
							<c:forEach items="${diaryList}" var="diary">
								<li class="li">
									<h4 class="title"><a href="recdiarycontent?id=${diary.id}">${diary.name}</a></h4>
									<p class="text">${diary.brief}</p>
									<div class="pic">
										<c:forEach items="${diary.diaryPicList}" var="diaryPic">
											<div class="pic-son">
												<a href="recdiarycontent?id=${diary.id}">
													<img src="${diaryPic.bannerPicPath}" alt="" width="266" height="166">
												</a>
											</div>
										</c:forEach>
										<div class="pic-son"></div>
									</div>
								</li>
							</c:forEach>
						</ul>
						<!-- 分页 -->
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
												<li><a  href ="javascript
												:void(0);" onclick ="getDiaryList(${pageNo})">${pageNo}</a></li>
											</c:forEach>
											<li><a href ="javascript:void(0);" onclick ="getPageTurningDiaryList(1)" class="x">></a></li>
											<li><a href ="javascript:void(0);" onclick ="getDiaryList(${pageDiary.pages})" class="next">末页</a></li>
										</ul>
									</div>
								</c:if>
								<c:if test="${pageDiary.pages > 8}">
									<div class="page-wrapper" id="page_wrapper">
										<ul>
											<li><a href="" class="up">首页</a></li>
											<li><a class="active">1</a></li>
											<c:forEach var="pageNo" begin="2" end="5">
												<li><a  href ="javascript:void(0);" onclick ="getDiaryList(${pageNo})">${pageNo}</a></li>
											</c:forEach>
											<li class="ellipsis">...</li>
											<c:forEach var="pageNo" begin="${pageDiary.pages-1}" end="${pageDiary.pages}">
												<li><a  href ="javascript:void(0);" onclick ="getDiaryList(${pageNo})">${pageNo}</a></li>
											</c:forEach>
											<li><a href ="javascript:void(0);" onclick ="getPageTurningDiaryList(1)" class="x">></a></li>
											<li><a href ="javascript:void(0);" onclick ="getDiaryList(${pageDiary.pages})" class="next">末页</a></li>
										</ul>
									</div>
								</c:if>
							</c:when>
						</c:choose>
					</div>
					<div class="right">
						<div class="right-1">
							<div class="title-wrapper">
								<h3 class="h3-label-2">推荐攻略</h3>
								<a href="strategy" class="more">MORE ></a>
							</div>
							<ul class="unified-ul">
								<c:forEach items="${strategyList}" var="strategy">
								<li class="unified-li">
									<a href="strategycontent?id=" class="a-1">
										<img src="${strategy.coverPath}" alt="" width="250" height="301">
									</a>
									<a href="strategycontent?id=${strategy.id}" class="a-2">${strategy.name}</a>
								</li>
								</c:forEach>
							</ul>
						</div>

						<!-- 热门新闻 -->
						<div class="right-2">
							<div class="title-wrapper-2">
								<div class="i"><i class="iconfont icon-huo"></i></div>
								<h3 class="h3-label-3">热门新闻</h3>
								<a href="Straty?type=4&page=0" class="more">MORE ></a>
							</div>
							<ul class="right-2-ul">
								<c:forEach items="${newList}" var="st">
								<li class="right-2-ul-li">
									<a href="latestactivitiescontent?id=${st.id}" class="a-2">${st.subtitle}</a>
								</li>
								</c:forEach>
							</ul>
						</div>
						<!-- 最新活动 -->
						<div class="right-2 right-3">
							<div class="title-wrapper-2">
								<div class="i"><i class="iconfont icon-lihe"></i></div>
								<h3 class="h3-label-3">最新活动</h3>
								<a href="latestactivitieslist" class="more">MORE ></a>
							</div>
							<ul class="right-2-ul">
                                <c:forEach items="${diaryActivitiesList}" var="activities">
                                    <li class="right-2-ul-li">
                                        <a href="latestactivitiescontent?id=${activities.id}" class="a-1 special"><img src="${activities.bannerPicPath}" alt=""></a>
                                        <a href="latestactivitiescontent?id=${activities.id}" class="a-2">${activities.name}</a>
                                    </li>
                                </c:forEach>
							</ul>
						</div>

					</div>
				</section>
			</section>
		</section>
		<!-- 合作商家 -->
		<section class="cooperative-business-wrapper">
			<div class="son">
				<h2 class="title">合作商家</h2>
				<div class="info">MARRIAGE RELATED</div>
				<!-- Swiper -->
				<div class="swiper-container swiper-container-2">
					<div class="swiper-wrapper">
						<div class="swiper-slide swiper-slide-2">
							<img src="/marry/jxweb/jx/img/201901100923.jpg" alt="" width="222" height="122">
						</div>
						<div class="swiper-slide swiper-slide-2">
							<img src="/marry/jxweb/jx/img/201901100923.jpg" alt="" width="222" height="122">
						</div>
						<div class="swiper-slide swiper-slide-2">
							<img src="/marry/jxweb/jx/img/201901100923.jpg" alt="" width="222" height="122">
						</div>
						<div class="swiper-slide swiper-slide-2">
							<img src="/marry/jxweb/jx/img/201901100923.jpg" alt="" width="222" height="122">
						</div>
						<div class="swiper-slide swiper-slide-2">
							<img src="/marry/jxweb/jx/img/201901100923.jpg" alt="" width="222" height="122">
						</div>
						<div class="swiper-slide swiper-slide-2">
							<img src="/marry/jxweb/jx/img/201901100923.jpg" alt="" width="222" height="122">
						</div>
					</div>
					<!-- Add Pagination -->
					<!-- <div class="swiper-pagination swiper-pagination-2"></div> -->
				    <!-- Add Arrows -->
				    <div class="swiper-button-next swiper-button-next-2"></div>
				    <div class="swiper-button-prev swiper-button-prev-2"></div>
				</div>
				<script>
					var swiper = new Swiper('.swiper-container-2', {
						slidesPerView: 5,
						spaceBetween: 20,
						navigation: {
							nextEl: '.swiper-button-next-2',
							prevEl: '.swiper-button-prev-2',
						},
					})
				</script>
			</div>
		</section>

		<%@ include file="common/foot.jsp"%>

	<!-- 提交信息 -->
	<div class="fixed-wrapper">
		<div class="son">
			<div class="select-wrapper">
				<div class="box">
					<!-- 						<div class="filter-box filter-box-1">
                                                <div class="filter-text">
                                                    <input class="filter-title" type="text" readonly placeholder="pleace select" />
                                                    <i class="icon icon-filter-arrow"></i>
                                                </div>
                                                <select name="filter">
                                                    <option value="1">111</option>
                                                    <option value="2">222</option>
                                                    <option value="3">333</option>
                                                    <option value="4">444</option>
                                                    <option value="5">555</option>
                                                    <option value="6">666</option>
                                                </select>
                                            </div>
                                            <div class="text"></div> -->


					<input type="text" name="" placeholder="请输入名字" class="first-class">
				</div>
				<div class="box">
					<!-- 						<div class="filter-box filter-box-2">
                                                <div class="filter-text">
                                                    <input class="filter-title" type="text" readonly placeholder="pleace select" />
                                                    <i class="icon icon-filter-arrow"></i>
                                                </div>
                                                <select name="filter">
                                                    <option value="1">111</option>
                                                    <option value="2">222</option>
                                                    <option value="3">333</option>
                                                    <option value="4">444</option>
                                                    <option value="5">555</option>
                                                    <option value="6">666</option>
                                                </select>
                                            </div>
                                            <div class="text"></div> -->




					<input type="text" name="" placeholder="请输入年龄" class="second-class">
				</div>
				<div class="box">
					<div class="filter-box filter-box-3">
						<div class="filter-text">
							<input class="filter-title" type="text" readonly placeholder="pleace select" />
							<i class="icon icon-filter-arrow"></i>
						</div>
						<select name="filter">
							<option value="1">111</option>
							<option value="2">222</option>
							<option value="333">333</option>
							<option value="4">444</option>
							<option value="5">555</option>
							<option value="6">666</option>
						</select>
					</div>
					<div class="text">（含摄影、婚礼、婚纱）</div>
				</div>
				<div class="box">

					<input type="text" name="date" placeholder="请选择婚期" class='ECalendar' id="ECalendar_case" />

				</div>
				<div class="submit">提交</div>
			</div>
		</div>
			<img src="/marry/jxweb/jx/img/201901202316.png" alt="" class="fixed-pic"/>
			<div class="close">
				<div class="line"></div>
				<i class="iconfont icon-guanbi"></i>
			</div>
		</div>

		<script type="text/javascript">

            $(function(){
                var s3 = ''
                $('.filter-box-3').selectFilter({
                    callBack : function (val){
                        //返回选择的值
                        console.log(val)
                        s3 = val
                    }
                })
                // 日历插件
                $("#ECalendar_case").ECalendar({
                    type:"date",
                    skin:"#b12f2a",
                    offset:[0,2],
                    callback: function(v, e) {
                        console.log(v)
                        console.log(e)
                    }
                })

                // 提交表单
                $('.submit').on('click', function() {
                    var s1 = $('.first-class').val()
                    var s2 = $('.second-class').val()
                    var s4 = $('.ECalendar').val()

                    if(s1 == '') {
                        alert('请输入姓名')
                    } else if(s2 == '') {
                        alert('请输入年龄')
                    } else if(s3 == '') {
                        alert('请选择费用')
                    } else if(s4 == '') {
                        alert('请选择婚期')
                    } else {
                        // 通过
                        $.ajax({
                            url: '',
                            method: 'post',
                            data: {
                                'name': s1,
                                'age': s2,
                                'cost': s3,
                                'date': s4,
                            },
                            dataType: 'json',
                            success: function(res) {
                                console.log(res)
                            },
                            error: function(err) {
                                console.log(err)
                            }
                        })
                    }
                })
            })
			//这里是初始化
			$('.filter-box-1').selectFilter({
				callBack : function (val){
					//返回选择的值
					console.log(val+'-是返回的值')
				}
			});
			$('.filter-box-2').selectFilter({
				callBack : function (val){
					//返回选择的值
					console.log(val+'-是返回的值')
				}
			});
			$('.filter-box-3').selectFilter({
				callBack : function (val){
					//返回选择的值
					console.log(val+'-是返回的值')
				}
			});
			$('.filter-box-4').selectFilter({
				callBack : function (val){
					//返回选择的值
					console.log(val+'-是返回的值')
				}
			});


			function getDiaryList(pageNo) {
				$("#diaryShowList").html("");
				$("#page_wrapper").html("");
				//获取推荐日记列表
				$.ajax({
					url: "/marry/api/diary/getDiaryList",
					type:"get",
					cache: true,
					async: false,
					data: {
						type:0,
						pageNo:pageNo,
						pageSize:8
					},
					success: function (data) {
						// 数据绑定
						for(var i =0 ;i<data.diaryList.length; i++){
							var proInfo = data.diaryList[i];
							var str ='<li class="li"><h4 class="title"><a href="recdiarycontent?id='+proInfo.id+'">'+proInfo.name+'</a></h4><p class="text">'+proInfo.brief+'</p>';
							var pic_str = "";
							var pic_content = "";
							var pic_str_begin = '<div class="pic">';
							for(var n =0 ;n<proInfo.diaryPicList.length; n++){
								var picInfo = proInfo.diaryPicList[n];
								var picStr ='<div class="pic-son"><a href="recdiarycontent?id='+proInfo.id+'"><img src="'+picInfo.bannerPicPath+'" alt="" width="266" height="166"></a></div>';
								pic_content = pic_content + picStr;
							}
							var pic_str_end = '<div class="pic-son"></div></div>';
							pic_str = pic_str_begin + pic_content + pic_str_end;
							$("#diaryShowList").append(str+pic_str+"</li>");
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
							pageStr = '<li><a  href ="javascript:void(0);" onclick ="getDiaryList('+ i + ')">'+ i + '</a></li>';
						}
						page_content = page_content + pageStr;
					}
				}else {  //超过 8 页 会有 ... 展示
					if(pageNo!=1){   // 不是点击第一页  会有 向前 箭头
						page_content = '<li><a href="javascript:void(0);" onclick ="getPageTurningDiaryList(0)" class="s"><</a></li>';
					}
					var difference = pages - pageNo;
					if(difference == 3 ){ //刚刚好
						for(var n = pageNo - 4 ;n <= pages; n++){
							if(pageNo == n){
								pageStr = '<li><a class="active">'+ pageNo + '</a></li>';
							}else {
								pageStr = '<li><a  href ="javascript:void(0);" onclick ="getDiaryList('+ n + ')">'+ n + '</a></li>';
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
									pageStr = '<li><a  href ="javascript:void(0);" onclick ="getDiaryList('+ p + ')">'+ p + '</a></li>';
								}
								page_content = page_content + pageStr;
							}
						}else{
							for(var p = pageNo-4 ;p <= pageNo; p++){
								if(pageNo == p){
									pageStr = '<li><a class="active">'+ pageNo + '</a></li>';
								}else {
									pageStr = '<li><a  href ="javascript:void(0);" onclick ="getDiaryList('+ p + ')">'+ p + '</a></li>';
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
								pageStr = '<li><a  href ="javascript:void(0);" onclick ="getDiaryList('+ p + ')">'+ p + '</a></li>';
							}
							page_content = page_content + pageStr;
						}
					}else {// 已经到 最底页
						for(var n = pages - 7 ;n <= pages; n++){
							if(pageNo == n){
								pageStr = '<li><a class="active">'+ pageNo + '</a></li>';
							}else {
								pageStr = '<li><a  href ="javascript:void(0);" onclick ="getDiaryList('+ n + ')">'+ n + '</a></li>';
							}
							page_content = page_content + pageStr;
						}
					}
				}
				var page_end = '';
				var end = '';
				if(pageNo!=pages){
					var pageNext = '<li><a href ="javascript:void(0);" onclick ="getPageTurningDiaryList(1)" class="x">></a></li>';
					page_end = page_end + pageNext;
				}
				end = '<li><a href ="javascript:void(0);" onclick ="getDiaryList('+pages +')" class="next">末页</a></li></ul>';
				page_end = page_end + end;
				$("#page_wrapper").append(page_start + page_content + page_end);
			}


		</script>
		<!-- 提交信息结束 -->
		<!-- 对话框 -->
		<div class="dialog-box">
			<div class="l">
				<i class="iconfont icon-icon-pinglun"></i>
			</div>
			<div class="r">
				<span>和我们在线交谈</span>
				<i class="iconfont icon-zuo"></i>
			</div>
		</div>



	</body>
</html>
	