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
							<label for="inputText" class="col-sm-2 control-label"><i style="color: red;">*</i> 账号：</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="account"
									name="account" placeholder="账号">
							</div>
						</div>
						<div class="form-group">
							<label for="inputText" class="col-sm-2 control-label">表名：</label>
							<div class="col-sm-10">
								<textarea class="form-control" id="busType" name="busType"
								placeholder="表名,多个之间以英文字符逗号分隔,必须与各模板中名称一致"></textarea>
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
							<label for="inputText" class="col-sm-2 control-label"><i style="color: red;">*</i> 账号：</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="account" readonly="readonly"
									name="account" placeholder="账号">
							</div>
						</div>
						<div class="form-group">
							<label for="inputText" class="col-sm-2 control-label">表名：</label>
							<div class="col-sm-10">
								<textarea class="form-control" id="busType" name="busType" placeholder="表名,多个之间以英文字符逗号分隔,必须与各模板中名称一致"></textarea>
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
	
	