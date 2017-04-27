package com.myhome.domain;

import java.util.Date;

public class Project {
	private int pno;
	private String name;
	private String content;
	private Date sdate;
	private Date edate;
	private int progress;

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getSdate() {
		
		return sdate;
	}

	public void setSdate(Date sdate) {
		this.sdate = sdate;
	}

	public Date getEdate() {
		return edate;
	}

	public void setEdate(Date edate) {
		this.edate = edate;
	}

	public int getProgress() {
		return progress;
	}

	public void setProgress(int progress) {
		this.progress = progress;
	}

	@Override
	public String toString() {
		return "Project [no=" + pno + ", name=" + name + ", content=" + content + ", sdate=" + sdate + ", edate=" + edate
				+ ", progress=" + progress + "]";
	}

}
