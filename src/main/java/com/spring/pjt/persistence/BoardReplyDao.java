package com.spring.pjt.persistence;

import java.util.List;

import com.spring.pjt.domain.BoardReply;

public interface BoardReplyDao {
	
	int create(BoardReply boardReply);
	List<BoardReply> read(int board_no);
	int update(BoardReply boardReply);
	int delete(int board_reply_no);
	int readBoardNo(int board_reply_no);

}
