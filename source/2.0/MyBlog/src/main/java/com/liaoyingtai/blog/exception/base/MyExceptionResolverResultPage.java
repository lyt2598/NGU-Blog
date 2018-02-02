package com.liaoyingtai.blog.exception.base;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import com.liaoyingtai.blog.exception.userInfo.UserRegisteredException;

public class MyExceptionResolverResultPage {

	@ExceptionHandler
	public ModelAndView resolveException(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2,
			Exception arg3) {
		ModelAndView mad = new ModelAndView();
		String viewName = "other/error";
		if (arg3 instanceof BlogSystemException) {
			BlogSystemException baseException = (BlogSystemException) arg3;
			mad.addObject("errorMsg", baseException);
		} else if (arg3 instanceof UserRegisteredException) {
			UserRegisteredException userRegisteredException = (UserRegisteredException) arg3;
			viewName = "baseView/message";
			mad.addObject("errorMsg", userRegisteredException);
		} else {
			BlogSystemException baseException = new BlogSystemException("运行过程中发生未知异常,请立即与管理员取的联系！");
			mad.addObject("errorMsg", baseException);
		}
		mad.setViewName(viewName);
		return mad;
	}

}
