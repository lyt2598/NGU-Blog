<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改用户信息</title>
</head>
<body>
<div class="layui-tab layui-tab-card">
  <ul class="layui-tab-title">
    <li class="layui-this">用户信息</li>
    <li>修改信息</li>
    <li>上传头像</li>
  </ul>
  <div class="layui-tab-content" style="height: 100px;">
    <div class="layui-tab-item layui-show">默认宽度是相对于父元素100%适应的，你也可以固定宽度。</div>
    <div class="layui-tab-item">2</div>
    <div class="layui-tab-item">3</div>
    <div class="layui-tab-item">4</div>
    <div class="layui-tab-item">5</div>
    <div class="layui-tab-item">6</div>
  </div>
</div>

<script>
layui.use('element', function(){
  var $ = layui.jquery
  ,element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块
});
</script>
</body>
</html>