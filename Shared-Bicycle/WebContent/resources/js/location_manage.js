var location_manage = {
	info: function(){
		$('#content').load("/location/info",function(){
			location_manage.list(1);
			location_manage.add();
		});
	},
		
	list : function(cur_page) {
		$('#location_manage_list').load("/location/list?curPage="+cur_page,function(){
			location_manage.del_location();
		});
	},
	
	nextPage : function(number){
		var curPage = $("#location_manage_page").find("#curPage").val();
		curPage = parseInt(curPage);
		var totalpage = $("#location_manage_page").find("#totalPage").val();
		totalpage = parseInt(totalpage);

		var nextCurPage = curPage + number;
		if (nextCurPage == 0) {
			nextCurPage = 1;
		} else if (nextCurPage > totalpage) {
			nextCurPage = totalpage;
		}

		location_manage.list(nextCurPage);
	},
	goPage : function(cur_page) {
		location_manage.list(cur_page);
	},
	
	add : function() {
		$("#location_manage_add_btn").on('click',function(){
			var loaction_form = $('#location_manage_form');
			var location_name = loaction_form.find("#location_name").val();
			$.get('/location/'+location_name,function(data) {
				var isSuccess = data.code;
				var msg = data.msg;
				if(isSuccess == 200) {
					var param = loaction_form.serialize();
					$.post('/location/add',param,function(data) {
						var isSuccess = data.code;
						var msg = data.msg;
						if(isSuccess == 200) {
							success_prompt(msg,1000);
							var curPage = $('#location_manage_table').find('#curPage').val();
							location_manage.list(curPage);
							loaction_form.reset();
						} else {
							fail_prompt(msg,1000);
							return;
						}
					})
					
				} else {
					fail_prompt(msg,1000);
					return;
				}
			})
		})
	},
	del_location : function() {
		$(".del_location").each(function(){
			$(this).on('click',function(){
				var name = $(this).attr('name');
				$.post('/location/del',{'name':name},function(result){
					var isSuccess = result.code;
					var msg = result.msg;
					if(isSuccess == 200) {
						success_prompt(msg,1000);
						var curPage = $('#location_manage_table').find('#curPage').val();
						location_manage.list(curPage);
					} else {
						fail_prompt(msg,1000);
						return;
					}
				});
			})
		});
	}
}