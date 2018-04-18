<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include.jsp"%>

<!DOCTYPE html>
<html>
<body>
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>启用日期</th>
				<th>上传账号</th>
				<th>上传表名</th>
				<th>用户状态</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${not empty pager and fn:length(pager.datas) > 0 }">
					<input type="hidden" value="${pager.curPage }" id="curPage">
					<c:forEach items="${pager.datas }" var="data">
						<tr>
							<td><fmt:formatDate value="${data.enableTime }" pattern="yyyy-MM-dd"/></td>
							<td>${data.account }</td>
							<td>${data.busType }</td>
							<td>
								<c:if test="${data.status eq '0' }">停用</c:if>
								<c:if test="${data.status eq '1' }">启用</c:if>
							</td>
							<td>
								<c:if test="${data.isAdmin eq '0' }">
									<a href="javascript:void(0)" class="updateStatus" curStatus="${data.status}" account="${data.account }">
										<c:if test="${data.status eq '0' }">
											启用
										</c:if>
										<c:if test="${data.status eq '1' }">
											停用
										</c:if>
									</a>
									&nbsp;
									&nbsp;
								</c:if>
								<a href="javascript:void(0)" class="userUpdateBtn" account="${data.account }">编辑</a>
								<c:if test="${data.isAdmin eq '0' }">
									&nbsp;
									&nbsp;
									<a href="javascript:void(0)" class="userDeleteBtn" account="${data.account }">删除</a>
								</c:if>
							</td>
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
	
	<div id="upload_manage_userPage"> 
		<jsp:include page="/WEB-INF/views/page.jsp">
			<jsp:param value="upload_manage.user" name="type"/>
		</jsp:include>
	</div>
</body>
</html>