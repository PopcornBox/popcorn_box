package com.spring.pjt.domain;

import java.sql.Date;

public class MovieLike {
	private int user_no;
	private String user_nickname;
	private int movie_no;
	private Date like_update_time;
	
	// Constructor
	public MovieLike() {}
	
	public MovieLike(int user_no, String user_nickname, int movie_no, Date like_update_time) {
		this.user_no = user_no;
		this.user_nickname = user_nickname;
		this.movie_no = movie_no;
		this.like_update_time = like_update_time;
	}
	
	// getters & setters
	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getUser_nickname() {
		return user_nickname;
	}

	public void setUser_id(String user_nickname) {
		this.user_nickname = user_nickname;
	}

	public int getMovie_no() {
		return movie_no;
	}

	public void setMovie_no(int movie_no) {
		this.movie_no = movie_no;
	}

	public Date getLike_update_time() {
		return like_update_time;
	}

	public void setLike_update_time(Date like_update_time) {
		this.like_update_time = like_update_time;
	}

	@Override
	public String toString() {
		return "MovieLike [user_no=" + user_no + ", user_nickname=" + user_nickname + ", movie_no=" + movie_no
				+ ", like_update_time=" + like_update_time + "]";
	}
	
}
