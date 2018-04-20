<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include.jsp"%>

<!DOCTYPE html>
<html>
<body>
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h4 class="panel-title">附近车辆</h4>
		</div>
		<div class="panel-body">
			<form class="form-inline">
				<div class="form-group">
					<label for="month">我的位置：</label> 
					<select class="form-control" name="place" id="my_place">
					  <option value="华北">华北</option>
					  <option value="华东">华东</option>
					  <option value="华南">华南</option>
					  <option value="西部">西部</option>
					</select>
				</div>
			</form>
			
			<div id="near_bike_list">
				
			</div>
		</div>
	</div>	
</body>
</html>