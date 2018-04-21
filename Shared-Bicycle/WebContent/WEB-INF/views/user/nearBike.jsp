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
			<form class="form-inline" id="my_location_form">
				<div class="form-group">
					<label for="month">我的位置：</label> 
					<select class="form-control" name="place" id="my_place">
					  
					</select>
				</div>
			</form>
			<c:if test="${empty bike }">
				<div id="near_bike_list">
					<table id="near_bike_table" class="table table-bordered table-condensed"> 
						<thead>
							<tr>
								<th>序号</th>
								<th>车辆编号</th>
								<th>车辆密码</th>
								<th>车辆品牌</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan="6" align="center">暂无数据</td>
							</tr>
						</tbody>
					</table>
				</div>
			</c:if>
			<c:if test="${not empty bike }">
				<form class="form-inline" id="return_bike_form">
					<input type="hidden" id="bikeCode" value="${bike.bikeCode }"/>
					<div class="form-group">
						<h4>您当前正在租用
						<strong>	
							<c:choose>
								<c:when test="${bike.bikeBrand eq 1 }">ofo单车_${bike.bikeCode }</c:when>
								<c:when test="${bike.bikeBrand eq 2 }">摩拜单车_${bike.bikeCode }</c:when>
								<c:when test="${bike.bikeBrand eq 3 }">哈罗单车_${bike.bikeCode }</c:when>
								<c:otherwise>其他</c:otherwise>
							</c:choose>
						</strong>
						<input class="btn btn-primary" type="button" id="return_bike_btn" value="现在还车"/>
				</form>
			</c:if>
		</div>
	</div>	
</body>
</html>