var bike_manage = {
		init : function(){
			// 初始化模态框事件
			bike_manage.openAddModal();
			bike_manage.openUpdateModal();
			bike_manage.closeModal();
			bike_manage.add();
			bike_manage.update();
			// 模态框居中设置
			myModal.show();
		},
		
		list : function(cur_page) {
			$('#content').load("/bike/list?curPage="+cur_page,function(){
				bike_manage.init();
			});
		},
		
		nextPage : function(number){
			var curPage = $("#bike_manage_page").find("#curPage").val();
			curPage = parseInt(curPage);
			var totalpage = $("#bike_manage_page").find("#totalPage").val();
			totalpage = parseInt(totalpage);

			var nextCurPage = curPage + number;
			if (nextCurPage == 0) {
				nextCurPage = 1;
			} else if (nextCurPage > totalpage) {
				nextCurPage = totalpage;
			}

			bike_manage.list(nextCurPage);
		},
		goPage : function(cur_page) {
			bike_manage.list(cur_page);
		},
		
		add : function() {
			$('#bike_manage_add_btn').on('click',function(){
				var bikeCode = $('#bike_manage_add_form').find('#bikeCode').val();
				$.get('/bike/exists',{'bikeCode':bikeCode},function(result){
					var code = result.code;
					if (code == 200) {
						warning_prompt('单车已存在',1000);
						return;
					} else {
						var param = $('#bike_manage_add_form').serialize();
						$.post('/bike/add',param,function(data) {
							var code = data.code;
							var msg = data.msg;
							if(code == 200) {
								success_prompt(msg,1000);
								user_manage.list(1);
								$("#bike_manage_add_modal").modal('hide');
							} else {
								fail_prompt(msg,1000);
								return;
							}
						});
					}
				})
			})
		},
		
		update : function(params) {
			$('#bike_manage_update_btn').on('click',function(){
				var param = $('#bike_manage_update_form').serialize();
				$.post('/bike/update',param,function(result) {
					var code = result.code;
					var msg = data.msg;
					if(code == 200) {
						success_prompt(msg,1000);
						var curPage = $('#bike_manage_table').find('#curPage').val();
						upload_manage.user.list(curPage);
						$("#bike_manage_update_modal").modal('hide');
					} else {
						fail_prompt(msg,1000);
						return;
					}
				});
			})
		},
		
		openAddModal : function() {
			$("#bike_manage_add").on('click',function(){
				// 弹出添加对话框
				$("#bike_manage_add_modal").modal({
					backdrop:'static',
					keyboard:false,
					show:true
				});
			});
		},
		openUpdateModal : function() {
			$(".update_bike").each(function(){
				$(this).on('click',function(){
					var bike_code = $(this).attr('bike_code');
					// 初始化数据
					$.get('/bike/'+bike_code,{bikeCode:bike_code},function(result){
						
					});
					
					// 弹出添加对话框
					$("#bike_manage_update_modal").modal({
						backdrop:'static',
						keyboard:false,
						show:true
					});
				});
			})
		},
		closeModal : function() {
			// 添加框关闭清除表单数据
		    $('#bike_manage_add_modal').on('hidden.bs.modal', function (e) {
		    	$('#bike_manage_add_form')[0].reset();
		   	})
		   	
		   	// 更新框关闭清除表单数据
		    $('#bike_manage_update_modal').on('hidden.bs.modal', function (e) {
		    	$('#bike_manage_update_form')[0].reset();
		   	})
		},
}

var myModal = {
	'setCenter': function(){
		$('.modal').each(function(i){   //遍历每一个模态框
	        var $clone = $(this).clone().css('display', 'block').appendTo('body');    
	        var top = Math.round(($clone.height() - $clone.find('.modal-content').height()) / 2);
	        top = top > 0 ? top : 0;
	        $clone.remove();
	        $(this).find('.modal-content').css("margin-top", top-30);  //修正原先已经有的30个像素
	    });
	},
	'show' : function() {
		$('.modal').on('show.bs.modal', myModal.setCenter());      //当模态框出现的时候
		$(window).on('resize', myModal.setCenter());
	}
}