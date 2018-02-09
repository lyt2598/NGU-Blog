package com.liaoyingtai.blog.controller.index;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.liaoyingtai.blog.annotation.CheckUserLogin;
import com.liaoyingtai.blog.annotation.NotLoadHeadMenu;
import com.liaoyingtai.blog.exception.base.MyExceptionResolverResultPage;

@Controller
@RequestMapping("/backStage")
public class IndexBackStageController extends MyExceptionResolverResultPage {

	@NotLoadHeadMenu
	@CheckUserLogin
	@RequestMapping(value = "index", method = { RequestMethod.GET })
	public String index() throws Exception {
		return "backStage/index";
	}
}
