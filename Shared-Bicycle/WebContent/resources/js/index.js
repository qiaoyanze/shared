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
			near_bike.info();
		});
		$('#balance').on('click', function() {
			user_manage.balance();
		});
		$('#my_repair').on('click', function() {
			my_repair.list(1);
		});
		$('#location_manage').on('click', function() {
			location_manage.info();
		});
	}
}

var place = {
	init:function(){
    	var add_form = $("#bike_manage_add_form");
		var update_form = $("#bike_manage_update_form");
		$.get('/location/dicts',function(data){
    		if (data.length > 0) {
				add_form.find("#place").append(" <option value=\"\"></option>");
    			update_form.find("#place").append(" <option value=\"\"></option>");
				$.each(data, function (i, n) {
					add_form.find("#place").append(" <option value=\"" + n.geoCode + "," + n.name + "\">" + n.name + "</option>");
					update_form.find("#place").append(" <option value=\"" + n.geoCode + "," + n.name + "\">" + n.name + "</option>");
                })
			}
    	})
	}
}

// 全局设置
$(function() {
	obj.init();
	place.init();
	
	$('input[type=text]:not(:disabled)').each(function() {
		$(this).val($.trim($(this).val()));
	});
	
	//ajax session 失效全局处理
	$.ajaxSetup({   
	    contentType:"application/x-www-form-urlencoded;charset=utf-8",   
	    cache:false ,   
	    complete:function(XHR,TS){   
	    	var resText=XHR.responseText;
	    	console.log(resText)
	    	if(resText == 'session-invalidate') {
	    		window.location = "/login";
	    	}
	    }    
	});
})