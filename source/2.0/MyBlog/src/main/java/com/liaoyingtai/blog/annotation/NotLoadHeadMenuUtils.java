package com.liaoyingtai.blog.annotation;

import java.lang.reflect.Method;

import org.springframework.web.method.HandlerMethod;

public class NotLoadHeadMenuUtils {

	/**
	 * 读取handler上是否存在@NotLoadHeadMenu注解，如果存在返回true，不存在返回false
	 * 
	 * @param handler
	 * @return
	 * @throws Exception
	 */
	public static boolean isNotLoadHeadMenu(Object handler) throws Exception {
		boolean result = true;
		if (handler instanceof HandlerMethod) {
			HandlerMethod handlerMethod = (HandlerMethod) handler;
			Method method = handlerMethod.getMethod();
			Class<?> type = handlerMethod.getBeanType();
			if (!method.isAnnotationPresent(NotLoadHeadMenu.class)
					&& !type.isAnnotationPresent(NotLoadHeadMenu.class)) {
				result = false;
			}
		}
		return result;
	}

}
