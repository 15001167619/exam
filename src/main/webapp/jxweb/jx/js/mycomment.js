$(function() {
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
})