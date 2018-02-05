// 读取第一张图片路径
function getFirstImgSrc(text) {
	var regexp = new RegExp("(<img.*src=\"\.*?\>)");
	var value = text.match(regexp);
	if (value == null) {
		return basePath + "/img/learningNotes/default.png";
	}
	regexp = /src="([^"]*)"/g;
	var resultSrc = value[0].match(regexp);
	if (resultSrc == null) {
		return basePath + "/img/learningNotes/default.png";
	}
	var i = "src=\"".length;
	resultSrc = resultSrc[0].substring(i, resultSrc[0].length - 1);
	return resultSrc;
}
// 读取纯文本内容，剔除html标签
function getContext(text) {
	var reTag = /<(?:.|\s)*?>/g;
	var html = text.replace(reTag, "");
	html = cutString(html, 280);
	return html;
}
// 读取当前时间
function getTimeHtml() {
	var date = new Date().format("yyyy年MM月dd日 hh:mm:ss");
	var html = '<i class="fas fa-clock"></i>' + date
	$(".dataTime").html(html);
	setTimeout("getTimeHtml()", 1000);
}
// 设置首页文章列表内容
function setIndexLNList() {
	$(".lnText").html(function(index) {
		var html = $("input", this).val();
		$(".lnImage:eq(" + index + ")").attr("src", getFirstImgSrc(html));
		$(this).html(getContext(html));
	});
}
// 计算出超出文本超出内容
function cutString(str, len) {
	// length属性读出来的汉字长度为1
	if (str.length * 2 <= len) {
		return str;
	}
	var strlen = 0;
	var s = "";
	for (var i = 0; i < str.length; i++) {
		s = s + str.charAt(i);
		if (str.charCodeAt(i) > 128) {
			strlen = strlen + 2;
			if (strlen >= len) {
				return s.substring(0, s.length - 1) + "...";
			}
		} else {
			strlen = strlen + 1;
			if (strlen >= len) {
				return s.substring(0, s.length - 2) + "...";
			}
		}
	}
	return s;
}