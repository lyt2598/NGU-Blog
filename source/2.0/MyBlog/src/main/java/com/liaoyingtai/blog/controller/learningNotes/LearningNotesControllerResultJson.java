package com.liaoyingtai.blog.controller.learningNotes;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.liaoyingtai.blog.annotation.NotLoadHeadMenu;
import com.liaoyingtai.blog.controller.validator.group.learningNotes.PublishLearningNotesValidatorGroup;
import com.liaoyingtai.blog.entity.learningNotes.LearningNotes;
import com.liaoyingtai.blog.entity.userInfo.UserInfo;
import com.liaoyingtai.blog.exception.base.BlogSystemException;
import com.liaoyingtai.blog.exception.base.MyExceptionResolverResultJson;
import com.liaoyingtai.blog.service.learningNotes.LearningNotesService;
import com.liaoyingtai.blog.utils.ResultUtils;

@Controller
@NotLoadHeadMenu
public class LearningNotesControllerResultJson extends MyExceptionResolverResultJson {

	@Autowired
	private LearningNotesService learningNotesService;

	// 发表学习笔记
	@RequestMapping(value = "/pubLearningNotes", method = { RequestMethod.POST })
	public @ResponseBody ResultUtils pubLearningNotes(HttpSession session,
			@Validated(value = { PublishLearningNotesValidatorGroup.class }) LearningNotes learningNotes,
			BindingResult bindingResult) throws Exception {
		if (bindingResult.hasErrors()) {
			// 只返回第一个错误
			String errorMsg = bindingResult.getAllErrors().get(0).getDefaultMessage();
			throw new BlogSystemException(errorMsg);
		}
		// 从session中读取当前用户的id来发表文章
		UserInfo userInfo = (UserInfo) session.getAttribute("currentUser");
		// 暂时先自己写权限判断用户是否登陆，到时候整合Shiro后再做修改
		if (userInfo == null) {
			throw new BlogSystemException("请先登陆后再执行此操作！");
		}
		String uid = userInfo.getMyBlog_UserInfo_id();
		learningNotes.setLearningNotes_PubUser(uid);
		learningNotesService.insertLearningNotesList(uid, learningNotes);
		ResultUtils resultUtils = new ResultUtils();
		resultUtils.setStatus(ResultUtils.STATUS_OK);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		// 将发表文章的用户id返回，前台用做跳转参数
		resultMap.put("userId", uid);
		resultUtils.setResult(resultMap);
		return resultUtils;
	}

}
