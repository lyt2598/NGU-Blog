package com.liaoyingtai.blog.controller.about;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.liaoyingtai.blog.entity.about.AboutMe;
import com.liaoyingtai.blog.exception.base.MyExceptionResolverResultPage;
import com.liaoyingtai.blog.service.about.AboutMeService;

@Controller
public class AboutMeController extends MyExceptionResolverResultPage {

	@Autowired
	private AboutMeService aboutMeService;

	@RequestMapping(value = "aboutMe/{userId}", method = { RequestMethod.GET })
	public String aboutMe(Model model, @PathVariable("userId") String uid) throws Exception {
		model.addAttribute("userId", uid);
		// 读取关于我信息
		AboutMe aboutMe = aboutMeService.getAboutMeByUserId(uid);
		model.addAttribute("aboutMe", aboutMe);
		// 浏览次数加一次
		aboutMeService.updateAboutMeViewCountByUserId(aboutMe, uid);
		return "about/aboutMe";
	}
}
