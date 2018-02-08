package com.liaoyingtai.blog.exception.userInfo;

public class UserNotLoginException extends Exception {

	private static final long serialVersionUID = -3732796336046301984L;

	private String message;

	public UserNotLoginException(String message) {
		super(message);
		this.message = message;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

}
