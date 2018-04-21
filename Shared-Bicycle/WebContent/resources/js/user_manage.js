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
				if (curStatus == 1) status = 2;
				if (curStatus == 2) status = 1;
				
				var account = $(this).attr('account');
				$.post('/user/update',{'status':status,'account':account},function(result){
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
	},
	
	info : function() {
		var account = $("#login_account").val();
		$('#content').load("/user/info/"+ account,function(){
			user_manage.user_submit();
		});
	},
	
	user_submit : function() {
		$('#user_submit').on('click',function(){
			var param = $("#user_update_form").serialize();
			$.post('/user/update',param,function(data){
				var code = data.code;
				var msg = data.msg;
				if(code == 200) {
					success_prompt(msg,1000);
					user_manage.info();
				} else {
					fail_prompt(msg,1000);
					return;
				}
			})
		})
	},
	
	balance:function(){
		var account = $("#login_account").val();
		$('#content').load("/user/balance/"+ account,function(){
			user_manage.recharge();
		});
	},
	recharge:function(){
		$("#rechargeBtn").on('click',function(){
			var account = $("#login_account").val();
			var balance = $("#recharge_amt").val();
			$.post('/user/update',{'account':account,'balance':balance},function(data){
				var code = data.code;
				var msg = data.msg;
				if(code == 200) {
					success_prompt(msg,1000);
					user_manage.balance();
				} else {
					fail_prompt(msg,1000);
					return;
				}
			})
		})
	}
}


var my_repair = {
	list : function() {
		$('#content').load("/user/myrepair/list");
	},
	nextPage : function(number){
		var curPage = $("#my_repair_page").find("#curPage").val();
		curPage = parseInt(curPage);
		var totalpage = $("#my_repair_page").find("#totalPage").val();
		totalpage = parseInt(totalpage);

		var nextCurPage = curPage + number;
		if (nextCurPage == 0) {
			nextCurPage = 1;
		} else if (nextCurPage > totalpage) {
			nextCurPage = totalpage;
		}

		my_repair.list(nextCurPage);
	},
	goPage : function(cur_page) {
		my_repair.list(cur_page);
	}
}