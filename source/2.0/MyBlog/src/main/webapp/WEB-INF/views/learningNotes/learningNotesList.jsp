<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>${lookUserInfo.userInfo_Name }&nbsp;-&nbsp;学习笔记&nbsp;-&nbsp;个人主页&nbsp;-&nbsp;Nerver&nbsp;Give&nbsp;Up</title>
<%@ include file="../../baseView/pageBaseCSS.jsp"%>
<%@ include file="../../baseView/pageBaseJS.jsp"%>
<script
	src="${pageContext.request.contextPath }/js/mybuild/utils/dateFormat.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/mybuild/learningNotes/learningNotesList.css">
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
					<li class="active">学习笔记</li>
				</ol>
				<!-- 正文内容 -->
				<div class="lnBody">
					<div class="page-header">
						<h1>
							学习笔记 <small>学无止境</small>
						</h1>
					</div>
					<p>以下文章均为个人学习时得出的结论以及碰到的问题的整理,如果有不对的地方欢迎大家指出。</p>
					<div class="table-menu">
						<form class="bs-example bs-example-form form-inline"
							action="${pageContex.request.contextPath }/learningNotesList/${userId}">
							<div class="input-group">
								<input type="text" id="searchData" class="form-control"
									placeholder="请输入需要查询的内容"><span class="input-group-btn"><button
										title="点击查询" class="btn btn-default searchButton"
										onclick="search('${userId}')">
										<i class="fa fa-search"></i>
									</button></span>
							</div>
						</form>
					</div>
					<table class="table table-striped table-bordered table-condensed">
						<thead>
							<tr class="noselect">
								<th class="textAlign ln-hidden">#</th>
								<th>文章标题</th>
								<th class="ln-hidden">发布时间</th>
								<th class="ln-hidden">浏览次数</th>
								<th class="ln-hidden">评论次数</th>
							</tr>
						</thead>
						<tbody id="table-body">
							<c:choose>
								<c:when test="${lnList.totalCount>0}">
									<c:forEach items="${lnList.learningNotes }" var="ln">
										<tr>
											<td class="textAlign ln-hidden"><c:choose>
													<c:when test="${ln.learningNotes_Stick==1 }">
														<tr>
															<a class="a-i" title="置頂文章"><i
																class="fas fa-thumbtack"></i></a>
													</c:when>
													<c:otherwise>
														<i class="fa fa-list-alt" aria-hidden="true"></i>
													</c:otherwise>
												</c:choose></td>
											<td><div class="lnTitle">
													<span class="lnListType">[${ln.learningNotesType.learningNotes_Type_Name }]</span>&nbsp;<a
														href="${pageContext.request.contextPath }/learningNotes/${userId }/${ln.myBlog_LearningNotes_id }"
														title="${ln.learningNotes_Title }">${ln.learningNotes_Title }</a>
													<c:choose>
														<c:when test="${ln.learningNotes_Private==1 }">
															<a class="a-i" title="此文章仅自己可见"><i
																class="fas fa-eye-slash"></i></a>
														</c:when>
														<c:when test="${ln.learningNotes_Private==2 }">
															<a class="a-i" title="此文章已被举报多次,禁止显示.请立即修改"><i
																class="fas fa-exclamation-triangle"></i></a>
														</c:when>
													</c:choose>
												</div></td>
											<td class="ln-hidden"><i class="fas fa-clock"></i>${ln.learningNotes_PubDate }</td>
											<td class="ln-hidden"><i class="fa fa-eye i-default"
												aria-hidden="true"></i>${ln.learningNotes_ViewCount }</td>
											<td class="ln-hidden"><i class="fas fa-comment-alt"></i><span
												id="sourceId::/learningNotes/${ln.learningNotes_PubUser }/${ln.myBlog_LearningNotes_id }"
												class="cy_cmt_count"></span> <script id="cy_cmt_num"
													src="https://changyan.sohu.com/upload/plugins/plugins.list.count.js?clientId=cytqfnp8B"></script></td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<th>
									<td colspan="5" class="textAlign table-load">没有查询到文章列表信息</td>
									</th>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
					<div id="paging" align="center">
						<ul class="pagination">
							<c:choose>
								<c:when test="${lnList.page<=1 }">
									<li class="disabled"><a href="javascript:void(0);">&laquo;</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="javascript:void(0);" onclick="">&laquo;</a></li>'</c:otherwise>
							</c:choose>
							<c:set var="starPage" value="1" />
							<c:set var="endPage" value="5" />
							<c:choose>
								<c:when test="${lnList.totalPage>5 && lnList.page>=3 }">
									<c:when test="${lnList.page+2<=lnList.totalPage }">
										<c:set var="starPage" value="${lnList.page-2 }" />
										<c:set var="endPage" value="${lnList.page+2 }" />
									</c:when>
									<c:otherwise>
										<c:set var="starPage" value="${lnList.totalPage-4 }" />
										<c:set var="endPage" value="${lnList.totalPage }" />
									</c:otherwise>
								</c:when>
								<c:otherwise>
									<c:set var="endPage" value="${lnList.totalPage }" />
								</c:otherwise>
							</c:choose>
							<c:forEach begin="${starPage }" end="${endPage }" varStatus="i">
								<c:choose>
									<c:when test="${starPage==lnList.page }">
										<li class="disabled"><a href="javascript:void(0);">${i.index }</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="javascript:void(0);" onclick="">${i.index }</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:choose>
								<c:when
									test="${lnList.totalPage==1 || lnList.page>=lnList.totalPage }">
									<li class="disabled"><a href="javascript:void(0);">&raquo;</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="javascript:void(0);" onclick="">&raquo;</a></li>'
								</c:otherwise>
							</c:choose>
						</ul>
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