package com.spring.pjt.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.pjt.domain.Board;

@Repository
public class BoardDaoImpl implements BoardDao{
	
	private static final Logger log = LoggerFactory.getLogger(BoardDaoImpl.class);
	private static final String BOARD_NAMESPACE = "com.spring.pjt.mapper.BoardMapper";
	
	@Autowired private SqlSession sqlSession;
	
	@Override
	public List<Board> read() {
		log.info("boardDaoImpl.read() 호출");
		
		return sqlSession.selectList(BOARD_NAMESPACE + ".selectAllBoard");
	}

	@Override
	public Board read(int board_no) {
		log.info("boardDaoImple.read(board_no={}) 호출", board_no);
		
		return sqlSession.selectOne(BOARD_NAMESPACE + ".selectByBno", board_no);
	}

	@Override
	public int create(Board board) {
		log.info("boardDaoImple.create({}) 호출", board);
		//board.setUser_id("todo");
		return sqlSession.insert(BOARD_NAMESPACE + ".create", board);
	}

	@Override
	public int update(Board board) {
		log.info("boardDaoImple.create({}) 호출", board);
		return sqlSession.update(BOARD_NAMESPACE + ".update", board);
	}

	@Override
	public int UpdateViewCnt(int board_no) {
		log.info("boardDaoImpl.UpdateViewCnt({}) 호출",board_no);
		return sqlSession.update(BOARD_NAMESPACE + ".updateViewCnt", board_no);
	}

	@Override
	public int delete(int board_no) {
		log.info("boardDaoImple.delete({}) 호출", board_no);
		return sqlSession.delete(BOARD_NAMESPACE + ".delete", board_no);

	}

}
