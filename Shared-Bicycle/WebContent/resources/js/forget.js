var forget = {
		init : function(){
			$("#forget_submit").on('click',function(){
				forget.submit();
			})
		},
		submit : function() {
			var account = $("#account").val();
			$.get('/forget/'+account,'',function(data){
				if(data.code == 500) {
					fail_prompt(data.msg,1000);
					return;
				} else {
					var param = $('#forget_form').serialize();
					$.post('/forget',param,function(data){
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
	forget.init();
})