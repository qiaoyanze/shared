var register = {
		init : function(){
			$("#register_submit").on('click',function(){
				register.submit();
			})
		},
		submit : function() {
			var account = $("#account").val();
			$.get('/user/'+account,'',function(data){
				if(data.code == 500) {
					fail_prompt(data.msg,1000);
					return;
				} else {
					var param = $('#register_form').serialize();
					$.post('/register',param,function(data){
						if(data.code == 200) {
							success_prompt(data.msg,1000);
							setTimeout(function(){
								window.location = "/login";
							},1500)
						} else {
							fail_prompt(data.msg,1000);
						}
					});
				}
			})
		}
}

$(function(){
	register.init();
})