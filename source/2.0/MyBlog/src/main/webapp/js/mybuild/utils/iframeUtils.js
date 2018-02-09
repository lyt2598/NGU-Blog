// document.domain = "xxx.com";//如果跨域就需要设置此项
function changeFrameHeight(id) {
	var ifm = document.getElementById(id);
	var obj;
	try {
		obj = ifm.contentDocument;
	} catch (e) {
		obj = ifm.contentWindow.document;
	}
	var subWeb = document.frames ? document.frames[id].document : obj;
	if (ifm != null && subWeb != null) {
		ifm.setAttribute('height', 'auto');
		ifm.height = subWeb.body.scrollHeight;
	}
}