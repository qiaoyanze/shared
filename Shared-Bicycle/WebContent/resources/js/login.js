$(document).ready(function() {
	var account = $.cookie('account');
	var passwd = $.cookie('passwd');
	if(account != null) {
		$("#account").val(account);
		$('input:checkbox[name="remember-me"]').attr("checked",true);
	}
	if(passwd != null) $("#passwd").val(passwd);
	
	$("#login").on("click",function() {
		doLogin();
	})
	
	function doLogin() {
		$("#errorMsg").html("");
		
		var account = $("#account").val().trim();
		var pwd = $("#passwd").val();
//		var md5_pwd = hex_md5(pwd);
		$.ajax({
			url: "/login",
			method: "POST",
			async: false, 
			dataType: 'json',
			data: {'account':account,'password':pwd},
			success: function(result) {
				var isSuccess = result.code;
				if(isSuccess == 200) {
					// 记住账户
					var rem = $('input:checkbox[name="remember-me"]:checked').val();
					if(rem == null || rem == '') {
						// 进行Cookie操作
						$.removeCookie('account'); 
						$.removeCookie('passwd'); 
					} else {
						// 进行Cookie操作
						$.cookie('account', account, { expires: 7 });
						$.cookie('passwd', pwd, { expires: 7 });
					}
					window.location = "/main";
				} else {
					var errmsg = result.errmsg;
					if(null != result.data) errmsg = errmsg  +"-"+ result.data;
					$("#errorMsg").html("<div class='errorTip'>"+errmsg+"</div>");
					return false;
				}
			},
			error: function() {
				$("#errorMsg").html("<div class='errorTip'>抱歉，系统出现错误！</div>");
				return false;
			}
		});
	}
})