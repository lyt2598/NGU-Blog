package com.liaoyingtai.blog.annotation;

import static java.lang.annotation.ElementType.METHOD;
import static java.lang.annotation.ElementType.TYPE;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;

@Documented
@Retention(RUNTIME)
@Target({ TYPE, METHOD })
public @interface NotLoadHeadMenu {

	/**
	 * 是否加载头部菜单，默认为false
	 * 
	 * @return
	 */
	boolean loadHeadMenu() default false;
}
