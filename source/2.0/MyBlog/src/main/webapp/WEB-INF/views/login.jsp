<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="keywords"
	content="LYT-NGU个人主页，www.liaoyingtai.com，95后 Java 程序员，技能专长：JAVA、Python、C#、易语言、
	PHP、HTML、Js、JQuery、AJAX、Bootstrap、UEditor、Echarts、Spring、SpringMVC、Status2、Hibernate、
	MyBatis、Maven、Linux、Tomcat、Git、SQLSserver、MySQL、PostgreSQL，等">
<meta name="description"
	content="LYT-NGU个人主页，www.liaoyingtai.com，JAVA，Python，C#，易语言，
	PHP，HTML，Js，JQuery，AJAX，Bootstrap，UEditor，Echarts，Spring，SpringMVC，Status2，Hibernate，
	MyBatis，Maven，Linux，Tomcat，Git，SQLSserver，MySQL，PostgreSQL，等">
<title>登陆&nbsp;-&nbsp;个人主页&nbsp;-&nbsp;Nerver&nbsp;Give&nbsp;Up</title>
<link
	href="${pageContext.request.contextPath }/css/mybuild/userInfo/loginPage.css"
	rel='stylesheet' type='text/css' />
<script
	src="${pageContext.request.contextPath }/js/referenced/jquery/jquery-3.2.1.min.js"></script>
<script
	src="${pageContext.request.contextPath }/js/mybuild/userInfo/login.js"></script>
<script type="text/javascript">
	var basePath = '${pageContext.request.contextPath}';
</script>
</head>
<body>
	<div class="login-form">
		<div class="top-login">
			<span><img
				src="${pageContext.request.contextPath }/img/user/head/default.png"
				alt="" width="64px" height="64px" /></span>
		</div>
		<a href="${pageContext.request.contextPath }"><h1>登录 - Nerver
				Give Up</h1></a>
		<div class="login-top">
			<div id="loginMessage" class="errorMsg" align="center"></div>
			<div class="login-ic">
				<i title="用户名"></i> <input type="text" placeholder="请输入用户名"
					id="login_username" class="login-username" />
				<div class="clear"></div>
			</div>
			<div class="login-ic">
				<i class="icon" title="密码"></i> <input type="password"
					placeholder="请输入密码" class="login-password" id="login_password"
					onfocus="checkUserName()" />
				<div class="clear"></div>
			</div>
			<div class="login-ic">
				<i class="checkcode" title="点击此处获取验证码"></i> <input type="text"
					placeholder="请输入验证码" class="login-checkcode" id="login_checkcode"
					onfocus="checkPassWord()" onblur="checkCheckCode()" />
				<div class="clear"></div>
			</div>
			<div class="login-ic">
				<img src="${pageContext.request.contextPath }/img/checkCode"
					alt="点击此处读取验证码" height="130px" width="100%" title="看不清？点击即可更换"
					onclick="this.src='${pageContext.request.contextPath }/img/checkCode?'+ new Date().getTime()">
			</div>
			<div class="log-bwn">
				<input type="submit" value="立即登录" onclick="submitLoginPage()">
			</div>
		</div>
		<p class="copy">
			Copyright© Nerver Give Up - lyt 版权所有&nbsp;&nbsp; Design by DanceSmile
			<a href="http://www.miitbeian.gov.cn/" target="_black">湘ICP备18000987号</a>
		</p>
	</div>
</body>
</html>