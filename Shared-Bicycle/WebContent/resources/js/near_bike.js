var near_bike = {
	init : function(){
		$("#my_place").on('change',function(){
			near_bike.list(1);
		})
	},
	
	info : function(place) {
		$('#content').load("/user/nearbike",function(){
			near_bike.init_place(place);
			near_bike.init();
			near_bike.return_bike();
		});
	},
	
	init_place : function(place){
		var my_place = $("#my_place");
		$.get('/location/dicts',function(data){
    		if (data.length > 0) {
				my_place.append(" <option value=\"\"></option>");
				$.each(data, function (i, n) {
					my_place.append(" <option value=\"" + n.geoCode + "," + n.name + "\">" + n.name + "</option>");
                })
                
                $("#my_place option[value='"+place+"']").attr("selected","selected");
				near_bike.list(1);
			}
    	})
    	
	},
	
	list : function(cur_page) {
		var param = $("#my_location_form").serialize();
		$('#near_bike_list').load("/user/nearbike/list?curPage="+cur_page + "&" + param,function(){
			near_bike.rent_bike();
			near_bike.repair_bike();
		});
	},
	
	nextPage : function(number){
		var curPage = $("#near_bike_page").find("#curPage").val();
		curPage = parseInt(curPage);
		var totalpage = $("#near_bike_page").find("#totalPage").val();
		totalpage = parseInt(totalpage);

		var nextCurPage = curPage + number;
		if (nextCurPage == 0) {
			nextCurPage = 1;
		} else if (nextCurPage > totalpage) {
			nextCurPage = totalpage;
		}

		near_bike.list(nextCurPage);
	},
	goPage : function(cur_page) {
		near_bike.list(cur_page);
	},
	
	update : function(bike_code,status) {
		var param = $("#my_location_form").serializeArray();
		$.post('/bike/update',{'bikeCode':bike_code,'status':status,place:param[0].value},function(result){
			var isSuccess = result.code;
			var msg = result.msg;
			if(isSuccess == 200) {
				success_prompt(msg,1000);
				near_bike.info(param[0].value);
			} else {
				fail_prompt(msg,1000);
				return;
			}
		});
	},
	
	rent_bike : function() {
		$('.rent_bike').each(function(){
			$(this).on('click',function(){
				var bike_code = $(this).attr('bike_code');
				$.get('/user/enough/banlance',function(data){
					var isSuccess = data.code;
					var msg = data.msg;
					if(isSuccess == 200) {
						near_bike.update(bike_code,2);
					} else {
						fail_prompt(msg,1000);
						return;
					}
				})
			})
		})
	},
	
	return_bike : function() {
		$('#return_bike_btn').on('click',function(){
			var param = $("#my_location_form").serializeArray();
			if(param[0].value == null || param[0].value == '') {
				warning_prompt('请选位置',1000);
				return;
			}
			var bike_code = $('#return_bike_form').find('#bikeCode').val();
			near_bike.update(bike_code,1);
		})
	},
	
	repair_bike : function() {
		$('.repair_bike').each(function(){
			$(this).on('click',function(){
				var bike_code = $(this).attr('bike_code');
				near_bike.update(bike_code,3);
			})
		})
	}
}