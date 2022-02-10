package com.spring.pjt.domain;

import java.util.Date;

public class User {
	private int user_no;
	private String user_id;
	private String user_nickname;
	private String user_pwd;
	private String user_email;
	private Date user_update_time;
	private String user_key;
	
	public User() {}	
	
	public User(int user_no, String user_id, String user_nickname, String user_pwd, String user_email,
			Date user_update_time, String user_key) {
		this.user_no = user_no;
		this.user_id = user_id;
		this.user_nickname = user_nickname;
		this.user_pwd = user_pwd;
		this.user_email = user_email;
		this.user_update_time = user_update_time;
		this.user_key = user_key;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_nickname() {
		return user_nickname;
	}

	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}

	public String getUser_pwd() {
		return user_pwd;
	}

	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public Date getUser_update_time() {
		return user_update_time;
	}

	public void setUser_update_time(Date user_update_time) {
		this.user_update_time = user_update_time;
	}

	public String getUser_key() {
		return user_key;
	}

	public void setUser_key(String user_key) {
		this.user_key = user_key;
	}

	@Override
	public String toString() {
		return String.format(
				"User{user_no:%d, user_id:%s, user_nickname:%s, user_pwd:%s, user_email:%s, user_update_time:%s, user_key:%s}", 
				this.user_no, this.user_id, this.user_nickname, this.user_pwd, this.user_email, this.user_update_time, this.user_key);
	}
		
}
