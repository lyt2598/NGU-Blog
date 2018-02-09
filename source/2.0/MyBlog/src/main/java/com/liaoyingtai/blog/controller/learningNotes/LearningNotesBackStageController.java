package com.liaoyingtai.blog.controller.learningNotes;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.liaoyingtai.blog.annotation.CheckUserLogin;
import com.liaoyingtai.blog.annotation.NotLoadHeadMenu;
import com.liaoyingtai.blog.entity.learningNotes.LearningNotesCustom;
import com.liaoyingtai.blog.entity.userInfo.UserInfo;
import com.liaoyingtai.blog.exception.base.MyExceptionResolverResultPage;
import com.liaoyingtai.blog.service.learningNotes.LearningNotesService;

@Controller
@RequestMapping("/backStage")
public class LearningNotesBackStageController extends MyExceptionResolverResultPage {

	@Autowired
	private LearningNotesService learningNotesService;

	@NotLoadHeadMenu
	@CheckUserLogin
	@RequestMapping(value = "learningNotesList", method = { RequestMethod.GET })
	public String learningNotesList(Model model, HttpSession session, LearningNotesCustom learningNotesCustom)
			throws Exception {
		UserInfo currentUser = (UserInfo) session.getAttribute("currentUser");
		learningNotesCustom = learningNotesService.getLearningNotesList(currentUser.getMyBlog_UserInfo_id(),
				currentUser, learningNotesCustom);
		model.addAttribute("lnList", learningNotesCustom);
		return "backStage/learningNotesList";
	}

}
