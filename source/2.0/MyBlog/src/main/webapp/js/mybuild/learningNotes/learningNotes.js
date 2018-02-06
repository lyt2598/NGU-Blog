
function getLNTagsHtml(tags) {
	if (tags == null || tags == "") {
		return "";
	}
	var html = '<span class="label label-primary"><i class="fas fa-tags"></i>本文标签：</span>';
	tags = tags.split(",");
	for (var i = 0; i < tags.length; i++) {
		html += '<span class="label label-default" data-toggle="tooltip" data-placement="top" title="标签：'
				+ tags[i] + '">' + tags[i] + '</span>';
	}
	return html;
}