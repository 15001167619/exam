$(function() {
	var message=$('.message').val();
	if(''!=message||message.length>0){
		$('.err-info').html(message);
	}
});
function verphone() {
	var user = $('.user').val();
	var reg=/^[1][3,4,5,7,8][0-9]{9}$/;

	if(user == '') {
		$('.err-info').html('请输入手机号');
		return false;
	} else if(!reg.test(user)) {
		$('.err-info').html('手机号格式不正确');
		return false;
	} else {
		$('.err-info').html('');
		return true;
	}
};
function getVerificationCode() {
	if (verphone()) {
		var user = $('.user').val();
		$.ajax({
			url: 'getVerificationCode',
			method: 'POST',
			data: {"tel": user},
			dataType: 'json',
			success: function (res) {
				if (res.code == 20000) {
					$('.mask').show();
					var time = 59;
					var t = setInterval(function () {
						if (time == 0) {
							$('.mask').hide();
							$('.obtain').html('重新发送');
							$('.obtain').removeAttr("disabled");
							clearInterval(t);
						} else {
							$('.obtain').attr('disabled',"true");
							$('.obtain').html(time + 's重新发送');
							--time
						}
					}, 1000);
					$('.err-info').html("验证码已发送，请注意查收");
				} else {
					$('.err-info').html(res.message);
				}
			}
		})
	}
};

function formCheck() {
	var code = $('.Code').val();
	var user = $('.user').val();
	var reg=/^[1][3,4,5,7,8][0-9]{9}$/;
	if(user == '') {
		$('.err-info').html('请输入手机号');
		return false;
	} else if(!reg.test(user)) {
		$('.err-info').html('手机号格式不正确');
		return false;
	}
	else if (code == '') {
		$('.err-info').html('请输入验证码');
		return false;
	}else {
		$('.err-info').html('');
		return true;
	}
};