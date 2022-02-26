package com.spring.pjt.service;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.mapping.MapBasedAttributes2GrantedAuthoritiesMapper;
import org.springframework.stereotype.Service;

import com.spring.pjt.domain.Board;
import com.spring.pjt.domain.PageCriteria;
import com.spring.pjt.domain.User;
import com.spring.pjt.mapper.BoardMapper;
import com.spring.pjt.mapper.EventMapper;
import com.spring.pjt.persistence.BoardDao;
import com.spring.pjt.persistence.UserDao;

@Service
public class BoardServiceImpl  implements BoardService{

	private static final Logger log = LoggerFactory.getLogger(BoardServiceImpl.class);
	
	@Autowired private BoardDao boardDao;
	@Autowired private BoardMapper mapper;
	
	@Override
	public List<Board> select() {
		log.info("select() 호출");
		return boardDao.read();
	}

	@Override
	public Board select(int board_no) {
		log.info("select(board_no={}) 호출", board_no);
		Board board = boardDao.read(board_no);
		boardDao.UpdateViewCnt(board_no);
	
		
		return board;
	}

	@Override
	public int insert(Board board) {
		log.info("insert() 호출", board);
		int result = boardDao.create(board);
		
		return result;

		
	}

	@Override
	public int update(Board board) {
		log.info("update() 호출", board);
		
		return boardDao.update(board);
	}

	@Override
	public int delete(int board_no) {
		log.info("delete() 호출", board_no);
		
		return boardDao.delete(board_no);
	}

	@Override
	public int boardListCnt() {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public List<Board> select(int searchType, String searchKeyword) {
		log.info("select(searchType={}, searchType={})", searchType, searchKeyword);
		return boardDao.read(searchType, searchKeyword);
	}
	
	@Override
	public List<Board> pagingList(PageCriteria pcri) {
		log.info("Board getList() 호출" + pcri.toString());
		return mapper.pagingList(pcri);
	}
	
	@Override
	public int getTotalContents() {
		return mapper.getTotalContents();
	}



	
}
