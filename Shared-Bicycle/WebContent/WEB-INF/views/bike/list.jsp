<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include.jsp"%>

<!DOCTYPE html>
<html>
<body>
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h4 class="panel-title">单车管理</h4>
		</div>
		<div class="panel-body">
			<div style="margin-left: 10px; margin-bottom: 10px;">
				<input class="btn btn-primary"
					style="float: right; margin-bottom: 5px" type="button"
					id="bike_manage_add" value="新增" />
			</div>
			<table id="bike_manage_table" class="table table-bordered table-condensed"> 
				<thead>
					<tr>
						<th>序号</th>
						<th>单车编号</th>
						<th>单车密码</th>
						<th>单车品牌</th>
						<th>投放位置</th>
						<th>单车状态</th>
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
									<td>${data.place }</td>
									<td>
										<c:if test="${data.status eq '1' }">正常</c:if>
										<c:if test="${data.status eq '2' }">租车</c:if>
										<c:if test="${data.status eq '3' }">报修</c:if>
										<c:if test="${data.status eq '4' }">回收下线</c:if>
									</td>
									<td>
										<c:if test="${data.status eq 1 }">
											<a href="javascript:void(0)" class="update_bike"  bike_code="${data.bikeCode }">
												修改
											</a>
											&nbsp;
											&nbsp;
										</c:if>	
											
										<c:if test="${data.status eq 1 or data.status eq 3 }">
											<a href="javascript:void(0)" class="collect"  bike_code="${data.bikeCode }">
												回收下线
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
			
			<div id="bike_manage_page" style="float: right;"> 
				<jsp:include page="/WEB-INF/views/page.jsp">
					<jsp:param value="bike_manage" name="type"/>
				</jsp:include>
			</div>
		</div>
	</div>
</body>
</html>