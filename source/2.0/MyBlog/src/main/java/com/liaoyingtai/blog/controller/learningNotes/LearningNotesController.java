package com.liaoyingtai.blog.controller.learningNotes;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.liaoyingtai.blog.entity.learningNotes.LearningNotesCustom;
import com.liaoyingtai.blog.entity.userInfo.UserInfo;
import com.liaoyingtai.blog.service.learningNotes.LearningNotesService;

@Controller
public class LearningNotesController {

	@Autowired
	private LearningNotesService learningNotesService;

	@RequestMapping(value = "learningNotesList/{userId}", method = { RequestMethod.GET })
	public String learningNotesList(Model model, HttpSession session, @PathVariable("userId") String uid,
			LearningNotesCustom learningNotesCustom) throws Exception {
		model.addAttribute("userId", uid);
		// 判断当前登录用户和访问的用户是不是同一人
		UserInfo currentUser = (UserInfo) session.getAttribute("currentUser");
		// 读取文章列表
		learningNotesCustom = learningNotesService.getLearningNotesList(uid, currentUser, learningNotesCustom);
		model.addAttribute("lnList", learningNotesCustom);
		return "learningNotes/learningNotesList";
	}

}