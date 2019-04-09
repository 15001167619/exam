$(function() {
	// 首页产品中心
	function ProductCenter(o) {
		var len = o.contentDomList.length
		if(o.ix == undefined) {
			var i = 0
		} else {
			var i = o.ix
			$('.son-wrapper .item').eq(i).show()
		}
		
		o.leftButton.on('click', function() {
			i--
			i < 0 ? i = len - 1 : i
			o.contentDomList.eq(i).show().siblings().hide()
			o.tabDomList.eq(i).addClass(o.active).siblings().removeClass(o.active)
		})
		o.rightButton.on('click', function() {
			i++
			i >= len ? i = 0 : i
			o.contentDomList.eq(i).show().siblings().hide()
			o.tabDomList.eq(i).addClass(o.active).siblings().removeClass(o.active)
		})
	}
	ProductCenter({
		tabDomList: $('.product-switching-effect .tab-list .tab-list-item'),
		contentDomList: $('.product-switching-effect .tab-item .li-item'),
		leftButton: $('.toggle-button .front'),
		rightButton: $('.toggle-button .after'),
		active: 'active',
		timer: 300
	})

	// 首页侧边栏效果
	function hover(o) {
		o.domListItem.hover(function() {
			$(this).find(o.showDom).show().parents().siblings().find(o.showDom).hide()
		})
	}
	hover({
		domListItem: $('.right-3 .right-2-ul .right-2-ul-li'),
		showDom: $('.special')
	})
	// 社会招聘
	// function clickEl(o) {
	// 	o.dom1.on('click', function() {
	// 		$(this).addClass(o.addClass).parents(o.dom3).siblings().find(o.dom1).removeClass(o.addClass)
	// 		$(this).siblings(o.dom2).show().parents(o.dom3).siblings().find(o.dom2).hide()
	// 		$(this).find(o.dom4).addClass(o.addClass2).parents(o.dom3).siblings().find(o.dom4).removeClass(o.addClass2)
	// 	})
	// }
	// clickEl({
	// 	dom1: $('.table-li .table-li-1'),
	// 	dom2: '.operable',
	// 	dom3: '.table-li',
	// 	addClass: 'table-li-1-on',
	// 	dom4: '.icon-shipinbofang',
	// 	addClass2: 'active'
	// })

	// 我的评论 查看更多

	function more(o) {
		o.domItem.on('click', function() {
			$(this).parents(o.domItemActive).css({
				'height': 'auto'
			}).find('.list-item').css({
				'padding': '20px 0'
			})
			$(this).hide()
		})
	}
	more({
		domItem: $('.content .content_right_list .ul-1 .li .right .more'),
		domItemActive: '.right'
	})



	$('.user_con_1').each(function(i, v) {

		var num = $(this).find('.comment-wrapper .user_con_1_1').size()

		if(num == 0) {
			$(this).find('.user_time').css({
				'border': 'none',
				'padding': '20px 0 0 0'
			})
		}
	})



	// 产品详情页面
	$(window).on('scroll', function() {
		var scrollTop = $(document).scrollTop()
		if(scrollTop >= 870 ) {
			console.log(scrollTop)
			$('.list-wrapper .ul-1').addClass('ul-1-active')
		} else {
			$('.list-wrapper .ul-1').removeClass('ul-1-active')
		}
	})

	function clickTag(o) {
		if(o.element == 'click') {
			o.domListItem.click(function() {
				$(this).addClass(o.active).siblings().removeClass(o.active)
			})
		}
	}

	clickTag({
		element: 'click',
		domListItem: $('.list-wrapper .ul-1 .li'),
		// contentDomList: $('.list-wrapper .ul-2 .li'),
		active: 'active'
		// parentDom: $('.list-wrapper .ul-2')
	})


	$('.textarea').on('keyup', function() {

		var textNum = $(this).val().length
		
		if(textNum > 300) {
			$(this).val($(this).val().substring(0, 300))
		} else {
			$('.word-number').html(textNum + ' / 300')
		}
		
	})

	$('.Big-Picture-wrapper').css({
		'height': $(document).height() + 'px'
	})
	$('.magnifier').on('click', function() {
		$('.Big-Picture-wrapper').show()
		ProductCenter({
			tabDomList: $('.product-switching-effect .tab-list .tab-list-item'),
			contentDomList: $('.Big-Picture-wrapper .son-wrapper .item'),
			leftButton: $('.Big-Picture-wrapper .upper'),
			rightButton: $('.Big-Picture-wrapper .next'),
			active: 'active',
			timer: 300,
			ix: $('.content_tab-1-2').attr('i')
		})
	})

	$('.Big-Picture-wrapper').on('click', function(e) {
		if($(e.target).attr('class') == 'Big-Picture-wrapper') {
			$('.Big-Picture-wrapper').hide()
		}
	})
	$('.content_tab-1-1 li').hover(function() {
		$(this).addClass('active').siblings().removeClass('active')
		$('.content_tab-1-2 li').eq($(this).index()).show().siblings().hide()
		$('.content_tab-1-2').attr('i', $(this).index())
	})



	// 对比栏
	$('.comparison-column .up-wrapper .icon-guanbi').on('click', function() {
		$('.comparison-column').hide()
	})




	// $('.box-list-1 .li').on('click', function() {
	// 	console.log(1)
	// 	$('.box-list-2 .li').eq($(this).index()).show().siblings().hide()
	// })









	// 关闭提交信息
	$('.fixed-wrapper .close .icon-guanbi').on('click', function() {
		$('.fixed-wrapper').hide()
	})









	// 搜索
	$('.header-wrapper .icon-sousuo').on('click', function() {
		var keyword = $('#searchContent').val();
		location.href = "searchlist?keyword="+keyword;
	})
})