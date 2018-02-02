package com.liaoyingtai.blog.exception.base;

public class BlogParameterException extends Exception {

	private static final long serialVersionUID = 7485420941070743900L;

	private String message;

	public BlogParameterException(String message) {
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
