// 读取文章类型
function getLNType(url) {
	$.ajax({
		url : url + "/ajax/getLNType",
		method : "post",
		dataType : "json",
		success : function(data) {
			var obj = eval(data);
			if (obj.status == 1) {
				var result = obj.result.lnType;
				$("#pubType").append("<option value='-1'>请选择文章类型</option>");
				for (var i = 0; i < result.length; i++) {
					$("#pubType").append(
							"<option value='"
									+ result[i].myBlog_LearningNotes_Type_id
									+ "'>" + result[i].learningNotes_Type_Name
									+ "</option>");
				}
			} else {
				alert(obj.message);
			}
		},
		error : function(e) {
			alert("请求出错,请刷新页面重新请求。错误信息：" + e);
			console.log(e);
		}
	})
}
// 发表文章
function pubLearningNotes(um, url) {
	var title = $("#pubTitleValue").val();
	var context = um.getContent();
	if (um.hasContents() == false) {
		$("#publishLNMessage").html("请输入正文内容");
		return;
	}
	var lnStick = 0;
	if ($("#lnStick").is(':checked')) {
		lnStick = 1;
	}
	var lnPrivate = 0;
	if ($("#lnPrivate").is(':checked')) {
		lnPrivate = 1;
	}
	var lnRelay = 0;
	if ($("#lnRelay").is(':checked')) {
		lnRelay = 1;
	}
	var lnComment = 0;
	if ($("#lnComment").is(':checked')) {
		lnComment = 1;
	}
	var pubType = $("#pubType").val();
	if (pubType == -1) {
		$("#publishLNMessage").html("请选择文章类型");
		return;
	}
	var pubTags = $("#pubTags").val();
	$.ajax({
		url : url + "/ajax/pubLearningNotes",
		method : 'post',
		data : {
			"learningNotes_Title" : title,
			"learningNotes_Context" : context,
			"learningNotes_Stick" : lnStick,
			"learningNotes_Private" : lnPrivate,
			"learningNotes_Relay" : lnRelay,
			"learningNotes_Comment" : lnComment,
			"learningNotes_Tags" : pubTags,
			"learningNotes_Type_id" : pubType
		},
		dataType : 'json',
		success : function(data) {
			var obj = eval(data);
			if (obj.status == 1) {
				var uid = obj.result.userId;
				window.location.href = url + "/learningNotesList/" + uid;
			} else {
				$("#publishLNMessage").html(obj.message);
			}
		},
		error : function(e) {
			alert("发布文章出错啦，请刷新后重试！");
			console.log(e);
		}
	})
}
// 关键字格式化
function keywordFormat() {
	var value = $("#pubTags").val();
	value = value.replace("，", ",");
	$("#pubTags").val(value);
}