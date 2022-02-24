package com.spring.pjt.service;

import java.util.List;

import com.spring.pjt.domain.BoardReply;

public interface BoardReplyService {

		List<BoardReply> slelct(int board_no);
		int insert(BoardReply boardReply);
		int update(BoardReply boardReply);
		int delete(int board_reply_no);
}
