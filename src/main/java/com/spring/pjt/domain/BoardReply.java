package com.spring.pjt.domain;

import java.sql.Date;

public class BoardReply {

	private int board_reply_no;
	private String board_reply_content;
	private String user_nickname;
	private Date board_reply_update_time;
	private int board_no;
	
	
	
	public BoardReply() {}
	
		
	public BoardReply(int board_reply_no, String board_reply_content, String user_nickname,
			Date board_reply_update_time, int board_no) {
		super();
		this.board_reply_no = board_reply_no;
		this.board_reply_content = board_reply_content;
		this.user_nickname = user_nickname;
		this.board_reply_update_time = board_reply_update_time;
		this.board_no = board_no;
	}



	public void setBoard_reply_no(int board_reply_no) {
		this.board_reply_no = board_reply_no;
	}
	public String getBoard_reply_content() {
		return board_reply_content;
	}
	public void setBoard_reply_content(String board_reply_content) {
		this.board_reply_content = board_reply_content;
	}
	public String getUser_nickname() {
		return user_nickname;
	}
	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}
	public Date getBoard_reply_update_time() {
		return board_reply_update_time;
	}
	public void setBoard_reply_update_time(Date board_reply_update_time) {
		this.board_reply_update_time = board_reply_update_time;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}


	@Override
	public String toString() {
		return String.format( "BoardReply{board_reply_no:%d, board_reply_content:%s, user_nickname:%s, board_reply_update_time:%s, board_no:%d}", 
				+ this.board_reply_no, this.board_reply_content, this.user_nickname, this.board_reply_update_time, this.board_no);
	}
	
	
	
}
