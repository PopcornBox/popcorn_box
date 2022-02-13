package com.spring.pjt.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.pjt.domain.Board;
import com.spring.pjt.persistence.BoardDao;

@Service
public class BoardServiceImpl  implements BoardService{

	private static final Logger log = LoggerFactory.getLogger(BoardServiceImpl.class);
	
	@Autowired private BoardDao boardDao;
	
	@Override
	public List<Board> select() {
		log.info("select() 호출");
		return boardDao.read();
	}

	@Override
	public Board select(int board_no) {
		log.info("select(board_no={}) 호출", board_no);
		Board board = boardDao.read(board_no);
		//boardDao.updateViewCnt(board_bno);
		
		return board;
	}
}
