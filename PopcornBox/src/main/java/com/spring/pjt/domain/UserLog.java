package com.spring.pjt.domain;

import java.util.List;
// 질문하기
public class UserLog {
	private int user_no;
	private String user_nickname;
	private List<Board> myBoardList;
	private List<BoardReply> myBoardReplyList;
	private List<EventReply> myEventReplyList;
	private List<MovieReply> myMovieReplyList;
	
	
	// constructor
	public UserLog() {}
	
	public UserLog(int user_no, String user_nickname, List<Board> myBoardList, List<BoardReply> myBoardReplyList,
			List<EventReply> myEventReplyList, List<MovieReply> myMovieReplyList) {
		this.user_no = user_no;
		this.user_nickname = user_nickname;
		this.myBoardList = myBoardList;
		this.myBoardReplyList = myBoardReplyList;
		this.myEventReplyList = myEventReplyList;
		this.myMovieReplyList = myMovieReplyList;
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

	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
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

	@Override
	public String toString() {
		return "UserLog [user_no=" + user_no + ", user_nickname=" + user_nickname + ", myBoardList=" + myBoardList
				+ ", myBoardReplyList=" + myBoardReplyList + ", myEventReplyList=" + myEventReplyList
				+ ", myMovieReplyList=" + myMovieReplyList + "]";
	}
	
}
