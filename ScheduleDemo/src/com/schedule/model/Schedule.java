package com.schedule.model;

public class Schedule {
	
	private int id;
	private String date;
	private String bname;
	private String broute;
	private String dtime;
	private String atime;
	
	
	public Schedule(int id, String date, String bname, String broute, String dtime, String atime) {
		super();
		this.id = id;
		this.date = date;
		this.bname = bname;
		this.broute = broute;
		this.dtime = dtime;
		this.atime = atime;
	}


	public int getId() {
		return id;
	}


	public String getDate() {
		return date;
	}


	public String getBname() {
		return bname;
	}


	public String getBroute() {
		return broute;
	}


	public String getDtime() {
		return dtime;
	}


	public String getAtime() {
		return atime;
	}



	
	
	

}
