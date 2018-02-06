<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>学习笔记 - Nerver Give Up</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@ include file="../baseView/pageBaseJS.jsp"%>
<%@ include file="../baseView/pageBaseCSS.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/mybuild/learningNotes/learningNotes.css">
<script
	src="${pageContext.request.contextPath }/js/mybuild/learningNotes/learningNotes.js"></script>
<script
	src="${pageContext.request.contextPath }/js/mybuild/utils/dateFormat.js"></script>
<script
	src="${pageContext.request.contextPath }/js/mybuild/utils/changyan.js"></script>
</head>

<body>
	<%@ include file="../baseView/pageBody.jsp"%>
	<script type="text/javascript">
		$(document).ready(function(e) {
			var uid = '${userId}';
			var lnId = '${lnId}';
			var url = '${pageContext.request.contextPath }';
			var html = getLearningNotesBaseHtml();
			setPanelBody(html);
			getLearningNotesInfo(lnId);
			getOtherLearningNotesInfo(lnId);
			$("[data-toggle='tooltip']").tooltip();
		})
	</script>
</body>
</html>
