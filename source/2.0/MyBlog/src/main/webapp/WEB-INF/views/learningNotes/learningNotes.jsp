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
						href="${pageContext.request.contextPath }/learningNotesList/${userId}">学习笔记</a></li>
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
							<span data-toggle="tooltip" title="浏览次数"><i
								class="fa fa-eye" aria-hidden="true"></i><span
								id="menu-viewCount" class="menu-title">${lnInfo.learningNotes_ViewCount }次</span></span>
							<span data-toggle="tooltip" title="转发次数"><i
								class="fas fa-code-branch"></i><span id="menu-relayCount"
								class="menu-title">${lnInfo.learningNotes_RelayCount }次</span></span> <span
								data-toggle="tooltip" title="评论次数"><i
								class="fa fa-comments" aria-hidden="true"></i><span
								id="menu-commentCount" class="menu-title"> <span
									href="#SOHUCS" id="changyan_count_unit" class="no-span">0</span>次<script
										type="text/javascript"
										src="https://assets.changyan.sohu.com/upload/plugins/plugins.count.js"></script>
							</span></span><span data-toggle="tooltip" title="发表时间"><i
								class="fas fa-clock"></i><span id="menu-pubTime"
								class="menu-title">${lnInfo.learningNotes_PubDate }</span></span>
							<c:if test="${lnInfo.learningNotes_ModDate !=null }">
								<span data-toggle="tooltip" title="最后修改时间"><i
									class="fas fa-clock"></i><span id="menu-modTime"
									class="menu-title">${lnInfo.learningNotes_ModDate }</span></span>
							</c:if>
						</div>
					</div>
					<div id="lnValue">${lnInfo.learningNotes_Context }</div>
					<div id="lnTags">${lnInfo.learningNotes_Tags }</div>
					<!-- <div id="lnReward" align="center">
						<div id="cyReward" class="ln-hidden" role="cylabs"
							data-use="reward"></div>
						<script type="text/javascript" charset="utf-8"
							src="https://changyan.sohu.com/js/changyan.labs.https.js?appid=cytqfnp8B"></script>
					</div> -->
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
						<script type="text/javascript">
							(function() {
								var appid = 'cytqfnp8B';
								var conf = 'prod_65ef75d90f5c3635d4d6befda898c451';
								var width = window.innerWidth
										|| document.documentElement.clientWidth;
								if (width < 960) {
									window.document
											.write('<script id="changyan_mobile_js" charset="utf-8" type="text/javascript" src="https://changyan.sohu.com/upload/mobile/wap-js/changyan_mobile.js?client_id='
													+ appid
													+ '&conf='
													+ conf
													+ '"><\/script>');
								} else {
									var loadJs = function(d, a) {
										var c = document
												.getElementsByTagName("head")[0]
												|| document.head
												|| document.documentElement;
										var b = document
												.createElement("script");
										b.setAttribute("type",
												"text/javascript");
										b.setAttribute("charset", "UTF-8");
										b.setAttribute("src", d);
										if (typeof a === "function") {
											if (window.attachEvent) {
												b.onreadystatechange = function() {
													var e = b.readyState;
													if (e === "loaded"
															|| e === "complete") {
														b.onreadystatechange = null;
														a()
													}
												}
											} else {
												b.onload = a
											}
										}
										c.appendChild(b)
									};
									loadJs(
											"https://changyan.sohu.com/upload/changyan.js",
											function() {
												window.changyan.api.config({
													appid : appid,
													conf : conf
												})
											});
								}
							})();
						</script>
					</div>
				</div>
			</div>
			<%@ include file="../../baseView/pageContext-footer.jsp"%>
		</div>
		<%@ include file="../../baseView/pageFooter.jsp"%>
	</div>
	<%@ include file="../../baseView/pageUtils.jsp"%><script
		type="text/javascript">
		$(document).ready(
				function() {
					var format = "yyyy年MM月dd日";
					$("#menu-pubTime").html(function(index, html) {
						var date = dateFormat(html, format);
						return date;
					});
					$("#menu-modTime").html(function(index, html) {
						var date = dateFormat(html, format);
						return date;
					});
					var targs = $("#lnTags").html();
					targs = targs.split(",");
					var html = '<span class="label label-default">本文标签</span>';
					for (var i = 0; i < targs.length; i++) {
						html += '<span class="label label-info">' + targs[i]
								+ '</span>';
					}
					$("#lnTags").html(html);
				});
	</script>
</body>
</html>