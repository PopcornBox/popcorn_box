package com.spring.pjt.domain;

import java.sql.Date;

public class Movie {
	private int movie_no;
	private String movie_title;
	private String movie_director;
	private String movie_actor;
	private String movie_genre;
	private String movie_info;
	private Date movie_release;
	private String movie_content;
	private String movie_trailer;
	private String movie_imgae;
	private String movie_update_time;
	
	public Movie() {}

	public Movie(int movie_no, String movie_title, String movie_director, String movie_actor, String movie_genre,
			String movie_info, Date movie_release, String movie_content, String movie_trailer, String movie_imgae, String movie_update_time) {
		super();
		this.movie_no = movie_no;
		this.movie_title = movie_title;
		this.movie_director = movie_director;
		this.movie_actor = movie_actor;
		this.movie_genre = movie_genre;
		this.movie_info = movie_info;
		this.movie_release = movie_release;
		this.movie_content = movie_content;
		this.movie_trailer = movie_trailer;
		this.movie_imgae = movie_imgae;
		this.movie_update_time = movie_update_time;
	}

	public String getMovie_update_time() {
		return movie_update_time;
	}

	public void setMovie_update_time(String movie_update_time) {
		this.movie_update_time = movie_update_time;
	}

	public int getMovie_no() {
		return movie_no;
	}

	public void setMovie_no(int movie_no) {
		this.movie_no = movie_no;
	}

	public String getMovie_title() {
		return movie_title;
	}

	public void setMovie_title(String movie_title) {
		this.movie_title = movie_title;
	}

	public String getMovie_director() {
		return movie_director;
	}

	public void setMovie_director(String movie_director) {
		this.movie_director = movie_director;
	}

	public String getMovie_actor() {
		return movie_actor;
	}

	public void setMovie_actor(String movie_actor) {
		this.movie_actor = movie_actor;
	}

	public String getMovie_genre() {
		return movie_genre;
	}

	public void setMovie_genre(String movie_genre) {
		this.movie_genre = movie_genre;
	}

	public String getMovie_info() {
		return movie_info;
	}

	public void setMovie_info(String movie_info) {
		this.movie_info = movie_info;
	}

	public Date getMovie_release() {
		return movie_release;
	}

	public void setMovie_release(Date movie_release) {
		this.movie_release = movie_release;
	}

	public String getMovie_content() {
		return movie_content;
	}

	public void setMovie_content(String movie_content) {
		this.movie_content = movie_content;
	}

	public String getMovie_trailer() {
		return movie_trailer;
	}

	public void setMovie_trailer(String movie_trailer) {
		this.movie_trailer = movie_trailer;
	}

	public String getMovie_imgae() {
		return movie_imgae;
	}

	public void setMovie_imgae(String movie_imgae) {
		this.movie_imgae = movie_imgae;
	}
	
	@Override
	public String toString() {
		return String.format(
	"Movie{movie_no:%d, movie_title:%s, movie_director:%s, movie_actor:%s, movie_genre:%s, movie_info:%s, movie_release:%s, "
	+  "movie_content:%s, movie_trailer:%s, movie_imgae:%s, movie_update_time:%s"
				, this.movie_no, this.movie_title, this.movie_director, this.movie_actor, this.movie_genre, this.movie_info, this.movie_release,
				this.movie_content, this.movie_trailer, this.movie_imgae, this.movie_update_time);
	}

}
