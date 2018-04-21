<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include.jsp"%>

<!-- 新增 -->
	<div class="modal fade" id="bike_manage_add_modal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content"  style="width: 700px;">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">新增</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" role="form" id="bike_manage_add_form">
						<div class="form-group">
							<label for="inputText" class="col-sm-2 control-label">单车品牌：</label>
							<div class="col-sm-10">
								<select class="form-control" name="bikeBrand">
								  <option value="1">ofo单车</option>
								  <option value="2">摩拜单车</option>
								  <option value="3">哈罗单车</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="inputText" class="col-sm-2 control-label">投放位置：</label>
							<div class="col-sm-10">
								<select class="form-control" id="place" name="place">
								  
								</select>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="bike_manage_add_btn">确定</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 编辑 -->
	<div class="modal fade" id="bike_manage_update_modal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="width: 700px;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">编辑</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" role="form" id="bike_manage_update_form">
						<div class="form-group">
							<label for="inputText" class="col-sm-2 control-label">单车号码：</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="bikeCode"
									name="bikeCode" readonly="readonly">
							</div>
						</div>
						<div class="form-group">
							<label for="inputText" class="col-sm-2 control-label">单车品牌：</label>
							<input type="hidden" id="bikeBrand_req" name="bikeBrand"/>
							<div class="col-sm-10">
								<select class="form-control" id="bikeBrand" disabled="disabled">
								  <option value="1">ofo单车</option>
								  <option value="2">摩拜单车</option>
								  <option value="3">哈罗单车</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="inputText" class="col-sm-2 control-label">投放位置：</label>
							<div class="col-sm-10">
								<select class="form-control" id="place" name="place">
								  
								</select>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="bike_manage_update_btn">确定</button>
				</div>
			</div>
		</div>
	</div>
	
	