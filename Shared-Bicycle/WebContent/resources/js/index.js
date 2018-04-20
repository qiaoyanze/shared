var obj = {
	"init" : function() {
		// 管理员功能
		$('#user_manage').on('click', function() {
			user_manage.list(1);
		});
		$('#bike_manage').on('click', function() {
			bike_manage.list(1);
		});
		$('#repair_manage').on('click', function() {
			repair_manage.list(1);
		});
		
		// 维修人员功能
		$('#repair_info').on('click', function() {
			repair_manage.info();
		});
		
		$('#repair_bike').on('click', function() {
			repair_bike.list(1);
		});
		
		// 用户功能
		$('#user_info').on('click', function() {
			user_manage.info();
		});
		$('#rent_bike').on('click', function() {
			$('#content').load("/user/rentbike",function(){
				rent_bike.init();
			});
		});
		$('#balance').on('click', function() {
			user_manage.balance();
		});
	}
}

// 全局设置
$(function() {
	obj.init();
	
	$('input[type=text]:not(:disabled)').each(function() {
		$(this).val($.trim($(this).val()));
	});
	
	//ajax session 失效全局处理
	$.ajaxSetup({   
	    contentType:"application/x-www-form-urlencoded;charset=utf-8",   
	    cache:false ,   
	    complete:function(XHR,TS){   
	    	var resText=XHR.responseText;
	    	if(resText == 'session-invalidate') {
	    		window.location = "/login";
	    	}
	    }    
	});
})