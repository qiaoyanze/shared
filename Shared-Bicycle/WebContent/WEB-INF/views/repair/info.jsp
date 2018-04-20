<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include.jsp"%>

<!DOCTYPE html>
<html>
<body>
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h4 class="panel-title">我的信息</h4>
		</div>
		<div class="panel-body">
			<div class="row">
				<div class="col-md-offset-3 col-md-6">
					<form class="form-horizontal" role="form" id="repair_update_form">
						<div class="form-group">
							<label for="account">审核状态：</label>
							<c:choose>
								<c:when test="${info.isPass eq 1 }">审核中</c:when>
								<c:when test="${info.isPass eq 2 }">审核通过</c:when>
							</c:choose>
						</div>
						
						<div class="form-group">
							<label for="account">账号：</label> <input type="text" readonly="readonly"
								class="form-control" id="account" name="account" value="${info.account }"
								placeholder="手机号/字母数字组合">
						</div>
						
						<div class="form-group">
							<label for="realname">真实姓名：</label> 
							<input type="text" readonly="readonly"
								class="form-control" name="realname" value="${info.realname }" placeholder="真实姓名">
						</div>
						<div class="form-group">
							<label for="idNo">身份证号：</label> 
							<input type="text"  readonly="readonly"
								class="form-control" name="idNo" value="${info.idNo }" placeholder="身份证号">
						</div>
						<div class="form-group">
							<label for="mobile">手机号：</label> 
							<input type="tel"
								class="form-control" name="mobile" value="${info.mobile }" placeholder="手机号">
						</div>
						<div class="form-group">
							<label for="gender">性别：</label> 
							<div>
								<label class="radio-inline"> 
									<input type="radio" <c:if test="${info.gender eq 1 }">checked="checked"</c:if> name="gender" value="1"> 男
								</label>
								<label class="radio-inline">
									<input type="radio" <c:if test="${info.gender eq 2 }">checked="checked"</c:if> name="gender" value="2">女
								</label> 
							</div>
						</div>
						<div class="form-group">
							<label for="date">出生日期：</label> 
							<input type="date"
								class="form-control" name="birthday" value="${info.birthday }" placeholder="出生日期">
						</div>
						
						<div class="form-group">
							<input class="btn btn-primary" type="button" id="repair_submit" value="修改"/>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>	
</body>
</html>