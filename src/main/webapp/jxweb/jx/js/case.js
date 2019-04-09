$(function() {
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
})