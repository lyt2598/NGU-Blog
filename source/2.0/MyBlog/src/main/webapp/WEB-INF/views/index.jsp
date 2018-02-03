<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>${lookUserInfo.userInfo_Name }&nbsp;-&nbsp;首页&nbsp;-&nbsp;个人主页&nbsp;-&nbsp;Nerver&nbsp;Give&nbsp;Up</title>
<%@ include file="../baseView/pageBaseCSS.jsp"%>
<%@ include file="../baseView/pageBaseJS.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/mybuild/index.css">
<script
	src="${pageContext.request.contextPath }/js/mybuild/utils/dateFormat.js"></script>
<script src="${pageContext.request.contextPath }/js/mybuild/index.js"></script>
</head>
<body>
	<%@ include file="../baseView/pageMenu.jsp"%>
	<div class="container">
		<%@ include file="../baseView/pageLogo.jsp"%>
		<div class="panel panel-primary">
			<%@ include file="../baseView/pageContext-title.jsp"%>
			<div class="my-panel-body" id="panel-body">
				<ol class="breadcrumb">
					<li class="active">当前位置</li>
					<li class="active">首页</li>
				</ol>
				<!-- 正文内容 -->
				<div id="indexContext">
					<div id="indexRight" class="lnHidden">
						<div class="boxShadow rightList" align="center">
							<div class="title">当前时间</div>
							<div class="dataTime rightContext"></div>
						</div>
						<div class="boxShadow rightList">
							<div class="title">用户资料</div>
							<div class="indexUserInfo rightContext">
								<div id="baseUserInfo">
									<div id="userInfoHeadImg">
										<a
											href="${pageContext.request.contextPath }/aboutMe/${lookUserInfo.myBlog_UserInfo_id}"><img
											src="${pageContext.request.contextPath }/img/user/head/${lookUserInfo.userInfo_HeadImg}"
											class="img-circle"></a>
									</div>
									<div id="userInfo">
										<span class="userInfoSpan" data-toggle="tooltip"
											data-placement="top" data-original-title="用户名字"><i
											class="fa fa-user" aria-hidden="true"></i>${lookUserInfo.userInfo_Name }</span><span
											class="userInfoSpan" data-toggle="tooltip"
											data-placement="top" data-original-title="用户邮箱"><a
											href="mailto:${lookUserInfo.userInfo_Email }"><i
												class="fa fa-envelope" aria-hidden="true"></i>${lookUserInfo.userInfo_Email }</a></span>
									</div>
								</div>
								<hr>
								<span class="userInfoSpan" data-toggle="tooltip"
									data-placement="top" data-original-title="QQ"><i
									class="fab fa-qq"></i>QQ：${lookUserInfo.userInfo_QQaccount }</span> <span
									class="userInfoSpan" data-toggle="tooltip" data-placement="top"
									data-original-title="微信"><i class="fab fa-weixin"></i>微信：${lookUserInfo.userInfo_WeChat }</span>
								<span class="userInfoSpan" data-toggle="tooltip"
									data-placement="top" data-original-title="GitHub"><i
									class="fab fa-github"></i>GitHub：<a
									href="${lookUserInfo.userInfo_GitHub }" target="_black">点击进入Ta的GitHub</a></span>
							</div>
						</div>
						<div class="boxShadow rightList" align="center">
							<div class="title">网站分享</div>
							<div class="baiduFX rightContext"></div>
						</div>
					</div>
					<div id="indexLeft">
						<c:forEach items="${lnList.learningNotes }" var="lnInfo">
							<div class="lnContext boxShadow">
								<div class="lnImg">
									<img alt="文章图片" class="img-thumbnail lnImage"
										id="img_${lnInfo.myBlog_LearningNotes_id }">
								</div>
								<div class="lnValue">
									<a
										href="${pageContext.request.contextPath }/learningNotes/${lnInfo.learningNotes_PubUser }/${lnInfo.myBlog_LearningNotes_id}">
										<span class="lnTitle"><span class="lnType lnHidden">[${lnInfo.learningNotesType.learningNotes_Type_Name }]</span>
											${lnInfo.learningNotes_Title } </span>
									</a>
									<div class="lnText" id="${lnInfo.myBlog_LearningNotes_id }">${lnInfo.learningNotes_Context }</div>
									<div class="lnMore"
										onclick="javascript:location.href='${pageContext.request.contextPath }/learningNotes/${lnInfo.learningNotes_PubUser }/${lnInfo.myBlog_LearningNotes_id}'">
										<i class="fas fa-hand-point-right"></i>阅读全文
									</div>
									<div class="lnView lnHidden">
										<span class="view"><span class="badge"><i
												class="fa fa-eye i-default" aria-hidden="true"></i>浏览次数：
												${lnInfo.learningNotes_ViewCount }</span></span><span class="view"><span
											class="badge"><i class="fas fa-comment-alt"></i>评论次数：<span
												id="sourceId::/learningNotes/${lnInfo.learningNotes_PubUser }/${lnInfo.myBlog_LearningNotes_id}"
												class="cy_cmt_count"></span></span> <script id="cy_cmt_num"
												src="https://changyan.sohu.com/upload/plugins/plugins.list.count.js?clientId=cytqfnp8B">
													
												</script></span>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<%@ include file="../baseView/pageContext-footer.jsp"%>
		</div>
		<%@ include file="../baseView/pageFooter.jsp"%>
	</div>
	<%@ include file="../baseView/pageUtils.jsp"%>
	<script type="text/javascript">
		$(document).ready(
				function() {
					$(".baiduFX").html(getBaiduFXHTML());
					//读取系统时间
					getTimeHtml();
					$(".lnText").html(
							function(index, html) {
								$(".lnImage:eq(" + index + ")").attr("src",
										getFirstImgSrc(html));
								$(this).html(getContext(html));
							});
				});
	</script>
</body>
</html>