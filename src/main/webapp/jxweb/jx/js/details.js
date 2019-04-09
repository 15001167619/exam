$(function() {
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
	$('.contrast').on('click', function() {
		$('.comparison-column').show()
	})
	$('.icon-guanbi').on('click', function() {
		$('.comparison-column').hide()
	})











	$('.user_con').on('click', function(e) {
	  var _class = $(e.target).attr('class')
	  switch(_class) {
	  	case 'reply-trigger-1':
		  	$('.level-1-box').show()
		  	$(e.target).parents('.user_con_1').siblings().find('.level-1-box').hide()
		  	$(e.target).parent().css({
			  'border': 'none'
			}).parents('.user_con_1').siblings('.user_con_1').find('.user_time').css({
			  'border-bottom': '1px dashed #e3e3e3'
			})
			break;
		case 'reply-trigger-2':
		  	$(e.target).parent().siblings('.level-2-box').show()
		  	$(e.target).parents('.user_con_1').siblings('.user_con_1')
		  	.find('.level-2-box').hide()
		  	$(e.target).parents('.user_con_1_1').siblings('.user_con_1_1')
		  	.find('.level-2-box').hide()
		  	break;
		case 'confirm-1':
		  	var v = $(e.target).siblings('.level-1').val()
			if(v != '') {
				$.ajax({
					url: '',
					method: 'post',
					data: {
						'v': v
					},
					dataType: 'json',
					success: function(res) {
						if(res.data.code == 200) {
							$(e.target).siblings('.level-1').val('')
							$(e.target).parent().hide()
							$(e.target).parent().siblings('.user_time').css({
								'border-bottom': '1px dashed #e3e3e3'
							})
						}
					},
					error: function(err) {
						alert(err)
					}
				})
			} else {
				alert('请输入回复信息')
			}
			break;
		case 'confirm-2':
		  	var v = $(e.target).siblings('.level-2').val()
			if(v != '') {
				$.ajax({
					url: '',
					method: 'post',
					data: {
						'v': v
					},
					dataType: 'json',
					success: function(res) {
						if(res.data.code == 200) {
							$(e.target).siblings('.level-2').val('')
							$(e.target).parent().hide()
						}
					},
					error: function(err) {
						alert(err)
					}
				})
			} else {
				alert('请输入回复信息')
			}
			break;
		default:
			''
	  }









	  
	 //  if(_class == 'reply-trigger-1') {
	 //  	$('.level-1-box').show()
	 //  	$(e.target).parents('.user_con_1').siblings().find('.level-1-box').hide()
	 //  	$(e.target).parent().css({
		//   'border': 'none'
		// }).parents('.user_con_1').siblings('.user_con_1').find('.user_time').css({
		//   'border-bottom': '1px dashed #e3e3e3'
		// })
	 //  } else if(_class == 'reply-trigger-2') {
	 //  	$(e.target).parent().siblings('.level-2-box').show()
	 //  	$(e.target).parents('.user_con_1').siblings('.user_con_1')
	 //  	.find('.level-2-box').hide()
	 //  	$(e.target).parents('.user_con_1_1').siblings('.user_con_1_1')
	 //  	.find('.level-2-box').hide()
	 //  } else if(_class == 'confirm-1') {
	 //  	var v = $(e.target).siblings('.level-1').val()
		// if(v != '') {
		// 	$.ajax({
		// 		url: '',
		// 		method: 'post',
		// 		data: {
		// 			'v': v
		// 		},
		// 		dataType: 'json',
		// 		success: function(res) {
		// 			if(res.data.code == 200) {
		// 				$(e.target).siblings('.level-1').val('')
		// 				$(e.target).parent().hide()
		// 				$(e.target).parent().siblings('.user_time').css({
		// 					'border-bottom': '1px dashed #e3e3e3'
		// 				})
		// 			}
		// 		},
		// 		error: function(err) {
		// 			alert(err)
		// 		}
		// 	})
		// } else {
		// 	alert('请输入回复信息')
		// }
	 //  } else if(_class == 'confirm-2') {
	 //  	var v = $(e.target).siblings('.level-2').val()
		// if(v != '') {
		// 	$.ajax({
		// 		url: '',
		// 		method: 'post',
		// 		data: {
		// 			'v': v
		// 		},
		// 		dataType: 'json',
		// 		success: function(res) {
		// 			if(res.data.code == 200) {
		// 				$(e.target).siblings('.level-2').val('')
		// 				$(e.target).parent().hide()
		// 			}
		// 		},
		// 		error: function(err) {
		// 			alert(err)
		// 		}
		// 	})
		// } else {
		// 	alert('请输入回复信息')
		// }
	 //  }
	})





})