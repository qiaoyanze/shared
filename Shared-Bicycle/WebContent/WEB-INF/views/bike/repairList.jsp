<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include.jsp"%>

<!DOCTYPE html>
<html>
<body>
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h4 class="panel-title">报修单车</h4>
		</div>
		<div class="panel-body">
			<table id="repair_bike_table" class="table table-bordered table-condensed"> 
				<thead>
					<tr>
						<th>序号</th>
						<th>单车编号</th>
						<th>单车品牌</th>
						<th>报修位置</th>
						<th>报修时间</th>
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
									<td>
										<c:choose>
											<c:when test="${data.bikeBrand eq 1 }">ofo单车</c:when>
											<c:when test="${data.bikeBrand eq 2 }">摩拜单车</c:when>
											<c:when test="${data.bikeBrand eq 3 }">哈罗单车</c:when>
											<c:otherwise>其他</c:otherwise>
										</c:choose>
									</td>
									<td>${data.repairPlace }</td>
									<td><fmt:formatDate value="${data.repairTime }" type="both"/></td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="5" align="center">暂无数据</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			
			<div id="repair_bike_page" style="float: right;"> 
				<jsp:include page="/WEB-INF/views/page.jsp">
					<jsp:param value="repair_bike" name="type"/>
				</jsp:include>
			</div>
		</div>
	</div>
</body>
</html>