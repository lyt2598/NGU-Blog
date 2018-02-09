package com.liaoyingtai.blog.controller.learningNotes;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.liaoyingtai.blog.annotation.CheckUserLogin;
import com.liaoyingtai.blog.entity.learningNotes.LearningNotes;
import com.liaoyingtai.blog.entity.learningNotes.LearningNotesCustom;
import com.liaoyingtai.blog.entity.userInfo.UserInfo;
import com.liaoyingtai.blog.exception.base.MyExceptionResolverResultPage;
import com.liaoyingtai.blog.service.learningNotes.LearningNotesService;

@Controller
public class LearningNotesController extends MyExceptionResolverResultPage {

	@Autowired
	private LearningNotesService learningNotesService;

	@RequestMapping(value = "learningNotesList/{userId}", method = { RequestMethod.GET })
	public String learningNotesList(Model model, HttpSession session, @PathVariable("userId") String uid,
			LearningNotesCustom learningNotesCustom) throws Exception {
		model.addAttribute("userId", uid);
		// 判断当前登录用户
		UserInfo currentUser = (UserInfo) session.getAttribute("currentUser");
		// 读取文章列表
		learningNotesCustom = learningNotesService.getLearningNotesList(uid, currentUser, learningNotesCustom);
		model.addAttribute("lnList", learningNotesCustom);
		return "learningNotes/learningNotesList";
	}

	@RequestMapping(value = "learningNotes/{userId}/{lnId}", method = { RequestMethod.GET })
	public String learningNotes(Model model, HttpSession session, @PathVariable("userId") String uid,
			@PathVariable("lnId") int lnId) throws Exception {
		model.addAttribute("userId", uid);
		// 判断当前登录用户
		UserInfo currentUser = (UserInfo) session.getAttribute("currentUser");
		// 读取文章信息
		LearningNotes learningNotes = learningNotesService.getLearningNotes(currentUser, lnId);
		model.addAttribute("lnInfo", learningNotes);
		// 访问次数+1
		learningNotesService.updateLearningNotes(lnId, learningNotes);
		// 读取上一篇/下一篇文章
		learningNotes = learningNotesService.getTopLearningNotes(lnId, uid);
		model.addAttribute("topLNInfo", learningNotes);
		learningNotes = learningNotesService.getNextLearningNotes(lnId, uid);
		model.addAttribute("nextLNInfo", learningNotes);
		// 读取更多列表文章信息
		List<LearningNotes> list = learningNotesService.getOtherLearningNotes(lnId, 10);
		model.addAttribute("otherLNInfo", list);
		return "learningNotes/learningNotes";
	}

	@CheckUserLogin
	@RequestMapping(value = "pubLearningNotes", method = { RequestMethod.GET })
	public String pubLearningNotes(Model model, HttpSession session,Integer lnId) throws Exception {
		// 将当前用户的ID设置到model中，拦截器要通过id获取头部菜单
		UserInfo userInfo = (UserInfo) session.getAttribute("currentUser");
		model.addAttribute("userId", userInfo.getMyBlog_UserInfo_id());
		return "learningNotes/pubLearningNotes";
	}

}