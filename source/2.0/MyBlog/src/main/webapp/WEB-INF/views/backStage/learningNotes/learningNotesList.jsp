<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@include file="../baseView/pageBaseCSS.jsp"%>
<%@include file="../baseView/pageBaseJS.jsp"%>
</head>
<body>
	<div class="layui-tab layui-tab-card">
		<ul class="layui-tab-title">
			<li class="layui-this" lay-id="00">笔记管理</li>
		</ul>
		<div class="layui-tab-content" style="height: 100px;">
			<div class="layui-tab-item layui-show">
				<div class="demoTable">
					标题：
					<div class="layui-inline">
						<input class="layui-input" name="id" id="searchLn"
							autocomplete="off">
					</div>
					<button class="layui-btn" data-type="reload">搜索</button>
				</div>
				<table class="layui-table" lay-filter="lnTable">
				</table>
			</div>
		</div>
	</div>
	<script type="text/html" id="barDemo">
	  <a class="layui-btn layui-btn-xs" lay-event="detail">查看</a>
	  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
	  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
	</script>
	<script>
		layui.use('table', function() {
			var table = layui.table;
			table.render({
				url : '/demo/table/user/',
				page : true,
				id : 'lnListTable',
				cols : [ [ {
					type : 'checkbox',
					fixed : 'left'
				}, {
					field : 'id',
					width : 200,
					sort : true,
					fixed : true,
					title : 'ID'
				}, {
					field : 'score',
					title : '笔记类别'
				}, {
					field : 'username',
					title : '文章标题'
				}, {
					field : 'sex',
					title : '发布时间',
					sort : true
				}, {
					field : 'city',
					title : '修改时间',
					sort : true
				}, {
					field : 'sign',
					title : '是否置顶文章'
				}, {
					field : 'experience',
					title : '是否首页推存'
				}, {
					field : 'classify',
					title : '是否私有'
				}, {
					field : 'wealth',
					title : '是否允许转发'
				}, {
					field : 'score',
					title : '浏览次数'
				}, {
					fixed : 'right',
					width : 178,
					align : 'center',
					toolbar : '#barDemo'
				} ] ]
			});
		});
		layui.use('element', function() {
			var $ = layui.jquery, element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块
		});
	</script>
</body>
</html>