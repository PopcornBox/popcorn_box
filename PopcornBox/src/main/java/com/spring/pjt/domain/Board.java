package com.spring.pjt.domain;

import java.sql.Date;

public class Board {
	private int board_no;
	private int board_mode;
	private String board_title;
	private String user_id;
	private Date board_update_time;
	private int board_view_cnt;
	private int board_reply_cnt;
	
	public Board() {}
	

	public Board(int board_no, int board_mode, String board_title, String user_id, Date board_update_time,
			int board_view_cnt, int board_reply_cnt) {
		super();
		this.board_no = board_no;
		this.board_mode = board_mode;
		this.board_title = board_title;
		this.user_id = user_id;
		this.board_update_time = board_update_time;
		this.board_view_cnt = board_view_cnt;
		this.board_reply_cnt = board_reply_cnt;
	}


	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public int getBoard_mode() {
		return board_mode;
	}

	public void setBoard_mode(int board_mode) {
		this.board_mode = board_mode;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public Date getBoard_update_time() {
		return board_update_time;
	}

	public void setBoard_update_time(Date board_update_time) {
		this.board_update_time = board_update_time;
	}

	public int getBoard_view_cnt() {
		return board_view_cnt;
	}

	public void setBoard_view_cnt(int board_view_cnt) {
		this.board_view_cnt = board_view_cnt;
	}

	public int getBoard_reply_cnt() {
		return board_reply_cnt;
	}

	public void setBoard_reply_cnt(int board_reply_cnt) {
		this.board_reply_cnt = board_reply_cnt;
	}


	@Override
	public String toString() {
		return String.format("Board{board_no:%d, board_mode%d, board_title:%s, user_id:%s, boarad_update_time:%s, board_view_cnt:%d, board_reply_cnt:%d}", 
				this.board_no, this.board_mode, this.board_title, this.user_id, this.board_update_time, this.board_view_cnt, this.board_reply_cnt);
	}
	
	
}
