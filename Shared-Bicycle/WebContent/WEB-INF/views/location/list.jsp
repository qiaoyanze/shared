<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include.jsp"%>

<!DOCTYPE html>
<html>
<body>
	<table id="location_manage_table" class="table table-bordered table-condensed"> 
		<thead>
			<tr>
				<th>序号</th>
				<th>位置名称</th>
				<th>经度</th>
				<th>纬度</th>
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
							<td>${data.name }</td>
							<td>${data.lon }</td>
							<td>${data.lat }</td>
							<td>
								<a href="javascript:void(0)" class="del_location" name="${data.name }">
									删除
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
	
	<div id="location_manage_page" style="float: right;"> 
		<jsp:include page="/WEB-INF/views/page.jsp">
			<jsp:param value="location_manage" name="type"/>
		</jsp:include>
	</div>
</body>
</html>