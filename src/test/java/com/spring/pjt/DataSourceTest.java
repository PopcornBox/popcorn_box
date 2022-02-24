package com.spring.pjt;


import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.spring.pjt.domain.User;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"}
)
@WebAppConfiguration
public class DataSourceTest {
	private static final Logger log = LoggerFactory.getLogger(DataSourceTest.class);
	
	@Autowired private DataSource ds;
	@Autowired private SqlSessionFactory sessionFactory;
	@Autowired private SqlSession sqlSession;
	
	@Test
	public void doTest() throws SQLException {
		log.info("ds: {}", ds);
		
		Connection conn = ds.getConnection();
		log.info("connection: {}", conn);
		
		conn.close();
		log.info("connection 해제");
		
		log.info("sessionFactory: {}", sessionFactory);
		log.info("sqlSession: {}", sqlSession);
		
		List<User> list = sqlSession.selectList("com.spring.pjt.mapper.UserMapper.selectAll");	
		for (User user : list) {
			log.info(user.toString());
		}
		
	}

}
