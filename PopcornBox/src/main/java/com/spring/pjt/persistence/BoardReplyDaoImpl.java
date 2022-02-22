package com.spring.pjt.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.pjt.domain.BoardReply;

@Repository
public class BoardReplyDaoImpl implements BoardReplyDao {
	
	private static final Logger log = LoggerFactory.getLogger(BoardReplyDaoImpl.class);
	private static final String NAMESPACE = "com.spring.pjt.mapper.BoardReplyMapper";

	@Autowired // 의존성 주입
	private SqlSession sqlSession;
	
	@Override
	public int create(BoardReply boardReply) {
		log.info("create({}) 호출", boardReply);
		
		return sqlSession.insert(NAMESPACE + ".insert", boardReply);
	}

	@Override
	public List<BoardReply> read(int board_no) {
		log.info("read(board_no={}) 호출", board_no);
		
		return sqlSession.selectList(NAMESPACE +".select", board_no);
	}

	@Override
	public int update(BoardReply boardReply) {
		log.info("update={board_no} 호출", boardReply);
		
		return sqlSession.update(NAMESPACE + ".update", boardReply)  ;
	}

	@Override
	public int delete(int board_reply_no) {
		log.info("delete=(board_reply_no");
		
		return sqlSession.delete(NAMESPACE + ".delete", board_reply_no);
	}
	
	@Override
	public int readBoardNo(int board_reply_no) {
		log.info("readBoardNo(board_reply_no={})" ,  board_reply_no);
		
		return sqlSession.selectOne(NAMESPACE + ".readBoardNo", board_reply_no);
	}

}
