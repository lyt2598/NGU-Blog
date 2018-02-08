<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>标题</title>
<%@ include file="../../baseView/pageBaseCSS.jsp"%>
<%@ include file="../../baseView/pageBaseJS.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/mybuild/learningNotes/pubLearningNotes.css">
<script
	src="${pageContext.request.contextPath }/js/mybuild/learningNotes/pubLearningNotes.js"></script>
</head>
<body>
	<%@ include file="../../baseView/pageMenu.jsp"%>
	<div class="container">
		<%@ include file="../../baseView/pageLogo.jsp"%>
		<div class="panel panel-primary">
			<%@ include file="../../baseView/pageContext-title.jsp"%>
			<div class="my-panel-body" id="panel-body">
				<!-- 正文内容 -->
				<div class="pubTitle">
					标题：<input id="pubTitleValue" type="text" /><span
						class="pubTitleMsg">如果标题为空，默认当前日期作为标题。</span>
				</div>
				<script id="myEditor" style="width:100%;height:360px;"
					type="text/plain"></script>
				<div class="pubConfig">
					显示设置： <label><input type="checkbox" id="lnStick"
						title="置顶笔记">置顶笔记</label> <label><input type="checkbox"
						id="lnPrivate" title="仅自己可见">自己可见</label>
				</div>
				<div class="pubConfig">
					其他设置： <label><input type="checkbox" id="lnRelay"
						checked="checked">允许转发</label>
				</div>
				<div class="pubConfig">
					文章类别：<select id="pubType"></select><span class="pubTitleMsg">&nbsp;*</span>
				</div>
			</div>
			<div class="pubConfig">
				关键字：<input type="text" id="pubTags" onchange="keywordFormat()">
				<span class="pubTitleMsg">关键字用逗号[ , ]隔开</span>
			</div>
			<div class="pubSubmit" align="center">
				<span id="publishLNMessage" class="pubTitleMsg"></span>
				<button type="button" class="btn btn-success" id="publishLN">
					<i class="fa fa-plus" aria-hidden="true"></i>&nbsp;立即发表学习笔记
				</button>
			</div>
			<%@ include file="../../baseView/pageContext-footer.jsp"%>
		</div>
		<%@ include file="../../baseView/pageFooter.jsp"%>
	</div>
	<%@ include file="../../baseView/pageUtils.jsp"%>
	<script type="text/javascript" charset="utf-8"
		src="${pageContext.request.contextPath }/editor/ueditor.config.js"></script>
	<script type="text/javascript" charset="utf-8"
		src="${pageContext.request.contextPath }/editor/ueditor.all.min.js">
		
	</script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/editor/lang/zh-cn/zh-cn.js"></script>
	<script type="text/javascript">
		$(document).ready(function(e) {
			var ue = UE.getEditor('myEditor');
			$('#publishLN').click(function() {
				pubLearningNotes(ue, url);
			});
		})
	</script>
</body>
</html>