<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>个人中心</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/layui/css/layui.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/mybuild/backStage/index.css">
</head>
<body class="layui-layout-body">
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header head">
			<div class="layui-logo">
				<a
					href="${pageContext.request.contextPath }/index/${sessionScope.currentUser.myBlog_UserInfo_id }"><img
					alt="logo"
					src="${pageContext.request.contextPath }/img/favicon.png"
					height="40px" width="40px">&nbsp;NGU&nbsp;-&nbsp;个人主页</a>
			</div>
			<ul class="layui-nav layui-layout-left">
				<li class="layui-nav-item"><a href="">个人中心</a></li>
				<!--<li class="layui-nav-item">
        <a href="javascript:;">笔记管理</a>
        <dl class="layui-nav-child">
          <dd><a href="">发表笔记</a></dd>
          <dd><a href="">管理笔记</a></dd>
          <dd><a href="">其他3</a></dd>
        </dl>
      </li>-->
			</ul>
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item"><a href="javascript:;"> <img
						src="http://t.cn/RCzsdCq" class="layui-nav-img">${sessionScope.currentUser.userInfo_Name }
				</a>
					<dl class="layui-nav-child">
						<dd>
							<a href="javascript:void(0);" onclick="loginOut()">注销登录</a>
						</dd>
					</dl></li>
			</ul>
		</div>

		<div class="layui-side layui-bg-black">
			<div class="layui-side-scroll">
				<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
				<ul class="layui-nav layui-nav-tree" lay-filter="test">
					<li class="layui-nav-item layui-nav-itemed"><a class=""
						href="javascript:;">个人资料</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="${pageContext.request.contextPath }/index.jsp"
									target="myIFrame">基本信息</a>
							</dd>
							<dd>
								<a
									href="${pageContext.request.contextPath }/aboutMe/${sessionScope.currentUser.myBlog_UserInfo_id}"
									target="myIFrame">个人介绍</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a href="javascript:;">学习笔记</a>
						<dl class="layui-nav-child">
							<dd>
								<a
									href="${pageContext.request.contextPath }/backStage/pubLearningNotes"
									target="myIFrame">发表笔记</a>
							</dd>
							<dd>
								<a
									href="${pageContext.request.contextPath }/backStage/learningNotesList"
									target="myIFrame">管理笔记</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a href="">友情链接</a></li>
					<li class="layui-nav-item"><a href="">关于本站</a></li>
				</ul>
			</div>
		</div>

		<div class="layui-body">
			<!-- 内容主体区域 -->
			<div style="margin:20px;">
				<iframe id="myIFrame" class="myIFrame" name="myIFrame" width="100%"
					src="#" onload="changeFrameHeight('myIFrame')" scrolling="no"></iframe>
			</div>
		</div>

		<div class="layui-footer">
			<!-- 底部固定区域 -->
			Copyright&copy;&nbsp;Nerver&nbsp;Give&nbsp;Up&nbsp;-&nbsp;lyt&nbsp;版权所有&nbsp;Design&nbsp;by&nbsp;DanceSmile&nbsp;<a
				href="http://www.miitbeian.gov.cn/" target="_black">湘ICP备18000987号</a>
		</div>
	</div>
	<script
		src="${pageContext.request.contextPath }/js/referenced/jquery/jquery-3.2.1.min.js"></script>
	<script src="${pageContext.request.contextPath }/layui/layui.js"></script>
	<script
		src="${pageContext.request.contextPath }/js/mybuild/userInfo/login.js"></script>
	<script
		src="${pageContext.request.contextPath }/js/mybuild/utils/iframeUtils.js"></script>
	<script>
		var basePath = '${pageContext.request.contextPath}';
		layui.use('element', function() {
			var element = layui.element;
		});
	</script>
</body>
</html>