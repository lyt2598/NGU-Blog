package com.liaoyingtai.blog.exception.learningNotes;

public class BackStageLearningNotesListException extends Exception {

	private static final long serialVersionUID = 1319620521722326808L;

	private String message;

	public BackStageLearningNotesListException(String message) {
		super(message);
		this.message = message;
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
