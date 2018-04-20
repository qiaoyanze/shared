var repair_manage = {
	list : function(cur_page) {
		$('#content').load("/repair/list?curPage="+cur_page,function(){
			repair_manage.pass();
			repair_manage.refuse();
		});
	},
	
	nextPage : function(number){
		var curPage = $("#repair_manage_page").find("#curPage").val();
		curPage = parseInt(curPage);
		var totalpage = $("#repair_manage_page").find("#totalPage").val();
		totalpage = parseInt(totalpage);

		var nextCurPage = curPage + number;
		if (nextCurPage == 0) {
			nextCurPage = 1;
		} else if (nextCurPage > totalpage) {
			nextCurPage = totalpage;
		}

		repair_manage.list(nextCurPage);
	},
	goPage : function(cur_page) {
		repair_manage.list(cur_page);
	},
	
	pass : function() {
		$(".isPass").each(function(){
			$(this).on('click',function(){
				var account = $(this).attr('account');
				$.post('/repair/update',{'isPass':2,'account':account},function(result){
					var isSuccess = result.code;
					var msg = result.msg;
					if(isSuccess == 200) {
						success_prompt(msg,1000);
						var curPage = $('#repair_manage_table').find('#curPage').val();
						repair_manage.list(curPage);
					} else {
						fail_prompt(msg,1000);
						return;
					}
				});
			})
		});
	},
	
	refuse : function() {
		$(".refuse").each(function(){
			$(this).on('click',function(){
				var account = $(this).attr('account');
				$.post('/repair/update',{'isPass':3,'account':account},function(result){
					var isSuccess = result.code;
					var msg = result.msg;
					if(isSuccess == 200) {
						success_prompt(msg,1000);
						var curPage = $('#repair_manage_table').find('#curPage').val();
						repair_manage.list(curPage);
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
		$('#content').load("/repair/info/"+ account,function(){
			repair_manage.repair_submit();
		});
	},
	
	repair_submit : function() {
		$('#repair_submit').on('click',function(){
			var param = $("#repair_update_form").serialize();
			$.post('/repair/update',param,function(data){
				var code = data.code;
				var msg = data.msg;
				if(code == 200) {
					success_prompt(msg,1000);
					repair_manage.info();
				} else {
					fail_prompt(msg,1000);
					return;
				}
			})
		})
	}
}