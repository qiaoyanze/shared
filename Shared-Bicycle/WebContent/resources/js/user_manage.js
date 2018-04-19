var user_manage = {
		init : function(){
			user_manage.active();
		},
		
		list : function(cur_page) {
			$('#content').load("/user/list?curPage="+cur_page,function(){
				user_manage.init();
			});
		},
		
		nextPage : function(number){
			var curPage = $("#user_manage_page").find("#curPage").val();
			curPage = parseInt(curPage);
			var totalpage = $("#user_manage_page").find("#totalPage").val();
			totalpage = parseInt(totalpage);

			var nextCurPage = curPage + number;
			if (nextCurPage == 0) {
				nextCurPage = 1;
			} else if (nextCurPage > totalpage) {
				nextCurPage = totalpage;
			}

			user_manage.list(nextCurPage);
		},
		goPage : function(cur_page) {
			user_manage.list(cur_page);
		},
		
		active : function() {
			$(".status").each(function(){
				$(this).on('click',function(){
					var curStatus = $(this).attr("status");
					var status;
					if (curStatus == 1) status = 0;
					if (curStatus == 0) status = 1;
					
					var account = $(this).attr('account');
					$.post('/user/status/',{'status':status,'account':account},function(result){
						var isSuccess = result.code;
						var msg = result.msg;
						if(isSuccess == 200) {
							success_prompt(msg,1000);
							var curPage = $('#user_manage_table').find('#curPage').val();
							user_manage.list(curPage);
						} else {
							fail_prompt(msg,1000);
							return;
						}
					});
				})
			});
		}
}