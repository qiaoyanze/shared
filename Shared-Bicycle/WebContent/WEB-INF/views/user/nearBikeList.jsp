<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include.jsp"%>

<!DOCTYPE html>
<html>
<body>
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
			<c:choose>
				<c:when test="${not empty pager and fn:length(pager.datas) > 0 }">
					<input type="hidden" value="${pager.curPage }" id="curPage">
					<c:forEach items="${pager.datas }" var="data" varStatus="stat">
						<tr>
							<td>${stat.count + pager.pageOffset }</td>
							<td>${data.bikeCode }</td>
							<td>${data.bikePassword }</td>
							<td>
								<c:choose>
									<c:when test="${data.bikeBrand eq 1 }">ofo单车</c:when>
									<c:when test="${data.bikeBrand eq 2 }">摩拜单车</c:when>
									<c:when test="${data.bikeBrand eq 3 }">哈罗单车</c:when>
									<c:otherwise>其他</c:otherwise>
								</c:choose>
							</td>
							<td>
								<a href="javascript:void(0)" class="rent_bike" bike_code="${data.bikeCode}">
									我要租车
								</a>
								&nbsp;
								&nbsp;
								<a href="javascript:void(0)" class="repair_bike" bike_code="${data.bikeCode}">
									我要报修
								</a>
							</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="6" align="center">暂无数据</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	
	<div id="near_bike_page" style="float: right;"> 
		<jsp:include page="/WEB-INF/views/page.jsp">
			<jsp:param value="near_bike" name="type"/>
		</jsp:include>
	</div>
</body>
</html>