package com.liaoyingtai.blog.controller.userInfo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.liaoyingtai.blog.annotation.NotLoadHeadMenu;
import com.liaoyingtai.blog.exception.base.MyExceptionResolverResultPage;

@Controller
public class UserInfoController extends MyExceptionResolverResultPage {

	@NotLoadHeadMenu
	@RequestMapping(value = "/login", method = { RequestMethod.GET })
	public String login() throws Exception {
		return "login";
	}

}
