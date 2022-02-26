package com.spring.pjt;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.spring.pjt.domain.User;
import com.spring.pjt.persistence.UserDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" } 
)
@WebAppConfiguration
public class UserDaoTest {

	private static final Logger log = LoggerFactory.getLogger(UserDaoTest.class);
	
	@Autowired private UserDao userDao;
	
	@Test
	public void doTest() {
		log.info("userDao: {}", userDao);
		
		// User user = new User(0, "yueun", "bonobono", "1234", "yueun@gmail.com", null);
		// int result = userDao.create(user);
		// log.info("create user 결과: {}", result);

//		User user = new User(0, "kim328", "porori", "1234", "kim328@gmail.com", null, null, null);
//		int result = userDao.create(user);
//		log.info("create user 결과: {}", result);
	}
}
