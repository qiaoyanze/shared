<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
.alert {
	display: none;
	position: fixed;
	top: 50%;
	left: 50%;
	min-width: 200px;
	margin-left: -100px;
	z-index: 99999;
	padding: 15px;
	border: 1px solid transparent;
	border-radius: 4px;
	text-align: center;
}

.alert-success {
	color: #3c763d;
	background-color: #dff0d8;
	border-color: #d6e9c6;
}

.alert-info {
	color: #31708f;
	background-color: #d9edf7;
	border-color: #bce8f1;
}

.alert-warning {
	color: #8a6d3b;
	background-color: #fcf8e3;
	border-color: #faebcc;
}

.alert-danger {
	color: #a94442;
	background-color: #f2dede;
	border-color: #ebccd1;
}
</style>
<div class="alert"></div>

<script>
	/**
	 * 弹出式提示框，默认1.2秒自动消失
	 * @param message 提示信息
	 * @param style 提示样式，有alert-success、alert-danger、alert-warning、alert-info
	 * @param time 消失时间
	 */
	var prompt = function(message, style, time) {
		style = (style === undefined) ? 'alert-success' : style;
		time = (time === undefined) ? 1200 : time;
		$('<div>').appendTo('body').addClass('alert ' + style).html(message)
				.show().delay(time).fadeOut();
	};

	// 成功提示
	var success_prompt = function(message, time) {
		prompt(message, 'alert-success', time);
	};

	// 失败提示
	var fail_prompt = function(message, time) {
		prompt(message, 'alert-danger', time);
	};

	// 提醒
	var warning_prompt = function(message, time) {
		prompt(message, 'alert-warning', time);
	};

	// 信息提示
	var info_prompt = function(message, time) {
		prompt(message, 'alert-info', time);
	};
</script>