$(function() {
	var message=$('.message').val();
	console.log(message);
	if(''!=message||message.length>0){
		$('.err-info').html(message);
	}
});
function formCheck() {
	var password = $('.password').val();
	var user = $('.user').val();
	var reg=/^[1][3,4,5,7,8][0-9]{9}$/;
	if(user == '') {
		$('.err-info').html('请输入手机号');
		return false;
	} else if(!reg.test(user)) {
		$('.err-info').html('手机号格式不正确');
		return false;
	}
	else if (password == '') {
		$('.err-info').html('请输入密码');
		return false;
	}else {
		$('.err-info').html('');
		return true;
	}
};