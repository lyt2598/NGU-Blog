<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>${lnInfo.learningNotes_Title }&nbsp;-&nbsp;学习笔记&nbsp;-&nbsp;个人主页&nbsp;-&nbsp;Nerver&nbsp;Give&nbsp;Up</title>
<%@ include file="../../baseView/pageBaseCSS.jsp"%>
<%@ include file="../../baseView/pageBaseJS.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/mybuild/learningNotes/learningNotes.css">
<script
	src="${pageContext.request.contextPath }/js/mybuild/utils/dateFormat.js"></script>
<script
	src="${pageContext.request.contextPath }/js/mybuild/utils/changyan.js"></script>
<script type="text/javascript"
	src="https://assets.changyan.sohu.com/upload/plugins/plugins.count.js"></script>
</head>
<body>
	<%@ include file="../../baseView/pageMenu.jsp"%>
	<div class="container">
		<%@ include file="../../baseView/pageLogo.jsp"%>
		<div class="panel panel-primary">
			<%@ include file="../../baseView/pageContext-title.jsp"%>
			<div class="my-panel-body" id="panel-body">
				<ol class="breadcrumb">
					<li class="active">当前位置</li>
					<li><a
						href="${pageContext.request.contextPath }/index/${userId}">首页</a></li>
					<li><a
						href="${pageContext.request.contextPath }/learningNotes/${userId}">学习笔记</a></li>
					<li class="active title">${lnInfo.learningNotes_Title }</li>
				</ol>
				<!-- 正文内容 -->
				<div class="lnLeft ln-hidden">
					<div class="lnUserInfo">
						<div class="userHead">
							<img
								src="${pageContext.request.contextPath }/img/user/head/${lookUserInfo.userInfo_HeadImg}" />
						</div>
						<div class="userInfo">
							<div class="one">
								<span class="userName">${lookUserInfo.userInfo_Name}</span>
							</div>
							<div class="two">
								<a class="ln-qq" target="_blank"
									href="http://wpa.qq.com/msgrd?v=3&uin=${lookUserInfo.userInfo_QQaccount}&site=qq&menu=yes"
									data-toggle="tooltip" title="联系Ta-QQ"><i class="fab fa-qq"></i></a>
								<a class="ln-github" target="_blank"
									href="${lookUserInfo.userInfo_GitHub}" data-toggle="tooltip"
									title="进入GitHub"><i class="fab fa-github"></i></a> <a
									class="ln-wechat" href="javascript:void(0);"
									data-toggle="tooltip" title="WeChat"><i
									class="fab fa-weixin"></i></a> <a class="ln-email"
									href="mailto:${lookUserInfo.userInfo_Email}"
									data-toggle="tooltip" title="邮箱"><i class="fa fa-envelope"
									aria-hidden="true"></i></a>
							</div>
						</div>
					</div>
					<c:if test="${otherLNInfo!=null }">
						<div class="lnList">
							<div class="title">
								Ta的其他文章
								<div class="more">
									<a
										href="${pageContext.request.contextPath }/learningNotesList/${userId}">更多&nbsp;>></a>
								</div>
							</div>
							<div class="list" id="otherLn">
								<ul>
									<c:forEach items="${otherLNInfo }" var="lnInfo">
										<li><a
											href="${pageContext.request.contextPath }/learningNotes/${lnInfo.learningNotes_PubUser }/${lnInfo.myBlog_LearningNotes_id }">${lnInfo.learningNotes_Title }</a></li>
									</c:forEach>
								</ul>
							</div>
						</div>
					</c:if>
				</div>
				<div class="lnContext">
					<div id="lnTitle">
						<div class="menu">
							<span style="color: #999;">标题：</span>
							<p id="lnTitle_Span">${lnInfo.learningNotes_Title }</p>
							<hr />
							<div class="hiddenUserInfo">
								<img
									src="${pageContext.request.contextPath }/img/user/head/${lookUserInfo.userInfo_HeadImg}" /><span
									class="userName">${lookUserInfo.userInfo_Name}</span> <a
									class="ln-qq" target="_blank"
									href="http://wpa.qq.com/msgrd?v=3&uin=${lookUserInfo.userInfo_QQaccount}&site=qq&menu=yes"
									data-toggle="tooltip" title="联系Ta-QQ"><i class="fab fa-qq"></i></a>
								<a class="ln-github" target="_blank"
									href="${lookUserInfo.userInfo_GitHub}" data-toggle="tooltip"
									title="进入GitHub"><i class="fab fa-github"></i></a> <a
									class="ln-wechat" href="javascript:void(0);"
									data-toggle="tooltip" title="WeChat"><i
									class="fab fa-weixin"></i></a> <a class="ln-email"
									href="mailto:${lookUserInfo.userInfo_Email}"
									data-toggle="tooltip" title="邮箱"><i class="fa fa-envelope"
									aria-hidden="true"></i></a>
							</div>
							<a href="javascript:void(0);" data-toggle="tooltip" title="浏览次数"><i
								class="fa fa-eye" aria-hidden="true"></i><span
								id="menu-viewCount" class="menu-title">${lnInfo.learningNotes_ViewCount }次</span></a>
							<a href="javascript:void(0);" data-toggle="tooltip" title="转发次数"><i
								class="fas fa-code-branch"></i><span id="menu-relayCount"
								class="menu-title">${lnInfo.learningNotes_RelayCount }次</span></a> <a
								href="javascript:void(0);" data-toggle="tooltip" title="评论次数"><i
								class="fa fa-comments" aria-hidden="true"></i><span
								id="menu-commentCount" class="menu-title"> <span
									href="#SOHUCS" id="changyan_count_unit">0</span>次
							</span></a> <a href="javascript:void(0);" data-toggle="tooltip" title="发表时间"><i
								class="fas fa-clock"></i><span id="menu-pubTime"
								class="menu-title">${lnInfo.learningNotes_PubDate }</span></a>
							<c:if test="${lnInfo.learningNotes_ModDate !=null }">
								<a href="javascript:void(0);" data-toggle="tooltip"
									title="最后修改时间"><i class="fas fa-clock"></i><span
									id="menu-modTime" class="menu-title">${lnInfo.learningNotes_ModDate }</span></a>
							</c:if>
						</div>
					</div>
					<div id="lnValue">${lnInfo.learningNotes_Context }</div>
					<div id="lnTags">${lnInfo.learningNotes_Tags }</div>
					<div id="lnReward" align="center">
						<div id="cyReward" role="cylabs" data-use="reward"></div>
						<!-- 代码2：用来读取评论框配置，此代码需放置在代码1之后。 -->
						<!-- 如果当前页面有评论框，代码2请勿放置在评论框代码之前。 -->
						<!-- 如果页面同时使用多个实验室项目，以下代码只需要引入一次，只配置上面的div标签即可 -->
						<script type="text/javascript" charset="utf-8"
							src="https://changyan.itc.cn/js/lib/jquery.js"></script>
						<script type="text/javascript" charset="utf-8"
							src="https://changyan.sohu.com/js/changyan.labs.https.js?appid=cytqfnp8B"></script>
					</div>
					<div id="lnBottom">
						<c:if test="${topLNInfo!=null}">
							<b>&nbsp;上一篇：<a
								href="${pageContext.request.contextPath }/learningNotes/${userId}/${topLNInfo.myBlog_LearningNotes_id }"
								data-toggle="tooltip" title="上一篇" class="lnTitleA" id="topLn">${topLNInfo.learningNotes_Title }</a></b>
						</c:if>
						<c:if test="${nextLNInfo!=null}">
							<b>&nbsp;下一篇：<a
								href="${pageContext.request.contextPath }/learningNotes/${userId}/${nextLNInfo.myBlog_LearningNotes_id }"
								data-toggle="tooltip" title="下一篇" class="lnTitleA" id="nextLn">${nextLNInfo.learningNotes_Title }</a></b>
						</c:if>
					</div>
					<div id="message">
						<div id="SOHUCS"
							sid="/learningNotes/${userId}/${lnInfo.myBlog_LearningNotes_id }"></div>
					</div>
				</div>
			</div>
			<%@ include file="../../baseView/pageContext-footer.jsp"%>
		</div>
		<%@ include file="../../baseView/pageFooter.jsp"%>
	</div>
	<%@ include file="../../baseView/pageUtils.jsp"%>
</body>
</html>