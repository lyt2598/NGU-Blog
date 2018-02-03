package com.liaoyingtai.blog.controller.index;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.liaoyingtai.blog.entity.learningNotes.LearningNotesCustom;
import com.liaoyingtai.blog.entity.userInfo.UserInfo;
import com.liaoyingtai.blog.exception.base.MyExceptionResolverResultPage;
import com.liaoyingtai.blog.service.learningNotes.LearningNotesService;
import com.liaoyingtai.blog.service.userinfo.UserInfoService;

@Controller
public class IndexController extends MyExceptionResolverResultPage {

	@Autowired
	private LearningNotesService learningNotesService;
	@Autowired
	private UserInfoService userInfoService;

	@RequestMapping(value = "index/{userId}", method = { RequestMethod.GET })
	public String index(Model model, @PathVariable("userId") String uid) throws Exception {
		model.addAttribute("userId", uid);
		// 读取文章列表
		LearningNotesCustom learningNotesCustom = new LearningNotesCustom();
		learningNotesCustom.setPage(1);
		learningNotesCustom.setLimit(5);
		learningNotesCustom = learningNotesService.getLearningNotesList(uid, null, learningNotesCustom);
		model.addAttribute("lnList", learningNotesCustom);
		// 读取用户信息
		UserInfo userInfo = userInfoService.getPortionUserInfoById(uid);
		model.addAttribute("userInfo", userInfo);
		return "index";
	}
}
