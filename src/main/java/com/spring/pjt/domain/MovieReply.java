package com.spring.pjt.domain;

import java.util.Date;

public class MovieReply {

	private int movie_reply_no;
	private String movie_reply_content;
	private String user_nickname;
	private Date movie_reply_update_time;
	private int movie_no;
	
	public MovieReply() {
	}

	public MovieReply(int movie_reply_no, String movie_reply_content, String user_nickname,
			Date movie_reply_update_time, int movie_no) {
		this.movie_reply_no = movie_reply_no;
		this.movie_reply_content = movie_reply_content;
		this.user_nickname = user_nickname;
		this.movie_reply_update_time = movie_reply_update_time;
		this.movie_no = movie_no;
	}

	public int getMovie_reply_no() {
		return movie_reply_no;
	}

	public void setMovie_reply_no(int movie_reply_no) {
		this.movie_reply_no = movie_reply_no;
	}

	public String getMovie_reply_content() {
		return movie_reply_content;
	}

	public void setMovie_reply_content(String movie_reply_content) {
		this.movie_reply_content = movie_reply_content;
	}

	public String getUser_nickname() {
		return user_nickname;
	}

	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}

	public Date getMovie_reply_update_time() {
		return movie_reply_update_time;
	}

	public void setMovie_reply_update_time(Date movie_reply_update_time) {
		this.movie_reply_update_time = movie_reply_update_time;
	}

	public int getMovie_no() {
		return movie_no;
	}

	public void setMovie_no(int movie_no) {
		this.movie_no = movie_no;
	}
	
	@Override
	public String toString() {
		return String.format("MovieReply{movie_reply_no:%d, movie_reply_content:%s, user_nickname:%s, movie_reply_update_time:%s, movie_no:%d", 
				this.movie_reply_no, this.movie_reply_content, this.user_nickname, this.movie_reply_update_time, this.movie_no);
	}
	
}
