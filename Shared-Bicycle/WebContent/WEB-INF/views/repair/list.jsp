<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include.jsp"%>

<!DOCTYPE html>
<html>
<body>
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h4 class="panel-title">维修人员管理</h4>
		</div>
		<div class="panel-body">
			<table id="repair_manage_table" class="table table-bordered table-condensed"> 
				<thead>
					<tr>
						<th>序号</th>
						<th>账号</th>
						<th>姓名</th>
						<th>身份证号</th>
						<th>手机号</th>
						<th>性别</th>
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
									<td>${data.repairInfo.realname }</td>
									<td>${data.repairInfo.idNo }</td>
									<td>${data.repairInfo.mobile }</td>
									<td>
										<c:if test="${data.repairInfo.gender eq 1 }">男</c:if>
										<c:if test="${data.repairInfo.gender eq 2 }">女</c:if>
									</td>
									<td>
										<c:if test="${data.repairInfo.isPass eq '1' }">待审核</c:if>
										<c:if test="${data.repairInfo.isPass eq '2' }">通过</c:if>
										<c:if test="${data.repairInfo.isPass eq '3' }">已拒绝</c:if>
									</td>
									<td>
										<c:if test="${data.repairInfo.isPass eq '1' }">
											<a href="javascript:void(0)" class="isPass" account="${data.account }">
												审批通过
											</a>
											&nbsp;
											&nbsp;
											<a href="javascript:void(0)" class="refuse" account="${data.account }">
												拒绝
											</a>
										</c:if>
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
			
			<div id="repair_manage_page" style="float: right;"> 
				<jsp:include page="/WEB-INF/views/page.jsp">
					<jsp:param value="repair_manage" name="type"/>
				</jsp:include>
			</div>
		</div>
	</div>	
</body>
</html>