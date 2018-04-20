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
					<form class="form-horizontal" role="form" id="user_update_form">
						<div class="form-group">
							<label for="account">账号：</label> <input type="text" readonly="readonly"
								class="form-control" id="account" name="account" value="${info.account }">
						</div>
						<div class="form-group">
								<label for="date">昵称：</label> 
								<input type="text" value="${info.nickname }"
									class="form-control" name="nickname" placeholder="昵称">
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
							<input class="btn btn-primary" type="button" id="user_submit" value="修改"/>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>	
</body>
</html>