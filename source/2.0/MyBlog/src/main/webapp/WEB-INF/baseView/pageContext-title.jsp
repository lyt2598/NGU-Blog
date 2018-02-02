<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<div class="panel-heading">
	<h3 class="panel-title" style="display: inline-block;">Nerver Give
		Up</h3>
	<span data-toggle="tooltip"
		onclick="javascript:location.href='${pageContext.request.contextPath}/index/${userId }'"
		title="进入首页" class="panel-menu-button"> <i class="fa fa-home"
		aria-hidden="true"></i>
	</span><span data-toggle="tooltip" onclick="javascript:history.back()"
		title="点击返回上一页" class="panel-menu-button"> <i
		class="fa fa-arrow-circle-left" aria-hidden="true"></i>
	</span> <span data-toggle="tooltip" onclick="javascript:location.reload()"
		title="点击刷新" class="panel-menu-button"> <i
		class="fa fa-refresh" aria-hidden="true"></i>
	</span>
</div>