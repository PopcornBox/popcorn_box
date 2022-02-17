package com.spring.pjt.domain;

import java.util.Date;

public class EventReply {
	
	private int event_reply_no;
	private String event_reply_content;
	private String user_nickname;
	private Date event_reply_update_time;
	private int event_no;
	
	public EventReply() {}

	public EventReply(int event_reply_no, String event_reply_content, String user_nickname,
			Date event_reply_update_time, int event_no) {
		super();
		this.event_reply_no = event_reply_no;
		this.event_reply_content = event_reply_content;
		this.user_nickname = user_nickname;
		this.event_reply_update_time = event_reply_update_time;
		this.event_no = event_no;
	}

	public int getEvent_reply_no() {
		return event_reply_no;
	}

	public void setEvent_reply_no(int event_reply_no) {
		this.event_reply_no = event_reply_no;
	}

	public String getEvent_reply_content() {
		return event_reply_content;
	}

	public void setEvent_reply_content(String event_reply_content) {
		this.event_reply_content = event_reply_content;
	}

	public String getUser_nickname() {
		return user_nickname;
	}

	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}

	public Date getEvent_reply_update_time() {
		return event_reply_update_time;
	}

	public void setEvent_reply_update_time(Date event_reply_update_time) {
		this.event_reply_update_time = event_reply_update_time;
	}

	public int getEvent_no() {
		return event_no;
	}

	public void setEvent_no(int event_no) {
		this.event_no = event_no;
	}
	
	@Override
	public String toString() {
		return String.format("EventReply{event_reply_no:%d, event_reply_content:%s, user_nickname:%s, event_reply_update_time:%s, event_no:%d", 
				this.event_reply_no, this.event_reply_content, this.user_nickname, this.event_reply_update_time, this.event_no);
	}
}
