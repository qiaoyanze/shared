<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8" name="viewport"
	content="width=device-width, initial-scale=1">
<title>登录</title>
<link rel="stylesheet" type="text/css"
	href='<c:url value="/web-resources/libs/bootstrap-3.1.1/css/bootstrap.min.css"/>'>
<link rel="stylesheet" type="text/css"
	href='<c:url value="/web-resources/css/login.css"/>'>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-offset-3 col-md-6">
				<form class="form-horizontal">
					<span class="heading">用户登录</span>
					<div class="form-group">
						<input type="text" class="form-control" id="account"
							placeholder="账号"> <i class="fa fa-user"></i>
					</div>
					<div class="form-group help">
						<input type="password" class="form-control" id="passwd"
							placeholder="密码"> <i class="fa fa-lock"></i> <a href="#"
							class="fa fa-question-circle"></a>
					</div>
					<div class="form-group">
						<div class="main-checkbox">
							<input type="checkbox" value="None" id="checkbox1"
								name="remember-me" /> <label for="checkbox1"></label>
						</div>
						<span class="text">记住密码</span> <span id="errorMsg"></span>
						<input type="button" class="btn btn-default" id="login" value="登录" />
					</div>
					<div class="form-group register">
						<a href="/forget">忘记密码?</a>
						&nbsp;&nbsp; | &nbsp;&nbsp;
						<a href="/register">没有账号，点此注册</a>						
					</div>
				</form>
			</div>
		</div>
	</div>

	<script type="text/javascript"
		src='<c:url value="/web-resources/libs/jquery/jquery-2.1.1.js"/>'></script>
	<script type="text/javascript"
		src='<c:url value="/web-resources/libs/jquery/jquery.cookie.js"/>'></script>
	<script type="text/javascript"
		src='<c:url value="/web-resources/js/login.js"/>'></script>

</body>
</html>