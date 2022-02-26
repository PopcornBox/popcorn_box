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

import com.spring.pjt.domain.BoardReply;
import com.spring.pjt.persistence.BoardReplyDao;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" }
)


@WebAppConfiguration
public class BoardReplyDaoTest {

	private static final Logger log = LoggerFactory.getLogger(BoardReplyDaoTest.class);
	
	@Autowired
	private BoardReplyDao boardReplyDao;
	
	@Test
	public void doTest() {
		log.info("boardReplyDao: {}", boardReplyDao);
		
//		BoardReply boardReply = new BoardReply(1, "testupdate", null, null, 1);
//		int result = boardReplyDao.update(boardReply);
//		log.info("update result: {}", result);
//		
//		List<BoardReply> replyList = boardReplyDao.read(1);
//		log.info(replyList.toString());
		
		int result = boardReplyDao.delete(2);
		log.info("delete result: {}", result);

	}
	
}
