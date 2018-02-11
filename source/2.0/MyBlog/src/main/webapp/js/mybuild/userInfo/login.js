//提交登录
function submitLogin() {
	if (checkUserName() == false) {
		return false;
	}
	if (checkPassWord() == false) {
		return false;
	}
	if (checkCheckCode() == false) {
		return false;
	}
	var userAccount = $(".login-username").val();
	var password = $(".login-password").val();
	var checkcode = $(".login-checkcode").val();
	$.ajax({
		url : basePath + "/login",
		method : "POST",
		data : "userInfo_Account=" + userAccount + "&userInfo_Password="
				+ password + "&checkCode=" + checkcode,
		dataType : "json",
		success : function(data) {
			var obj = eval(data);
			if (obj.status == 1) {
				removeLoginModal();
				location.reload();
			} else {
				if (obj.status == -2) {
					$("#checkCodeImg")
							.attr(
									"src",
									basePath + '/img/checkCode?'
											+ new Date().getTime());
				}
				setErrorMessage(obj.message);
			}
		},
		error : function(e) {
			setErrorMessage("登录出错啦！请刷新页面重试");
			console.log(e);
		}
	});
}
// 提交登录页面
function submitLoginPage() {
	if (checkUserName() == false) {
		return false;
	}
	if (checkPassWord() == false) {
		return false;
	}
	if (checkCheckCode() == false) {
		return false;
	}
	var userAccount = $(".login-username").val();
	var password = $(".login-password").val();
	var checkcode = $(".login-checkcode").val();
	$.ajax({
		url : basePath + "/login",
		method : "POST",
		data : "userInfo_Account=" + userAccount + "&userInfo_Password="
				+ password + "&checkCode=" + checkcode,
		dataType : "json",
		success : function(data) {
			var obj = eval(data);
			if (obj.status == 1) {
				var url = getUrlParms("url");
				location.href = url;
			} else {
				if (obj.status == -2) {
					$("#checkCodeImg")
							.attr(
									"src",
									basePath + '/img/checkCode?'
											+ new Date().getTime());
				}
				setErrorMessage(obj.message);
			}
		},
		error : function(e) {
			setErrorMessage("登录出错啦！请刷新页面重试");
			console.log(e);
		}
	});
}
// 获取URL参数
function getUrlParms(name) {
	var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
	var r = window.location.search.substr(1).match(reg);
	if (r != null)
		return unescape(r[2]);
	return "http://liaoyingtai.com";
}
var id = getUrlParms("id");
// 检查用户账号
function checkUserName(username) {
	if (username == null || username == undefined)
		username = $(".login-username").val();
	var username_regex = /^[0-9a-zA-z_]{6,12}$/
	if (username == null || username == "") {
		setErrorMessage("用户名不能为空");
	} else if (!username_regex.test(username)) {
		setErrorMessage("用户名格式不正确,用户名长度必须为6-12位");
	} else {
		setDefaultMessagt();
		return true;
	}
	return false;
}
// 检查用户密码
function checkPassWord(password) {
	if (password == null || password == undefined)
		password = $(".login-password").val();
	var password_regex = /^[0-9a-zA-z_\.\+\-_]{6,12}$/
	if (password == null || password == "") {
		setErrorMessage("密码不能为空");
	} else if (!password_regex.test(password)) {
		setErrorMessage("密码格式不正确，密码长度为6-18位，可包含.+-_");
	} else {
		setDefaultMessagt();
		return true;
	}
	return false;
}
// 检查验证码
function checkCheckCode(checkcode) {
	if (checkcode == null || checkcode == undefined)
		checkcode = $(".login-checkcode").val();
	var checkCode_regex = /^[0-9a-zA-Z]{4}$/
	if (checkcode == null || checkcode == "") {
		setErrorMessage("验证码不能为空");
	} else if (!checkCode_regex.test(checkcode)) {
		setErrorMessage("验证码格式不正确,验证码位4位字符");
	} else {
		setDefaultMessagt();
		return true;
	}
	return false;
}
// 设置错误提示警告
function setErrorMessage(text) {
	var loginMessage = $("#loginMessage");
	var errorMessage = "<strong>错误！</strong>";
	loginMessage.attr("class", "alert alert-danger");
	loginMessage.html(errorMessage + text);
	var msg = $(".errorMsg");
	if (msg != null && msg != undefined) {
		msg.css("display", "inline-block");
	}
}
// 设置默认警告(不显示警告)
function setDefaultMessagt() {
	var loginMessage = $("#loginMessage");
	loginMessage.attr("class", "");
	loginMessage.html("");
	var msg = $(".errorMsg");
	if (msg != null && msg != undefined) {
		msg.css("display", "none");
	}
}
// 设置成功提示警告
function setSuccessMessage(text) {
	var loginMessage = $("#loginMessage");
	var errorMessage = "<strong>恭喜！</strong>";
	loginMessage.attr("class", "alert alert-success");
	loginMessage.html(errorMessage + text);
}

function loginOut() {
	$.ajax({
		url : basePath + "/loginOut",
		method : "POST",
		dataType : "json",
		success : function(data) {
			console.log(data);
			var obj = eval(data);
			console.log(obj);
			if (obj.status == 1) {
				location.reload();
			} else {
				alert(obj.message)
			}
		},
		error : function(e) {
			alert("注销时出现错误，请刷新后重试！")
			console.log(e);
		}
	})
}