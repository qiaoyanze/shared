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
						
						<div id="user_info">
							<div class="form-group">
								<label for="date">昵称：</label> 
								<input type="text"
									class="form-control" name="userInfo.nickname" placeholder="昵称">
							</div>
							<div class="form-group">
								<label for="gender">性别：</label> 
								<div>
									<label class="radio-inline"> 
										<input type="radio" checked="checked" name="userInfo.gender" value="1"> 男
									</label>
									<label class="radio-inline">
										<input type="radio" name="userInfo.gender" value="2">女
									</label> 
								</div>
							</div>
							<div class="form-group">
								<label for="birthday">出生日期：</label> 
								<input type="date"
									class="form-control" name="userInfo.birthday" placeholder="出生日期">
							</div>
						</div>
						
						<div id="repair_info" style="display: none;">
							<div class="form-group">
								<label for="realname">真实姓名：</label> 
								<input type="text"
									class="form-control" name="repairInfo.realname" placeholder="真实姓名">
							</div>
							<div class="form-group">
								<label for="idNo">身份证号：</label> 
								<input type="text"
									class="form-control" name="repairInfo.idNo" placeholder="身份证号">
							</div>
							<div class="form-group">
								<label for="mobile">手机号：</label> 
								<input type="tel"
									class="form-control" name="repairInfo.mobile" placeholder="手机号">
							</div>
							<div class="form-group">
								<label for="gender">性别：</label> 
								<div>
									<label class="radio-inline"> 
										<input type="radio" checked="checked" name="repairInfo.gender" value="1"> 男
									</label>
									<label class="radio-inline">
										<input type="radio" name="repairInfo.gender" value="2">女
									</label> 
								</div>
							</div>
							<div class="form-group">
								<label for="date">出生日期：</label> 
								<input type="date"
									class="form-control" name="repairInfo.birthday" placeholder="出生日期">
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