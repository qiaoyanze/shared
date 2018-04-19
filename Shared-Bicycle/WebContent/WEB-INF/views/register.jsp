<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8" name="viewport"
	content="width=device-width, initial-scale=1">
<title>注册</title>
<link rel="stylesheet" type="text/css"
	href='<c:url value="/web-resources/libs/bootstrap-3.1.1/css/bootstrap.min.css"/>'>
	
<style type="text/css">
	.heading{
	    display: block;
	    font-size: 35px;
	    font-weight: 700;
	    padding: 35px 0;
	    border-bottom: 1px solid #f0f0f0;
	    margin-bottom: 30px;
	}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-offset-3 col-md-6">
				<div class="panel-heading">
					<span class="heading">用户注册</span>
				</div>
				<div class="panel-body">
					<form class="form-horizontal" id="register_form">
						<div class="form-group">
							<label for="account">账号：</label> <input type="text"
								class="form-control" id="account" name="account"
								placeholder="手机号/字母数字组合">
						</div>
						<div class="form-group">
							<label for="passwd">密码：</label> <input type="password"
								class="form-control" id="password" name="password"
								placeholder="密码">
						</div>
	
						<div class="form-group">
							<label for="role">角色：</label>
							<div>
								<label class="radio-inline"> <input type="radio" checked="checked"
									name="role" id="user" value="3"> 用户
								</label>
								<label class="radio-inline">
									<input type="radio" name="role" id="repair_user" value="2">
									维修人员
								</label> 
							</div>
						</div>
						
						<div class="form-group">
							<input class="btn btn-primary" type="button" id="register_submit" value="提交"/>
						</div>
					</form>
				</div>
				
			</div>
		</div>
	</div>

	<script type="text/javascript"
		src='<c:url value="/web-resources/libs/jquery/jquery-2.1.1.js"/>'></script>
	<script type="text/javascript"
		src='<c:url value="/web-resources/js/register.js"/>'></script>
</body>
</html>