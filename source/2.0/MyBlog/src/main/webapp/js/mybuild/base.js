function getBaiduFXHTML() {
	var html = '<div class="bdsharebuttonbox"><a href="#" class="bds_more" data-cmd="more"></a>'
			+ '<a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a>'
			+ '<a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a>'
			+ '<a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a>'
			+ '<a href="#" class="bds_sqq" data-cmd="sqq" title="分享到QQ好友"></a>'
			+ '<a href="#" class="bds_tieba" data-cmd="tieba" title="分享到百度贴吧"></a>'
			+ '<a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a>'
			+ '<a href="#" class="bds_renren" data-cmd="renren" title="分享到人人网"></a>'
			+ '<a href="#" class="bds_bdhome" data-cmd="bdhome" title="分享到百度新首页"></a>'
			+ '<a href="#" class="bds_fbook" data-cmd="fbook" title="分享到Facebook"></a>'
			+ '<a href="#" class="bds_evernotecn" data-cmd="evernotecn" title="分享到印象笔记"></a>'
			+ '<a href="#" class="bds_linkedin" data-cmd="linkedin" title="分享到linkedin"></a>'
			+ '<a href="#" class="bds_print" data-cmd="print" title="分享到打印"></a>'
			+ '<a href="#" class="bds_copy" data-cmd="copy" title="分享到复制网址"></a></div>';
	return html;
}
// 添加到收藏夹
function AddFavorite(){
	var title=$("title").html();
	var url=window.location.href;
	try{
		window.external.addFavorite(url,title);
	}catch(e){
		try{
			window.sidebar.addPanel(title,url,"");
		}catch(e){
		   alert("抱歉，您所使用的浏览器无法完成此操作。\n\n请使用快捷键Ctrl+D进行添加！");
		}
	}
}
$(function() {
	$(window).scroll(function() {
		var scrollTop = $(this).scrollTop();
		if (scrollTop > 100) {
			$("#goTop").fadeIn(500);
		} else {
			$("#goTop").fadeOut(500);
		}
	});
	$("[data-toggle='tooltip']").tooltip({html : true });
	// 登陆窗口被隐藏时动作
	$('#loginModal').on('hide.bs.modal', function() {
		$("#loginModal #login_username").val("");
		$("#loginModal #login_password").val("");
		$("#loginModal #login_checkcode").val("");
		$("#loginModal #loginMessage").html("");
		$("#loginModal #loginMessage").removeAttr("class");
	});
	$('#searchModal').on('hide.bs.modal', function() {
		$("#searchModal #searchData").val("");
		$("#loginModal .modal-body").html('<div class="no-search-result"><i class="fa fa-frown-o fa-5x"></i><p>没有找到符合要求的内容</p></div>');
	});
	// 当点击跳转链接后，回到页面顶部位置
	$("#goTop").click(function() {
		if ($('html').scrollTop()) {
			$('html').animate({
				scrollTop : 0
			}, 100);// 动画效果
			return false;
		}
		$('body').animate({
			scrollTop : 0
		}, 100);
		$(this).blur();
		return false;
	});
	$(".floatMenuList").hover(function(){
		$(".text",this).css("display","block");
		$(".context",this).css("display","block");
		$("i",this).css("display","none");
	},function(){
		$(".text",this).css("display","none");
		$(".context",this).css("display","none");
		$("i",this).css("display","block");
	});
	var bp = document.createElement('script');
	var curProtocol = window.location.protocol.split(':')[0];
	if (curProtocol === 'https') {
		bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';
	} else {
		bp.src = 'http://push.zhanzhang.baidu.com/push.js';
	}
	var s = document.getElementsByTagName("script")[0];
	s.parentNode.insertBefore(bp, s);
});
// 百度分享
window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"LYT - NGU - 个人主页 www.liaoyingtai.com","bdMini":"1","bdMiniList":false,"bdPic":"http://liaoyingtai.com/img/favicon.png","bdStyle":"0","bdSize":"16"},"share":{},"image":{"viewList":["weixin","qzone","tsina","sqq","tieba","tqq","renren","bdhome","fbook","evernotecn","linkedin","print","copy"],"viewText":"分享到：","viewSize":"16"},"selectShare":{"bdContainerClass":null,"bdSelectMiniList":["weixin","qzone","tsina","sqq","tieba","tqq","renren","bdhome","fbook","evernotecn","linkedin","print","copy"]}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];