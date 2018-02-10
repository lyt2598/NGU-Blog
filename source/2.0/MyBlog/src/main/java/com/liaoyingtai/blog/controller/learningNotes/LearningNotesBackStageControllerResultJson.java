package com.liaoyingtai.blog.controller.learningNotes;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.liaoyingtai.blog.annotation.CheckUserLogin;
import com.liaoyingtai.blog.annotation.NotLoadHeadMenu;
import com.liaoyingtai.blog.exception.base.MyExceptionResolverResultJson;
import com.liaoyingtai.blog.utils.ResultUtils;

@Controller
@RequestMapping("/ajax")
public class LearningNotesBackStageControllerResultJson extends MyExceptionResolverResultJson {

	@NotLoadHeadMenu
	@CheckUserLogin
	@RequestMapping()
	public @ResponseBody ResultUtils getBackStageLNList() throws Exception {
		return null;
	}
}
