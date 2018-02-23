<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学习笔记管理&nbsp;-&nbsp;个人中心&nbsp;-&nbsp;NGU&nbsp;个人主页</title>
<%@include file="../baseView/pageBaseCSS.jsp"%>
<%@include file="../baseView/pageBaseJS.jsp"%>
</head>
<body>
	<div class="layui-tab layui-tab-card">
		<ul class="layui-tab-title">
			<li class="layui-this" lay-id="00">笔记管理</li>
		</ul>
		<div class="layui-tab-content">
			<div class="layui-tab-item layui-show">
				<div class="demoTable">
					<form
						action="${pageContext.request.contextPath }/backStage/learningNotesList"
						method="get">
						标题：
						<div class="layui-inline">
							<input class="layui-input" value="${lnInfo.title }" name="title"
								id="searchLn" autocomplete="off">
						</div>
						<button class="layui-btn" data-type="reload">搜索</button>
					</form>
				</div>
				<input type="hidden" id="count" value="${lnInfo.totalCount }">
				<input type="hidden" id="curr" value="${lnInfo.page }">
				<table class="layui-table" lay-even="" lay-skin="row">
					<thead>
						<tr>
							<th>文章编号</th>
							<th width="390px">文章标题</th>
							<th>发表时间</th>
							<th>修改时间</th>
							<th>置顶文章</th>
							<th>是否私有</th>
							<th>转发权限</th>
							<th>浏览次数</th>
							<th>评论次数</th>
							<th>其他操作</th>
						</tr>
					</thead>
					<tbody id="lnList">
						<c:choose>
							<c:when test="${lnInfo.totalCount>0 }">
								<c:forEach items="${lnInfo.learningNotes }" var="learningNotes">
									<tr>
										<td>${learningNotes.myBlog_LearningNotes_id }</td>
										<td class="listTitle">${learningNotes.learningNotes_Title }</td>
										<td class="time">${learningNotes.learningNotes_PubDate }</td>
										<td class="time">${learningNotes.learningNotes_ModDate }</td>
										<td>${learnintNotes.learningNotes_Stick==1?'置顶':'非置顶' }</td>
										<td>${learningNotes.learningNotes_Private==1?'私有':learningNotes.learningNotes_Private==2?'禁止显示':'非私有' }</td>
										<td>${learningNotes.learningNotes_Relay==1?'允许转发':'不允许转发'}</td>
										<td>${learningNotes.learningNotes_ViewCount }</td>
										<td><span
											id="sourceId::/learningNotes/${learningNotes.learningNotes_PubUser }/${learningNotes.myBlog_LearningNotes_id }"
											class="cy_cmt_count"></span></td>
										<td><button class="layui-btn layui-btn-xs">查看全文</button>
											<button class="layui-btn layui-btn-xs layui-btn-normal">修改文章</button>
											<button class="layui-btn layui-btn-xs layui-btn-danger">删除文章</button></td>
									</tr>
								</c:forEach>
								<script id="cy_cmt_num"
									src="https://changyan.sohu.com/upload/plugins/plugins.list.count.js?clientId=cytqfnp8B"></script>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="10" align="center">没有查询到相关内容</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
				<div align="center">
					<div id="page"></div>
				</div>
			</div>
		</div>
	</div>
	<script
		src="${pageContext.request.contextPath }/js/mybuild/utils/dateFormat.js"></script>
	<script
		src="${pageContext.request.contextPath }/js/mybuild/backStage/learningNotes/learningNotesList.js"></script>
</body>
</html>