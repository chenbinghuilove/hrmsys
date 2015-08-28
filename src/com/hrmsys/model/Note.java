package com.hrmsys.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Train entity. @author MyEclipse Persistence Tools
 */

public class Note implements java.io.Serializable {

	// Fields
	private Integer noteId;
	private String noteContent;
	private Date notefinishDate;
	private User noteAddPerson;
	private Integer noteHours;
	private String noteRemark;
	
	public Integer getNoteId() {
		return noteId;
	}
	public void setNoteId(Integer noteId) {
		this.noteId = noteId;
	}
	public String getNoteContent() {
		return noteContent;
	}
	public void setNoteContent(String noteContent) {
		this.noteContent = noteContent;
	}
	public Date getNotefinishDate() {
		return notefinishDate;
	}
	public void setNotefinishDate(Date notefinishDate) {
		this.notefinishDate = notefinishDate;
	}
	public User getNoteAddPerson() {
		return noteAddPerson;
	}
	public void setNoteAddPerson(User noteAddPerson) {
		this.noteAddPerson = noteAddPerson;
	}
	public Integer getNoteHours() {
		return noteHours;
	}
	public void setNoteHours(Integer noteHours) {
		this.noteHours = noteHours;
	}
	public String getNoteRemark() {
		return noteRemark;
	}
	public void setNoteRemark(String noteRemark) {
		this.noteRemark = noteRemark;
	}
	
	

}