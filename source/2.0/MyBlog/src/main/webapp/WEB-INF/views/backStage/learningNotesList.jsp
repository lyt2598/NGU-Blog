<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@include file="baseView/pageBaseCSS.jsp"%>
<%@include file="baseView/pageBaseJS.jsp"%>
</head>
<body>
	<div class="demoTable">
		搜索ID：
		<div class="layui-inline">
			<input class="layui-input" name="id" id="demoReload"
				autocomplete="off">
		</div>
		<button class="layui-btn" data-type="reload">搜索</button>
	</div>
	<table class="layui-hide" id="LAY_table_ln" lay-filter="user"></table>
	<script>
		layui.use('table', function() {
			var table = layui.table;
			//方法级渲染
			table.render({
				elem : '#LAY_table_user',
				url : '/demo/table/user/',
				cols : [ [ {
					checkbox : true,
					fixed : true
				}, {
					field : 'id',
					title : 'ID',
					width : 80,
					sort : true,
					fixed : true
				}, {
					field : 'username',
					title : '用户名',
					width : 80
				}, {
					field : 'sex',
					title : '性别',
					width : 80,
					sort : true
				}, {
					field : 'city',
					title : '城市',
					width : 80
				}, {
					field : 'sign',
					title : '签名'
				}, {
					field : 'experience',
					title : '积分',
					sort : true,
					width : 80
				}, {
					field : 'score',
					title : '评分',
					sort : true,
					width : 80
				}, {
					field : 'classify',
					title : '职业',
					width : 80
				}, {
					field : 'wealth',
					title : '财富',
					sort : true,
					width : 135
				} ] ],
				id : 'testReload',
				page : true,
				height : 315
			});

			var $ = layui.$, active = {
				reload : function() {
					var demoReload = $('#demoReload');
					table.reload('testReload', {
						page : {
							curr : 1
						},
						where : {
							key : {
								id : demoReload.val()
							}
						}
					});
				}
			};

			$('.demoTable .layui-btn').on('click', function() {
				var type = $(this).data('type');
				active[type] ? active[type].call(this) : '';
			});
		});
	</script>
</body>
</html>