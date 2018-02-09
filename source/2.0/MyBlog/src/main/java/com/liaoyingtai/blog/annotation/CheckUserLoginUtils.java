package com.liaoyingtai.blog.annotation;

import java.lang.reflect.Method;

import javax.servlet.http.HttpSession;

import org.springframework.web.method.HandlerMethod;

import com.liaoyingtai.blog.entity.userInfo.UserInfo;

public class CheckUserLoginUtils {

	/**
	 * 判断当前请求controller是否存在校验用户是否已经登录的注解
	 * 
	 * 查找方法：先查找方法上是否存在该注解，再查找类中是否存在该注解
	 * 
	 * @param session
	 * @param handle
	 * @return true：没有检测到注解/用户已经登录 false：用户没有登录抛出异常
	 * 
	 */
	public static boolean checkUserLogin(HttpSession session, Object handle) {
		HandlerMethod handlerMethod = (HandlerMethod) handle;
		Method method = handlerMethod.getMethod();
		System.out.println("自定义注解->检测方法上是否含有校验用户是否登陆注解");
		if (method.isAnnotationPresent(CheckUserLogin.class)) {
			System.out.println("自定义注解->检测方法上是否含有校验用户是否登陆注解->校验用户是否登陆");
			UserInfo userInfo = (UserInfo) session.getAttribute("currentUser");
			if (userInfo == null) {
				System.out.println("自定义注解->检测方法上是否含有校验用户是否登陆注解->校验用户是否登陆->用户没有登录");
				return false;
			}
		} else {
			Class<?> type = handlerMethod.getBeanType();
			System.out.println(type);
			System.out.println("自定义注解->检测类上是否含有校验用户是否登陆注解");
			if (type.isAnnotationPresent(CheckUserLogin.class)) {
				System.out.println("自定义注解->检测类上是否含有校验用户是否登陆注解->校验用户是否登陆");
				UserInfo userInfo = (UserInfo) session.getAttribute("currentUser");
				if (userInfo == null) {
					System.out.println("自定义注解->检测类上是否含有校验用户是否登陆注解->校验用户是否登陆->用户没有登录");
					return false;
				}
			} else {
				System.out.println("没有检测到注解");
			}
		}
		return true;
	}

}
