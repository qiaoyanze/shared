<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include.jsp"%>

<!DOCTYPE html>
<html>
<body>
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h4 class="panel-title">用户管理</h4>
		</div>
		<div class="panel-body">
			<table id="user_manage_table" class="table table-bordered table-condensed"> 
				<thead>
					<tr>
						<th>序号</th>
						<th>账号</th>
						<th>昵称</th>
						<th>余额/元</th>
						<th>状态</th>
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
									<td>${data.account }</td>
									<td>${data.userInfo.nickname }</td>
									<td>${data.userInfo.balance }</td>
									<td>
										<c:if test="${data.userInfo.status eq '1' }">激活</c:if>
										<c:if test="${data.userInfo.status eq '2' }">冻结</c:if>
									</td>
									<td>
										<a href="javascript:void(0)" class="status" status="${data.userInfo.status}" account="${data.account }">
											<c:if test="${data.userInfo.status eq '2' }">
												激活
											</c:if>
											<c:if test="${data.userInfo.status eq '1' }">
												冻结
											</c:if>
										</a>
										&nbsp;
										&nbsp;
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
			
			<div id="user_manage_page" style="float: right;"> 
				<jsp:include page="/WEB-INF/views/page.jsp">
					<jsp:param value="user_manage" name="type"/>
				</jsp:include>
			</div>
		</div>
	</div>	
</body>
</html>