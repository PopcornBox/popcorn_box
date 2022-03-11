package com.spring.pjt;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.spring.pjt.domain.Board;
import com.spring.pjt.domain.PageCriteria;
import com.spring.pjt.mapper.BoardMapper;
import com.spring.pjt.persistence.BoardDao;
import com.spring.pjt.service.BoardService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration (
		locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"}
		)
@WebAppConfiguration
public class BoardDaoTest {
	private static final Logger log = LoggerFactory.getLogger(BoardDaoTest.class);
	
	
	@Autowired private BoardDao boardDao;
	@Autowired private BoardMapper mapper;
	@Autowired private BoardService service;
	
	@Test
	public void doTest() {
	log.info("boardDao: {}", boardDao);
	List<Board> list = boardDao.read();
	
//		Board board = boardDao.read(1);
//		log.info(board.toString());
	}
	
//	@Test
//	public void testpagingList() {
//		PageCriteria pcri = new PageCriteria();
//		log.info(pcri.toString());
//		List list = service.pagingList(pcri);
//		
//		list.forEach(board -> log.info("" + board));
//	}

}
