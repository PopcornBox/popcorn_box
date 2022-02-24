package com.spring.pjt.domain;

import java.util.Date;

public class Event {
	
	private int event_no;
	private String event_title;
	private String event_thumb;
	private String event_content;
	private Date event_start_time;
	private Date event_last_time;
	
	public Event() {}

	public Event(int event_no, String event_title, String event_thumb, String event_content, Date event_start_time,
					Date event_last_time) {
		super();
		this.event_no = event_no;
		this.event_title = event_title;
		this.event_thumb = event_thumb;
		this.event_content = event_content;
		this.event_start_time = event_start_time;
		this.event_last_time = event_last_time;
	}

	public int getEvent_no() {
		return event_no;
	}

	public void setEvent_no(int event_no) {
		this.event_no = event_no;
	}

	public String getEvent_title() {
		return event_title;
	}

	public void setEvent_title(String event_title) {
		this.event_title = event_title;
	}

	public String getEvent_thumb() {
		return event_thumb;
	}

	public void setEvent_thumb(String event_thumb) {
		this.event_thumb = event_thumb;
	}

	public String getEvent_content() {
		return event_content;
	}

	public void setEvent_content(String event_content) {
		this.event_content = event_content;
	}

	public Date getEvent_start_time() {
		return event_start_time;
	}

	public void setEvent_start_time(Date event_start_time) {
		this.event_start_time = event_start_time;
	}

	public Date getEvent_last_time() {
		return event_last_time;
	}

	public void setEvent_last_time(Date event_last_time) {
		this.event_last_time = event_last_time;
	}
	
	@Override
	public String toString() {
		return String.format("Event{event_no:%d, event_title:%s, event_thumb:%s, event_content:%s, event_start_time:%s, event_last_time:%s", 
				event_no, event_title, event_thumb, event_content, event_start_time, event_last_time);
	}
	

}
