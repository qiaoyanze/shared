var register = {
		init : function(){
			$("input[name='role']").on('change',function(){
				var role = $(this).val();
				if(role == 2) {
					$('#repair_info').show();
					$('#user_info').hide();
					register.clear_content('user_info');
				}
				if(role == 3) {
					$('#user_info').show();
					$('#repair_info').hide();
					register.clear_content('repair_info');
				}
			})
			
			$("#register_submit").on('click',function(){
				register.submit();
			})
		},
		clear_content: function(ele){
			$('#'+ele).find('input:not(:radio)').each(function(){
				$(this).val("");
			})
		},
		submit : function() {
			var account = $("#account").val();
			$.get('/register/'+account,'',function(data){
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