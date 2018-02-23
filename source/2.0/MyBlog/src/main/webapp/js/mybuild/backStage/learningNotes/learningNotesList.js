$(document).ready(function() {
	changeDateFormat();
});
layui.use('table', function() {
	var table = layui.table;

	layui.use('element', function() {
		var $ = layui.jquery, element = layui.element; // Tab的切换功能，切换事件监听等，需要依赖element模块
	});
});
layui
		.use(
				'laypage',
				function() {
					var laypage = layui.laypage;
					// 完整功能
					laypage
							.render({
								elem : 'page',
								count : $("#count").val(),
								layout : [ 'count', 'prev', 'page', 'next',
										'limit', 'skip' ],
								curr : $("#curr").val(),
								jump : function(obj, first) {
									if (!first) {
										$
												.ajax({
													url : basePath
															+ '/backStage/learningNotesList',
													method : 'POST',
													data : {
														'limit' : obj.limit,
														'page' : obj.curr,
														'title' : $("#searchLn")
																.val()
													},
													dataType : 'json',
													success : function(data) {
														var lnData = eval(data);
														var html = '';
														if (lnData.status == 1) {
															var temp_lnInfo = lnData.result.lnList.learningNotes;
															for (var i = 0; i < temp_lnInfo.length; i++) {
																html += '<tr><td>'
																		+ temp_lnInfo[i].myBlog_LearningNotes_id
																		+ '</td><td>'
																		+ temp_lnInfo[i].learningNotes_Title
																		+ '</td><td class="time">'
																		+ dateFormat(temp_lnInfo[i].learningNotes_PubDate)
																		+ '</td><td class="time">'
																		+ dateFormat(temp_lnInfo[i].learningNotes_ModDate)
																		+ '</td><td>';
																if (temp_lnInfo[i].learningNotes_Stick == 1) {
																	html += '置顶';
																} else {
																	html += '非置顶';
																}
																html += '</td><td>';
																if (temp_lnInfo[i].learningNotes_Private == 1) {
																	html += '私有';
																} else if (temp_lnInfo[i].learningNotes_Private == 2) {
																	html += '禁止显示';
																} else {
																	html += '非私有';
																}
																html += '</td><td>';
																if (temp_lnInfo[i].learningNotes_Relay == 1) {
																	html += '允许转发';
																} else {
																	html += '不允许转发';
																}
																html += '</td><td>'
																		+ temp_lnInfo[i].learningNotes_ViewCount
																		+ '</td><td><span id="sourceId::/learningNotes/'
																		+ temp_lnInfo[i].learningNotes_PubUser
																		+ '/'
																		+ temp_lnInfo[i].myBlog_LearningNotes_id
																		+ '"class="cy_cmt_count"></span></td><td><button class="layui-btn layui-btn-xs">'
																		+ '查看全文</button><button class="layui-btn layui-btn-xs layui-btn-normal">修改文章</button>'
																		+ '<button class="layui-btn layui-btn-xs layui-btn-danger">删除文章</button></td></tr>';
															}
															html += '<script id="cy_cmt_num" src="https://changyan.sohu.com/upload/plugins/plugins.list.count.js?clientId=cytqfnp8B"></sc'
																	+ 'ript>';
															obj.count = lnData.result.lnList.totalCount;
															obj.curr = lnData.result.lnList.page;
														} else {
															obj.count = 0;
															obj.curr = 1;
															html += '<tr><td>'
																	+ lnData.message
																	+ '</td></tr>';
														}
														$("#lnList").html(html);
														window.parent
																.changeFrameHeight('myIFrame');
													},
													error : function(e) {
														console.log(e);
													}
												});
									}
								}
							});
				});
function changeDateFormat() {
	$(".time").html(function(index, html) {
		var format = "yyyy年MM月dd日 hh时mm分ss秒";
		var date = dateFormat(html, format);
		return date;
	});
}