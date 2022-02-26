package com.spring.pjt.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.pjt.domain.BoardReply;
import com.spring.pjt.persistence.BoardDao;
import com.spring.pjt.persistence.BoardReplyDao;

@Service
public class BoardReplyServiceImpl implements BoardReplyService{
	
	private static final Logger log = LoggerFactory.getLogger(BoardReplyServiceImpl.class);
	
	@Autowired //의존성 주입
	private BoardReplyDao boardReplyDao;
	@Autowired private BoardDao boardDao;
	
	@Override
	public List<BoardReply> slelct(int board_no) {
		log.info("select(bno={}", board_no);
		return boardReplyDao.read(board_no);
	}

	@Override
	public int insert(BoardReply boardReply) {
		int result = boardReplyDao.create(boardReply);
		boardDao.updateBoardReplyCnt(boardReply.getBoard_no(), 1);

		return result;
	}

	@Override
	public int update(BoardReply boardReply) {
		log.info("update({})", boardReply);
		return boardReplyDao.update(boardReply);
		
		
	}

	@Override
	public int delete(int board_reply_no) {
		log.info("delete({})", board_reply_no);
		int board_no = boardReplyDao.readBoardNo(board_reply_no);
		int result = boardReplyDao.delete(board_reply_no);
		
		boardDao.updateBoardReplyCnt(board_no, -1);
		return result;
	}

	@Override
	public int boardNoDelete(int board_no) {
		log.info("boardNoDelete({})", board_no);
		
		return boardReplyDao.deleteReplyBNo(board_no);
	}
	
		
	
	
	
	
	
	
	

}
