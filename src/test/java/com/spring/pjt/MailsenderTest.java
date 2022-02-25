package com.spring.pjt;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" } 
)
@WebAppConfiguration
public class MailsenderTest {

private static final Logger log = LoggerFactory.getLogger(MailsenderTest.class);
	
	@Autowired private JavaMailSenderImpl mailSender;
	
	@Test
	public void doTest() {
		log.info("mailSender: {}", mailSender);
	}
}
