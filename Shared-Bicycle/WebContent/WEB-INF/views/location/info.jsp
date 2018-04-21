<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include.jsp"%>

<!DOCTYPE html>
<html>
<body>
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h4 class="panel-title">位置管理</h4>
		</div>
		<div class="panel-body">
			<form class="form-horizontal" id="location_manage_form">
				<div class="form-group">
					<div class="col-sm-6">
						<label for="month">位置名称：</label> 
						<input type="text" id="location_name" name="name" class="form-control" placeholder="位置名称"/>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-4">
						<label for="kpi">经度：</label> 
						<input type="number" step="0.000001" placeholder="经度" name="lon" class="form-control"/>
					</div>
					<div class="col-sm-4">
						<label for="kpi">纬度：</label> 
						<input type="number" step="0.000001" placeholder="纬度" name="lat" class="form-control"/>
					</div>
				</div>
				<input class="btn btn-primary" type="button" id="location_manage_add_btn" value="添加"/>
			</form>
			<div id="location_manage_list">
				<table id="location_manage_table" class="table table-bordered table-condensed"> 
					<thead>
						<tr>
							<th>序号</th>
							<th>位置名称</th>
							<th>经度</th>
							<th>纬度</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="6" align="center">暂无数据</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>