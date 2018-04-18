$(function() {
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