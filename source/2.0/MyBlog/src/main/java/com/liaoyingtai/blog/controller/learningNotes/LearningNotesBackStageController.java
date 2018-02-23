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
@NotLoadHeadMenu
@CheckUserLogin
@RequestMapping("/backStage")
public class LearningNotesBackStageController extends MyExceptionResolverResultPage {

	@Autowired
	private LearningNotesService learningNotesService;

	@RequestMapping(value = "learningNotesList", method = { RequestMethod.GET })
	public String learningNotesList(HttpSession session, Model model, String title) throws Exception {
		UserInfo userInfo = (UserInfo) session.getAttribute("currentUser");
		LearningNotesCustom learningNotesCustom = new LearningNotesCustom();
		learningNotesCustom.setTitle(title);
		learningNotesCustom = learningNotesService.getLearningNotesList(userInfo.getMyBlog_UserInfo_id(), userInfo,
				learningNotesCustom);
		model.addAttribute("lnInfo", learningNotesCustom);
		return "backStage/learningNotes/learningNotesList";
	}

	@RequestMapping(value = "pubLearningNotes", method = { RequestMethod.GET })
	public String pubLearningNotes() throws Exception {
		return "backStage/learningNotes/pubLearningNotes";
	}

}
