package com.liaoyingtai.blog.exception.userInfo;

/**
 * 用户注册异常
 * 
 * @author Lyt
 * 
 */
public class UserRegisteredException extends Exception {

	private static final long serialVersionUID = -1481553435909408458L;

	private String message;

	public UserRegisteredException(String errorMsg) {
		super(errorMsg);
		this.message = errorMsg;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
