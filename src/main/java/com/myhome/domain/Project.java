package com.myhome.domain;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Project {
	private int no;
	private String name;
	private String content;
	private Date sdate;
	private Date edate;
	private int progress;

	public Project(String name, String content, Object sdate, Object edate, int progress) {
		this.name = name;
		this.content = content;
		this.sdate = format(sdate);
		this.edate = format(edate);
		this.progress = progress;

	}

	public void setNo(int no) {
		this.no = no;
	}

	private Date format(Object date) {

		Date formatedDate = null;

		if (date instanceof String) {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

			try {
				formatedDate = format.parse((String) date);

			} catch (ParseException e) {
				System.out.println("String 타입 데이터 처리 error!!");
			}

		} else if (date instanceof Date) {
			formatedDate = (Date) date;
		} else {
			System.out.println("project date format 처리 에러!!");
			formatedDate = null;
		}
		return formatedDate;
	}

	public int getNo() {
		return no;
	}

	public String getName() {
		return name;
	}

	public String getContent() {
		return content;
	}

	public Date getSdate() {
		return sdate;
	}

	public Date getEdate() {
		return edate;
	}

	public int getProgress() {
		return progress;
	}

	@Override
	public String toString() {
		return "Project [no=" + no + ", name=" + name + ", content=" + content + ", sdate=" + sdate + ", edate=" + edate
				+ ", progress=" + progress + "]";
	}
}
