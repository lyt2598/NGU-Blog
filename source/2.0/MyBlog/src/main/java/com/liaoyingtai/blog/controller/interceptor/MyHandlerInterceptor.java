package com.liaoyingtai.blog.controller.interceptor;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.liaoyingtai.blog.annotation.CheckUserLoginUtils;
import com.liaoyingtai.blog.annotation.NotLoadHeadMenuUtils;
import com.liaoyingtai.blog.entity.headMenu.HeadMenuCustom;
import com.liaoyingtai.blog.entity.userInfo.UserInfo;
import com.liaoyingtai.blog.exception.base.BlogSystemException;
import com.liaoyingtai.blog.exception.base.MyExceptionResolverResultPage;
import com.liaoyingtai.blog.service.headMenu.HeadMenuService;
import com.liaoyingtai.blog.service.userinfo.UserInfoService;

public class MyHandlerInterceptor extends MyExceptionResolverResultPage implements HandlerInterceptor {

	@Autowired
	private HeadMenuService headMenuService;
	@Autowired
	private UserInfoService userInfoService;
	// 登录页action
	private static final String LOGIN_URL = "post/login";

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		if (handler instanceof HandlerMethod) {
			boolean result = CheckUserLoginUtils.checkUserLogin(request.getSession(), handler);
			if (!result) {
				String url = request.getRequestURL().toString();
				response.sendRedirect(request.getServletContext().getContextPath() + "/" + LOGIN_URL + "?url=" + url);
				return false;
			}
		}
		return true;
	}

	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		if (!NotLoadHeadMenuUtils.isNotLoadHeadMenu(handler)) {
			// 加载头部菜单信息
			String uid = "";
			if (modelAndView == null) {
				throw new BlogSystemException("没有传入用户ID，无法查询到头部菜单");
			}
			Map<String, Object> modelMap = modelAndView.getModel();
			uid = (String) modelMap.get("userId");
			if (uid == null || "".equals(uid)) {
				throw new BlogSystemException("没有传入用户ID，无法查询到头部菜单");
			}
			List<HeadMenuCustom> list = headMenuService.getIndexHeadMenu(uid);
			modelAndView.addObject("headMenuList", list);
			UserInfo userInfo = userInfoService.getPortionUserInfoById(uid);
			modelAndView.addObject("lookUserInfo", userInfo);
		}
	}

	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {

	}

}
