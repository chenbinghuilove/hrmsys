package com.hrmsys.bean;

import java.util.Date;

public  class NoteBean {
	private int noteId;
	private String noteContent;
	private String notefinishDate;
	private String noteAddPerson;
	private int noteHours;
	private String noteRemark;
	public int getNoteId() {
		return noteId;
	}
	public void setNoteId(int noteId) {
		this.noteId = noteId;
	}
	public String getNoteContent() {
		return noteContent;
	}
	public void setNoteContent(String noteContent) {
		this.noteContent = noteContent;
	}
	public int getNoteHours() {
		return noteHours;
	}
	public void setNoteHours(int noteHours) {
		this.noteHours = noteHours;
	}
	public String getNoteRemark() {
		return noteRemark;
	}
	public void setNoteRemark(String noteRemark) {
		this.noteRemark = noteRemark;
	}
	public String getNotefinishDate() {
		return notefinishDate;
	}
	public void setNotefinishDate(String notefinishDate) {
		this.notefinishDate = notefinishDate;
	}
	public String getNoteAddPerson() {
		return noteAddPerson;
	}
	public void setNoteAddPerson(String noteAddPerson) {
		this.noteAddPerson = noteAddPerson;
	}
	
	
	
}
