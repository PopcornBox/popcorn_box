package com.spring.pjt;

import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.spring.pjt.domain.MovieReply;
import com.spring.pjt.persistence.MovieReplyDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" } 
)
@WebAppConfiguration
public class MovieReplyDaoTest {
	private static final Logger log = LoggerFactory.getLogger(MovieReplyDaoTest.class);

	@Autowired private MovieReplyDao movieReplyDao;
	
	@Test
	public void doTest() {
		log.info("movieReplyDao: {}", movieReplyDao);
		
//		MovieReply movieReply = new MovieReply(0, "안녕하세요오오오", "111", null, 15);
//		int result = movieReplyDao.insert(movieReply);
//		log.info("insert result: {}", result);
		
//		List<MovieReply> replyList = movieReplyDao.readAllMovieReplies(15);
//		log.info(replyList.toString());
		
//		MovieReply movieReply = new MovieReply(1, "수정", "팝콘킹", null, 15);
//		int result = movieReplyDao.update(movieReply);
//		log.info("update result: {}", result);

		int result = movieReplyDao.delete(1);
		log.info("delete result: {}", result);		

	}
}
