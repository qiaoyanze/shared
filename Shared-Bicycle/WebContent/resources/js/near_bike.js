var near_bike = {
	init : function(){
		$("#my_place").on('change',function(){
			near_bike.list(1);
		})
	},
	
	info : function(cur_page) {
		$('#content').load("/user/nearbike",function(){
			near_bike.init();
		});
	},
	
	list : function(cur_page) {
		$('#near_bike_list').load("/user/nearbike/list?curPage="+cur_page);
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
	
	rent_bike : function() {
		$('#rent_bike_btn').on('click',function(){
			
		})
	},
	
	return_bike : function() {
		$('#return_bike_btn').on('click',function(){
			
		})
	}
}