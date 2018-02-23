layui
		.use(
				[ 'form', 'layedit', ],
				function() {
					var form = layui.form, layer = layui.layer, layedit = layui.layedit, laydate = layui.laydate;
					form.render('select');
				});
$(document).ready(function(e) {
	var ue = UE.getEditor('myEditor');
	var url = parent.basePath;
	getLNType(url);
	$('#publishLN').click(function() {
		pubLearningNotes(ue, url, true);
		window.parent.changeFrameHeight('myIFrame');
	});
	window.parent.changeFrameHeight('myIFrame');
})