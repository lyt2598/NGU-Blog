<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>发表文章</title>
<%@ include file="../baseView/pageBaseCSS.jsp"%>
<%@ include file="../baseView/pageBaseJS.jsp"%>
<script
	src="${pageContext.request.contextPath }/js/referenced/jquery/jquery-3.2.1.min.js"></script>
<script
	src="${pageContext.request.contextPath }/js/mybuild/learningNotes/pubLearningNotes.js"></script>
</head>
<body>
	<form onsubmit="return false;" class="layui-form layui-form-pane">
		<div class="layui-form-item">
			<label class="layui-form-label">标题</label>
			<div class="layui-input-block">
				<input name="title" placeholder="请输入标题" class="layui-input"
					type="text">
			</div>
			<div class="layui-form-mid layui-word-aux">如果标题为空，默认使用当前日期作为标题。</div>
		</div>
		<div class="layui-form-item">
			<script id="myEditor"
				style="width:99.9%;height:360px;margin-bottom:15px;"
				type="text/plain"></script>
		</div>
		<div class="layui-form-item" pane>
			<label class="layui-form-label">文章设置</label>
			<div class="layui-input-block">
				<input type="checkbox" id="lnStick" lay-skin="primary" title="置顶笔记"><input
					type="checkbox" id="lnPrivate" lay-skin="primary" title="仅自己可见"><input
					type="checkbox" id="lnRelay" checked="checked" lay-skin="primary"
					title="允许转发">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">文章类别</label>
			<div class="layui-input-inline">
				<select id="pubType"></select><span class="pubTitleMsg"></span>
			</div>
			<div class="layui-form-mid layui-word-aux">*必选项</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">关键字</label>
			<div class="layui-input-inline">
				<input type="text" id="pubTags" onchange="keywordFormat()"
					class="layui-input">
			</div>
			<div class="layui-form-mid layui-word-aux">关键字用逗号[ , ]隔开</div>
		</div>

		<div class="pubSubmit" align="center">
			<p id="publishLNMessage" class="pubTitleMsg"></p>
			<button type="button" class="layui-btn layui-btn-normal"
				id="publishLN">
				<i class="fa fa-plus" aria-hidden="true"></i>&nbsp;立即发表学习笔记
			</button>
		</div>
	</form>
	<script type="text/javascript" charset="utf-8"
		src="${pageContext.request.contextPath }/editor/ueditor.config.js"></script>
	<script type="text/javascript" charset="utf-8"
		src="${pageContext.request.contextPath }/editor/ueditor.all.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/editor/lang/zh-cn/zh-cn.js"></script>
	<script>
		layui
				.use(
						[ 'form', 'layedit', ],
						function() {
							var form = layui.form, layer = layui.layer, layedit = layui.layedit, laydate = layui.laydate;
							form.render('select');
						});
	</script>
	<script type="text/javascript">
		$(document).ready(function(e) {
			var ue = UE.getEditor('myEditor');
			var url = parent.basePath;
			getLNType(url);
			$('#publishLN').click(function() {
				pubLearningNotes(ue, url, true);
				window.parent.changeFrameHeight('myIFrame');
			});
			window.parent.changeFrameHeight('myIFrame');
		})
	</script>
</body>
</html>
