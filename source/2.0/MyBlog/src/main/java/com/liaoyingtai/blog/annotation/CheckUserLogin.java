package com.liaoyingtai.blog.annotation;

import static java.lang.annotation.RetentionPolicy.RUNTIME;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;

@Documented
@Retention(RUNTIME)
@Target({ElementType.METHOD,ElementType.TYPE})
public @interface CheckUserLogin {
	
	boolean checkUserLogin() default true;

}
