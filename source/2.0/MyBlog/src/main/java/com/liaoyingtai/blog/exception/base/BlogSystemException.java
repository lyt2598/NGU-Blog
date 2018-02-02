package com.liaoyingtai.blog.exception.base;

public class BlogSystemException extends Exception {

	private static final long serialVersionUID = 7614448390443084571L;

	private String message;

	public BlogSystemException(String message) {
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
