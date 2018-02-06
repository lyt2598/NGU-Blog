<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!-- 登陆模态框 -->
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" data-backdrop="static"
	aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">Nerver Give Up -
					Login (登录)</h4>
			</div>
			<div class="modal-body">
				<div id="loginMessage"></div>
				<div id="loginBody" align="center">
					<div class="input-group col-sm-8" style="padding-bottom: 20px;">
						<span class="input-group-addon">用户名：</span> <input
							id="login_username" type="text"
							class="form-control login-username" placeholder="请输入用户名">
					</div>
					<div class="input-group col-sm-8" style="padding-bottom: 20px;">
						<span class="input-group-addon">密&nbsp;&nbsp;&nbsp;&nbsp;码：</span>
						<input id="login_password" type="password"
							class="form-control login-password" placeholder="请输入用户口令"
							onfocus="checkUserName()">
					</div>
					<div class="input-group col-sm-8" style="padding-bottom: 20px;">
						<span class="input-group-addon">验证码：</span> <input
							id="login_checkcode" type="text"
							class="form-control login-checkcode" placeholder="请输入验证码"
							onfocus="checkPassWord()" onblur="checkCheckCode()">
					</div>
					<div class="input-group col-sm-8">
						<img src="${pageContext.request.contextPath }/img/checkCode"
							class="img-rounded" id="checkCodeImg" height="130px" width="100%"
							title="看不清？点击即可更换"
							onclick="this.src='${pageContext.request.contextPath }/img/checkCode?'+ new Date().getTime()" />
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary"
					onclick="submitLogin()">立即登录</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal -->
</div>
<!-- 搜索模态框 -->
<div class="modal fade" id="searchModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" data-backdrop="static"
	aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header-custom">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<div class="search-icon">
					<i class="fa fa-search" aria-hidden="true"></i>
				</div>
				<input type="text" id="searchData" class="search-text"
					placeholder="请输入需要查询的内容">
			</div>
			<div class="modal-body modal-body-custom">
				<div class="no-search-result">
					<i class="fab fa-linux fa-5x"></i>
					<p>请输入需要查找的内容</p>
				</div>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal -->
</div>
<div id="floatMenu">
	<div id="goTop" class="floatMenuList noselect" align="center">
		<i class="fa fa-chevron-up" aria-hidden="true"></i> <span class="text">回到顶部</span>
	</div>
	<div id="qrcode" class="floatMenuList noselect" align="center">
		<div class="context" style="text-align: center;">
			<img alt="二维码"
				src="${pageContext.request.contextPath }/img/qrcode.png"
				width="200px" height="200px">
		</div>
		<i class="fas fa-qrcode"></i> <span class="text">二维码</span>
	</div>
	<div id="fx" class="floatMenuList noselect" align="center"
		onclick="AddFavorite()">
		<i class="fas fa-plus"></i><span class="text">收藏本站</span>
	</div>
	<div id="info" class="floatMenuList noselect" align="center">
		<div class="context">
			<h2>关于本站</h2>
			<p>网址：www.liaoyingtai.com</p>
			<p>用途：主要用来记录在学习过程中遇到的问题与解决方法</p>
			<p>开发人员：LiaoYingTai</p>
			<p>
				<font color="red">*手机端点击空白处即可隐藏本窗口</font>
			</p>
		</div>
		<i class="fas fa-info-circle"></i> <span class="text">关于本站</span>
	</div>
</div>