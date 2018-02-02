<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>标题</title>
<%@ include file="../../baseView/pageBaseCSS.jsp"%>
<%@ include file="../../baseView/pageBaseJS.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/mybuild/other/index.css">
<script
	src="${pageContext.request.contextPath }/js/mybuild/utils/dateFormat.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/mybuild/aboutMe/aboutMe.css" />
</head>
<body>
	<%@ include file="../../baseView/pageMenu.jsp"%>
	<div class="container">
		<%@ include file="../../baseView/pageLogo.jsp"%>
		<div class="panel panel-primary">
			<%@ include file="../../baseView/pageContext-title.jsp"%>
			<div class="my-panel-body" id="panel-body">
				<!-- 正文内容 -->
				<div>
					<div class="about_me_head">
						<div class="about_me_head_img" align="center">
							<img alt="头像"
								src="${ pageContext.request.contextPath}/img/user/head/${aboutMe.userInfo.userInfo_HeadImg}" />
						</div>
						<div class="about_me_name">
							<p id="name">${aboutMe.userInfo.userInfo_Name }</p>
							<p>
								<i class="fa fa-envelope" aria-hidden="true"></i> Email：<span
									id="email"><a
									href="mailto:${aboutMe.userInfo.userInfo_Email}">${aboutMe.userInfo.userInfo_Email}</a></span>
							</p>
						</div>
					</div>
					<div class="about_me_context">
						<c:choose>
							<c:when test="${aboutMe!=null}">
								<ul class="context_list">
									<c:if test="${aboutMe.aboutMe_Describe!=null }">
										<li><div class="list_right">
												<h1>
													<i class="fa fa-commenting-o" aria-hidden="true"></i><span
														class="list_right_title">个人描述</span>
												</h1>
												<pre class="list_right_context">${aboutMe.aboutMe_Describe }</pre>
											</div></li>
									</c:if>
									<c:if test="${aboutMe.aboutMe_Skill!=null }">
										<li><div class="list_right">
												<h1>
													<i class="fa fa-cogs" aria-hidden="true"></i><span
														class="list_right_title">技能介绍</span>
												</h1>
												<pre class="list_right_context">${aboutMe.aboutMe_Skill }</pre>
											</div></li>
									</c:if>
									<c:if test="${aboutMe.aboutMe_Development!=null }">
										<li><div class="list_right">
												<h1>
													<i class="fa fa-bug" aria-hidden="true"></i><span
														class="list_right_title">开发经验</span>
												</h1>
												<pre class="list_right_context">${aboutMe.aboutMe_Development }</pre>
											</div></li>
									</c:if>
									<c:if test="${aboutMe.aboutMe_Hobby!=null }">
										<li><div class="list_right">
												<h1>
													<i class="fa fa-music" aria-hidden="true"></i><span
														class="list_right_title">爱好介绍</span>
												</h1>
												<pre class="list_right_context">${aboutMe.aboutMe_Hobby }</pre>
											</div></li>
									</c:if>
									<c:if test="${aboutMe.aboutMe_Other!=null }">
										<li><div class="list_right">
												<h1>
													<i class="fa fa-phone-square" aria-hidden="true"></i><span
														class="list_right_title">其他描述</span>
												</h1>
												<pre class="list_right_context">${aboutMe.aboutMe_Other }</pre>
											</div></li>
									</c:if>
									<li><div class="list_right">
											<h1>
												<i class="fa fa-phone-square" aria-hidden="true"></i><span
													class="list_right_title">联系方式</span>
											</h1>
											<div class="contact">
												<c:if
													test="${aboutMe.userInfo.userInfo_QQaccount!=null && aboutMe.userInfo.userInfo_QQaccount!=''}">
													<p>
														<i class="fa fa-qq" aria-hidden="true"></i>&nbsp;QQ号码： <a
															href="http://wpa.qq.com/msgrd?v=3&uin=${aboutMe.userInfo.userInfo_QQaccount }&site=qq&menu=yes"
															target="_blank">${aboutMe.userInfo.userInfo_QQaccount }</a>
													</p>
												</c:if>
												<c:if
													test="${aboutMe.aboutMe_Phone == 1 && aboutMe.userInfo.userInfo_Phone != null
			&& aboutMe.userInfo.userInfo_Phone != '' }">
													<p>
														<i class="fa fa-fax" aria-hidden="true"></i>&nbsp;电话号码：${aboutMe.userInfo.userInfo_Phone }
													</p>
												</c:if>
												<c:if
													test="${aboutMe.userInfo.userInfo_GitHub!=null &&  aboutMe.userInfo.userInfo_GitHub!=''}">
													<p>
														<i class="fa fa-github" aria-hidden="true"></i>&nbsp;GitHub：<a
															target="_blank"
															href="${aboutMe.userInfo.userInfo_GitHub }">${aboutMe.userInfo.userInfo_GitHub }</a>
													</p>
												</c:if>
												<p>
													<i class="fa fa-envelope" aria-hidden="true"></i>&nbsp;Email：<a
														href="mailto:${aboutMe.userInfo.userInfo_Email }">${aboutMe.userInfo.userInfo_Email }</a>
												</p>
											</div>
										</div></li>
								</ul>
							</c:when>
							<c:otherwise>
								<h1 style='text-align: center;'>这家伙很懒，什么都没有写!</h1>
							</c:otherwise>
						</c:choose>
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