$(function() {
	$('.table-li').on('click', function() {
		$(this).addClass('active').siblings().removeClass('active')
	})
})