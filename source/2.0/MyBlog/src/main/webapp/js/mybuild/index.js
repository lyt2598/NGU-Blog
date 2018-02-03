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
	return text.replace(reTag, "");
}
// 读取当前时间
function getTimeHtml() {
	var date = new Date().format("yyyy年MM月dd日 hh:mm:ss");
	var html = '<i class="fas fa-clock"></i>'
			+ date
	$(".dataTime").html(html);
	setTimeout("getTimeHtml()", 1000);
}
