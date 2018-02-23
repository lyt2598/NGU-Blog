package com.liaoyingtai.blog.controller.learningNotes;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.liaoyingtai.blog.annotation.CheckUserLogin;
import com.liaoyingtai.blog.annotation.NotLoadHeadMenu;
import com.liaoyingtai.blog.entity.learningNotes.LearningNotesCustom;
import com.liaoyingtai.blog.entity.userInfo.UserInfo;
import com.liaoyingtai.blog.exception.base.MyExceptionResolverResultJson;
import com.liaoyingtai.blog.service.learningNotes.LearningNotesService;
import com.liaoyingtai.blog.utils.ResultUtils;

@Controller
@NotLoadHeadMenu
@CheckUserLogin
@RequestMapping("/backStage")
public class LearningNotesBackStageControllerResultJson extends MyExceptionResolverResultJson {

	@Autowired
	private LearningNotesService learningNotesService;

	@RequestMapping(value = "learningNotesList", method = { RequestMethod.POST })
	public @ResponseBody ResultUtils learningNotesList(HttpSession session, LearningNotesCustom selectParam)
			throws Exception {
		UserInfo userInfo = (UserInfo) session.getAttribute("currentUser");
		selectParam = learningNotesService.getLearningNotesList(userInfo.getMyBlog_UserInfo_id(), userInfo,
				selectParam);
		ResultUtils resultUtils = new ResultUtils();
		resultUtils.setStatus(ResultUtils.STATUS_OK);
		Map<String, Object> result = new HashMap<>();
		result.put("lnList", selectParam);
		resultUtils.setResult(result);
		return resultUtils;
	}
}
