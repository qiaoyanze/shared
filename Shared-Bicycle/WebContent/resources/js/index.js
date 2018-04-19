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
			$('#content').load("/repair/manage",function(){
				repair_manage.init();
			});
		});
		
		// 维修人员功能
		$('#repair_info').on('click', function() {
			$('#content').load("/repair/info",function(){
				repair_info.init();
			});
		});
		$('#repair_bike').on('click', function() {
			$('#content').load("/repair/bike",function(){
				repair_bike.init();
			});
		});
		
		// 用户功能
		$('#user_info').on('click', function() {
			$('#content').load("/user/info",function(){
				user_info.init();
			});
		});
		$('#rent_bike').on('click', function() {
			$('#content').load("/user/rentbike",function(){
				rent_bike.init();
			});
		});
		$('#recharge').on('click', function() {
			$('#content').load("/user/recharge",function(){
				recharge.init();
			});
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