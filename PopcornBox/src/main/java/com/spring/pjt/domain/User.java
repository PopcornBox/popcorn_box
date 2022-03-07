package com.spring.pjt.domain;

import java.util.Date;
import java.util.List;

public class User {
	private int user_no;
	private String user_id;
	private String user_nickname;
	private String user_pwd;
	private String user_email;
	private Date user_insert_time;
	private String user_key;
	private String user_position;
	
	// 활동 내역 기록
	private List<Board> myBoardList;
	private List<BoardReply> myBoardReplyList;
	private List<EventReply> myEventReplyList;
	private List<MovieReply> myMovieReplyList;
	private List<MovieLike> myMovieLikeList;

	
	public User() {}

	public User(int user_no, String user_id, String user_nickname, String user_pwd, String user_email,
			Date user_insert_time, String user_key, String user_position, List<Board> myBoardList,
			List<BoardReply> myBoardReplyList, List<EventReply> myEventReplyList, List<MovieReply> myMovieReplyList, List<MovieLike> myMovieLikeList) {
		this.user_no = user_no;
		this.user_id = user_id;
		this.user_nickname = user_nickname;
		this.user_pwd = user_pwd;
		this.user_email = user_email;
		this.user_insert_time = user_insert_time;
		this.user_key = user_key;
		this.user_position = user_position;
		this.myBoardList = myBoardList;
		this.myBoardReplyList = myBoardReplyList;
		this.myEventReplyList = myEventReplyList;
		this.myMovieReplyList = myMovieReplyList;
		this.myMovieLikeList = myMovieLikeList;
		
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

	public Date getUser_insert_time() {
		return user_insert_time;
	}

	public void setUser_insert_time(Date user_insert_time) {
		this.user_insert_time = user_insert_time;
	}

	public String getUser_key() {
		return user_key;
	}

	public void setUser_key(String user_key) {
		this.user_key = user_key;
	}
	
	public String getUser_position() {
		return user_position;
	}

	public void setUser_position(String user_position) {
		this.user_position = user_position;
	}
	
	public List<Board> getMyBoardList() {
		return myBoardList;
	}

	public void setMyBoardList(List<Board> myBoardList) {
		this.myBoardList = myBoardList;
	}

	public List<BoardReply> getMyBoardReplyList() {
		return myBoardReplyList;
	}

	public void setMyBoardReplyList(List<BoardReply> myBoardReplyList) {
		this.myBoardReplyList = myBoardReplyList;
	}

	public List<EventReply> getMyEventReplyList() {
		return myEventReplyList;
	}

	public void setMyEventReplyList(List<EventReply> myEventReplyList) {
		this.myEventReplyList = myEventReplyList;
	}

	public List<MovieReply> getMyMovieReplyList() {
		return myMovieReplyList;
	}

	public void setMyMovieReplyList(List<MovieReply> myMovieReplyList) {
		this.myMovieReplyList = myMovieReplyList;
	}
	
	public List<MovieLike> getMyMovieLikeList() {
		return myMovieLikeList;
	}
	
	public void setMyMovieLikeList(List<MovieLike> myMovieLikeList) {
		this.myMovieLikeList = myMovieLikeList;
	}
	

	@Override
	public String toString() {
		return "User [user_no=" + user_no + ", user_id=" + user_id + ", user_nickname=" + user_nickname + ", user_pwd="
				+ user_pwd + ", user_email=" + user_email + ", user_insert_time=" + user_insert_time + ", user_key="
				+ user_key + ", user_position=" + user_position + ", myBoardList=" + myBoardList + ", myBoardReplyList="
				+ myBoardReplyList + ", myEventReplyList=" + myEventReplyList + ", myMovieReplyList=" + myMovieReplyList
				+ "myMovieLikeList=" + myMovieLikeList +"]";
	}

}
