<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include.jsp"%>

<!DOCTYPE html>
<html>
<body>
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h4 class="panel-title">我的账户</h4>
		</div>
		<div class="panel-body">
			<h4>当前余额：
				<c:choose>
					<c:when test="${empty balance}">0.00 元</c:when>
					<c:otherwise>${balance } 元</c:otherwise>
				</c:choose>
			</h4>
			<form class="form-inline" id="balanceForm">
				<div class="form-group">
					<label for="kpi">金额(元)：</label> 
					<input type="number" placeholder="金额" id="recharge_amt" class="form-control"/>
				</div>
				<input class="btn btn-primary" type="button" id="rechargeBtn" value="充值"/>
			</form>
		</div>
	</div>	
</body>
</html>